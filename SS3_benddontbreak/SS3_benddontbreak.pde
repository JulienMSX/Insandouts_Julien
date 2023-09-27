//Julien Massaux, Bend_Dont_Break,moving the cursor over the different quadrants creates a binding to that direction.


int x = 100;
int y = 0;
int a,b,c;
float j,k,l;



void setup(){
  rectMode(CENTER);
  size(500,500);
  a = 0;
  b=0;
  c=1;
}

void draw(){
  background(255);
  for(int i = 0; i < x; i+=5){
    //second();
    a=b;
    b=c;
    c=b+a;
    //line(c,-b,width/2+i,height/2);
    //line(-c,b,width/2-i,height/2);
    ////line(c,b,width/2,height/2+i);
    //line(-c,-b,width/2,height/2-i);
    //line(mouseX,mouseY,c,b);
    line(mouseX,mouseY,width/2+i,height/2);
    line(mouseX,mouseY,width/2-i,height/2);
    line(mouseX,mouseY,width/2,height/2+i);
    line(mouseX,mouseY,width/2,height/2-i);
    //line(mouseX,mouseY,width/2-i,height/2+i/2);
    
    rect(mouseX,mouseY,10,10);
    if(mouseX >= width/2 && mouseY >= height/2){
      for(int j = 10; j > 0;j--){
        line(mouseX,mouseY,width+i,height);
        line(mouseX,mouseY,width-i,height);
        line(mouseX,mouseY,width,height+i);
        line(mouseX,mouseY,width,height-i);
        
        
        
      }
    }
     if(mouseX <= width/2 && mouseY <= height/2){
      for(int j = 10; j > 0;j--){
        line(mouseX,mouseY,0+i,0);
        line(mouseX,mouseY,0-i,0);
        line(mouseX,mouseY,0,0+i);
        line(mouseX,mouseY,0,0-i);
        
        
        
      }
     }
     if(mouseX <= width/2 && mouseY >= height/2){
      for(int j = 10; j > 0;j--){
        line(mouseX,mouseY,0+i,height);
        line(mouseX,mouseY,0-i,height);
        line(mouseX,mouseY,0,height+i);
        line(mouseX,mouseY,0,height-i);
        
        
        
      }
     }
     if(mouseX >= width/2 && mouseY <= height/2){
      for(int j = 10; j > 0;j--){
        line(mouseX,mouseY,width+i,0);
        line(mouseX,mouseY,width-i,0);
        line(mouseX,mouseY,width,0+i);
        line(mouseX,mouseY,width,0-i);
        
        
        
      }
    }
  }
}
