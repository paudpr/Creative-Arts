PImage picture;

void setup() {

  size(1200, 800);
  picture = loadImage("marguerite2.jpg");
  println("Width: " + picture.width);
  println("Height: " + picture.height);
  
  loadPixels();
  // Iterate over the pixels of the image
  for(int i = 0; i < picture.width; i++) {
    for(int j = 0; j < picture.height; j++) {
      
      // Coordinate to access pixels array
      int location = i + j * width;
      
      // Get pixel color
      color pixel_color = picture.pixels[location];
      // Get brightness of the pixel
      float bright = brightness(pixel_color);  
      // Create a new gray color using the brightness
      color new_color = color(bright);
      // Assign the pixel the new color.
      picture.pixels[location] = new_color;
      
    }
  }
  
  updatePixels();
}


void draw() {
  
  background(0);
  image(picture, 0, 0);

}
