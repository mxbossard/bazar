
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

const float STEPPER_REGUL_MAX_SPEED = 2000;
const float STEPPER_INDIC_MAX_SPEED = 2000;

const float STEPPER_REGUL_ACCELERATION = 4000;
const float STEPPER_INDIC_ACCELERATION = 4000;


const float REGUL_STEP_RATIO = 28.0 / 16;
const uint16_t REGUL_STEP_COUNT = 800;
const float REGUL_OFFSET = 0;

const float INDICA_STEP_RATIO = 28.0 / 36;
const uint16_t INDICA_STEP_COUNT = 800;
const float INDICA_OFFSET = 0;

const float INDICB_STEP_RATIO = 28.0 / 16;
const int16_t INDICB_STEP_COUNT = 800;
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

// Relative symbol coordinates are positive in trigonometric way (couter clock wise)

const float RELATIVE_36_ALPHA_CHAPPE_A[3] = {0, 1.0/4, 1.0/4};
const float RELATIVE_36_ALPHA_CHAPPE_B[3] = {-1.0/8, 1.0/8, 1.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_C[3] = {-1.0/4, 0, 0};
const float RELATIVE_36_ALPHA_CHAPPE_D[3] = {1.0/8, -1.0/8, -1.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_E[3] = {0, -1.0/4, -1.0/4};
const float RELATIVE_36_ALPHA_CHAPPE_F[3] = {-1.0/8, -3.0/8, -3.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_G[3] = {-1.0/4, 1.0/2, 1.0/2};
const float RELATIVE_36_ALPHA_CHAPPE_H[3] = {1.0/8, 3.0/8, 3.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_I[3] = {0, -1.0/4, 1.0/4};
const float RELATIVE_36_ALPHA_CHAPPE_K[3] = {-1.0/8, -3.0/8, 1.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_L[3] = {-1.0/4, 1.0/2, 0};
const float RELATIVE_36_ALPHA_CHAPPE_M[3] = {1.0/8, -1.0/8, 3.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_N[3] = {0, 1.0/4, -1.0/4};
const float RELATIVE_36_ALPHA_CHAPPE_O[3] = {-1.0/8, 1.0/8, -3.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_P[3] = {-1.0/4, 0, 1.0/2};
const float RELATIVE_36_ALPHA_CHAPPE_Q[3] = {1.0/8, 3.0/8, -1.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_R[3] = {0, 1.0/4, 1.0/2};
const float RELATIVE_36_ALPHA_CHAPPE_S[3] = {-1.0/8, 1.0/8, 3.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_T[3] = {-1.0/4, 0, 1.0/4};
const float RELATIVE_36_ALPHA_CHAPPE_U[3] = {1.0/8, 1.0/8, -1.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_V[3] = {0, 0, -1.0/4};
const float RELATIVE_36_ALPHA_CHAPPE_W[3] = {-1.0/8, -1.0/8, -3.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_X[3] = {-1.0/4, -1.0/4, 1.0/2};
const float RELATIVE_36_ALPHA_CHAPPE_Y[3] = {1.0/8, 3.0/8, -3.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_Z[3] = {0, 0, 1.0/4};
const float RELATIVE_36_ALPHA_CHAPPE_ET[3] = {-1.0/8, -1.0/8, 1.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_1[3] = {-1.0/4, -1.0/4, 0};
const float RELATIVE_36_ALPHA_CHAPPE_2[3] = {1.0/8, -1.0/8, -3.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_3[3] = {0, -1.0/4, 1.0/2};
const float RELATIVE_36_ALPHA_CHAPPE_4[3] = {-1.0/8, -3.0/8, 3.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_5[3] = {-1.0/4, 1.0/2, 1.0/4};
const float RELATIVE_36_ALPHA_CHAPPE_6[3] = {1.0/8, 1.0/8, 3.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_7[3] = {0, 0, 1.0/2};
const float RELATIVE_36_ALPHA_CHAPPE_8[3] = {-1.0/8, -1.0/8, 3.0/8};
const float RELATIVE_36_ALPHA_CHAPPE_9[3] = {-1.0/4, -1.0/4, 1.0/4};
const float RELATIVE_36_ALPHA_CHAPPE_10[3] = {1.0/8, 1.0/8, -3.0/8};

const float* RELATIVE_36_ALPHA_CHAPPE[36] = {RELATIVE_36_ALPHA_CHAPPE_A, RELATIVE_36_ALPHA_CHAPPE_B, RELATIVE_36_ALPHA_CHAPPE_C, RELATIVE_36_ALPHA_CHAPPE_D, 
                                            RELATIVE_36_ALPHA_CHAPPE_E, RELATIVE_36_ALPHA_CHAPPE_F, RELATIVE_36_ALPHA_CHAPPE_G, RELATIVE_36_ALPHA_CHAPPE_H, 
                                            RELATIVE_36_ALPHA_CHAPPE_I, RELATIVE_36_ALPHA_CHAPPE_K, RELATIVE_36_ALPHA_CHAPPE_L, RELATIVE_36_ALPHA_CHAPPE_M, 
                                            RELATIVE_36_ALPHA_CHAPPE_N, RELATIVE_36_ALPHA_CHAPPE_O, RELATIVE_36_ALPHA_CHAPPE_P, RELATIVE_36_ALPHA_CHAPPE_Q, 
                                            RELATIVE_36_ALPHA_CHAPPE_R, RELATIVE_36_ALPHA_CHAPPE_S, RELATIVE_36_ALPHA_CHAPPE_T, RELATIVE_36_ALPHA_CHAPPE_U, 
                                            RELATIVE_36_ALPHA_CHAPPE_V, RELATIVE_36_ALPHA_CHAPPE_W, RELATIVE_36_ALPHA_CHAPPE_X, RELATIVE_36_ALPHA_CHAPPE_Y, 
                                            RELATIVE_36_ALPHA_CHAPPE_Z, RELATIVE_36_ALPHA_CHAPPE_ET, RELATIVE_36_ALPHA_CHAPPE_1, RELATIVE_36_ALPHA_CHAPPE_2, 
                                            RELATIVE_36_ALPHA_CHAPPE_3, RELATIVE_36_ALPHA_CHAPPE_4, RELATIVE_36_ALPHA_CHAPPE_5, RELATIVE_36_ALPHA_CHAPPE_6, 
                                            RELATIVE_36_ALPHA_CHAPPE_7, RELATIVE_36_ALPHA_CHAPPE_8, RELATIVE_36_ALPHA_CHAPPE_9, RELATIVE_36_ALPHA_CHAPPE_10};

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

  randomSeed(analogRead(0));
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

void _naiveMoveTo(int16_t regulPos, int16_t indicAPos, int16_t indicBPos) {
  stepperRegulateur.moveTo(regulPos);
  stepperIndicateurA.move(indicAPos);
  stepperIndicateurB.moveTo(indicBPos);
}

int32_t calcShortestDistance(int32_t currentPosition, int32_t positionToGo, int16_t stepCountPerTour) {
  // FIXME it seem there is some move in chappe alphabet which are not shortest (ex between S and T).
  
  // Calculate shortest move for Indicator A
  int32_t distance = positionToGo - currentPosition;
  int32_t reducedDistance = abs(distance) % stepCountPerTour;
  if (distance < 0) {
    reducedDistance = -1 * reducedDistance;
  }
  int32_t minDistance = reducedDistance;
  if (reducedDistance > 1.0/2 * stepCountPerTour) {
    minDistance = reducedDistance - stepCountPerTour;
  }
  else if (reducedDistance < -1.0/2 * stepCountPerTour) {
    minDistance = stepCountPerTour - reducedDistance;
  }

  //Serial.println("indicADistance: " + String(indicADistance, DEC) + ", stepPerIndicATour: " + String(stepPerIndicATour, DEC) + ", indicAReducedDistance: " + String(indicAReducedDistance, DEC) + ", indicAMinDistance:" + String(indicAMinDistance, DEC) + "");

  return minDistance;
}

void _shortestPathMoveTo(int32_t regulPos, int32_t indicAPos, int32_t indicBPos) {
  // TODO calc shortest path for regulator
  
  stepperRegulateur.moveTo(regulPos);
  stepperIndicateurA.move(calcShortestDistance(stepperIndicateurA.currentPosition(), indicAPos, INDICA_STEP_RATIO * INDICA_STEP_COUNT));
  stepperIndicateurB.move(calcShortestDistance(stepperIndicateurB.currentPosition(), indicBPos, INDICB_STEP_RATIO * INDICB_STEP_COUNT));
}

void _oneRandomPathMoveTo(int32_t regulPos, int32_t indicAPos, int32_t indicBPos) {
  // TODO calc shortest path for regulator

  int randExtraLoop = random(0,3);
  
  stepperRegulateur.moveTo(regulPos + REGUL_STEP_RATIO * REGUL_STEP_COUNT * randExtraLoop);
  stepperIndicateurA.move(calcShortestDistance(stepperIndicateurA.currentPosition(), indicAPos, INDICA_STEP_RATIO * INDICA_STEP_COUNT) + INDICA_STEP_RATIO * INDICA_STEP_COUNT * randExtraLoop);
  stepperIndicateurB.move(calcShortestDistance(stepperIndicateurB.currentPosition(), indicBPos, INDICB_STEP_RATIO * INDICB_STEP_COUNT) + INDICB_STEP_RATIO * INDICB_STEP_COUNT * randExtraLoop);
}

void _allRandomPathMoveTo(int32_t regulPos, int32_t indicAPos, int32_t indicBPos) {
  // TODO calc shortest path for regulator
  
  stepperRegulateur.moveTo(regulPos + REGUL_STEP_RATIO * REGUL_STEP_COUNT * random(0,3));
  stepperIndicateurA.move(calcShortestDistance(stepperIndicateurA.currentPosition(), indicAPos, INDICA_STEP_RATIO * INDICA_STEP_COUNT) + INDICA_STEP_RATIO * INDICA_STEP_COUNT * random(0,3));
  stepperIndicateurB.move(calcShortestDistance(stepperIndicateurB.currentPosition(), indicBPos, INDICB_STEP_RATIO * INDICB_STEP_COUNT) + INDICB_STEP_RATIO * INDICB_STEP_COUNT * random(0,3));
}


void moveToSymbol(float symbol[3]) {
  //Serial.println("Symbol: (" + String(symbol[0], DEC) + ", " + String(symbol[1], DEC) + ", " + String(symbol[2], DEC) + ")");
  
  int16_t regulPos = (float) REGUL_STEP_COUNT * (symbol[0] + REGUL_OFFSET) * REGUL_STEP_RATIO;
  int16_t indicAPos = (float) INDICA_STEP_COUNT * (symbol[1] + INDICA_OFFSET) * INDICA_STEP_RATIO;
  int16_t indicBPos = (float) INDICB_STEP_COUNT * (symbol[2] + INDICB_OFFSET) * INDICB_STEP_RATIO;

  //Serial.println("Move to: (" + String(regulPos, DEC) + ", " + String(indicAPos, DEC) + ", " + String(indicBPos, DEC) + ")");

  //_naiveMoveTo(regulPos, indicAPos, indicBPos);
  //_shortestPathMoveTo(regulPos, indicAPos, indicBPos);
  //_randomPathMoveTo(regulPos, indicAPos, indicBPos);
  _oneRandomPathMoveTo(regulPos, indicAPos, indicBPos);
  
  uint16_t stepToGo = max(abs(stepperRegulateur.distanceToGo()), abs(stepperIndicateurA.distanceToGo()));
  stepToGo = max(stepToGo, abs(stepperIndicateurB.distanceToGo()));

  // Fastest way to call run() a reasonable amount of time ?
  for(uint16_t k = 0 ; k < stepToGo ; k++) {
    stepperRegulateur.run();
    stepperIndicateurA.run();
    stepperIndicateurB.run();
  }

  // Go on calling run() just in case
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

void listChappeAlphabet() {
  enableMotors();

  for (int k = 0; k < 36 ; k++) {
    moveToSymbol(RELATIVE_36_ALPHA_CHAPPE[k]);
    delay(2000);
  }

  //disableMotors();
}

void loop() {
  listChappeAlphabet();
  delay(10000);
}
