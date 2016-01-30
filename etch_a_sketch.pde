import processing.serial.*;

Serial myPort;  
int xVal, yVal, reset;
int lastX, lastY;

void setup() 
{
  size(1024, 1024);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  background(255);
}

void draw()
{
  fill(0);
  if(reset == 1) background(255);
  line(lastX, lastY, xVal, yVal);
  lastX = xVal;
  lastY = yVal;
}

void serialEvent(Serial myPort) {
  String data = myPort.readStringUntil('\n');

  if (data != null) {
    data = trim(data);
    String[] splitData = split(data, ',');
    xVal = int(splitData[0]);
    yVal = 1024 - int(splitData[1]);
    reset = int(splitData[2]);
    println(yVal);
  }
}