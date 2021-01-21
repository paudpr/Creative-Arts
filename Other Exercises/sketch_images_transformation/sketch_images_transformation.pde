PImage picture;
int threshold;

void setup () {
  
  size (1200, 800);
  
  picture = loadImage ("marguerite2.jpg");
  //to obtain the picture's dimensions
  println ("Width: " + picture.width);
  println ("Height: " + picture.height);
  
  loadPixels ();
  threshold = 100;
  
  //iterate over the pixels of the image; first pixels horizontally, then vertically
  for (int i= 0; i < picture.width; i++){
   for (int j = 0; j < picture.height; j++){
     
     //coordinate to access pixels array
     int location = i + j * width;
     
     //get pixel color
     color pixel_color = picture.pixels [location];
     // get brightness of the pixel
     float bright = brightness (pixel_color);
    //create a new gray color using the brightness
     color new_color = color (bright); //if (0,0,bright) will display blue shades, and iterations
     //assign the pixel the new color
    picture.pixels [location] = new_color;
   }
  }
  
  updatePixels ();
}

void draw () {
  
 background (0);
 
 image (picture, 0, 0);
  
}
