/*

 DIGITAL FABRICATION FOR INTERACTION 19/20
 
 MODULE: Visual Arts
 
 DATE: 2/4/2020
 
 */

// Define objects for picture, size
PImage picture;
int size;

void setup() {

  size(1200, 800);
  smooth();

  // Load image
  picture = loadImage("marguerite2.jpg");

  // Assign values to size parameter
  size = 100;
}


void draw() {

  // Paint canvas in black 
  background(0);
  
  // Instead of drawing the picture:
  image(picture, 0, 0);
  
  // You should apply a circular mask of radius "size" to the picture and show it centered
  // in the mouse position
  
  fill(255);
  textSize(20);
  textAlign(RIGHT, CENTER);
  text("Framerate: " + int(frameRate), width - 10, 30); 
  // println(frameRate);
}
