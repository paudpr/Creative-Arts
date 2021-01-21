
ArrayList <ball> list = new ArrayList<ball> ();
int nballs = 200;

void setup () {
size (640, 480);
frameRate(80);
  
  //create the object
  for (int i = 0; i < nballs; i++) {
    list.add (new ball());
  }
  
}

void draw () {
  background (0);
  
  //update balls atributes
  for (int i = 0; i < nballs; i++) {
    list.get(i).update();
    list.get(i).display();
  }
  
}
