/*

  DIGITAL FABRICATION FOR INTERACTION 19/20
  
  MODULE: Visual Arts
  
  DATE: 6/3/2020
  
*/


// Using a class "Ball" to declare 3 objects of Ball type
Ball ball1, ball2, ball3;

// Setup function, will be executed just once
void setup() {
  
  // Define canvas size
  size(1280, 720);
  
  // Fill background in black
  background(0);
  
  // Initialize my objects
  ball1 = new Ball();
  ball2 = new Ball();
  ball3 = new Ball();

}


// Draw function, will be executed in a loop
void draw() {
  
  // Delete previous frame by filling in black
  background(0);
  
  // Update my ball objects attributes
  ball1.update();
  ball2.update();
  ball3.update();
  
  // Displaying my ball objects
  ball1.display();
  ball2.display();
  ball3.display();

}
