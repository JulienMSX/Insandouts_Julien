

#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_ADXL345_U.h>

Adafruit_ADXL345_Unified accel = Adafruit_ADXL345_Unified();
int x;
const int b = 12;
int bs = 0;
void setup() {
  
  Serial.begin(9600);  
  accel.begin();
  pinMode(b, INPUT);

}

void loop() {
   
  

    sensors_event_t event; 
    accel.getEvent(&event);
    x = event.acceleration.x;
    bs = digitalRead(b);
    
    //Serial.println(map(x,-10,10,1,20));
    Serial.write(map(x,-100,100,0,255));
    ////Serial.write(x);
    if(bs == HIGH){
      Serial.write(200);
      //Serial.println(200);
    }


    

    

    delay(50);
  
 
}
