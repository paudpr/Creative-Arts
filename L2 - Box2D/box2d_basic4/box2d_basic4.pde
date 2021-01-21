// Library imports
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
ArrayList<Ball> balls;


void setup() {

  size(640, 480);
  
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // We are setting a custom gravity
  box2d.setGravity(0, -10);
  
  // Create boundaries list
  boundaries = new ArrayList<Boundary>();
  balls = new ArrayList<Ball>();
  
  // Add some boundaries
  boundaries.add(new Boundary(0.5 * width, 0, width, 20));
  boundaries.add(new Boundary(0, 0.5 * height, 20, height));
  boundaries.add(new Boundary(width, 0.5 * height, 20, height));
  boundaries.add(new Boundary(0.2 * width, height, 0.4 * width, 20));
  boundaries.add(new Boundary(0.8 * width, height, 0.4 * width, 20));
  
}

void draw() {
  background(255);
  
  // We must always step through time!
  box2d.step();

  // Display all the boundaries 
  for (int i = 0; i < boundaries.size(); i++) {
    boundaries.get(i).display();
  }
  
  // Display all my boxes
  for (Ball element: balls) {
    element.display();
  }
  
  // Check if boxes must be removed
  for (int i = balls.size() - 1; i >= 0; i--) {
    Ball b = balls.get(i);
    if (b.done()) {
      balls.remove(i);
    }
  }
  
  textSize(24);
  fill(0);
  text("FrameRate: " + int(frameRate), 10, 30);
  text("Elements: " + boxes.size(), 10, 60);
}

void mousePressed() {
    Box p = new Box(mouseX, mouseY);
    boxes.add(p);
}