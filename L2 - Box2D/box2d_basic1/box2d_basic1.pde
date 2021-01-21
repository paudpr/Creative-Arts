import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;


void setup() {

  size(640, 480);
  
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // We are setting a custom gravity
  box2d.setGravity(0, -10);
  
  // Create boundaries list
  boundaries = new ArrayList<Boundary>();
  
  // Add some boundaries
  boundaries.add(new Boundary(width/4,height-5,width/2-50,10));
  boundaries.add(new Boundary(3*width/4,height-50,width/2-50,10));

  
}

void draw() {
  background(255);
  
  // We must always step through time!
  box2d.step();

  // Display all the boundaries 
  for (int i = 0; i < boundaries.size(); i++) {
    boundaries.get(i).display();
  }
  
}
