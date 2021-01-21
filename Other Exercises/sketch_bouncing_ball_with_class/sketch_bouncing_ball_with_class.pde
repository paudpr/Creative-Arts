ball ball1, ball2, ball3;


void setup () {
size (640, 480);
frameRate(80);
  
  //creating objects
  ball1 = new ball();
  ball2 = new ball();
  ball3 = new ball();
}

void draw () {
  background (0);
  
  //update ball atributes
   ball1.update ();
   ball2.update ();
   ball3.update ();
  
  //displaying balls
  ball1.display();
  ball2.display();
  ball3.display();
  
  
}
