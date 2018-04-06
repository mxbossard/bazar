
// Declare Pins
const int POV_CLOCK = 13;
const int POV_LOCK = 12;
const int POV_SERIAL_DATA_4 = 11;

const int POV_HALL_IN = 3;


int value = 128;

volatile int interruptCount = 0;

// the setup function runs once when you press reset or power the board
void setup() {
  // Config outputs
  pinMode(POV_CLOCK, OUTPUT);
  pinMode(POV_LOCK, OUTPUT);
  pinMode(POV_SERIAL_DATA_4, OUTPUT);
  
  // Config inputs
  pinMode(POV_HALL_IN, INPUT_PULLUP);
  
  // Config interrupts
  attachInterrupt(POV_HALL_IN - 2, interruptHall, RISING);
  
  // Initialize ouptuts
  digitalWrite(POV_CLOCK, LOW);
  digitalWrite(POV_LOCK, LOW);
  
  // Initialize serial communication
  Serial.begin(115200);
  
}

// Called on Hall detection
void interruptHall() {
  interruptCount += 1;
}

// Send one bit of information on a serial latch
void sendBitToSerialLatch(boolean data, int canal) {
  digitalWrite(canal, data);
  //delay(1);

  // Clock on rising edge        
  digitalWrite(POV_CLOCK, LOW);
  //delay(1); // Needed if no decoupling condensator
  digitalWrite(POV_CLOCK, HIGH);
}

// Lock all serial latches
void lockSerialLatches() {
  // Lock on rising edge
  digitalWrite(POV_LOCK, LOW);
  //delay(1);
  digitalWrite(POV_LOCK, HIGH);
}

void sendByteToSerialLatch(byte data, int canal) {
  //Serial.print("Sent vals: ");
  for (int i=7; i >=0; i--) {
    boolean val = bitRead(data, i);
    sendBitToSerialLatch(val, canal);
    //Serial.print(val);
  }
  //Serial.print("\n");  
}

// une fonction send 5 bytes to serial latch ?
// Quelle est la meilleure structure de data pour l'affichage sur 5 serial latch en parallèle ?

// the loop function runs over and over again forever
void loop() {
  value = value >> 1;
  
  if (value < 16) {
    value = 128;
  }
  
  sendByteToSerialLatch(255 - value, POV_SERIAL_DATA_4); 
  lock();
  sendByteToSerialLatch(255, POV_SERIAL_DATA_4); 
  
  delay(100);
  
  Serial.print("Hall detected (");
  Serial.print(interruptCount);
  Serial.print(")\n");
}
