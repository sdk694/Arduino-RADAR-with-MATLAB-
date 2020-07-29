    
#include <Stepper.h>
 
#define STEPS_PER_REV 513
 
// Create our stepper motor object
Stepper motor(STEPS_PER_REV, 2, 3, 4, 5);
 
void setup() {
  motor.setSpeed(10); 
  // Motor speed of 10 RPM
}
void loop()
{
// motor.step(STEPS_PER_REV);        // Step clockwise one whole revolution
//motor.step(STEPS_PER_REV / 2);    // Step clockwise half revolution
motor.step(-STEPS_PER_REV);       // Step count
}



 
