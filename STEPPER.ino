
//const int triggerpin = 6;
//const int echopin= 7;

void setup() {
  // put your setup code here, to run once:
   Serial.begin(9600);
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  digitalWrite(2,0);
  digitalWrite(3,0);
  digitalWrite(4,0);
  digitalWrite(5,0);
  pinMode(13,OUTPUT);
//  Serial.begin(9600);
//  pinMode(triggerpin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  long duration,inches,cm;
  digitalWrite(13,1);
//
  digitalWrite(2,1);
  delay(3);
  digitalWrite(2,0);
  

  digitalWrite(3,1);
  delay(3);
  digitalWrite(3,0);

//  
  digitalWrite(4,1);  
  delay(3);
  digitalWrite(4,0);

  
  digitalWrite(5,1);  
  delay(3);
  digitalWrite(5,0);

//  digitalWrite(triggerpin, LOW);
//  delayMicroseconds(2);
//  digitalWrite(triggerpin, HIGH);
//  delayMicroseconds(5);
//  digitalWrite(triggerpin, LOW);
////
////   The same pin is used to read the signal from the PING))): a HIGH
////   pulse whose duration is the time (in microseconds) from the sending
////   of the ping to the reception of its echo off of an object.
//  pinMode(echopin, INPUT);
//  duration = pulseIn(echopin, HIGH);
//
//  // convert the time into a distance
////  inches = microsecondsToInches(duration);
////  cm = microsecondsToCentimeters(duration);
//
////  Serial.print(inches);
////  Serial.print("in, ");
////  Serial.print(cm);
////  Serial.print("cm");
////  Serial.println();
////  delay(10);
//  
 }
 long microsecondsToInches(long microseconds)
{
  return microseconds / 74 / 2;
}
 long microsecondsToCentimeters(long microseconds) 
 {
  return microseconds / 29 / 2;
 }
