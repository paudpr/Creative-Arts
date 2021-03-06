import processing.opengl.*;

PImage img;
int[][] values;
float angle;

void setup() {
  size(500, 685, OPENGL);
  noFill();
  
  values = new int[width][height];

  // Extract the brightness of each pixel in the image
  // and store in the "values" array
  img = loadImage("a-aguirre.jpg");
  img.loadPixels();
  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      color pixel = img.pixels[i*img.width + j];
      values[j][i] = int(brightness(pixel));
    }
  }
}

void draw() {
  
  background(0);                     // Set black background
  translate(width/2, height/2, 0);   // Move to the center
  scale(4.0);                        // Scale to 400%
  
  // Update the angle
  angle += 0.005;
  rotateY(angle);  
  
  // Display the image mass
  for (int i = 0; i < img.height; i += 2) {
    for (int j = 0; j < img.width; j += 2) {
      stroke(values[j][i], 153);
      float x1 = j-img.width/2;
      float y1 = i-img.height/2;
      float z1 = -values[j][i]/2;
      float x2 = j-img.width/2;
      float y2 = i-img.height/2;
      float z2 = -values[j][i]/2-4;
      line(x1, y1, z1, x2, y2, z2);
    }
  }
}
