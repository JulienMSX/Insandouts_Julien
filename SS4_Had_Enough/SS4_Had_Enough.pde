//JULIEN MASSAUX, digital emotion, hold down the mouse to express yourself

int currentTime=0; 
int x,y;
PImage hm;
PImage heart;
PImage laugh;
PImage scare;
float rand;

void setup() {
  size(500,500);
  textAlign(CENTER);
  textSize(56);
  
 
  imageMode(CENTER);
  hm = loadImage("hm.png");
  heart = loadImage("heart.png");
  laugh = loadImage("laugh.png");
  scare = loadImage("scare.png");
  
  
  
}

void draw() {
  background(100);
  
  
  
  rand = random(10);
   //background(255);
  currentTime=millis(); //continuously update our currentTime variable
  
  
  
  
  

  if(mousePressed) {
    text("How Do You Feel?", width/2,height/2); 
    fill(0, 408, 612);
    
    println(rand);
   
    
    y+=10;
    if(y > height){
      y = -10;
    }
    
    
    
      
      //println(currentTime);
    
      
      if(currentTime<5000){
        
          image(laugh,mouseX+rand,y,laugh.width/4,laugh.height/4);
          text("HAPPY?", width/2,height/2+100); 
          fill(255, 408, 612);
        
      }
      else if(currentTime<10000){
        image(hm,mouseX+rand,y,hm.width/6,hm.height/6);
        text("UNSURE?", width/2,height/2+100); 
        fill(255, 100, 612);
      }
      else if(currentTime < 15000){
        image(heart,mouseX+rand,y,heart.width/2,heart.height/2);
        text("IN LOVE?", width/2,height/2+100); 
        fill(50, 30, 422);
      }
      else if(currentTime < 20000){
        
        image(scare,mouseX+rand,y,scare.width/4,scare.height/4);
        text("AFRAID?", width/2,height/2+100); 
        fill(530, 430, 300);
        
      }
      else{
        exit();
      }
    }
   
}
