float circleX = 0;
float xspeed = 10;

void setup (){
  size (640, 360);
  
}

void draw () {
  background (50);
  
  fill (255);
  ellipse (circleX, 180, 24, 24);
  
  circleX = circleX + xspeed;
   
  if (circleX >  width) {
    xspeed = -10;
  }
  
  if (circleX < 0) {
    xspeed = 10;
  }
  
  //to do it with just one statement
  //if (circleX > width, circleX < 0) {
    //xspeed = xspeed * -1;
    
}
