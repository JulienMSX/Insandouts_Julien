//Julien Massaux Anxious 
//Visualizing Anxiety
//add fill and stroke variable
int x1 = 0;
int x2 = 50;
int y1 = 10;

int y2 = 60;
int x3 = 0;
int x4 = 200;
int y3= 400;
int y4 = 300;
int x5 = 0;
int x6 = 200;
int y5= 400;
int y6 = 300;
size(1080,720);
rect(200,300,500,100);
rect(400,100,100,500);
for(int i = 0; i < 1000; i++){
  line(x5,y5,x6,y6);
  line(x3,y3,x4,y4);
  line(x1,y1,x2,y2);
  x1+=10;
  x3+=10;
  y3+=10;
  x6+=-10;
  y6+=-10;
  y1+=2;
  y2+=10;
}
  
