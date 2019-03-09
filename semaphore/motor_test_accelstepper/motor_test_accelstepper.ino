
#include <AccelStepper.h>

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

const int STEP_INDICA_PIN = CNC_STEP_Z_PIN;
const int DIR_INDICA_PIN = CNC_DIR_Z_PIN;

const int STEP_INDICB_PIN = CNC_STEP_X_PIN;
const int DIR_INDICB_PIN = CNC_DIR_X_PIN;

const int MOTOR_ENABLE_PIN = CNC_ENABLE_PIN;

const float STEPPER_REGUL_MAX_SPEED = 40000;
const float STEPPER_INDIC_MAX_SPEED = 40000;

const float STEPPER_REGUL_ACCELERATION = 40000;
const float STEPPER_INDIC_ACCELERATION = 40000;


const float REGUL_STEP_RATIO = 28.0 / 16;
const uint16_t REGUL_STEP_COUNT = 3200;
const float REGUL_OFFSET = 0;

const float INDICA_STEP_RATIO = 28.0 / 36;
const uint16_t INDICA_STEP_COUNT = 3200;
const float INDICA_OFFSET = 0;

const float INDICB_STEP_RATIO = 28.0 / 16;
const int16_t INDICB_STEP_COUNT = 3200;
const float INDICB_OFFSET = - 1.0 / 2;

/*
const float RELATIVE_SYMBOL_A[3] = {0, 1.0/4, 1.0/4};
const float RELATIVE_SYMBOL_B[3] = {0, 0, 0};
const float RELATIVE_SYMBOL_C[3] = {0, 3.0/4, 7.0/8};
const float RELATIVE_SYMBOL_D[3] = {0, 1.0/8, 3.0/4};
*/

const float RELATIVE_SYMBOL_A[3] = {0, 1.0/4, 1.0/4};
const float RELATIVE_SYMBOL_B[3] = {1.0/4, 2.0/4, 2.0/4};
const float RELATIVE_SYMBOL_C[3] = {0, 3.0/4, 3.0/4};
const float RELATIVE_SYMBOL_D[3] = {-1.0/4, 4.0/4, 4.0/4};
const float RELATIVE_SYMBOL_0[3] = {0, 0, 1.0/2};


// Define some steppers and the pins the will use
AccelStepper stepperRegulateur(AccelStepper::DRIVER, STEP_REGUL_PIN, DIR_REGUL_PIN);
AccelStepper stepperIndicateurA(AccelStepper::DRIVER, STEP_INDICA_PIN, DIR_INDICA_PIN);
AccelStepper stepperIndicateurB(AccelStepper::DRIVER, STEP_INDICB_PIN, DIR_INDICB_PIN);

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);

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

  stepperRegulateur.setMaxSpeed(STEPPER_REGUL_MAX_SPEED);
  stepperRegulateur.setAcceleration(STEPPER_REGUL_ACCELERATION);
  stepperRegulateur.setCurrentPosition(0);
  stepperRegulateur.setPinsInverted(true);

  stepperIndicateurA.setMaxSpeed(STEPPER_INDIC_MAX_SPEED);
  stepperIndicateurA.setAcceleration(STEPPER_INDIC_ACCELERATION);
  stepperIndicateurA.setCurrentPosition(0);

  stepperIndicateurB.setMaxSpeed(STEPPER_INDIC_MAX_SPEED);
  stepperIndicateurB.setAcceleration(STEPPER_INDIC_ACCELERATION);
  stepperIndicateurB.setCurrentPosition(0);
  stepperIndicateurB.setPinsInverted(true);
  
}

bool _motorsEnabled = false;


void enableMotors() {
  digitalWrite(MOTOR_ENABLE_PIN, LOW);
  _motorsEnabled = true;
}

void disableMotors() {
  digitalWrite(MOTOR_ENABLE_PIN, HIGH);
  _motorsEnabled = false;
}

void moveToSymbol(float symbol[3]) {
  Serial.println("Symbol: (" + String(symbol[0], DEC) + ", " + String(symbol[1], DEC) + ", " + String(symbol[2], DEC) + ")");
  
  int16_t regulPos = (float) REGUL_STEP_COUNT * (symbol[0] + REGUL_OFFSET) * REGUL_STEP_RATIO;
  int16_t indicAPos = (float) INDICA_STEP_COUNT * (symbol[1] + INDICA_OFFSET) * INDICA_STEP_RATIO;
  int16_t indicBPos = (float) INDICB_STEP_COUNT * (symbol[2] + INDICB_OFFSET) * INDICB_STEP_RATIO;

  Serial.println("Move to: (" + String(regulPos, DEC) + ", " + String(indicAPos, DEC) + ", " + String(indicBPos, DEC) + ")");
  
  stepperRegulateur.moveTo(regulPos);
  stepperIndicateurA.moveTo(indicAPos);
  stepperIndicateurB.moveTo(indicBPos);

  while(stepperRegulateur.isRunning() || stepperIndicateurA.isRunning() || stepperIndicateurB.isRunning()) {
    stepperRegulateur.run();
    stepperIndicateurA.run();
    stepperIndicateurB.run();
  }
}

void testSemaphore() {
  enableMotors();

  moveToSymbol(RELATIVE_SYMBOL_A);
  delay(2000);
  moveToSymbol(RELATIVE_SYMBOL_B);
  delay(2000);
  moveToSymbol(RELATIVE_SYMBOL_C);
  delay(2000);
  moveToSymbol(RELATIVE_SYMBOL_D);
  delay(2000);
  moveToSymbol(RELATIVE_SYMBOL_0);

  //disableMotors();
}

void loop() {
  testSemaphore();
  delay(10000);
}
