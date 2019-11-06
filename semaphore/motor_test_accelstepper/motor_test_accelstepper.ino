
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

const int STEP_A_INDIC_PIN = CNC_STEP_Z_PIN;
const int DIR_A_INDIC_PIN = CNC_DIR_Z_PIN;

const int STEP_B_INDIC_PIN = CNC_STEP_X_PIN;
const int DIR_B_INDIC_PIN = CNC_DIR_X_PIN;

const int MOTOR_ENABLE_PIN = CNC_ENABLE_PIN;

const float STEPPER_REGUL_MAX_SPEED = 1000;
const float STEPPER_INDIC_MAX_SPEED = 1000;

const float STEPPER_REGUL_ACCELERATION = 200;
const float STEPPER_INDIC_ACCELERATION = 200;


const float REGUL_STEP_RATIO = 1.0/2.5;//28.0 / 16;
const uint16_t REGUL_STEP_COUNT = 800;
const float REGUL_OFFSET = 0;

const float A_INDIC_STEP_RATIO = 1.0/2.5;//28.0 / 36;
const uint16_t A_INDIC_STEP_COUNT = 800;
const float A_INDIC_OFFSET = 0;

const float B_INDIC_STEP_RATIO = 1.0/2.5;//28.0 / 16;
const int16_t B_INDIC_STEP_COUNT = 800;
const float B_INDIC_OFFSET = 1.0 / 2;

const uint16_t REGUL_STEP_PER_TOUR = REGUL_STEP_RATIO * REGUL_STEP_COUNT;
const uint16_t A_INDIC_STEP_PER_TOUR = A_INDIC_STEP_RATIO * A_INDIC_STEP_COUNT;
const uint16_t B_INDIC_STEP_PER_TOUR = B_INDIC_STEP_RATIO * B_INDIC_STEP_COUNT;

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
AccelStepper stepperIndicateurA(AccelStepper::DRIVER, STEP_A_INDIC_PIN, DIR_A_INDIC_PIN);
AccelStepper stepperIndicateurB(AccelStepper::DRIVER, STEP_B_INDIC_PIN, DIR_B_INDIC_PIN);

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);

  pinMode(STEP_REGUL_PIN, OUTPUT);
  pinMode(DIR_REGUL_PIN, OUTPUT);
  pinMode(STEP_A_INDIC_PIN, OUTPUT);
  pinMode(DIR_A_INDIC_PIN, OUTPUT);
  pinMode(STEP_B_INDIC_PIN, OUTPUT);
  pinMode(DIR_B_INDIC_PIN, OUTPUT);
  pinMode(MOTOR_ENABLE_PIN, OUTPUT);

  pinMode(LED_BUILTIN, OUTPUT);

  digitalWrite(STEP_REGUL_PIN, LOW);
  digitalWrite(DIR_REGUL_PIN, LOW);
  digitalWrite(STEP_A_INDIC_PIN, LOW);
  digitalWrite(DIR_A_INDIC_PIN, LOW);
  digitalWrite(STEP_B_INDIC_PIN, LOW);
  digitalWrite(DIR_B_INDIC_PIN, LOW);

  // Disable motors
  digitalWrite(MOTOR_ENABLE_PIN, HIGH);

  stepperRegulateur.setMaxSpeed(STEPPER_REGUL_MAX_SPEED);
  stepperRegulateur.setAcceleration(STEPPER_REGUL_ACCELERATION);
  stepperRegulateur.setCurrentPosition(0);
  stepperRegulateur.setPinsInverted(false);

  stepperIndicateurA.setMaxSpeed(STEPPER_INDIC_MAX_SPEED);
  stepperIndicateurA.setAcceleration(STEPPER_INDIC_ACCELERATION);
  stepperIndicateurA.setCurrentPosition(0);
  stepperIndicateurB.setPinsInverted(true);

  stepperIndicateurB.setMaxSpeed(STEPPER_INDIC_MAX_SPEED);
  stepperIndicateurB.setAcceleration(STEPPER_INDIC_ACCELERATION);
  stepperIndicateurB.setCurrentPosition(0);
  stepperIndicateurB.setPinsInverted(false);

  // Setup steppers offsets
  stepperRegulateur.setCurrentPosition(REGUL_OFFSET * REGUL_STEP_PER_TOUR);
  stepperIndicateurA.setCurrentPosition(A_INDIC_OFFSET * A_INDIC_STEP_PER_TOUR);
  stepperIndicateurB.setCurrentPosition(B_INDIC_OFFSET * B_INDIC_STEP_PER_TOUR);

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
  stepperIndicateurA.moveTo(indicAPos);
  stepperIndicateurB.moveTo(indicBPos);
}

int16_t calcShortestDistance(int32_t currentPosition, int32_t positionToGo, int16_t stepCountPerTour) {
  // FIXME it seem there is some move in chappe alphabet which are not shortest (ex between S and T).
  
  // Calculate shortest move for Indicator A
  int32_t distance = positionToGo - currentPosition;
  int32_t reducedDistance = abs(distance) % stepCountPerTour;
  if (distance < 0) {
    reducedDistance = -1 * reducedDistance;
  }
  int16_t minDistance = reducedDistance;
  if (reducedDistance > 1.0/2 * stepCountPerTour) {
    minDistance = - stepCountPerTour + reducedDistance;
  }
  else if (reducedDistance < -1.0/2 * stepCountPerTour) {
    minDistance = stepCountPerTour + reducedDistance;
  }

  //Serial.println("indicADistance: " + String(indicADistance, DEC) + ", stepPerIndicATour: " + String(stepPerIndicATour, DEC) + ", indicAReducedDistance: " + String(indicAReducedDistance, DEC) + ", indicAMinDistance:" + String(indicAMinDistance, DEC) + "");

  return minDistance;
}

void _shortestPathMoveTo(int32_t regulPos, int32_t indicAPos, int32_t indicBPos) {
  // TODO calc shortest path for regulator

  int32_t currentRegulPos = stepperRegulateur.currentPosition();
  int32_t currentIndicAPos = stepperIndicateurA.currentPosition();
  int32_t currentIndicBPos = stepperIndicateurB.currentPosition();
  
  int16_t regulShortestDistance = calcShortestDistance(currentRegulPos, regulPos, REGUL_STEP_RATIO * REGUL_STEP_COUNT * 1.0/2); // Half step count per tour for the regulator because it returns in position after half a tour but in reverse state.
  uint16_t regulStepCountPerTour = REGUL_STEP_RATIO * REGUL_STEP_COUNT;

  // normalizedCurrentRegulPos range between 0 and regulStepCountPerTour for a complete regulator tour.
  int16_t normalizedCurrentRegulPos = 0;
  if (currentRegulPos >= 0) {
    normalizedCurrentRegulPos = currentRegulPos % regulStepCountPerTour;
  } else {
    normalizedCurrentRegulPos = regulStepCountPerTour - (abs(currentRegulPos) % regulStepCountPerTour);
  }
  
  if (normalizedCurrentRegulPos > 1.0/4 * regulStepCountPerTour && normalizedCurrentRegulPos <= 3.0/4 * regulStepCountPerTour) {
    // Regulator is in a reverse state. So Indicator A is left or bottom.
    //Serial.println("Regulator in reverse state.");
    //Serial.println("Before swap Indic A pos: " + String(indicAPos, DEC) + " ; Indic B pos: " + String(indicBPos, DEC));
    // Swap indicator A and B
    int32_t tempA = indicAPos;
    // Offset of each indicator is included so we need to remove and reinclude it.
    
    indicAPos = A_INDIC_STEP_RATIO * A_INDIC_STEP_COUNT * ((float) indicBPos / (B_INDIC_STEP_RATIO * B_INDIC_STEP_COUNT));
    indicBPos = B_INDIC_STEP_RATIO * B_INDIC_STEP_COUNT * ((float) tempA / (A_INDIC_STEP_RATIO * A_INDIC_STEP_COUNT));

    Serial.println("After swap Indic A pos: " + String(indicAPos, DEC) + " ; Indic B pos: " + String(indicBPos, DEC));
  }

  int16_t indicAShortestDistance = calcShortestDistance(currentIndicAPos, indicAPos, A_INDIC_STEP_RATIO * A_INDIC_STEP_COUNT);
  int16_t indicBShortestDistance = calcShortestDistance(currentIndicBPos, indicBPos, B_INDIC_STEP_RATIO * B_INDIC_STEP_COUNT);

  //int32_t regulatorDistance = regulPos - stepperRegulateur.currentPosition();
  //stepperRegulateur.move(regulatorDistance);
  stepperRegulateur.move(regulShortestDistance);
  stepperIndicateurA.move(indicAShortestDistance);
  stepperIndicateurB.move(indicBShortestDistance);
}

void _oneRandomPathMoveTo(int32_t regulPos, int32_t indicAPos, int32_t indicBPos) {
  // TODO calc shortest path for regulator

  int randExtraLoop = random(-3, 3);

  int32_t regulatorDistance = regulPos - stepperRegulateur.currentPosition();
  stepperRegulateur.move(regulatorDistance + REGUL_STEP_RATIO * REGUL_STEP_COUNT * randExtraLoop);
  stepperIndicateurA.move(calcShortestDistance(stepperIndicateurA.currentPosition(), indicAPos, A_INDIC_STEP_RATIO * A_INDIC_STEP_COUNT) + A_INDIC_STEP_RATIO * A_INDIC_STEP_COUNT * randExtraLoop);
  stepperIndicateurB.move(calcShortestDistance(stepperIndicateurB.currentPosition(), indicBPos, B_INDIC_STEP_RATIO * B_INDIC_STEP_COUNT) + B_INDIC_STEP_RATIO * B_INDIC_STEP_COUNT * randExtraLoop);
}

void _allRandomPathMoveTo(int32_t regulPos, int32_t indicAPos, int32_t indicBPos) {
  // TODO calc shortest path for regulator
  
  int32_t regulatorDistance = regulPos - stepperRegulateur.currentPosition();
  stepperRegulateur.move(regulatorDistance + REGUL_STEP_RATIO * REGUL_STEP_COUNT * random(-3, 3));
  stepperIndicateurA.move(calcShortestDistance(stepperIndicateurA.currentPosition(), indicAPos, A_INDIC_STEP_RATIO * A_INDIC_STEP_COUNT) + A_INDIC_STEP_RATIO * A_INDIC_STEP_COUNT * random(-3, 3));
  stepperIndicateurB.move(calcShortestDistance(stepperIndicateurB.currentPosition(), indicBPos, B_INDIC_STEP_RATIO * B_INDIC_STEP_COUNT) + B_INDIC_STEP_RATIO * B_INDIC_STEP_COUNT * random(-3, 3));
}


void moveToSymbol(float symbol[3]) {
  Serial.println("Symbol: (" + String(symbol[0], DEC) + ", " + String(symbol[1], DEC) + ", " + String(symbol[2], DEC) + ")");

  int16_t regulPos = (float) REGUL_STEP_COUNT * symbol[0] * REGUL_STEP_RATIO;
  int16_t indicAPos = (float) A_INDIC_STEP_COUNT * symbol[1] * A_INDIC_STEP_RATIO;
  int16_t indicBPos = (float) B_INDIC_STEP_COUNT * symbol[2] * B_INDIC_STEP_RATIO;

  Serial.println("Move to: (" + String(regulPos, DEC) + ", " + String(indicAPos, DEC) + ", " + String(indicBPos, DEC) + ")");

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

void blockUntilStepperMoveEnd() {
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

  boxStepperPosition();
}

void moveSemaphoreByRelativeAngle(float regulAngle, float aIndicAngle, float bIndicAngle) {
  Serial.println("moveSemaphoreByRelativeAngle ; regulAngle: " + String(regulAngle, DEC) + " ; aIndicAngle: " + String(aIndicAngle, DEC) + " ; bIndicAngle: " + String(bIndicAngle, DEC));
  int32_t regulStepCount = regulAngle * REGUL_STEP_PER_TOUR;
  int32_t aIndicStepCount = aIndicAngle * A_INDIC_STEP_PER_TOUR;
  int32_t bIndicStepCount = bIndicAngle * B_INDIC_STEP_PER_TOUR;
  Serial.println("moveSemaphoreByRelativeAngle ; regulStepCount: " + String(regulStepCount, DEC) + " ; aIndicStepCount: " + String(aIndicStepCount, DEC) + " ; bIndicStepCount: " + String(bIndicStepCount, DEC));
  
  stepperRegulateur.move(regulStepCount);
  stepperIndicateurA.move(aIndicStepCount);
  stepperIndicateurB.move(bIndicStepCount);

  blockUntilStepperMoveEnd();

  Serial.println("moveSemaphoreByRelativeAngle movedTo: regulPosition= " + String(stepperRegulateur.currentPosition(), DEC) + " ; indicAposition= " + String(stepperIndicateurA.currentPosition(), DEC) + " ; indicBposition= " + String(stepperIndicateurB.currentPosition(), DEC));
}

float extractDecimalPart(float number) {
  int32_t integerPart = number;
  return number - integerPart;
}

void moveSemaphoreToAbsoluteAngle(float regulAngle, float aIndicAngle, float bIndicAngle) {
  Serial.println("moveSemaphoreToAbsoluteAngle ; regulAngle: " + String(regulAngle, DEC) + " ; aIndicAngle: " + String(aIndicAngle, DEC) + " ; bIndicAngle: " + String(bIndicAngle, DEC));
  int32_t regulStepPosition = regulAngle * REGUL_STEP_PER_TOUR;
  int32_t aIndicStepPosition = aIndicAngle * A_INDIC_STEP_PER_TOUR;
  int32_t bIndicStepPosition = bIndicAngle * B_INDIC_STEP_PER_TOUR;

  stepperRegulateur.moveTo(regulStepPosition);
  stepperIndicateurA.moveTo(aIndicStepPosition);
  stepperIndicateurB.moveTo(bIndicStepPosition);

  blockUntilStepperMoveEnd();

  Serial.println("moveSemaphoreToAbsoluteAngle movedTo: regulPosition= " + String(stepperRegulateur.currentPosition(), DEC) + " ; indicAposition= " + String(stepperIndicateurA.currentPosition(), DEC) + " ; indicBposition= " + String(stepperIndicateurB.currentPosition(), DEC));
}

bool isRegulatorInReverseState() {
  return willRegulatorEndInReverseState(0.0);
}

bool willRegulatorEndInReverseState(float regulRelativeAngle) {
  int32_t regulStepCount = regulRelativeAngle * REGUL_STEP_PER_TOUR;

  int32_t regulateurEndPosition = stepperRegulateur.currentPosition() + regulStepCount;

  // 0 <= boxedRegulateurEndPosition < REGUL_STEP_PER_TOUR
  uint16_t boxedRegulateurEndPosition = 0;
  if (regulateurEndPosition < 0) {
    boxedRegulateurEndPosition = REGUL_STEP_PER_TOUR - (abs(regulateurEndPosition) % REGUL_STEP_PER_TOUR);
  } else {
    boxedRegulateurEndPosition = regulateurEndPosition % REGUL_STEP_PER_TOUR;
  }

  if (boxedRegulateurEndPosition < 1.0/4 * REGUL_STEP_PER_TOUR || boxedRegulateurEndPosition >= 3.0/4 * REGUL_STEP_PER_TOUR) {
    return false;
  }
  return true;
}

// Calculate the shortest angle move between 2 float angles with : -maxAngularMove < shortestAngularMove <= maxAngularMove
float calculateShortestAngularMove(float angle1, float angle2, float maxAngularMove) {
  float distance = extractDecimalPart(angle2 - angle1);

  while (distance <= -maxAngularMove) {
    distance = distance + maxAngularMove * 2;
  }
  while (distance >= maxAngularMove) {
    distance = distance - maxAngularMove * 2;
  }

  //Serial.println("calculateShortestAngularMove: angle1= " + String(angle1, DEC) + " ; angle2= " + String(angle2, DEC) + " ; maxAngularMove= " + String(maxAngularMove, DEC) + " => distance= " + String(distance, DEC));

  return distance;
}

void calculateSymbolShortestAngularMove(float symbol1[3], float symbol2[3], float symbolMove[3]) {

  float shortestRegulMove = calculateShortestAngularMove(symbol1[0], symbol2[0], 1.0/4);
  float shortestAIndicMove = 0.0;
  float shortestBIndicMove = 0.0;
  
  if(!isRegulatorInReverseState() && !willRegulatorEndInReverseState(shortestRegulMove)) {
    // Stay in normal state
    shortestAIndicMove = calculateShortestAngularMove(symbol1[1], symbol2[1], 1.0/2);
    shortestBIndicMove = calculateShortestAngularMove(symbol1[2], symbol2[2], 1.0/2);
    Serial.println("Regulator stay in normal state ; shortestRegulMove: " + String(shortestRegulMove, DEC) + " ; shortestAIndicMove: " + String(shortestAIndicMove, DEC) + " ; shortestBIndicMove: " + String(shortestBIndicMove, DEC));
  } else if (!isRegulatorInReverseState() && willRegulatorEndInReverseState(shortestRegulMove)) {
    // Not in reverse state but will be in reverse state after move
    shortestAIndicMove = calculateShortestAngularMove(symbol1[2], symbol2[1], 1.0/2);
    shortestBIndicMove = calculateShortestAngularMove(symbol1[1], symbol2[2], 1.0/2);
    Serial.println("Regulator enter in reverse state ; shortestRegulMove: " + String(shortestRegulMove, DEC) + " ; shortestAIndicMove: " + String(shortestAIndicMove, DEC) + " ; shortestBIndicMove: " + String(shortestBIndicMove, DEC));
  } else if (isRegulatorInReverseState() && willRegulatorEndInReverseState(shortestRegulMove)) {
    // Stay in reverse state
    shortestAIndicMove = calculateShortestAngularMove(symbol1[2], symbol2[2], 1.0/2);
    shortestBIndicMove = calculateShortestAngularMove(symbol1[1], symbol2[1], 1.0/2);
    Serial.println("Regulator stay in reverse state ; shortestRegulMove: " + String(shortestRegulMove, DEC) + " ; shortestAIndicMove: " + String(shortestAIndicMove, DEC) + " ; shortestBIndicMove: " + String(shortestBIndicMove, DEC));
  } else {
    // Come back to normal state
    shortestAIndicMove = calculateShortestAngularMove(symbol1[1], symbol2[2], 1.0/2);
    shortestBIndicMove = calculateShortestAngularMove(symbol1[2], symbol2[1], 1.0/2);
    Serial.println("Regulator enter in normal state ; shortestRegulMove: " + String(shortestRegulMove, DEC) + " ; shortestAIndicMove: " + String(shortestAIndicMove, DEC) + " ; shortestBIndicMove: " + String(shortestBIndicMove, DEC));
  }

  symbolMove[0] = shortestRegulMove;
  symbolMove[1] = shortestAIndicMove;
  symbolMove[2] = shortestBIndicMove;
}

void displaySemaphoreSymbol(float symbol[]) {
    // symbol is made of absolute angles
    
    
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

void boxStepperPosition() {
  int32_t regulPos = stepperRegulateur.currentPosition();
  if (regulPos < 0) {
    stepperRegulateur.setCurrentPosition(REGUL_STEP_PER_TOUR - abs(regulPos) % REGUL_STEP_PER_TOUR);
  } else {
    stepperRegulateur.setCurrentPosition(regulPos % REGUL_STEP_PER_TOUR);
  }

  int32_t aIndicPos = stepperIndicateurA.currentPosition();
  if (aIndicPos < 0) {
    stepperIndicateurA.setCurrentPosition(A_INDIC_STEP_PER_TOUR - abs(aIndicPos) % A_INDIC_STEP_PER_TOUR);
  } else {
    stepperIndicateurA.setCurrentPosition(aIndicPos % A_INDIC_STEP_PER_TOUR);
  }

  int32_t bIndicPos = stepperIndicateurB.currentPosition();
  if (bIndicPos < 0) {
    stepperIndicateurB.setCurrentPosition(A_INDIC_STEP_PER_TOUR - abs(bIndicPos) % B_INDIC_STEP_PER_TOUR);
  } else {
    stepperIndicateurB.setCurrentPosition(bIndicPos % B_INDIC_STEP_PER_TOUR);
  }
  
}

void listChappeAlphabet() {
  enableMotors();

  float previousSymbol[3] = {(float)stepperRegulateur.currentPosition()/REGUL_STEP_PER_TOUR, (float)stepperIndicateurA.currentPosition()/A_INDIC_STEP_PER_TOUR, (float)stepperIndicateurB.currentPosition()/B_INDIC_STEP_PER_TOUR};
  float symbolMove[3] = {0, 0, 0};

  /*
  for (int k = 0; k < 36 ; k++) {
    calculateSymbolShortestAngularMove(previousSymbol, RELATIVE_36_ALPHA_CHAPPE[k], symbolMove);
    moveSemaphoreByRelativeAngle(symbolMove[0], symbolMove[1], symbolMove[2]);

    memcpy(previousSymbol, RELATIVE_36_ALPHA_CHAPPE[k], 3*sizeof(previousSymbol[0]));
    delay(2000);
  }
  */
  
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
