//number of ellipses
int amount = 500;

//coordinates for placing the ellipse
float X[] = new float[amount];
float Y[] = new float[amount];

//adding random colors to the ellipses
float R[] = new float[amount];
float G[] = new float[amount];
float B[] = new float[amount];

//transparency of ellipses
float alpha[] = new float[amount];

//size of ellipses
float radius[] = new float[amount];

void setup() {
  size( 400, 400 );
  
  for(int i = 0; i < amount; i = i + 1) {
    X[i] = random( 0, width );
    Y[i] = random( 0, height );
    R[i] = random( 0, 255 );
    G[i] = random( 0, 255 );
    B[i] = random( 0, 255 );
    alpha[i] = random( 0, 255 );
    radius[i] = random( 0, 100 );
  }
}

void draw() {
  background(200);
  noStroke();
  for(int i = 0; i < amount; i = i + 1) {
    fill( R[i], G[i], B[i], alpha[i]);
    ellipse( X[i], Y[i], radius[i], radius[i]);
  }
}
