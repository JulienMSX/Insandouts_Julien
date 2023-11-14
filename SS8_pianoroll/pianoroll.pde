///////////////////////////////////////////////////////
/*
DEMO: SENDING DATA FROM PROCESSING TO ARDUINO
 Pair with Arduino demo sketch to control Piezo.
 
 Piezo frequency corresponds with mouseX position.
 Press mouse to send data over serial.
 
 Note: Be sure to specify correct port number below!
 */
///////////////////////////////////////////////////////

int val=0; //to send over Serial
float x,y,rot;
int r = 50;


import processing.serial.*;  //import Serial library

Serial myPort;  // create object from Serial class

void setup() {
  size(1300,700); 
  textSize (44);
  textAlign (CENTER, CENTER);
  
  //whitekey [] ary = new whitekey[8];

  //set up Serial communication
  printArray(Serial.list()); // prints port list to the console
  String portName = Serial.list()[3]; //change to match your port
  myPort = new Serial(this, portName, 9600); //initialize Serial communication at 9600 baud
}

class blackkey{
  
  int xpos;
  int ypos;
  float tone;
  blackkey(int _xpos, int _ypos, float _tone){
    xpos = _xpos;
    ypos = _ypos;
    tone = _tone;
  }
  void drawBK(int xpos){
    rectMode(CENTER);
    fill(0);
    rect(xpos,ypos,50,300);
  }
  void hitbx(int xpos, int ypos, char k){
    if(keyPressed && key == k){
      val = int(map(tone*2,100,1500,0,255));
      fill(255,10,10);
      rect(xpos,ypos,25,200);
      myPort.write(val); //write to Serial
      //println("on");
    }
    
    
  }
  
  
}


class whitekey{
  
  int xpos;
  int ypos;
  float tone;
  whitekey(int _xpos, int _ypos, float _tone){
    xpos = _xpos;
    ypos = _ypos;
    tone = _tone;
  }
  void drawWK(int xpos){
    rectMode(CENTER);
    fill(255);
    rect(xpos,ypos,100,400);
  }
  void hitbx(int xpos, int ypos, char k){
    if(keyPressed && key == k){
      val = int(map(tone*2,100,1500,0,255));
      fill(255,10,10);
      rect(xpos,ypos,50,300);
      myPort.write(val); //write to Serial
      
      //println("won");
    }
    
    
  }
  
  
}
void draw() {
  //println(mouseX + " " + mouseY);
  
  background (255);
  
  whitekey c = new whitekey(100,400,261.63);
  c.drawWK(100);
  c.hitbx(100,400,'a');
  whitekey d = new whitekey(200,400,293.66);
  d.drawWK(200);
  d.hitbx(200,400,'s');
  whitekey e = new whitekey(300,400,329.63);
  e.drawWK(300);
  e.hitbx(300,400,'d');
  whitekey f = new whitekey(400,400,349.23);
  f.drawWK(400);
  f.hitbx(400,400,'f');
  whitekey g = new whitekey(500,400,392.00);
  g.drawWK(500);
  g.hitbx(500,400,'g');
  whitekey a = new whitekey(600,400,440);
  a.drawWK(600);
  a.hitbx(600,400,'h');
  whitekey b = new whitekey(700,400,493.88);
  b.drawWK(700);
  b.hitbx(700,400,'j');
  whitekey hc = new whitekey(800,400,523.25);
  hc.drawWK(800);
  hc.hitbx(800,400,'k');
  
  blackkey draw = new blackkey(150,200,277.18);
  draw.drawBK(150);
  draw.hitbx(150,200,'w');
  blackkey draw1 = new blackkey(250,200,311.13);
  draw1.drawBK(250);
  draw1.hitbx(250,200,'e');
  blackkey draw2 = new blackkey(450,200,369.99);
  draw2.drawBK(450);
  draw2.hitbx(450,200,'t');
  blackkey draw3 = new blackkey(550,200,415.30);
  draw3.drawBK(550);
  draw3.hitbx(550,200,'y');
  blackkey draw4 = new blackkey(650,200,466.16);
  draw4.drawBK(650);
  draw4.hitbx(650,200,'u');
  
  
  
  ellipse(x,y,30,30);
  if(rot < 360){
     x = width - 200 + r * cos(rot);
     y = height/2 + r * sin(rot);
     rot+=0.05;
  }
  else{
    rot = 0;
  }
 
  
  

  


  //if (mousePressed) {
  //  //mouse location controls communication to Serial 
  //  val= int (map (mouseX, 0, width, 0, 255)); //remaps mouseY to 0-255  
    
    
  //  myPort.write(val); //write to Serial
  //  println(val);  //print to console

  //  //NOTE: SENDING VALUES 0-255 as Arduino receives byte-sized data over port
  //}
}
