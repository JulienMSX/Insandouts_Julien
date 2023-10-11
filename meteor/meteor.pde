//import processing.sound.*;

int ax,ay,x,y,tarx,tary,movrand, ammu;
int direct = 1;
int[] astx = new int[100];
float[] asty = new float[100];
float[] msx = new float[1];
float[] msy = new float[1];
boolean trig = false;
boolean dead = false;
float bulx,buly;
int rand;
int randx;
int gamest = 0;
int basex;
int basey;
int astDest;

//BOSS

int pointx, pointy, npointx,npointy;
int bosshp;
int num = 20;
float a = 0;
float b = 1;
float c;
int wid = 250;
int hi = 250;

int hitbxX;
int hitbxY;

float [] adpoix = new float [num];
float [] adpoiy = new float [num];
float [] adpoix1 = new float [num];
float [] adpoiy1 = new float [num];
float [] npoix = new float [num];
float [] npoiy = new float [num];
float [] npoix1 = new float [num];
float [] npoiy1 = new float [num];

float [] fib = new float [num];

class Rock{}
class Boom{
  //var boom  = ellipse(msx[0],msy[0],40+j,40+j);

}




void setup(){
  //BOSS
  pointx = 0;
  pointy = hi*2;
  npointx = wid*2;
  npointy = 0;
  bosshp = 25;
  //GAME
 
  size(900,900);
  hitbxX=1000;
  hitbxY = 1000;
   y = mouseY;
  basex = width/2;
  basey = height;
  /*SoundFile pew;
  pew = new SoundFile(this, "pew.wav");
  pew.loop();
  */
  
  
  ammu = 10;
  
  
   
   
  //rock = new Rock();
  
  
  //frameRate(8);
  //creates random positions for asteroid start
  for(int i = 0; i < 100; i++){
    rand = int(random(100,400));
    astx[i] = rand;
    //println(astx[i]);
    //asty[i] = rand;
    
    
  }
  
  
}
void draw(){
  //println(ammu);
  background(255);
  //basic setup
  if(gamest == 0){
    textAlign(CENTER);
    textSize(86);
    text("Start", width/2, height/2);
    fill(0);
    bosshp = 25;
    
  }
  if(gamest == 2){
    textAlign(CENTER);
    textSize(86);
    text("Game Over", width/2, height/2);
    fill(0);
    stroke(0);
    ammu = 10;
    astDest = 0;
    
  }
  if(gamest == 3){
    textAlign(CENTER);
    textSize(86);
    text("You Win!", width/2, height/2);
    fill(0);
    stroke(0);
    ammu = 10;
    
  }
  
  if( gamest == 1){
    if(astDest >= 10){
      hi = 0;
      if(hi < height/2){
        hi+=100;
        for(int i = 0; i<num;i+=1){   
        stroke(255,0,0);
        line(wid, hi, adpoix[i], adpoiy[i]);
        line(wid, hi, adpoix1[i], adpoiy1[i]);
        line(wid, hi, npoix[i], npoiy[i]);
        line(wid, hi, npoix1[i], npoiy1[i]);    
      }
      }
      fill(230,0,0);
      hitbxX = width/2;
      hitbxY = height/2;
      ellipse(hitbxX,hitbxY,100,100);
      circ();
      revcirc(); 
      addit();
       
      
      clean();
      if(bosshp <= 0){
        gamest = 3;
      }
      
    }
    textAlign(CENTER);
    textSize(24);
    fill(0);
    text("Ammo: " + ammu, width/2,20);
    
   
    
    
  
    
    
    //println(y,msx[0],tarx,tary);
  
  

  
  base();
  if(basey <= tary+50 && basex <= tarx + 50 && basex >= tarx - 50){
    randx = int(random(100));
    println("shot");
    asteroid(astx[randx]);
    movrand = int(random(-5,5));
    ax=0;
    ay=0;
    y = mouseY;
    trig = false;
    basex=1000;
    basey=1000;
    astDest = 0;
    gamest = 2;
    
    
  }
  
  
  //random spawn asteroid
  
  
  
    
  
  asteroid(astx[randx]);
  if(tary > height || tarx > width || tarx < -10){
    randx = int(random(100));
    println("shot");
    asteroid(astx[randx]);
    movrand = int(random(-5,5));
    ax=0;
    ay=0;
    
    
    
  }
  if(y <= tary+50 && msx[0] <= tarx + 50 && msx[0] >= tarx - 50){
    randx = int(random(100));
    println("shot");
    asteroid(astx[randx]);
    astDest++;
    movrand = int(random(-5,5));
    ax=0;
    ay=0;
    y = mouseY;
    trig = false;
    
  }
  
  //BOSS HIT
  if(y <= hitbxY+50 && msx[0] <=  hitbxX  + 50 && msx[0] >= hitbxX - 50){
    bosshp--;
    y = mouseY;
    trig = false;
    print("boss hit");
  }
  Ammo();
  
  //println(astx[randx]);
  
  
  //did you shoot?
  
  
  if(trig == true && ammu > 0){
    
   
    
    if(y>=0){
      y-= 10;
      line(msx[0],y+10,msx[0],y);
      
      
    }
    if(y <= 0){
      trig = false;
      
      y = mouseY;
    }
    
    
    }
    
    
  }
  
}
  
void keyPressed(){
   if(key == 'r'){
      ammu++;
   }
}
void mousePressed(){
  if(gamest == 0){
      basex = width/2;
      basey = height;
      gamest = 1;
    }

  if(gamest == 1){
    msx[0] = mouseX;
    y = mouseY;
    
    trig = true;
    ammu--;
    
   }
   if(gamest == 2){
     gamest = 0;
   }
   if(gamest == 3){
     gamest = 0;
   }

  
  
}
  
  


void base(){
  
  int diameter = 60;
  fill(0,0,255);
  ellipse(basex, basey,diameter,diameter);
  gun(x,y);
  
  
}
void Ammo(){
  if(ammu > 10){
    ammu=10;
    
  }
  if(ammu <= 0){
    
   
    textAlign(CENTER);
    textSize(86);
    fill(0);
    text("Reload [R]", width/2, height/2);
    ammu = 0;
    
    
  }
}
void gun(int posX,int posY){
  fill(255);
 
  triangle(mouseX,mouseY-20,mouseX-10,mouseY+15,mouseX+10,mouseY+15); 
  triangle(mouseX,mouseY+10,mouseX-10,mouseY+15,mouseX+10,mouseY+15); 
}
void asteroid(int start){
  
   tarx = start + ax;
   tary = 0 + ay;
  
    ax+= movrand;
    ay+=5;
  
    ellipse(start+ax,0+ay,30,30);
  
}

//BOSS

void addit(){
  fib();
  
  for(int i = 0; i < num; i++){
    
  
    
    adpoix[i] = pointx + fib[i]/2;
    adpoiy[i] = pointy + fib[i]/2;
    adpoix1[i] = pointx - fib[i]/2;
    adpoiy1[i] = pointy - fib[i]/2;
    npoix[i] = npointx - fib[i]/2;
    npoiy[i] = npointy - fib[i]/2;
    npoix1[i] = npointx + fib[i]/2;
    npoiy1[i] = npointy + fib[i]/2;
    
    
    
  }
}
void fib(){
  
  for(int i = 0; i < num; i++){
    c = a + b;
    a = b;
    b = c;
    fib[i] = c;
    //println(c);
    
  }
}


void clean(){
  for(int i = 0; i < num; i++){
    adpoix[i] = 0;
    adpoiy[i] = 0;
    fib[i] = 0;
    a = 0;
    b = 1;
    c = a+b;
  }
}
void revcirc(){
  if(npointy <= 0){
    npointx--;
    
  }
  if(npointx <= 0){
    npointy++;
    
  }
  if(npointy > hi*2){
    npointx++;
    
  }
  if(npointx>= wid*2){
    npointy--;
    
  }
}
void circ(){
  if(pointx > 0){
    pointy--;
  }
  if(pointy >= 0){
    pointx++;
  }
  if(pointx < wid*2){
    pointy++;
  }
  if(pointy<= hi*2){
    pointx--;
  }
}
