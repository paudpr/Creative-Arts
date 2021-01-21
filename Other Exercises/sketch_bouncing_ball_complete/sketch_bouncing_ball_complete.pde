float x = 0;
float y = 0;

//to define the direction of the movement
float xspeed = 1;
float yspeed = 1;


void setup () {
size (640, 480);
frameRate(80);
  
}

void draw () {
  background (0);
  
  fill (random (200,255), random (200,255), random (200,255));
  ellipse (x, y, 20, 20);
  
  x = x + xspeed;
  if ((x > width -10) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  
  y = y + yspeed;
  if (( y > height -10) || (y < 0)) {
    yspeed = yspeed * -1;
  }
}
