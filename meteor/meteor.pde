//import processing.sound.*;

int ax,ay,x,y,tarx,tary,movrand, ammu,hp,level,plyspeed,totalDest;
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
int triX;
int triY;
int randstarx;
int randstary;
int starprint = 1000;
int stars;
int [] starx = new int [starprint];
int [] stary = new int [starprint];

//BOSS
boolean bosstime;
int speed;
int bossatk;
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
  totalDest = 0;
  plyspeed = 100;
  level = 1;
  stars =0;
  hp = 10;
  //BOSS
  bosstime=false;
  speed = 10;
  //GAME
 
  size(900,900);
  bossatk = 50;
  pointx = 0;
  pointy = hi*2;
  npointx = wid*2;
  npointy = 0;
  bosshp = 25;
  hitbxX=1000;
  hitbxY = 1000;
  hi = height/2;
  wid = width/2;
  
   y = mouseY;
  basex = width/2;
  basey = height - 100;
  /*SoundFile pew;
  pew = new SoundFile(this, "pew.wav");
  pew.loop();
  */
  
  
  ammu = 10;
  
//creates random positions for asteroid start
  for(int i = 0; i < 100; i++){
    rand = int(random(100,800));
    astx[i] = rand;
    //println(astx[i]);
    //asty[i] = rand;
    
    
  }
//Show Stars
  for(int i = 0; i < starprint; i++){
    
    randstarx = int(random(0,width));
    starx[i] = randstarx;
    
    randstary = int(random(0, height));
    stary[i] = randstary;

  }
  
  
}
void draw(){
  //println(ammu);
  background(0);
  noCursor();
  for(int i = 0; i<starprint;i++){
    stroke(255);
    strokeWeight(3);
    line(starx[i],stary[i],starx[i],stary[i]);
    
  }
  
  triX = mouseX;
  triY = mouseY;
  //basic setup
  if(gamest == 0){
    
    bosstime=false;
    textAlign(CENTER);
    textSize(86);
    text("Start", width/2, height/2);
    fill(0,255,0);
    bosshp = 25;
    astDest = 0;
    hitbxX = 1000;
    hitbxY = 1000;
    
  }
  if(gamest == 2){
    
    bosstime=false;
    level = 1;
    speed = 5;
    
    textAlign(CENTER);
    textSize(86);
    fill(0,255,0);
    text("Game Over", width/2, height/2);
    
    stroke(0);
    ammu = 10;
    astDest = 0;
    totalDest = 0;
    
    
  }
  if(gamest == 3){
    bosstime=false;
    textAlign(CENTER);
    textSize(86);
    fill(0,255,0);
    
    text("You Win!", width/2, height/2);
    text("Onto Level " + level,width/2,height/2+100);
    
    
    stroke(0);
    ammu = 10;
    
    
  }
  if(gamest == 4){
    level = 1;
    bosstime=false;
    speed = 5;
    textAlign(CENTER);
    textSize(56);
    text("You've Destroyed Your Own Planet!\n You Monster...", width/2, height/2);
    fill(0,255,0);
    stroke(0);
    ammu = 10;
  }
  if(gamest == 5){
    level = 1;
    bosstime=false;
    speed = 5;
    textAlign(CENTER);
    textSize(56);
    text("Kamikaze Attacks are Frowned Upon", width/2, height/2);
    fill(0,255,0);
    stroke(0);
    ammu = 10;
  }
  
  if( gamest == 1){
    bosstime=false;
    
    
//Player HP
    if(hp <= 0){
      println("player killed");
      gamest = 2;
    }
//BOSS SPAWNS
    if(astDest >= 10){
      bosstime=true;
      rectMode(CENTER);
      fill(0);
      rect(hitbxX,hitbxY - 109,25*10,20);
      fill(0,255,0);
      rect(hitbxX,hitbxY - 109,bosshp*10,20);
      textAlign(CENTER);
      textSize(24);
      fill(255);
      text("Boss HP: " + bosshp, width/2,height/2 - 100);
      
      
      
        for(int i = 0; i<num;i+=1){   
        fill(255);
        stroke(255,0,0);
        line(wid, hi, adpoix[i], adpoiy[i]);
        
        line(wid, hi, adpoix1[i], adpoiy1[i]);
        line(wid, hi, npoix[i], npoiy[i]);
        line(wid, hi, npoix1[i], npoiy1[i]); 
        ellipse(npoix1[i],npoiy1[i], bossatk, bossatk);
        ellipse(npoix[i],npoiy[i], bossatk, bossatk);
        ellipse(adpoix1[i],adpoiy1[i], bossatk, bossatk);
        ellipse(adpoix[i],adpoiy[i], bossatk, bossatk);
        if(level > 1){
          
            
            line(wid, hi/2, adpoix[i], adpoiy[i]/2);
        
            line(wid, hi/2, adpoix1[i], adpoiy1[i]/2);
            line(wid, hi/2, npoix[i], npoiy[i]/2);
            line(wid, hi/2, npoix1[i], npoiy1[i]/2); 
            ellipse(npoix1[i],npoiy1[i]/2, bossatk, bossatk);
            ellipse(npoix[i],npoiy[i]/2, bossatk, bossatk);
            ellipse(adpoix1[i],adpoiy1[i]/2, bossatk, bossatk);
            ellipse(adpoix[i],adpoiy[i]/2, bossatk, bossatk);
            if(level >2){
              line(wid, hi/1.5, adpoix[i], adpoiy[i]/2);
        
              line(wid, hi/1.5, adpoix1[i], adpoiy1[i]/2);
              line(wid, hi/1.5, npoix[i], npoiy[i]/2);
              line(wid, hi/1.5, npoix1[i], npoiy1[i]/2); 
              ellipse(npoix1[i],npoiy1[i]/1.5, bossatk, bossatk);
              ellipse(npoix[i],npoiy[i]/1.5, bossatk, bossatk);
              ellipse(adpoix1[i],adpoiy1[i]/1.5, bossatk, bossatk);
              ellipse(adpoix[i],adpoiy[i]/1.5, bossatk, bossatk);
            }
          
          
        }
        
        if(bosstime == true){
          if(triY <= adpoiy[i]+35 && triY >= adpoiy[i] - 35 && triX <= adpoix[i]+35 && triX >= adpoix[i] - 35){
            hp-=2;
            println("hit by boss");
            
          }
          if(triY <= adpoiy1[i]+35 && triY >= adpoiy1[i] - 35 && triX <= adpoix1[i]+35 && triX >= adpoix1[i] - 35){
            hp-= 2;
            println("hit by boss");
          }
          if(triY <= npoiy[i]+35 && triY >= npoiy[i] - 35 && triX <= npoix[i]+35 && triX >= npoix[i] - 35){
            hp -= 2;
            println("hit by boss");
          }
          if(triY <= npoiy1[i]+35 && triY >= npoiy1[i] -35 && triX <= npoix1[i]+35 && triX >= npoix1[i] - 35){
            hp -= 2;
            println("hit by boss");
          }
        }
      }
      
      fill(255,0,0);
      hitbxX = width/2;
      hitbxY = height/2;
      ellipse(hitbxX,hitbxY,100,100);
      circ();
      revcirc(); 
      addit();
       
      
      clean();
      if(bosshp <= 0){
        level++;
        gamest = 3;
      }
      
    }
    textAlign(CENTER);
    textSize(24);
    fill(0,255,0);
    
    text("Rocks Smashed: " + totalDest, width/2,40);
    text("LEVEL: " + level, width/2,60);
    
//BASE KILLED by Asteroid
  base();
  if(basey <= tary+50 && basey >= tary - 50 && basex <= tarx + 50 && basex >= tarx - 50){
    randx = int(random(100));
    println("base kill by asteroid");
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
//Base Killed by YOU
  if(y <= basey+50 && y >= basey-50 && msx[0] <= basex + 50 && msx[0] >= basex - 50){
    randx = int(random(100));
    println("base killed by you");
    asteroid(astx[randx]);
    movrand = int(random(-5,5));
    ax=0;
    ay=0;
    y = mouseY;
    trig = false;
    basex=1000;
    basey=1000;
    astDest = 0;
    gamest = 4;  
  }  
//random spawn asteroid 
  asteroid(astx[randx]);
  if(tary > height || tarx > width || tarx < -10){
    randx = int(random(100));
    println("astroid spawned");
    asteroid(astx[randx]);
    movrand = int(random(-5,5));
    ax=0;
    ay=0;
    
    
    
  }


  
//Player Touches Boss
  if(triY <= hitbxY+50 && triY >= hitbxY - 50 && triX <= hitbxX+35 && triX >= hitbxX - 35){
    gamest = 5;
  }
//Player Touches Asteroid
if(triY <= tary+20 && triY >= tary - 20 && triX <= tarx+20 && triX >= tarx - 20){
    hp -= 2;
    println("hit by asteroid");
  }


  
//Bullet hits Asteroid
  if(y <= tary+50 && y >= tary-50 && msx[0] <= tarx + 50 && msx[0] >= tarx - 50){
    randx = int(random(100));
    println("shot");
    asteroid(astx[randx]);
    astDest++;
    totalDest++;
    movrand = int(random(-5,5));
    ax=0;
    ay=0;
    y = mouseY;
    trig = false;
    
  }
  
//BOSS HIT
  if(y <= hitbxY+50 && y >= hitbxY-50 && msx[0] <=  hitbxX  + 35 && msx[0] >= hitbxX - 35){
    bosshp--;
    y = mouseY;
    trig = false;
    print("boss hit");
  }
  Ammo();
  

//Show Ammo

  
    rectMode(CENTER);
    fill(255,0,255);
    rect(triX - 50,triY,20,ammu*10);
    
//Show HP
    rectMode(CENTER);
    fill(0,255,0);
    rect(triX - 35,triY,20,hp*10);
    

  
  
//did you shoot?
  
  
  if(trig == true && ammu > 0){
    
   
    
    if(y>=0){
      y-= 10;
      stroke(0,255,0);
      strokeWeight(5);
      line(msx[0],y+10,msx[0],y);
      
      
    }
    if(y <= 0){
      trig = false;
      
      y = -10000;
    }
    
    
    }
    
    
  }
  
}
//RELOAD  
void keyPressed(){
   if(key == 'r'){
      ammu++;
   }
   if(key == ESC){
     exit();
   }
   /*if(key == 'w' || key == UP){
     triY-=plyspeed;
   }
   if(key == 's' || key == DOWN){
     triY+=plyspeed;
   }
   if(key == 'a' || key == RIGHT){
     triX-=plyspeed;
   }
   if(key == 'd' || key == LEFT){
     triX+=plyspeed;
   }*/
}
void mousePressed(){
  if(gamest == 0){
      hp = 10;
      basex = width/2;
      basey = height-100;
      
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
     speed += 2;
     gamest = 0;
   }
   if(gamest == 4){
     gamest = 2;
   }
   if(gamest == 5){
     gamest = 2;
   }
   

  
  
}
  
  


void base(){
  
  int diameter = 60;
  fill(0,0,255);
  ellipse(basex, basey,diameter,diameter);
  fill(0,235,5);
  gun(x,y);
  
  
}
void Ammo(){
  if(ammu > 10){
    ammu=10;
    
  }
  if(ammu <= 0){
    
   
    textAlign(CENTER);
    textSize(86);
    fill(0,255,0);
    text("Reload [R]", width/2, height/2);
    ammu = 0;
    
    
  }
}
void gun(int posX,int posY){
  fill(255);
  stroke(0);
  
 
  triangle(triX,triY-20,triX-10,triY+15,triX+10,triY+15); 
  triangle(triX,triY+10,triX-10,triY+15,triX+10,triY+15); 
}
void asteroid(int start){
  
   tarx = start + ax;
   tary = -20 + ay;
  
    ax+= movrand;
    ay+=speed;
  
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
    /*adpoix[i] = 0;
    adpoiy[i] = 0;
    adpoix1[i] = 0;
    adpoiy1[i] = 0;
    npoix[i] = 0;
    npoiy[i] = 0;
    npoix1[i] = 0;
    npoiy[i] = 0;
    fib[i] = 0;*/
    a = 0;
    b = 1;
    c = a+b;
  }
}
void revcirc(){
  if(npointy <= 0){
    npointx-=speed;
    
  }
  if(npointx <= 0){
    npointy+=speed;
    
  }
  if(npointy > hi*2){
    npointx+=speed;
    
  }
  if(npointx>= wid*2){
    npointy-=speed;
    
  }
}
void circ(){
  if(pointx > 0){
    pointy-=speed;
  }
  if(pointy >= 0){
    pointx+=speed;
  }
  if(pointx < wid*2){
    pointy+=speed;
  }
  if(pointy<= hi*2){
    pointx-=speed;
  }
}
