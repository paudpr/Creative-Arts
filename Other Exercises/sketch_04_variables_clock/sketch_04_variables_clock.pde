
void setup() {
  size(500, 500);
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  int ms = millis();
  
  int d = day();
  int M = month();
  int y = year();
  
  println(h + ":" + m + ":" + s);
  
}
