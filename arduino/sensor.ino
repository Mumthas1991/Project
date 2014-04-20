
 
int x;
 
void setup() {
 pinMode(2,INPUT);
 Serial.begin(9600);
 x = 0;
}
 
void loop() {
 x=analogRead(2);
Serial.flush();
 Serial.println(x);

 
 //Allow Time to Process Serial Communication
 delay(500);
}