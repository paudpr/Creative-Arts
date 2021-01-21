int cols, rows;
int scl = 20;

  int w = 1200;
  int h = 900;
  
    float[][] terrain;
  
void setup () {
  size (800, 800, P3D);

  cols = w/scl;
  rows = h/scl;
  
  terrain = new float [cols][rows];
  for (int y=0; y<rows; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x=0; x<cols; x++){
      terrain[x][y]= random (-10,10);
    }
  }
}


void draw () {
  background (0);
  stroke (255);
  noFill();
  
  //to place the image in the center of the canvas once the 3D  transformation is done
  translate(width/2, height/2);
  rotateX(PI/3);
  frameRate(1);
      
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x<cols; x++) {
      vertex (x*scl, y*scl, random (-100,100));
      vertex (x*scl, (y+1)*scl, random (-100,100));
      //rect(x*scl, y*scl, scl, scl);
      
    }
    
    endShape();
    
  }
  
}
