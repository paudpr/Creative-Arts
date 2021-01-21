/*

 DIGITAL FABRICATION FOR INTERACTION 19/20
 
 MODULE: Visual Arts
 
 DATE: 6/3/2020
 
 */


// Declaring a variable size list to store my Ball type objects
ArrayList<Ball> list = new ArrayList<Ball>();

// We will use 100 balls
int nBalls = 100;

// Setup function, will be executed just once
void setup() {

  // Define canvas size
  size(1280, 720);

  // Fill background in black
  background(0);

  // Initialize 100 objects of class Ball and push them in list
  for (int i = 0; i < nBalls; i++) {
    list.add(new Ball());
  }
}


// Draw function, will be executed in a loop
void draw() {

  // Delete previous frame by filling in black
  background(0);

  // Iterate over the list
  for (int i = 0; i < nBalls; i++) {
    // For every item: update and display.
    list.get(i).update();
    list.get(i).display();
  }
}
