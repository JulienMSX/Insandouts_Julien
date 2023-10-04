//JulienMassaux,boundary, you can drag the center around and really make it weird.
int pointx, pointy, npointx,npointy;
int num = 100;
int a = 0;
int b = 1;
int c;
int wid = 250;
int hi = 250;

int [] adpoix = new int [num];
int [] adpoiy = new int [num];
int [] adpoix1 = new int [num];
int [] adpoiy1 = new int [num];
int [] npoix = new int [num];
int [] npoiy = new int [num];
int [] npoix1 = new int [num];
int [] npoiy1 = new int [num];

int [] fib = new int [num];


void setup(){
  pointx = 0;
  pointy = hi*2;
  npointx = wid*2;
  npointy = 0;
  
  size(500,500);
}
void draw(){
  //println(adpoix[0],adpoiy[0],fib[0]);
 
  background(255);
  circ();
  revcirc();
  
  addit();
  //println(pointx,pointy);
  if(mousePressed){
        wid = mouseX;
        hi = mouseY;
  }
  
    for(int i = 0; i<num;i+=1){
      
      line(wid, hi, adpoix[i], adpoiy[i]);
      line(wid, hi, adpoix1[i], adpoiy1[i]);
      line(wid, hi, npoix[i], npoiy[i]);
      line(wid, hi, npoix1[i], npoiy1[i]);
      
    }
    //wid += pointx;
    //hi -= pointy;
    clean();
  
  
 
  
  
}

void addit(){
  fib();
  
  for(int i = 0; i < num; i++){
    
  
    
    adpoix[i] = pointx + fib[i];
    adpoiy[i] = pointy + fib[i];
    adpoix1[i] = pointx - fib[i];
    adpoiy1[i] = pointy - fib[i];
    npoix[i] = npointx - fib[i];
    npoiy[i] = npointy - fib[i];
    npoix1[i] = npointx + fib[i];
    npoiy1[i] = npointy + fib[i];
    
    
    
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
