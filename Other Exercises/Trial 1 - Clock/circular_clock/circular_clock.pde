

void setup(){
  size(600, 600);
}

void draw(){
  
  background(0);
  
  int s = second();
  int m = minute();
  int h = hour ();
  int ms = millis();
  
 // strokeWeight (4);
 // noFill();
 // stroke (255);
 // ellipse (300, 300, 400, 400);
  
  //milliseconds not working correctly
  strokeWeight (2);
  noFill();
  stroke (150);
  float milisegundero = map (ms, 0, 1000, 0, TWO_PI);
  arc (300, 300, 550, 550, 0, milisegundero);
  
  strokeWeight (4);
  noFill();
  stroke (150);
  float segundero = map (s, 0, 60, 0, TWO_PI);
  arc (300, 300, 500, 500, 0, segundero);
  
  strokeWeight (8);
  noFill();
  stroke (150);
  float minutero = map (m, 0, 60, 0, TWO_PI);
  arc (300, 300, 400, 400, 0, minutero);
  
  strokeWeight (16);
  noFill();
  stroke (150);
  float agujahora = map (h, 0, 24, 0, TWO_PI);
  arc (300, 300, 300, 300, 0, agujahora);

pushMatrix();
popMatrix();
translate(3,3);

strokeWeight (2);
  noFill();
  stroke (255);
  arc (300, 300, 550, 550, 0, milisegundero);
  
  strokeWeight (4);
  noFill();
  stroke (255);
  arc (300, 300, 500, 500, 0, segundero);
  
  strokeWeight (8);
  noFill();
  stroke (255);
  arc (300, 300, 400, 400, 0, minutero);
  
  strokeWeight (16);
  noFill();
  stroke (255);
  arc (300, 300, 300, 300, 0, agujahora);

}
