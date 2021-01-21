
class ball { 
 
  float x;
  float y;
  
  float diameter;
  
  //speed variables
  float xspeed;
  float yspeed;
  
  color ballcolor = color (255);
  
 ball () {
   
   x = 0.5 * width;
   y = 0.5 * height;
   
   diameter  = random (10,200);
   
   xspeed = random (-10, 10);
   yspeed = random (-10, 10);
   
   ballcolor = color (random (0, 255), random (0, 255), random (0, 255));
   
 }
 
void update() { 
    
   x = x + xspeed;
  if ((x > width -10) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  
  y = y + yspeed;
  if (( y > height -10) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  
} 
  
void display() { 
   
    fill (random (200,255), random (200,255), random (200,255));
  ellipse (x, y, 40, 40);
  
} 
  
}
