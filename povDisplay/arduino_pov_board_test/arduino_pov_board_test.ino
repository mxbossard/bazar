#include <avr/interrupt.h>

#define LOG_CYCLE_COUNTER 0 // LOG_CYCLE_COUNTER interfere avec la gestion temporelle de l'afficheur
#define COM_TRACE_LOG 0
#define COMM_DEBUG_LOG 0
#define COMM_INFO_LOG 1
#define LOG_ENABLED 0 //COMM_DEBUG_LOG || COMM_INFO_LOG || LOG_CYCLE_COUNTER

#define SLOW_DISPLAY_DRIVING_CLOCK 0
#define INTERUPT_ON_HALL_DETECTION 1
#define TIMER_MANAGEMENT 1

const int SERIAL_LATCH_COUNT = 5;

// Declare Pins
/*
Sur Arduino (ATmega328) : https://www.arduino.cc/en/Hacking/PinMapping168

DP 0-7   => PORTD 0-7
DP 8-13  => PORTB 0-5

DP 2     => INT0   
DP 3     => INT1

Pour gérer le display, nous avons besoin de 5 bits de Serial Data, 1 bit clock et 1 bit lock, donc 7 bits.
Idéalement, Pour gagner en temps d'execution, on peut manipuler les 7 bits avec un seul port (Generalement les ports on 8 bits).
Sur Arduino UNO il y a 3 ports accessibles :
PORTB: PB0 .. 5 => Digital Pin 8 .. 13 (PC13 pilote la LED)
PORTD: PD0 .. 7 => Digital Pin 0 .. 7 (PD0 & PD1 sont inutilisable à cause du RX/TX ; PD2 & PD3 sont les entrees d'interruption)
PORTC: PC0 .. 5 => Analog Pin 0 .. 5

Sur Arduino UNO, le seul port assez large le PORTD, on ne peut pas utiliser ni les pins RX & TX, et une entrée sera utilisée comme interruption. Donc le PORTD ne dispose que de 5 pins utilisable pour la communication du display.
=> Le display sera piloté sur le PORTB pour les Serial Data + Clock
PORTB => MSB [ CLOCK SD4 SD3 SD2 SD1 SD0 ] LSB
Envoyer 5 données en serie nécéssite ainsi 2 écriture sur le PORTB : 
PORTB = [ 0 SD4 SD3 SD2 SD1 SD0 ];
PORTB |= 32; 

PORTB0-4: Serial Data 0 à 4
PORTB5: CLOCK

PORTD3: Input HALL interrupt
PORTD4: Command TA => set: PORTD |= 0B10000; reset: PORTD &= 0B01111
PORTD5: Command TB => set: PORTD |= 0B100000; reset: PORTD &= 0B011111
PORTD6: LOCK => set: PORTD |= 0B1000000; reset: PORTD &= 0B0111111

*/

// PINS are expressed in "Arduino value"
const int HALL_SENSOR_PIN = 3; // Attention ici on utilise le pin arduino uno 3

const int A_COMMAND_PIN = 4;
const int B_COMMAND_PIN = 5;

const int CLOCK_PIN = 13;
const int LOCK_PIN = 6;

const int SERIAL_DATA_0_PIN = 8;
const int SERIAL_DATA_1_PIN = 9;
const int SERIAL_DATA_2_PIN = 10;
const int SERIAL_DATA_3_PIN = 11;
const int SERIAL_DATA_4_PIN = 12;
const int SERIAL_DATA_PINS[SERIAL_LATCH_COUNT] = {SERIAL_DATA_0_PIN, SERIAL_DATA_1_PIN, SERIAL_DATA_2_PIN, SERIAL_DATA_3_PIN, SERIAL_DATA_4_PIN};

volatile unsigned int hallInterruptCount = 0;
volatile unsigned int timer0InterruptCount = 0;
volatile unsigned int timer1InterruptCount = 0;

// Cycle counter
int cycleCounterStart = 0;
int cycleCounterFinish = 0;

void startCycleCounter() {
  #if LOG_CYCLE_COUNTER == 1
  cli(); // Same as noInterrupts()
  cycleCounterStart = TCNT1;
  #endif
}

void stopCycleCounter() {
  #if LOG_CYCLE_COUNTER == 1
  cycleCounterFinish = TCNT1;
  sei(); // Same as interrupts()
  int overhead = 24;
  long cyclesCount = cycleCounterFinish - cycleCounterStart - overhead;
  Serial.print("took ");
  Serial.print(cyclesCount);
  Serial.print(" CPU cycles (");
  Serial.print(cycleCounterFinish);
  Serial.print(" - ");
  Serial.print(cycleCounterStart);
  Serial.print(" - ");
  Serial.print(overhead);
  Serial.print(")\n\n");
  
  #endif
}

void quickSelectLedCurrent(int level) {
  // Security : For now fix level 0 or 2.
  if (level > 0) {
    level = 2;
  }
  
  // Note : A call on this method will not necessarely change the value of outputs, does it consume clock cycle necessarely ?
  switch(level) {
    case 3:
      // Current TA + TB
      PORTD &= 0B11001111;
      break;
    case 2:
      // Current TB
      PORTD |= 0B00010000;
      PORTD &= 0B11011111; // Switch off before lighting on
      break;
    case 1:
      // Current TA
      PORTD |= 0B00100000; // Switch off before lighting on
      PORTD &= 0B11101111; 
      break;
    default:
      // No Current TA an TB HIGH
      PORTD |= 0B00110000;
      break;
  }
}

/*
  Data structure : X bytes to send.
  Most Significant Bit of each byte is BOTTOM most, so, with the led horizontal, the center (or bottom) to the left, a line is displayed like it is written in the byte array.
  A Byte Buffer is implemented with a Byte array.
  
*/

const int DISPLAY_BYTE_COUNT = 5;
//byte oneLineMemory[DISPLAY_BYTE_COUNT] = {0xAA, 0xAA, 0xAA, 0xAA, 0xAA};
byte oneLineMemory[DISPLAY_BYTE_COUNT] = {0x77, 0x77, 0x77, 0x77, 0x77};
byte byteBufferToDisplay[DISPLAY_BYTE_COUNT];
byte transposedByteBufferToDisplay[8] = {0, 0, 0, 0, 0, 0, 0, 0};
byte transposeWork[DISPLAY_BYTE_COUNT] = {0, 0, 0, 0, 0};

void transposeByteBuffer(byte byteBuffer[], byte result[]) {
  
  #if LOG_CYCLE_COUNTER == 1
  Serial.print("transposeByteBuffer ");
  startCycleCounter();
  #endif
  
  // Copy byteBuffer to work
  memcpy(transposeWork, byteBuffer, DISPLAY_BYTE_COUNT);
  
  byte byteBufferToDisplay[DISPLAY_BYTE_COUNT];
  for(int i = 0; i < 8; i ++) {
    result[i] = 0;
    int power = 8;
    for(int k = 0; k < DISPLAY_BYTE_COUNT; k ++) {
      result[i] += (transposeWork[k] & 0x80) / power;
      //Serial.println(power);
      transposeWork[k] = transposeWork[k] << 1;
      power = power << 1;
    }
  }
  
  #if LOG_CYCLE_COUNTER == 1
  stopCycleCounter();
  #endif
}

void quickSendTransposedByteBufferToSerialLatch(byte byteArray[]) {

  #if LOG_CYCLE_COUNTER == 1
  Serial.print("testCycleCounterShouldBe0 ");
  delay(10);
  startCycleCounter();
  stopCycleCounter();
  
  Serial.print("quickSendByteArrayToSerialLatch ");
  startCycleCounter();
  #endif
  
  // The for loop should consume extra cycle clock than hardcoded shifting.
  // Idem for the multiple latch management. A loop symplify the code, but it should consume extra clock cycles.
  // An alternative is to use shiftOut to shift a byte bit per bit cf https://www.arduino.cc/reference/en/language/functions/advanced-io/shiftout/
  for(int i = 0; i < 8; i ++) {    
    // Lecture des 5bits à envoyés
    byte serialDatas = byteArray[i];

    #if COMM_TRACE_LOG == 1
    Serial.println(serialDatas);
    #endif

    // Push serialDatas on PORTB
    PORTB = 0 | serialDatas;
    // Send clock rising edge
    PORTB |= 0B00100000;
  }
  
  // Send lock rising edge
  PORTD |= 0B01000000;
  
  // Lower Lock ?
  PORTD &= 0B10111111;
  
  #if LOG_CYCLE_COUNTER == 1
  stopCycleCounter();
  #endif

}


// Right shift all bits of a byte buffer
void rightShiftByteBuffer(byte byteArray[], int bufferSize) {
  // first shift right most, then put LSB from left byte to MSB on right most byte ...
  byteArray[bufferSize - 1] = byteArray[bufferSize - 1] >> 1;
  for(int k = bufferSize - 2; k >= 0; k --) {
    bitWrite(byteArray[k + 1], 7, bitRead(byteArray[k], 0));
    byteArray[k] = byteArray[k] >> 1;
  }
}

void leftShiftByteBuffer(byte byteArray[], int bufferSize) {
  byteArray[0] = byteArray[0] << 1;
  for(int k = 1; k < bufferSize; k ++) {
    bitWrite(byteArray[k - 1], 0, bitRead(byteArray[k], 7));
    byteArray[k] = byteArray[k] << 1;
  }
}

void rightRotateByteBuffer(byte byteArray[], int bufferSize) {
  boolean mem = bitRead(byteArray[bufferSize - 1], 0);
  rightShiftByteBuffer(byteArray, bufferSize);
  bitWrite(byteArray[0], 7, mem);
}

void leftRotateByteBuffer(byte byteArray[], int bufferSize) {
  boolean mem = bitRead(byteArray[0], 7);
  leftShiftByteBuffer(byteArray, bufferSize);
  bitWrite(byteArray[bufferSize - 1], 0, mem);  
}

// Complement all bits of a byte array into a new byte array.
void complementByteBuffer(byte byteArray[], int bufferSize) {
  for (int k = 0; k < bufferSize; k++) {
    byteArray[k] = 255 - byteArray[k];
  }
}


// Called on Hall detection
void hallCounterInterrupt() {
  hallInterruptCount += 1;
  
  #if COMM_INFO_LOG == 1
  Serial.print("Hall detected (");
  Serial.print(hallInterruptCount);
  Serial.println(")");
  #endif
  
  // Rotate the memory
  //leftRotateByteBuffer(oneLineMemory, DISPLAY_BYTE_COUNT);
  //rightRotateByteBuffer(oneLineMemory, DISPLAY_BYTE_COUNT);
  
  
  for (int k = 0; k < 400; k++) {
    selectLedCurrent(3);
  }
  
  selectLedCurrent(0);
  
}

void hallDisplayInterrupt() {
  hallInterruptCount += 1;
  
  #if COMM_INFO_LOG == 1
  Serial.print("Timer1 value: ");
  Serial.print(TCNT1);
  Serial.print(" ; TCNT1H = ");
  Serial.println(TCNT1H);
  #endif
  
  TCNT0 = 0;
  // Start Timer 0
  OCR0A = TCNT1H; // Set timer 0 interrupt compare match to TCNT1H. TCNT1H are 8 MSB of Timer1 value. => Divide by 256.
  TCNT1 = 0;

  timer0InterruptCount = 0;
}

// Timer0 compare interrupt service routine
SIGNAL(TIMER0_COMPA_vect) {
  // No need to reset timer we configred it to reset on compare match.
  timer0InterruptCount ++;
  
  // Division par 128 environ
  if (timer0InterruptCount % 256 != hallInterruptCount % 256) {
    quickSelectLedCurrent(0);
    return;
  }
  
  #if COMM_DEBUG_LOG == 1
  Serial.println("Timer0 compare matched.");
  #endif
  
  //rightRotateByteBuffer(oneLineMemory, DISPLAY_BYTE_COUNT);
  quickSendTransposedByteBufferToSerialLatch(transposedByteBufferToDisplay);
  quickSelectLedCurrent(3);
    
  // Swap TB
  //PORTD ^= 0B00100000; // biwise XOR
  
}

void logByteBuffer(byte byteBuffer[], int length) {
  #if LOG_ENABLED == 1
  for(int k=0; k< length; k++) {
    Serial.print(byteBuffer[k]);
    Serial.print(" ");
    
  }
  Serial.println("");
  #endif
}


// the setup function runs once when you press reset or power the board
void setup() {
    
  // Initialize ouptuts
  digitalWrite(A_COMMAND_PIN, HIGH);
  digitalWrite(B_COMMAND_PIN, HIGH);
  
  digitalWrite(CLOCK_PIN, LOW);
  digitalWrite(LOCK_PIN, LOW);

  // Config outputs
  pinMode(A_COMMAND_PIN, OUTPUT);
  pinMode(B_COMMAND_PIN, OUTPUT);
  
  pinMode(CLOCK_PIN, OUTPUT);
  pinMode(LOCK_PIN, OUTPUT);
  
  for(int k = 0; k < SERIAL_LATCH_COUNT; k ++) {
    pinMode(SERIAL_DATA_PINS[k], OUTPUT);
  }
  
  // Config inputs
  pinMode(HALL_SENSOR_PIN, INPUT_PULLUP);
  
  // Config interrupts
  #if INTERUPT_ON_HALL_DETECTION == 1
  attachInterrupt(HALL_SENSOR_PIN - 2, hallDisplayInterrupt, RISING); // I should use digitalPinToInterrupt(), but where is it declared ?
  #endif

  #if TIMER_MANAGEMENT == 1
  // Init display rotation timer (Timer1 16 bits)
  TCCR1A = 0;
  TCCR1B = 5; // Prescaler: CLK / 1024
  
  // Init compare timer  (Timer0 8 bits)
  TCCR0A = 0;
  TCCR0A |= (1 << WGM01); // Reset timer on compare match
  TCCR0B = 5; // Prescaler: CLK / 1024 => 256 interrupt by cycle
  TIMSK0 = 0;
  TIMSK0 |= (1 << OCIE0A); // enable timer compare interrupt on channel A
  OCR0A = 200;
  //TIMSK0 |= _BV(OCIE0A);
  #endif 
  
  // Set Timer 1 to normal mode at F_CPU.
  #if LOG_CYCLE_COUNTER == 1
  TCCR1A = 0;
  TCCR1B = 1;
  #endif
  
  quickSelectLedCurrent(0);

  transposeByteBuffer(oneLineMemory, transposedByteBufferToDisplay);
  
  quickSendTransposedByteBufferToSerialLatch(transposedByteBufferToDisplay);

  // Initialize serial communication
  #if LOG_ENABLED == 1
  Serial.begin(115200);
  Serial.println("Log enabled !");
  #endif
  
  
}


// the loop function runs over and over again forever
void loop() {

  //selectLedCurrent(3);
  
  /*
  Serial.print("TCNT0 : ");
  Serial.print(TCNT0);
  Serial.print(" ; OCR0A : ");
  Serial.println(OCR0A);
  */
  
  /*
  // Copy line memory to working buffer
  memcpy(byteBufferToDisplay, oneLineMemory, DISPLAY_BYTE_COUNT);
  // Complement working buffer because 0 is needed to light a LED
  complementByteBuffer(byteBufferToDisplay, DISPLAY_BYTE_COUNT);
  
  // Send the working buffer to the serial latches
  sendByteBufferToSerialLatch(byteBufferToDisplay);
  
  // Rotate the memory
  //leftRotateByteBuffer(oneLineMemory, DISPLAY_BYTE_COUNT);
  rightRotateByteBuffer(oneLineMemory, DISPLAY_BYTE_COUNT);
  */
  
  //rightRotateByteBuffer(oneLineMemory, DISPLAY_BYTE_COUNT);
  //logByteBuffer(oneLineMemory, DISPLAY_BYTE_COUNT);
  //logByteBuffer(transposedByteBufferToDisplay, 8);

  //memcpy(byteBufferToDisplay, oneLineMemory, DISPLAY_BYTE_COUNT);
  //complementByteBuffer(byteBufferToDisplay, DISPLAY_BYTE_COUNT);  
  

  
  
  //for (int k = 0; k < 0xFF; k++) {
  //  delay(1);
  //}
 
}


/* ############################################################################################# */
/* ############################################################################################# */
/* ############################################################################################# */
/* ########################################## USELESS ########################################## */
/* ############################################################################################# */
/* ############################################################################################# */
/* ############################################################################################# */


// Send one bit of information on a serial latch
void sendBitToSerialLatch(boolean data, int canal) {
  digitalWrite(canal, data);
  //delay(1);

  clockSerialLatches();
}

// Clock all serial latches
void clockSerialLatches() {
  #if COMM_DEBUG_LOG == 1
  Serial.print("Clock !\n");
  #endif
  
  // Clock on rising edge
  digitalWrite(CLOCK_PIN, LOW);
    
  #if SLOW_DISPLAY_DRIVING_CLOCK == 1
  delay(1);
  #endif
  
  digitalWrite(CLOCK_PIN, HIGH);
}

// Lock all serial latches
void lockSerialLatches() {
  #if COMM_DEBUG_LOG == 1
  Serial.print("Lock !\n");
  #endif
  
  // Lock on rising edge
  digitalWrite(LOCK_PIN, LOW);
    
  #if SLOW_DISPLAY_DRIVING_CLOCK == 1
  delay(1);
  #endif
  
  digitalWrite(LOCK_PIN, HIGH);
}

// Send one complete byte of information on a serial latch
void sendByteToSerialLatch(byte data, int canal) {
  //Serial.print("Sent vals: ");
  for (int i = 7; i >= 0; i --) {
    boolean val = bitRead(data, i);
    sendBitToSerialLatch(val, canal);
    //Serial.print(val);
  }
  //Serial.print("\n");  
}

// From 0 to 3: 0 mean no current => LEDs OFF ; 3 mean full current, both // resistors supplying current.
void selectLedCurrent(int level) {
  // Note : A call on this method will not necessarely change the value of outputs, does it consume clock cycle necessarely ?
  switch(level) {
    case 3:
      //Serial.print("Current level 3\n");
      digitalWrite(A_COMMAND_PIN, LOW);
      digitalWrite(B_COMMAND_PIN, LOW);
      break;
    case 2:
      //Serial.print("Current level 2\n");
      digitalWrite(A_COMMAND_PIN, HIGH);
      digitalWrite(B_COMMAND_PIN, LOW);
      break;
    case 1:
      //Serial.print("Current level 1\n");
      digitalWrite(A_COMMAND_PIN, LOW);
      digitalWrite(B_COMMAND_PIN, HIGH);
      break;
    default:
      //Serial.print("Current level 0\n");
      digitalWrite(A_COMMAND_PIN, HIGH);
      digitalWrite(B_COMMAND_PIN, HIGH);
      break;
  }
}


/*
  This function is responsible to send data on serial latches. It will be called by interrupt and should be as fast a possible.
*/
void sendByteBufferToSerialLatch(byte byteArray[]) {
  #if LOG_CYCLE_COUNTER == 1
  Serial.print("testCycleCounterShouldBe0 ");
  delay(10);
  startCycleCounter();
  stopCycleCounter();
  
  Serial.print("sendByteArrayToSerialLatch ");
  startCycleCounter();
  #endif
  
  // The for loop should consume extra cycle clock than hardcoded shifting.
  // Idem for the multiple latch management. A loop symplify the code, but it should consume extra clock cycles.
  // An alternative is to use shiftOut to shift a byte bit per bit cf https://www.arduino.cc/reference/en/language/functions/advanced-io/shiftout/
  for(int i = 0; i < 8; i ++) {
    
    #if COMM_DEBUG_LOG == 1
    Serial.print("Send Byte Buffer:\n");
    Serial.print(bitRead(byteArray[0], i));
    Serial.print(" ");
    Serial.print(bitRead(byteArray[1], i));
    Serial.print(" ");
    Serial.print(bitRead(byteArray[2], i));
    Serial.print(" ");
    Serial.print(bitRead(byteArray[3], i));
    Serial.print(" ");
    Serial.print(bitRead(byteArray[4], i));
    Serial.print("\n");
    #endif
    
    
    // Output a bit on each latches in SERIAL_DATA_PINS array => La boucle consomme 440 cycles de plus que le hardcode.
    for(int k = 0; k < DISPLAY_BYTE_COUNT; k++) {
      digitalWrite(SERIAL_DATA_PINS[k], bitRead(byteArray[k], i));
      //PORTB |= 0x02; 
    }

    clockSerialLatches();
  }
  
  lockSerialLatches();
  
  #if LOG_CYCLE_COUNTER == 1
  stopCycleCounter();
  #endif
}


void testCycleCounter() {
  #if LOG_CYCLE_COUNTER == 1
  cli(); // Same as noInterrupts()
  int cycleCounterTestStart = TCNT0;
  int cycleCounterTestFinish = TCNT0;
  sei();
  
  long difference = cycleCounterTestFinish - cycleCounterTestStart;

  Serial.print("Test cycle counter : Start = ");
  Serial.print(cycleCounterTestStart);
  Serial.print(" ; Stop = ");
  Serial.print(cycleCounterTestFinish);
  Serial.print("; Difference = ");
  Serial.println(difference);
  
  #endif
}

