import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

//A reference to our 2D world
Box2DProcessing box2d;

ArrayList <Boundary> boundaries;

void setup () {
  size (640, 480);
  
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // We are setting a custom gravity
  box2d.setGravity(0, -10);
  
  //Create boundaries list
  boundaries = new ArrayList <Boundary> ();
  
  //Add some boundaries
  boundaries.add(new Boundary(0.5*width, 0.5*height, 20, height));  
    boundaries.add(new Boundary(0.5*width, 0.5*height, width, 20));  

}

//create 4 boundaries;
//borders of the canvas
//red coloured


void draw () {
  background (255);
  
  // We must always step through time!
  box2d.step();

  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }
  
  for (int i = 0; i < boundaries.size(); i++) {
    boundaries.get(i).display();
  }
  
}
