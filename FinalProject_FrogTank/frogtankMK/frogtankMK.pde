
//3D Assets by Sen Demina
import processing.serial.*;
Serial myPort; 
int val;


int st;


PShape frogtank;
PShape frogbullet;
float rotX, rotY;
PVector move,bulletmove;
int size = 50;
int X = 50;
int Y = 50;

int nume, score;

int grav = 1;
int numO = 50;
int numb = 500;
int bx,by = 25;

int keepgoing = 0;
Orb [] orb = new Orb[numO];



Cube[][] cubes = new Cube[X][Y];

float shotangle,shotanglex;
PImage img;

float elevation;
float xOff, yOff;
Gun gun;
//SoundFile sencraft; 

void setup()
{ 
  
  
  st = 0;
  size(1000, 600, P3D);
  
   printArray(Serial.list()); // prints port list to the console
  String portName = Serial.list()[3]; //change to match your port
  myPort = new Serial(this, portName, 9600); 
  
  
  
  frogtank = loadShape("frogtank.obj");
  frogbullet = loadShape("frogbullet.obj");
  img = loadImage("char1.jpg");
  frogtank.rotateX(PI);
  frogbullet.rotateX(PI);
  //frogtank.texture(img);
  //frogtank.setSpecular(0xff0000ff);
  lightSpecular(128, 128, 128);
  //frogtank.setFill(color(100, 200, 100));
  frogbullet.setFill(color(200, 100, 100));
  gun = new Gun();
  move = new PVector(0, 0, 0);
  bulletmove = new PVector(0,0,0);
  for(int i = 0; i < X; i++)
  {
    for(int j = 0; j < Y; j++)
    {
      cubes[i][j] = new Cube(i*size, j*size, 0);
    }
  }
  for(int i = 0; i < numO; i++){
      orb[i] = new Orb(0,0,0);    
    }
  
  calculateElevation();
  shapeMode(CENTER); 
  //sencraft = new SoundFile(this, "sencraft_draft.mp3"); 
  //sencraft.amp(0.1);
  //sencraft.loop();
  rotY = 2.25*PI/3;
}

void draw()
{
  if(myPort.available() > 0){
      val = myPort.read();
      
    }
  println(val);
  
  background(150, 200, 250);
  pushMatrix();
  stroke(10);
  strokeWeight(1);
  translate(width/2, height/2, 450);
  line(-5, 0, 5, 0);
  line(0, -5, 0, 5);
  popMatrix();
  
  if(keyPressed && keyCode == ENTER){st = 1;}
  if(st == 0){
    int gr= second();
    //println(gr);
    translate(-150,0,-100);
    textMode(CENTER);
    //line(width,height,0,0);
    textSize(50);
    text("FROG TANK :DD",width/2,height/2);
    pushMatrix();
    translate(width/2+225,height/2+200,0);
    frogtank.setFill(color(100, gr*4, 100));
    shape(frogtank);
    
    
    frogtank.rotateY(PI/36);
    
    
    if(val == 200){
      st = 1;
    }
    popMatrix();
   
    
    
  }
  
  if(st == 2){
    nume = 0;
     int gr= second();
    //println(gr);
    translate(-350,0,-100);
    textMode(CENTER);
    //line(width,height,0,0);
    textSize(50);
    text("FRIENDLY FROGGING IS ILLEGAL >:(",width/2,height/2);
    pushMatrix();
    translate(width/2+300,height/2+200,0);
    frogtank.setFill(color(100, gr*4, 100));
    shape(frogtank);
    
    
    //frogtank.rotateY(PI/4);
    //frogtank.rotateX(PI/4);
    
    
    if(val == 200){
      st = 0;
    }
    
    popMatrix();
    
  }
  
  
  if(st == 1){
   
    
    if(nume <= 0){
      for(int i = 0; i < X; i++)
    {
      for(int j = 0; j < Y; j++)
      {
        cubes[i][j] = new Cube(i*size, j*size, 0);
      }
    }
    }
    
    noFill();
    stroke(1);
    strokeWeight(1);
    translate(width/2, height/2, 500);  
    
    //rotateX(rotX);
    //println(nume);
    rotateY(rotY);
    rotateX(rotX);
    
    //pushMatrix();
    
    //rotateY(-rotY);
    //translate(0,0,-50);
    
    //line(0,0,0,0,height,0);
    //line(sin(rotY)*width,sin(rotX)*height,-sin(rotY)*width,0);
    //popMatrix();
    //sphere(20);
   
    for(int i = 0; i < numO; i++){
      orb[i].draworb();
    }
    
    pushMatrix();
    //translate(bulletmove.x,0,bulletmove.y);
    
   gun.update();
    //// Horizonal light.
    //spotLight(0, 127, 255, -size, -sin(rotY) * size, 0,1, 0, 0, PI/2, 25);
    //  //println(frameCount);
    //// Vertical light.
    //spotLight(0, 255, 127, -cos(rotY) * size, size, 0, 0, 1, 0, PI, 25);
  
    //// Flash light.
    //spotLight(191, 170, 133, 0, 0, size, mouseX, mouseY, -100, 100, 100);
    //rotX = mouseY*PI/200;
    //rotY = mouseX*PI/200;
     
    
      
    //println(val);
      
       
        
    if(val < 126){
      rotY -= PI/200;
    }
    if(val > 128){
      rotY += PI/200;
    }
    if(val == 200){
      gun.bullet();
      
    }
      
      
      
    
    
    if(keyPressed)
    {
      if(keyCode== SHIFT){gun.bullet();}
      //if(keyCode==UP) { rotX-=PI/100; }
      
      //if(keyCode==DOWN) {  rotX+=PI/100; }
      if (keyCode==LEFT) { rotY-=PI/100; }
      if(keyCode==RIGHT) { rotY+=PI/100; }
    }
    
    
    //stroke(100, 100, 200);
    lights();
    //spotLight(200, 150, 100, 0, size, 0, sin(rotY)*3, 0, -cos(rotY)*3, PI/2, 100);
    ambientLight(100, 100, 200);
    noStroke();
    strokeWeight(5);
    //println(elevation);
    //translate(0, 0, 0);
  
    //elevation = 0;
    for(int i = 0; i < X; i++)
    {
      
      pushMatrix();
      for(int j = 0; j < Y; j++)
      {
        pushMatrix();
        translate(0, 100, 0);
        //translate(-size*X/2, 100, -size*Y/2);
        //cubes[i][j].drawCube();
        cubes[i][j].x = -size*X/2;
         cubes[i][j].y = -size*Y/2;
        
       
        cubes[i][j].drawCube();
        
        cubes[i][j].touched();
        popMatrix();
        
        translate(0, 0, size);
        
        if(cubes[i][j].isAtOrigin())
        {
          elevation = 50-cubes[i][j].elevation+size;
        }
        
        //else elevation-=0.1;
        //println(elevation);
      }
      
      popMatrix();
      translate(size, 0, 0);
    } 
    popMatrix();
    
    
    
    //gun.bullX = bulletmove.x;
    //gun.bullY = bulletmove.y;
    
    
    
    if(elevation < -2000)
    {
      textSize(50);
      textMode(CENTER);
      background(200, 100, 100);
      stroke(1);
      strokeWeight(5);
      text("YOU FOOL", 0, 0, 50, 50);
      circle(0, 0, 50);
      //println("ded");
    }
    frogtank.rotateY(PI/36);
    frogbullet.rotateY(PI/2);
  }
}

class Cube
{
  float x, y;
  int elevation;
  boolean hasTank;
  boolean hasCacti;
  boolean hasFTank;
  Tank tank;
  FTank ftank;
  Cacti cacti;
  
  Cube(float _x, float _y, int _elevation)
  {
    x = _x;
    y = _y;
    elevation = _elevation;
    if(int(random(500))==0) { hasTank = true;}
    if(int(random(100)) == 0 && hasTank == false)
    {
      hasCacti = true;
    }
    if(int(random(1000)) == 0 && hasTank == false && hasCacti == false){
      hasFTank = true;
      
    }
    if(hasCacti){
      cacti = new Cacti(this,int(random(2,5)));
    }
    if(hasTank)
    {
      nume++;
      tank = new Tank(this, 3);
    }
    if(hasFTank){
      ftank = new FTank(this,3);
    }
    
  }
  
  void drawCube()
  {
    fill(200, 200, 100);
    box(size);
    if(hasTank) { tank.drawTank(); }
    if(hasCacti){ cacti.drawCacti();}
    if(hasFTank){ftank.drawFTank();}
  }
  
  boolean isAtOrigin()
  {
    if(x >= 0 && x <= size && y >= 0 && y <= size)
    {
      //println("at origin");
      return true;
    }
    else 
    { 
      //println("NOOOOOOOOOT at origin");
      return false; 
    }
  }
  void touched(){
   
    for(int i = 0; i < numO; i++){
      //if(orb[i].posX <= 10000 && orb[i].posX >= -10000  && 
      //orb[i].posZ <= 10000  && orb[i].posZ >= -10000 && 
       if(orb[i].posY >  170){
       
      
        
        orb[i].bouncefly+=10;
        orb[i].bouncefall+=10;
        //orb[i].osize/=2;
       
        
      }
      
      
    }
  }
}
class Gun{
  boolean shot = false;
  float bullX;
  float bullY;
  float bullZ;
  Gun(){}
  void bullet(){
    
    bulletmove.x=0;
    bulletmove.z=0;
     bulletmove.y = 0;
    shotangle = rotY;
    shotanglex = rotX;
    
    
    
    
  }
  void shoot(){
    
    
  }
  void update(){
    if(shot == false){
      pushMatrix();
      bullX = bulletmove.x;
      bullZ = bulletmove.z;
      bullY = bulletmove.y;
      //rotateY(-rotY);
      translate(bulletmove.x,bulletmove.y+size,bulletmove.z);
      shape(frogbullet);
      //sphere(20);
      
      bulletmove.add(new PVector(sin(shotangle)*10, sin(shotanglex)*10, -cos(shotangle)*10));
      //bulletmove.add(new PVector(0, 0, 0));
      popMatrix();
    }
    else{
      
    for(int i = 0; i < numO; i++){
      orb[i] = new Orb(bullX,bullY,bullZ);     
    }
      bulletmove.x=0;
      bulletmove.z=0;
       bulletmove.y = 0;
       pushMatrix();
      translate(bulletmove.x,bulletmove.y+size,bulletmove.z);
      popMatrix();
    }
    
  }
    
  
}
class Tank
{
  Cube cube;
  int tall;
  int mynum = 1;
  boolean alive;
  float x, z;
  boolean hit = false;
  
  Tank(Cube _cube, int _tall)
  {
   
    cube = _cube; 
    x = cube.x;
    z = cube.y;
    tall = _tall;
    //println("made tree");
  }
  
  void drawTank()
  {
    if(isHit() == false && hit == false){
      frogtank.setFill(color(200, 100, 100));
      pushMatrix();
      
        translate(0, size/2, 0);
        //box(size);
        shape(frogtank);
      
      //fill(100, 200, 100);
      //sphere(150);
      popMatrix();
    }
    
    
    else{
      nume -= mynum;
      score += mynum;
      mynum = 0;
      hit = true;
      
    }
  }
  boolean isHit()
  {
    if(x >= gun.bullX-100 && x <= gun.bullX+100 && z >= gun.bullZ-100 && z <= gun.bullZ+100)
    {
      pushMatrix();
      translate(x,100,z);
      fill(200,50,100);
      sphere(100);
      popMatrix();
      for(int i = 0;i<numO;i++){
        
        orb[i] = new Orb(x,100,z);
     //println("ded cacti");
      }
      
     
      return true;
    }
    else 
    { 
      //println(gun.bullX + " " + x);
      //println( gun.bullZ + " " + z);
       //println("ALIVE");
      return false; 
    }
  }
}
class FTank
{
  Cube cube;
  int tall;
  boolean alive;
  float x, z;
  boolean hit = false;
  
  FTank(Cube _cube, int _tall)
  {
   
    cube = _cube; 
    x = cube.x;
    z = cube.y;
    tall = _tall;
    //println("made tree");
  }
  
  void drawFTank()
  {
    if(isHit() == false && hit == false){
      frogtank.setFill(color(100, 200, 100));
      pushMatrix();
      
        translate(0, size/2, 0);
        //box(size);
        shape(frogtank);
      
      //fill(100, 200, 100);
      //sphere(150);
      popMatrix();
    }
    
    
    else{
      hit = true;
      
      
      
      
    }
  }
  boolean isHit()
  {
    if(x >= gun.bullX-100 && x <= gun.bullX+100 && z >= gun.bullZ-100 && z <= gun.bullZ+100)
    {
      st = 2;
      //println("ded cacti");
      return true;
    }
    else 
    { 
      //println(gun.bullX + " " + x);
      //println( gun.bullZ + " " + z);
       //println("ALIVE");
      return false; 
    }
  }
}
class Cacti
{
  Cube cube;
  int tall;
  float x, z;
  boolean hit = false;
  Cacti(Cube _cube, int _tall)
  {
   
    cube = _cube;
    x = cube.x;
    z = cube.y;
    tall = _tall;
    //println("made cacti");
  }
  
  void drawCacti()
  {
    if(isHit() == false && hit == false){
      fill(50, 200, 50);
      pushMatrix();
      for(int i = 0; i < tall; i++){
        translate(0, -size, 0);
        box(size);
       
      }
     
      popMatrix();
    }
    else{
      hit = true;
      
      
    }
    
    
  }
  
  boolean isHit()
  {
    if(x >= gun.bullX-100 && x <= gun.bullX+100 && z >= gun.bullZ-100 && z <= gun.bullZ+100)
    {
      
      //println("hit");
      
      
      //println("ded cacti");
      return true;
    }
    else 
    { 
      //println(gun.bullX + " " + x);
      //println( gun.bullZ + " " + z);
       //println("ALIVE");
      return false; 
    }
  }
}
class Orb{
  float bouncefall = 1;
  float bouncefly = 1;
  float dir =0;
  float posY,posX,posZ;
  int osize = int(random(20,40));
  int fly = int(random(-10,10));
  float fall = int(random(-50,-10));
  float flew = int(random(-15,15));
  int rcol = int(random(100,200));
  int gcol = int(random(50,100));
  int bcol = int(random(100,200));
 
    //float rotx = PI/10 ;
    //float roty = PI/3;
  Orb(float _posX, float _posY, float _posZ){
    posY = _posY;
    posX = _posX;
    posZ = _posZ;
  }
  void draworb(){
    noStroke();
    //println(posX + " " + posY + " " + posZ);
    fill(rcol,gcol,bcol);
    //frogtank.setFill(color(rcol,gcol,bcol));
    
    pushMatrix();
    translate(posX,posY-150,posZ);
    sphere(osize);
    //shape(frogtank);
    
    
    //frogtank.rotateY(roty);
    //frogtank.rotateX(rotx);
   
    //circle(posX,posY,size);
    posY+= fall;
    posX+= fly;
    posZ += flew;
    
    fall += grav;
    if(fly < 0){
      fly -= dir+1;
      flew -= dir+1;
    }
    if(fly > 0){fly+=dir+1; flew += dir+1;}
    
    fall /= bouncefall;
    fly /= bouncefly;
    flew /= bouncefly;
    popMatrix();
    
    
  }
  void bonk(){
    for(int i = 0; i < numO; i++){
      
      if(orb[i].posX != posX && orb[i].posY != posY && posX <= orb[i].posX + (size) && posX  >= orb[i].posX- (size) && posY <= orb[i].posY + (size) && posY >=  orb[i].posY - size){
        //fly*=-1 + int(random(0,1));
        
        bouncefly+=0.00001;
        fall*=-1 + int(random(0,1));
        bouncefall+=.0001;
      }
    }
  }
}

void calculateElevation()
{
  xOff = 0; 
  for(int i = 0; i < X; i++)
  {
    yOff = 0;
    for (int j = 0; j < Y; j++)
    {
      cubes[i][j].elevation = int(map(noise(xOff, yOff), 0, 1, 0, 5))*size;
      //elevation[i][j] = int(random(-2, 2))*size;
      //println("elevation["+i+"]"+"["+j+"]"+" = "+cubes[i][j].elevation);               
      yOff += 0.1;
    }
    xOff += 0.1;
  }
  //println("elevation calculated");
}
