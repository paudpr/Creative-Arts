/*

 DIGITAL FABRICATION FOR INTERACTION 19/20
 
 MODULE: Visual Arts
 
 DATE: 6/3/2020
 
 */
 
 
// Import Sound library (download it first if necessary)
import processing.sound.*;


// Declaring a variable size list to store my Ball type objects
ArrayList<Ball> list = new ArrayList<Ball>();

// Declaring nBalls as the number of Ball objects and set it to three
int nBalls = 3;

// Declaring a SoundFile object to store my sound file
SoundFile file;

// Setup function, will be executed just once
void setup() {
  
  // Define canvas size
  size(1280, 720);
  
  // Set our maximum frameRate to 30fps
  frameRate(30);
  
  // Fill background in black
  background(0);

  // Load a sound file into our SoundFile object
  file = new SoundFile(this, "Blop.mp3");

  // Create my 3 Ball objects and add them to the list
  for (int i = 0; i < nBalls; i++) {
    list.add(new Ball(file));
  }
  

}


// Draw function, will be executed in a loop
void draw() {
  
  // Trail effect: Instead of erasing previous frame by filling in opaque black,
  // we will draw a semi-transparent black rectangle over my frame.
  fill(0, 20);
  rect(0, 0, width, height);
  
  // Iterate over the list 
  for (int i = 0; i < nBalls; i++) {
    // For every list element, update and display it
    list.get(i).update();
    list.get(i).display();
  }
  
  // Draw a rectangle on the top left corner to 
  // avoid trailing efect on my fps display
  fill(0);
  stroke(255);
  rect(10, 10, 100, 40);
  
  // Set textsize and text color
  textSize(22);
  fill(255);
  // Align text: center vertically, left horizontally
  textAlign(LEFT, CENTER);
  // Show framerate on position 25, 25
  text(int(frameRate) + " fps", 25, 25);
}
