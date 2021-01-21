
Snake s =  new Snake (); 

float a;
float b;

float food;

int scl = 20;
float cols = width / scl;
float rows = height / scl;


void setup () {
  size (400, 600);
  frameRate (10);
  
  a = random (0, cols);
  b = random (0, rows);
  
}

void draw () {
  background (0);

  fill (255, 0, 100);
  rect (a, b, scl, scl);
  s.update ();
  s.display ();
}
