const int L1 = 13;
const int L2 = 12;
const int L3 = 11;
const int bt = A0;
int a,b,c;
int ary[3];
void setup() {
  pinMode(L1, OUTPUT);
  pinMode(L2, OUTPUT);
  pinMode(L3, OUTPUT);
  pinMode(bt, INPUT);
  Serial.begin(9600);
  
  
 

}

void loop() {
  
  
  int on = analogRead(bt);
 
 
  if(on >= 1000){
      
      digitalWrite(L1, HIGH);
      delay(100);
      digitalWrite(L1,LOW);
      digitalWrite(L2, HIGH);
      delay(100);
      digitalWrite(L2, LOW);
      analogWrite(L3, 20);
      delay(100);
      
  }
  else{
    digitalWrite(L1, LOW);
    digitalWrite(L2, LOW);
    digitalWrite(L3, LOW);
    
  }
  // put your main code here, to run repeatedly:

}
