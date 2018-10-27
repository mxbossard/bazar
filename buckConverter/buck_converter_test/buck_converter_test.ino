/*
  A propos du buck converter.
  Un état logique Bas en sortie correspond à un switch fermé (conducteur de courant).
  Pour le PWM, une valeur faible correspond donc à un switch souvent fermé (conducteur de courant), et inversement.
*/
 
// Pin 13 has an LED connected on most Arduino boards.
// give it a name:
int led = 13;


unsigned long time;
unsigned long displayTime = -1L;

int sensorValue = 0;
float roundedSensorValue = 0.0;
float tension = 0.0;
int pwmLevel = 1024;

float CAN_REF = 1.1;
int CAN_RESOLUTION = 1024;
//int DIVIDER_R1 = 9700;
int DIVIDER_R1 = 10592; // updated to match empyric results
int DIVIDER_R2 = 214;

float TARGET_VOLTAGE = 5.0;

const int SENSOR_BUFFER_SIZE = 10;

unsigned int increment = 0;
int sensorBuffer[SENSOR_BUFFER_SIZE];


/* PID */
const int INTEGRAL_BUFFER_SIZE = 32;
float error = 0.0;
float previousError = 0.0;
float differential = 0.0;
float integralBuffer[INTEGRAL_BUFFER_SIZE];
float integral = 0.0;
float pidScore = 0.0;

// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pin as an output.
  pinMode(led, OUTPUT);  

  // Configure Prescale to No prescale => As fast as possible:w
  CLKPR = _BV(CLKPCE);

  // Configure PWM  
  pinMode(3, OUTPUT);
  pinMode(11, OUTPUT);
  
  //TCCR2A = _BV(COM2A1) | _BV(COM2B1) | _BV(WGM20); // Mode 1: PWM, Phase Correct
  TCCR2A = _BV(COM2A1) | _BV(COM2B1) | _BV(WGM21) | _BV(WGM20); // Mode 3: Fast PWM
  //TCCR2B = _BV(CS22); // Freq: Prescaler / 64
  //TCCR2B = _BV(CS22) | _BV(CS21); // Freq: Prescaler / 32
  //TCCR2B = _BV(CS21); // Freq: Prescaler / 8
  TCCR2B = _BV(CS20); // Freq: Prescaler / 1
  
  // Start PWM values
  OCR2A = 10; // PORT11
  OCR2B = 254; // PORT3
  
  // Configure Analog read
  //analogReference(2); // Ref to 1.1V
  ADMUX = _BV(REFS1) | _BV(REFS0);
  //ADMUX = _BV(REFS0);
  //ADCSRA = _BV(ADPS2) | _BV(ADPS1) | _BV(ADPS0); // ADC freq prescale : 128
   
  // Configure serial comm
  Serial.begin(115200);
  
  for (int k = 0 ; k < SENSOR_BUFFER_SIZE ; k++) {
    sensorBuffer[k] = 0;
  }
  
  for (int k = 0 ; k < INTEGRAL_BUFFER_SIZE ; k++) {
    integralBuffer[k] = 0.0;
  }
}

/* Map 0 to 1024 Input to 0 to 255 with sqrt curve */
byte sqrt_pwm(int value) {
  // sqrt(1024) = 32
  byte val = sqrt(value) * 8;
  return val; 
}


// the loop routine runs over and over again forever:
void loop() {
  /*
  digitalWrite(led, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(100);               // wait for a second
  digitalWrite(led, LOW);    // turn the LED off by making the voltage LOW
  delay(100);               // wait for a second
  */
  
  time = millis();
  
  while (millis() < (time + 1)) {
    // wait 1 ms
  }
  
  
  /* Select ADC input */
  ADMUX	&= 0xf0; // Reset 4 msb
  ADMUX |= 1;
  
  ADCSRA |= _BV(ADSC); // Start conversion
  while ( (ADCSRA & _BV(ADSC)) ); // Wait conversion completion
  sensorValue = ADC;
  
  sensorBuffer[increment % SENSOR_BUFFER_SIZE] = sensorValue;
  increment ++;

  roundedSensorValue = 0;
  for (int j = 0 ; j < SENSOR_BUFFER_SIZE ; j++) {
    roundedSensorValue += sensorBuffer[j];
  }
  
  roundedSensorValue = ((float) roundedSensorValue / SENSOR_BUFFER_SIZE);
  
  tension = ((float) roundedSensorValue / CAN_RESOLUTION) * CAN_REF * (DIVIDER_R1 + DIVIDER_R2) / DIVIDER_R2;
  
  /* PID */
  error = TARGET_VOLTAGE - tension;
  differential = error - previousError;
  integralBuffer[increment % INTEGRAL_BUFFER_SIZE] = error;
  integral = 0.0;
  for (int j = 0 ; j < INTEGRAL_BUFFER_SIZE ; j++) {
    integral += integralBuffer[j];
  }
  
  pidScore = error * 3 + differential * 2 + integral * 0.01;
  pwmLevel -= pidScore;
 
  /*
  if (tension < TARGET_VOLTAGE && pwmLevel > 0) {
    pwmLevel -= pidScore;
  } else if (tension > TARGET_VOLTAGE && pwmLevel < 1023) {
    pwmLevel += pidScore;
  }
  */
  
  
  if (pwmLevel < 1) {
    pwmLevel = 0;
  } else if (pwmLevel > 1022) {
    pwmLevel = 1023;
  }
  
  OCR2B = sqrt_pwm(pwmLevel);

  //OCR2B = 251 + increment % 3;
  //OCR2B = 251;
  
  if (time > (displayTime + 1000)) {
    // One display per second
    displayTime = time;
    
    Serial.print(pidScore);
    Serial.print("  ");
    Serial.print(pwmLevel);
    Serial.print("  ");
    Serial.print(OCR2B);
    Serial.print("  ");
    Serial.print(sensorValue);
    Serial.print("  ");
    Serial.print(roundedSensorValue);
    Serial.print("  ");
    Serial.println(tension);
  }
  
  previousError = error;
  
}
