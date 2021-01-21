/*

  DIGITAL FABRICATION FOR INTERACTION 19/20
  
  MODULE: Visual Arts
  
  DATE: 6/3/2020
  
*/


// Global variables definition
int centerX;              // X component of center position of my ball
int centerY;              // Y component of center position of my ball
int diameter = 100;       // Diameter of my ball
int speedX = 5;           // X component of speed of my ball
int speedY = 5;           // Y component of speed of my ball


// Setup function, will be executed just once
void setup() {
  
  // Define canvas size
  size(600, 400);
  
  // Fill background in black
  background(0);

  // Set this variables to center of the canvas
  centerX = int(0.5 * width);
  centerY = int(0.5 * height);
  
  // Set random values to speedX and speedY
  speedX = int(random(-4, 4));
  speedY = int(random(-4, 4));
  
}


// Draw function, will be executed in a loop
void draw() {
  
  // Erase previous frame by filling in black
  background(0);
  
  // Check horizontal borders
  if ((centerX > width - 0.5 * diameter) || (centerX < 0.5 * diameter)) {
    speedX *= -1;
  }
  
  // Check vertical borders
  if ((centerY > height - 0.5 * diameter) || (centerY < 0.5 * diameter)) {
    speedY *= -1;
  }  
  
  // Update position by adding speed
  centerX += speedX;
  centerY += speedY;
  
  // Finally, draw the ball ball
  ellipse(centerX, centerY, diameter, diameter);

}
