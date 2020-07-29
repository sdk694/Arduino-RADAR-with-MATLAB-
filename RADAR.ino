
#include <Servo.h> 

Servo myservo; 
int pos = 1;
long duration, inches, cm=0;
const int pingPin = 8;
int st=0;

void setup() 
{ 
  Serial.begin(9600);
  myservo.attach(9); 
 } 
 
 
void loop() 
{ 

 if (pos == 1)
 	st = 0;
    
 if (pos == 180)
 	st = 1;
    
 if (st==0)
 	pos = pos+1;
    
 if (st==1)
    	pos = pos-1;
         
  myservo.write(pos);
  
  data();  
  
  Serial.print(pos); Serial.print( " "); Serial.println(cm);
  delay(30);
  
}


void data()
{
  pinMode(pingPin, OUTPUT);
  digitalWrite(pingPin, LOW);
  delayMicroseconds(2);
  digitalWrite(pingPin, HIGH);
  delayMicroseconds(5);
  digitalWrite(pingPin, LOW);
  pinMode(pingPin, INPUT);
  duration = pulseIn(pingPin, HIGH);
  // convert the time into a distance
  inches = microsecondsToInches(duration);
  cm = microsecondsToCentimeters(duration);  
  if (cm>300)
  {
    cm = 300;
  }
}


long microsecondsToInches(long microseconds)
{
  return microseconds / 74 / 2;
}

long microsecondsToCentimeters(long microseconds)
{
  return microseconds / 29 / 2;
}


