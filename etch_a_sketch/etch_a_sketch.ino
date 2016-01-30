const int xPot = A2;
const int yPot = A0;
const int resetSwitch = 2;

int xVal;
int yVal;
int reset;

void setup() {
  Serial.begin(9600);
  pinMode(xPot, INPUT);
  pinMode(yPot, INPUT);
  pinMode(resetSwitch, INPUT);
}

void loop() {
  xVal = analogRead(xPot);
  yVal = analogRead(yPot);
  reset = digitalRead(resetSwitch);
  Serial.print(xVal);
  Serial.print(',');
  Serial.print(yVal);
  Serial.print(',');
  Serial.print(reset);
  Serial.print('\n');
  delay(20);
}
