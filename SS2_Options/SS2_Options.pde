//Julien Massaux, Options, use mouse to click and create a shape
//Exploring the idea that people sometimes have limited control of the world around them
//they can only influence a handfull of things

int x = 0;
int y = 0;
float x1= 20;
float y1 = 20;
int shape = 0;


void setup(){
size(800,800);

background(255,255,255);
}
void draw(){

//line(width/2,height/2,x,y);
//line(width/2, height/2,mouseX,mouseY);
//ellipse(mouseX,mouseY,200,200);

  x+=10;
  y+=10;
  if(x >= 100 && y >= 100){
    line(width/2,height/2,mouseX,y*-1);
    line(width/2,height/2,x*-1,-mouseY);
   
  }
  else if(x<= -100 && y<= -100){
    line(width/2,height/2,mouseX,y);
    line(width/2,height/2,x,mouseY);
    
  }
}
void mousePressed() {
  float r,g,b;
  r = random(255);
  g = random(255);
  b = random(255);
  x1 = random(50);
  y1 = random(50);
  if(shape == 0){
    
    ellipse(mouseX,mouseY,x1,y1);
    shape++;
    fill(r,g,b);
  }
  else if (shape==1){
    rect(mouseX,mouseY,x1,y1);
    rectMode(CENTER);
    shape++;
  }
  else{
    line(width/2,height/2,mouseX,mouseY);
    shape = 0;
  }
    
}
