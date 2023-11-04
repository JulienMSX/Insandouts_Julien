//music by eddie.ewi

import processing.serial.*; //imports Serial library from Processing
import processing.sound.*;
SoundFile lvlmu1;
Serial myPort; // creates object from Serial class
int val=0;

PImage snek,phrog,car,pond,street,carRev;

int time;
int check;
int num = 4000;
int points = 0;

int diry, dirx;
int snakeL;
int randfoodx, randfoody;
int moveLR, moveUD;
int speed;
int st;
int LR,UD;
boolean L,R,U,D;
boolean alreadyUD, alreadyLR;
boolean firstfood;
int [] lastposx, lastposy;
int prevposx, prevposy;
int [] grid,gridy;
int gridlen = 10;
int xhere, yhere;
int count = 0;
int ycount = 0;
int car1x = 0;
int car2x = 50;
int car3x = 0;
void setup(){
  lvlmu1 = new SoundFile(this,"Bloopin.mp3");
  
  
  speed = 1;
  size(500,500);
  strokeWeight(5);
  gridy = new int[51];
  grid = new int[2601];
  
  for(int j = 0; j <= 50; j++){
    
    gridy[ycount] = j*10;
    ycount++; 
    for(int i = 0; i <= 50; i++ ){
      grid[count] = i*10;
      line(grid[i],gridy[j],grid[i],gridy[j]);
      count++;
    }
  }
  
 
  //print(grid[11] + " " + grid[11]);
  moveLR = grid[25];
  moveUD = grid[40];

  rectMode(CENTER);
  snakeL = 0;
  lastposx = new int[width];
  lastposy = new int[height];
  LR = 10;
  UD = 10;
  
  
  firstfood = true ;
  
  
  imageMode(CENTER);
  snek = loadImage("snek.png");
  phrog = loadImage("phrog.png");
   car = loadImage("car.png");
   pond = loadImage("pond.png");
   street = loadImage("street.png");
   carRev = loadImage("carRev.png");
   
  
  
  
  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[3]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 9600);
  
  
}
void draw(){
  delay(40);
  background(100,100,20);
  image(street, grid[0] ,gridy[10],car.width*3,car.height/2);
  image(street, grid[0] ,gridy[20],car.width*3,car.height/2);
  image(street, grid[0] ,gridy[30],car.width*3,car.height/2);
  
  if ( myPort.available() > 0) { // If data is available,
      val = myPort.read(); // read it and store it in val
  }
  if(st == 0){
    
    textAlign(CENTER);
    textSize(24);
    fill(0,255,0);
    
    text("SNEK", width/2,height/2);
    snakeL = 0;
    
    
  }
  if(st == 2){
    textAlign(CENTER);
    textSize(24);
    fill(0,255,0);
    
    text("YOU DIED", width/2,height/2);
    if(snakeL >= 10){
       text("Carrying Too Many Phrogs", width/2,280);
    }
    
    
  }
  if(st == 1){
    
//cars
    if(car1x < width){
      
      //rect(grid[0+car1x],gridy[10],60,40);
      image(carRev, grid[0+car1x] ,gridy[9],car.width/4,car.height/2);
      
      car1x++;
    }
      
    else if(car1x > width - 10){
      car1x=0;
    }
    if(car2x > 0){
      //rect(grid[50+car2x],gridy[20],60,40);
      image(car, grid[0+car2x] ,gridy[19],car.width/4,car.height/2.5);
      car2x--;
    }
    else if (car2x < 0 + 10 ){
      car2x = 50;
    }
    if(car3x < width){
      
      //rect(grid[0+car3x],gridy[30],60,40);
      image(carRev, grid[0+car3x] ,gridy[29],car.width/4,car.height/2);
      car3x+=2;
    }
    
    else if(car3x > width - 10){
      car3x=0;
    }
    
    if(moveLR <= grid[car1x] + 50 && moveLR >= grid[car1x] - 50 && moveUD <= gridy[10] +30 && moveUD >= gridy[10] - 30){
      st = 2;
      
    }
    if(moveLR <= grid[car2x] + 50 && moveLR >= grid[car2x] - 50 && moveUD <= gridy[20] +30 && moveUD >= gridy[20] - 30){
      st = 2;
      
    }
    if(moveLR <= grid[car3x] + 50 && moveLR >= grid[car3x] - 50 && moveUD <= gridy[30] +30 && moveUD >= gridy[30] - 30){
      st = 2;
      
    }
///pond
  //ellipse(grid[25],gridy[40],80,50);
  image(pond, grid[25] ,gridy[40],pond.width/6,pond.height/4);
  
  if(moveLR <= grid[25] + 80 && moveLR >= grid[25] - 80 && moveUD <= gridy[40] + 50 && moveUD >= gridy[40] - 50){
    time = millis();
    check = millis() / 2;
  //println(time + " " + check);
    if(time - check >= num && snakeL > 0){
      snakeL--;
      points++;
      num+=4000;
    }
  }
    
    
    
    textAlign(CENTER);
    textSize(14);
    fill(0,255,0);
    
    text("Phrogs in Tow: "+ snakeL, width/2,50);
    text("Phrogs Saved: "+ points, width/2,25);
    
    if(snakeL >= 7){
      textAlign(CENTER);
      textSize(24);
      fill(0,255,0);
    
      text("Getting Heavy!: "+ 10%snakeL +" more 'till limit", width/2,100);
    }
    if(snakeL >= 10){
      st = 2;
    }
    
    
    xhere = scanx();
    yhere = scany();
    
    //println(here);
    potcontrol();
    if(firstfood == true){
      randFood();
      
      firstfood = false;
    }
    image (phrog, randfoodx,randfoody,phrog.width/16,phrog.height/16);
    //rect(randfoodx,randfoody,10,10);
    
    
    
      if(R == true){
        
        moveLR = grid[xhere+1];
        
      }
      if(L == true){
        
        moveLR = grid[xhere-1];
      }
      if(D == true){
        
        moveUD = gridy[yhere+1];
      }
      if(U == true){
        
        moveUD = gridy[yhere-1];
      }
      
    
    for(int i = 0; i <= snakeL; i++){
  
      if(snakeL < 1){
        image (snek, moveLR,moveUD,snek.width/4,snek.height/4);
       
        
      }
      else{
        image (snek, moveLR,moveUD,snek.width/4,snek.height/4);
        
        
        
        tail(i);
      
        
        
      }
    }
    /*for(int i = 0; i < snakeL; i++){
      //rect(10*dirx,10*diry,10*dirx,10*diry+1);
      if(snakeL < 2){
        rect(moveLR,moveUD,10,snakeL*10);
        
      }
      else if(U == true){
        
        rect(moveLR,moveUD,10,snakeL*10-(i*10));
      }
      else if(D == true){
        
        rect(moveLR,moveUD,10,snakeL*-10+(i*10));
      }
      else if(L == true){
        
        rect(moveLR,moveUD,snakeL*10-(i*10),10);
      }
      else if(R == true){
        
        rect(moveLR,moveUD,snakeL*-10+(i*10),10);
      }
    
    }*/
    if(moveLR <= randfoodx + 10 && moveLR >= randfoodx - 10 && moveUD <= randfoody +10 && moveUD >= randfoody - 10){
      randFood();
      snakeL++;
      
    }
    if((moveLR <= 0  || moveLR >= width ) || (moveUD <= 0  || moveUD >= height )){
      moveLR = grid[25];
      moveUD = gridy[25];
    
      st = 2;
    }
    //println(moveLR +" "+ moveUD);
  }
  
}
void keyPressed(){
  if(key == 'l' && st == 0 || key == 'l' && st == 2){
    lvlmu1.stop();
    
    lvlmu1.loop();
    lvlmu1.amp(.2);
    snakeL = 0;
      moveLR = grid[25];
      moveUD = grid[40];
    st = 1;
    
  }
  if(key == 'w'){
    if(alreadyUD == false){
      U = true;
      L = false;
      R = false;
      D = false;
      alreadyUD = true;
      alreadyLR = false;
    //diry = -1; 
    }
  }
  if(key == 's'){
    if(alreadyUD == false){
      U = false;
      L = false;
      R = false;
      D = true;
      alreadyUD = true;
      alreadyLR = false;
    }
  }
  if(key == 'd'){
    if(alreadyLR == false){
      U = false;
      L = false;
      R = true;
      D = false;
      alreadyUD = false;
      alreadyLR = true;
    }
  }
  if(key == 'a'){
    if(alreadyLR == false){
      U = false;
      L = true;
      R = false;
      D = false;
      alreadyUD = false;
      alreadyLR = true;
    }
  }
  
}
void randFood(){
  randfoodx = int(random(10,width-10));
  randfoody = int(random(10,height-10));
  
}
void potcontrol(){
  if(val >= 0){
    U = false;
    L = false;
    R = false;
    D = true;
  }
   if(val >= 50){
     U = false;
    L = true;
    R = false;
    D = false;
  }
  if(val >= 150){
    U = true;
    L = false;
    R = false;
    D = false;
    //diry = -1; 
  }
  
  if(val >= 200){
    U = false;
    L = false;
    R = true;
    D = false;
  }
 
  
}

void tail(int num){
  
     image (phrog, grid[xhere]-num*5,grid[yhere]-num*5,phrog.width/16,phrog.height/16);
     //rect(grid[xhere]-num,grid[yhere]-num,10,10);
     

}

int scanx(){
  int gotem = 0;
  for(int i = 0; i < grid.length; i++){
    if(moveLR == grid[i]){
     gotem = i;
     return gotem;
     
    }
    
  }
  return gotem;
}


int scany(){
  int gotem = 0;
  for(int i = 0; i < gridy.length;i++){
    if(moveUD == gridy[i]){
      gotem = i;
      return gotem;
    }
  }
  return gotem;
}
