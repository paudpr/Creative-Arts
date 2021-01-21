int counter = 10;
  
void setup(){
  size(600, 600);
 
}

void draw(){
  background(255);
  
  int s = second();
  int m = minute();
  int h = hour ();
  int ms = millis();
  
  
  line(s*counter,0,s*counter,200);
  line(m*counter,200,m*counter,400);
  line(h,400,h,600);
  
}
