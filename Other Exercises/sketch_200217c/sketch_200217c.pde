float incX = 0.04;
float incY = 0.05;
float distance = 22;
int wavesHeight = 50;
boolean looping = true;
 float frame = 0;

void setup() {
fullScreen();
  background(0);
  noiseDetail(2);
  
  
  
}

void draw() {
  float zOff = frameCount * 0.01;
  background(0);
  //noStroke();
  strokeWeight(0.5);
  stroke(0);
  float yOff = 0;
  for(int y = - wavesHeight; y < height + wavesHeight; y += distance) {
    float xOff = 0;
    float r = xOff;
    beginShape();
    
    for(int x = -wavesHeight; x < width *2; x += distance) {
      float n = noise(xOff, yOff, zOff);
      float g = n;
      float b = yOff;
      float value = map(n, 0, 1, -wavesHeight, wavesHeight);
      curveVertex(x, y + value);
      xOff += incX;
      r = map(xOff, 0, 3.5, 255, 255);
      g = map(n, 0.2, 0.7, 255, 255);
      b = map(yOff, 0, 4, 255, 255);
      fill(r, g, b, b*1.5);
    }
    endShape();
    yOff += incY;
  
  }
  
}
