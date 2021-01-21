/*

 DIGITAL FABRICATION FOR INTERACTION 19/20
 
 MODULE: Visual Arts
 
 DATE: 6/3/2020
 
 */



// Defining a Ball class to define ball objects
class Ball { 

  // Parameters of my class "How is my object?"
  float centerX;
  float centerY;  
  float diameter;
  float speedX;
  float speedY;
  color ballcolor;

  // Constructor of my class. It just sets initial values for my parameters. 
  // It is executed when "ball = new Ball()" is called on main sketch.
  Ball () { 

    centerX = 0.5 * width;
    centerY = 0.5 * height;

    diameter = random(10, 200);

    speedX = random(-10, 10);
    speedY = random(-10, 10);

    ballcolor = color(random(0, 255), random(0, 255), random(0, 255));
  } 

  // Update method, all calculations belong here
  void update() { 

    // Check horizontal borders
    if ((centerX > width - 0.5 * diameter) || (centerX < 0.5 * diameter)) {
      speedX *= -1;
    }

    // Check vertical borders
    if ((centerY > height - 0.5 * diameter) || (centerY < 0.5 * diameter)) {
      speedY *= -1;
    }  

    centerX += speedX;
    centerY += speedY;
  }

  // Display method, all drawings are contained here
  void display() {

    fill(ballcolor);
    ellipse(centerX, centerY, diameter, diameter);
  }
} 
