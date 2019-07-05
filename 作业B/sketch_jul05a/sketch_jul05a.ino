// int sensorpin = A5;
// int sensorvalue;
#define potXPin A0
#define potYPin A1
 char HEADER = 'M';
void setup() {
 Serial.begin(9600);

}

void loop() {
// sensorvalue = analogRead(sensorpin);
// if(sensorvalue>27){
//  Serial.print(sensorvalue.DEC);
//  delay(100);
// }
 int x =analogRead(potXPin);
 int y =analogRead(potYPin);
 
 Serial.print(HEADER);
 Serial.print(",");
 Serial.print(x,DEC);
 Serial.print(",");
 Serial.print(y,DEC);
 Serial.print(",");

 Serial.println();
 delay(40);

}
