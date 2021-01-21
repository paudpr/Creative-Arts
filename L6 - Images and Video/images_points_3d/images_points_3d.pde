import peasy.PeasyCam;
PImage picture;
int size;
PeasyCam cam;

void setup() {

  size(1200, 800, P3D);
  
  
  picture = loadImage("marguerite2.jpg");
  println("Width: " + picture.width);
  println("Height: " + picture.height); 

  cam = new PeasyCam(this, 400);

  
}


void draw() {
  
  background(0);
  loadPixels();
  int step = 50;
  
  pushMatrix();
  //translate(0.5 * width, 0.5 * height, 500);
  
  for (int i = 0; i < picture.width; i = i + step) {
  
    for (int j = 0; j < picture.height; j = j + step) {
    
      int location = i + j * width;
      
      color color_pixel = picture.pixels[location];
      
      pushMatrix();
      translate(i, j, 0);
      fill(color_pixel);
      noStroke();
      sphere(3);
      popMatrix();
    }
  
  }
  
  popMatrix();
  
  fill(255);
  textSize(20);
  // text("Framerate: " + int(frameRate), 10, 30); 
  // println(frameRate);
  
}
