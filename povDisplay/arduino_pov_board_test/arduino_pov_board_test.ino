
const int SERIAL_LATCH_COUNT = 5;

// Declare Pins
const int HALL_SENSOR_PIN = 3;

const int A_COMMAND_PIN = 4;
const int B_COMMAND_PIN = 5;

const int CLOCK_PIN = 6;
const int LOCK_PIN = 7;

const int SERIAL_DATA_0_PIN = 9;
const int SERIAL_DATA_1_PIN = 10;
const int SERIAL_DATA_2_PIN = 11;
const int SERIAL_DATA_3_PIN = 12;
const int SERIAL_DATA_4_PIN = 13;
const int SERIAL_DATA_PINS[SERIAL_LATCH_COUNT] = {SERIAL_DATA_0_PIN, SERIAL_DATA_1_PIN, SERIAL_DATA_2_PIN, SERIAL_DATA_3_PIN, SERIAL_DATA_4_PIN};


int value = 128;

volatile int interruptCount = 0;

// Cycle counter
uint16_t cycleCounterStart = 0;
uint16_t cycleCounterFinish = 0;

// the setup function runs once when you press reset or power the board
void setup() {
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
  attachInterrupt(HALL_SENSOR_PIN - 2, interruptHall, RISING); // I should use digitalPinToInterrupt(), but where is it declared ?
  
  // Initialize ouptuts
  digitalWrite(A_COMMAND_PIN, HIGH);
  digitalWrite(B_COMMAND_PIN, HIGH);
  
  digitalWrite(CLOCK_PIN, LOW);
  digitalWrite(LOCK_PIN, LOW);
  
  // Initialize serial communication
  Serial.begin(115200);
  
  // Set Timer 1 to normal mode at F_CPU.
  TCCR1A = 0;
  TCCR1B = 1;
}

void startCyclyCounter() {
  cli();
  cycleCounterStart = TCNT1;
}

void stopCycleCounter(String message) {
  cycleCounterFinish = TCNT1;
  sei();
  uint16_t overhead = 8;
  uint16_t cycles = cycleCounterFinish - cycleCounterStart - overhead;
  Serial.print(message);
  Serial.print(" took ");
  Serial.print(cycles);
  Serial.println(" CPU cycles. \n");
}

// Called on Hall detection
void interruptHall() {
  interruptCount += 1;
  
  Serial.print("Hall detected (");
  Serial.print(interruptCount);
  Serial.print(")\n");
}

// Send one bit of information on a serial latch
void sendBitToSerialLatch(boolean data, int canal) {
  digitalWrite(canal, data);
  //delay(1);

  clockSerialLatches();
}

// Clock all serial latches
void clockSerialLatches() {
  // Lock on rising edge
  digitalWrite(CLOCK_PIN, HIGH);
  //delay(1);
  digitalWrite(CLOCK_PIN, LOW);
}

// Lock all serial latches
void lockSerialLatches() {
  // Lock on rising edge
  digitalWrite(LOCK_PIN, HIGH);
  //delay(1);
  digitalWrite(LOCK_PIN, LOW);
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
      digitalWrite(A_COMMAND_PIN, LOW);
      digitalWrite(B_COMMAND_PIN, LOW);
      break;
    case 2:
      digitalWrite(A_COMMAND_PIN, HIGH);
      digitalWrite(B_COMMAND_PIN, LOW);
      break;
    case 1:
      digitalWrite(A_COMMAND_PIN, LOW);
      digitalWrite(B_COMMAND_PIN, HIGH);
      break;
    default:
      digitalWrite(A_COMMAND_PIN, HIGH);
      digitalWrite(B_COMMAND_PIN, HIGH);
      break;
  }
}

/*
  Data structure : X bytes to send.
  Most Significant Bit of each byte is BOTTOM most, so, with the led horizontal, the center (or bottom) to the left, a line is displayed like it is written in the byte array.
  A Byte Buffer is implemented with a Byte array.
  
*/

const int DISPLAY_BYTE_COUNT = 5;
byte oneLineMemory[DISPLAY_BYTE_COUNT] = {0x11, 0x11, 0x11, 0x11, 0x11};
byte byteBufferToDisplay[DISPLAY_BYTE_COUNT];

/*
  This function is responsible to send data on serial latches. It will be called by interrupt and should be as fast a possible.
*/
void sendByteBufferToSerialLatch(byte byteArray[]) {
  startCyclyCounter();
  stopCycleCounter("testCounter_shouldBe_0");
  startCyclyCounter();
  
  // The for loop should consume extra cycle clock than hardcoded shifting.
  // Idem for the multiple latch management. A loop symplify the code, but it should consume extra clock cycles.
  // An alternative is to use shiftOut to shift a byte bit per bit cf https://www.arduino.cc/reference/en/language/functions/advanced-io/shiftout/
  for(int i = 0; i < 8; i ++) {
    
    // Output 5 bits four the 5 latches. We do not use a loop to 
    digitalWrite(SERIAL_DATA_PINS[0], bitRead(byteArray[0], i));
    digitalWrite(SERIAL_DATA_PINS[1], bitRead(byteArray[1], i));
    digitalWrite(SERIAL_DATA_PINS[2], bitRead(byteArray[2], i));
    digitalWrite(SERIAL_DATA_PINS[3], bitRead(byteArray[3], i));
    digitalWrite(SERIAL_DATA_PINS[4], bitRead(byteArray[4], i));
    clockSerialLatches();
  }
  
  lockSerialLatches();
  
  stopCycleCounter("sendByteArrayToSerialLatch");
}

// Right shift all bits of a byte buffer
void rightShiftByteBuffer(byte *byteArray, int bufferSize) {
  // first shift right most, then put LSB from left byte to MSB on right most byte ...
  byteArray[bufferSize - 1] >> 1;
  for(int k = bufferSize - 2; k >= 0; k --) {
    bitWrite(byteArray[k + 1], 7, bitRead(byteArray[k], 0));
    byteArray[k] >> 1;
  }
}

void leftShiftByteBuffer(byte *byteArray, int bufferSize) {
  byteArray[0] << 1;
  for(int k = 1; k < bufferSize - 1; k ++) {
    bitWrite(byteArray[k - 1], 0, bitRead(byteArray[k], 7));
    byteArray[k] << 1;
  }
}

void rightRotateByteBuffer(byte *byteArray, int bufferSize) {
  boolean mem = bitRead(byteArray[bufferSize - 1], 0);
  rightShiftByteBuffer(byteArray, bufferSize);
  bitWrite(byteArray[0], 7, mem);
}

void leftRotateByteBuffer(byte *byteArray, int bufferSize) {
  boolean mem = bitRead(byteArray[0], 7);
  leftShiftByteBuffer(byteArray, bufferSize);
  bitWrite(byteArray[bufferSize - 1], 0, mem);  
}

// Complement all bits of a byte array into a new byte array.
void complementByteBuffer(byte *byteArray, int bufferSize) {
  for (int k = 0; k < bufferSize; k++) {
    byteArray[k] = 255 - byteArray[k];
  }
}

// the loop function runs over and over again forever
void loop() {
  selectLedCurrent(1);
  
  // Copy line memory to working buffer
  memcpy(oneLineMemory, byteBufferToDisplay, DISPLAY_BYTE_COUNT);
  // Complement working buffer because 0 is needed to light a LED
  complementByteBuffer(byteBufferToDisplay, DISPLAY_BYTE_COUNT);
  
  // Send the working buffer to the serial latches
  sendByteBufferToSerialLatch(byteBufferToDisplay);
  
  // Rotate the memory
  rightRotateByteBuffer(oneLineMemory, DISPLAY_BYTE_COUNT);
  
  
  /*
  value = value >> 1;
  
  if (value < 16) {
    value = 128;
  }
  
  sendByteToSerialLatch(255 - value, SERIAL_DATA_4_PIN); 
  lock();
  sendByteToSerialLatch(255, SERIAL_DATA_4_PIN); 
  */
  
  delay(100);
  
 
}
