

// CNC shield pinout
const int CNC_STEP_X_PIN = 2;
const int CNC_DIR_X_PIN = 5;
const int CNC_STEP_Y_PIN = 3;
const int CNC_DIR_Y_PIN = 6;
const int CNC_STEP_Z_PIN = 4;
const int CNC_DIR_Z_PIN = 7;
const int CNC_ENABLE_PIN = 8;

// PINOUT
const int STEP_REGUL_PIN = CNC_STEP_Y_PIN;
const int DIR_REGUL_PIN = CNC_DIR_Y_PIN;

const int STEP_INDICA_PIN = CNC_STEP_X_PIN;
const int DIR_INDICA_PIN = CNC_DIR_X_PIN;

const int STEP_INDICB_PIN = CNC_STEP_Z_PIN;
const int DIR_INDICB_PIN = CNC_DIR_Z_PIN;

const int MOTOR_ENABLE_PIN = CNC_ENABLE_PIN;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);

  cli();//stop interrupts

  //set timer2 interrupt at 8kHz
  TCCR2A = 0;// set entire TCCR1A register to 0
  TCCR2B = 0;// same for TCCR1B
  TIMSK2 = 0;
  TIFR2 = 0;
  TCNT2  = 0;//initialize counter value to 0
  // set compare match register for 100khz increments
  OCR2A = 3;// (must be <256)
  // turn on CTC mode
  //TCCR2A |= (1 << WGM21);
  //TCCR2B |= (1 << WGM22); // Clear Timer2 on Compare Match (CTC) Mode
  // Set CS11 bit for 8 prescaler
  //TCCR2B |= (1 << CS21);
  // Set CS21 and CS20 bits for 32 prescaler
  //TCCR2B |= (1 << CS21) | (1 << CS20);
  // Set CS22 CS21 and CS20 bits for 1024 prescaler
  TCCR2B |= (1 << CS22) | (1 << CS21) | (1 << CS20); 
  // Set CS20 bits for 1 prescaler
  //TCCR2B |= (1 << CS20);  
  //TCCR2B = 0x01;
  // enable timer compare interrupt
  TIMSK2 |= (1 << OCIE2A);
  //TIMSK2 |= (1 << TOIE2);
  //TIMSK2 = 0x01;

  //interrupts();

  sei();//allow interrupts


  pinMode(STEP_REGUL_PIN, OUTPUT);
  pinMode(DIR_REGUL_PIN, OUTPUT);
  pinMode(STEP_INDICA_PIN, OUTPUT);
  pinMode(DIR_INDICA_PIN, OUTPUT);
  pinMode(STEP_INDICB_PIN, OUTPUT);
  pinMode(DIR_INDICB_PIN, OUTPUT);
  pinMode(MOTOR_ENABLE_PIN, OUTPUT);

  pinMode(LED_BUILTIN, OUTPUT);

  digitalWrite(STEP_REGUL_PIN, LOW);
  digitalWrite(DIR_REGUL_PIN, LOW);
  digitalWrite(STEP_INDICA_PIN, LOW);
  digitalWrite(DIR_INDICA_PIN, LOW);
  digitalWrite(STEP_INDICB_PIN, LOW);
  digitalWrite(DIR_INDICB_PIN, LOW);

  // Disable motors
  digitalWrite(MOTOR_ENABLE_PIN, HIGH);
  //digitalWrite(MOTOR_ENABLE_PIN, LOW);

  
}

ISR(TIMER2_COMPA_vect){
  //timer2 interrupt
  TCNT2 = 0;
  //TIFR2 = 0;
  motorFreqLoop();
}

ISR(TIMER2_OVF_vect){
  //timer2 interrupt
  TCNT2 = 250;
  TIFR2 = 0;
  //motorFreqLoop();
}

const unsigned long TIMER_FREQ = 4000;

const int MIN_PERIOD = 2;
const int MAX_PERDIO = 30;

bool _motorsEnabled = false;

unsigned long _timer = 0;
//int regulPeriod = 20;
//int indicAPeriod = 30;
//int indicBPeriod = 10;

// Freq ratio is the interrupt count to wait to send a motor step
float _regulFreqRatio = TIMER_FREQ;
float _indicAFreqRatio = TIMER_FREQ;
float _indicBFreqRatio = TIMER_FREQ;

// Step to go are the remaining count of step the motor need to do
unsigned int _regulStepToGo = 0;
unsigned int _indicAStepToGo = 0;
unsigned int _indicBStepToGo = 0;

void setRegulatorFreq(unsigned int freq) {
  _regulFreqRatio = ((float)TIMER_FREQ) / freq;
}

void setIndicatorAFreq(unsigned int freq) {
  _indicAFreqRatio = ((float)TIMER_FREQ) / freq;
}

void setIndicatorBFreq(unsigned int freq) {
  _indicBFreqRatio = ((float)TIMER_FREQ) / freq;
}

void setRegulatorStepToGo(unsigned int count) {
  _regulStepToGo = count;
}

void setIndicatorAStepToGo(unsigned int count) {
  _indicAStepToGo = count;
}

void setIndicatorBStepToGo(unsigned int count) {
  _indicBStepToGo = count;
}

void enableMotors() {
  digitalWrite(MOTOR_ENABLE_PIN, LOW);
  _motorsEnabled = true;
}

void disableMotors() {
  digitalWrite(MOTOR_ENABLE_PIN, HIGH);
  _motorsEnabled = false;
}

bool _blink = false;
void motorFreqLoop() {
  if (_motorsEnabled) {
      
    // stepToGo need to be positive. Multiply _regulFreqRatio by _regulStepToGo%10 to add one decimal of precision in the output frequency.
    // Example for 499 Hz => 100 kHz / 499 Hz = 200.4 => We will wait : 200, 200, 201, 200, 201, 200, 200, 201, 200, 201, ...
    unsigned int regulInterruptCountToWait = _regulFreqRatio * (10 - _regulStepToGo % 10) - (_regulFreqRatio * (9 - _regulStepToGo % 10));
    unsigned int indicAInterruptCountToWait = _indicAFreqRatio * (10 - _indicAStepToGo % 10) - (_indicAFreqRatio * (9 - _indicAStepToGo % 10));
    unsigned int indivBInterruptCountToWait = _indicBFreqRatio * (10 - _indicBStepToGo % 10) - (_indicBFreqRatio * (9 - _indicBStepToGo % 10));

    /*
    if (_timer % (10 * TIMER_FREQ) == 0) {
      Serial.println(millis());
      Serial.print(F("_regulFreqRatio: "));
      Serial.println(String(_regulFreqRatio, DEC));
  
      Serial.print(F("_indicAFreqRatio: "));
      Serial.println(String(_indicAFreqRatio, DEC));
  
      Serial.print(F("_indicBFreqRatio: "));
      Serial.println(String(_indicBFreqRatio, DEC));
    
      Serial.print(F("regulInterruptCountToWait: "));
      Serial.println(String(regulInterruptCountToWait, DEC));
      
      Serial.print(F("indicAInterruptCountToWait: "));
      Serial.println(String(indicAInterruptCountToWait, DEC));

      Serial.print(F("indivBInterruptCountToWait: "));
      Serial.println(String(indivBInterruptCountToWait, DEC));
    }
    */

    char inverter = 0;
    
    if (_regulStepToGo > 0 && _timer % regulInterruptCountToWait == 0) {
      //digitalWrite(STEP_REGUL_PIN, HIGH);
      //digitalWrite(STEP_REGUL_PIN, LOW);
      //PORTD |= (1 << STEP_REGUL_PIN);
      inverter ^= (1 << STEP_REGUL_PIN);
      _regulStepToGo --;
    }
    
    if (_indicAStepToGo > 0 && _timer % indicAInterruptCountToWait == 0) {
      //digitalWrite(STEP_INDICA_PIN, HIGH);
      //digitalWrite(STEP_INDICA_PIN, LOW);
      //PORTD |= (1 << STEP_INDICA_PIN);
      inverter ^= (1 << STEP_INDICA_PIN);
      _indicAStepToGo --;
    }
  
    if (_indicBStepToGo > 0 && _timer % indivBInterruptCountToWait == 0) {
      //digitalWrite(STEP_INDICB_PIN, HIGH);
      //digitalWrite(STEP_INDICB_PIN, LOW);
      //PORTD |= (1 << STEP_INDICB_PIN);
      inverter ^= (1 << STEP_INDICB_PIN);
      _indicBStepToGo --;
    }

    PORTD ^= inverter;
  }

  /*
  if (_timer % 10000 == 0) {
    //int val = TCNT1;
    //long timems = millis();
    
    //Serial.println(String(timems, DEC) + " : " + String(_timer, DEC) + " / " + String(val, DEC));
    _blink = !_blink;
    digitalWrite(LED_BUILTIN, _blink);
  }
  */
    
  _timer ++;
}

/*
void period1msLoop() {
      if (timer % regulPeriod == 0) {
      digitalWrite(STEP_REGUL_PIN, HIGH);
      digitalWrite(STEP_REGUL_PIN, LOW);
    }
  
    if (timer % indicAPeriod == 0) {
      digitalWrite(STEP_INDICA_PIN, HIGH);
      digitalWrite(STEP_INDICA_PIN, LOW);
    }
  
    if (timer % indicBPeriod == 0) {
      digitalWrite(STEP_INDICB_PIN, HIGH);
      digitalWrite(STEP_INDICB_PIN, LOW);
    }

    timer ++;
    delay(1);
}
*/

int regulPeriodShift = -1;
int indicAPeriodShift = -1;
int indicBPeriodShift = -1;

int regulFrequMax = 800;
int accelerationDelay = 1;

void loop() {

  enableMotors();

  for (int k = 1; k < regulFrequMax; k++) {
    setRegulatorFreq(k);
    setRegulatorStepToGo(10000);
    setIndicatorAFreq(k);
    setIndicatorAStepToGo(10000);
    setIndicatorBFreq(k);
    setIndicatorBStepToGo(10000);
    unsigned long timer = micros();
    while(micros() < timer + 1) {
    }
    //delay(accelerationDelay);
  }
  
  setRegulatorStepToGo(2000);
  delay(5000);
//  setRegulatorFreq(180);

  for (int k = regulFrequMax; k >= 0; k--) {
    setRegulatorFreq(k);
    setRegulatorStepToGo(10000);
    setIndicatorAFreq(k);
    setIndicatorAStepToGo(10000);
    setIndicatorBFreq(k);
    setIndicatorBStepToGo(10000);
    unsigned long timer = micros();
    while(micros() < timer + 10) {
    }
    //delay(accelerationDelay);
  }
  
  delay(5000);
  
  //enableMotors();

  //delay(5000);
  //enableMotors();
  
  //delay(5000);
  //disableMotors();

  
  //period1msLoop();

  /*
  unsigned long time = millis();

  if (time % 100 == 0) {
    if (regulPeriod == MIN_PERIOD) {
      regulPeriodShift = 1;
    }
    if (regulPeriod == MAX_PERDIO) {
      regulPeriodShift = -1;
    }
    regulPeriod += regulPeriodShift;
    
    if (indicAPeriod == MIN_PERIOD) {
      indicAPeriodShift = 1;
    }
    if (indicAPeriod == MAX_PERDIO) {
      indicAPeriodShift = -1;
    }
    indicAPeriod += indicAPeriodShift;
    
    if (indicBPeriod == MIN_PERIOD) {
      indicBPeriodShift = 1;
    }
    if (indicBPeriod == MAX_PERDIO) {
      indicBPeriodShift = -1;
    }
    indicBPeriod += indicBPeriodShift;
    
  }
  */
  
}
