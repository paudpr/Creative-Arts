PImage picture;
int size;
int mag;

void setup() {

  size(1200, 800);
  
  
  picture = loadImage("marguerite2.jpg");
  println("Width: " + picture.width);
  println("Height: " + picture.height); 

  size = 10;
  mag = 20;

  
}


void draw() {
  
  background(0);
  image(picture, 0, 0);
  
  noFill();
  stroke(255, 0, 0);
  rect(mouseX, mouseY, size, size);
  
  // Draw the Zoom area
  fill(0);
  stroke(255, 0, 0);
  rect(0, 0, mag * size, mag * size);

  
  fill(255);
  textSize(20);
  textAlign(RIGHT, CENTER);
  text("Framerate: " + int(frameRate), width - 10, 30); 
  // println(frameRate);
  
}
