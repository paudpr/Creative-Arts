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
ArrayList<Brick> bricks;


void setup() {

  size(480, 640);
  
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // We are setting a custom gravity
  box2d.setGravity(0, 0);
  
  // Create boundaries list
  boundaries = new ArrayList<Boundary>();
  balls = new ArrayList<Ball>();
  bricks = new ArrayList<Brick>();
  
  // Add some boundaries
  boundaries.add(new Boundary(0.5 * width, -11, width, 20));
  boundaries.add(new Boundary(-11, 0.5 * height, 20, height));
  boundaries.add(new Boundary(width+11, 0.5 * height, 20, height));

  // Add a ball
  Ball p = new Ball(0.5 * width, 0.5 * height);
  balls.add(p);
  
  // Add one brick
  bricks.add(new Brick(0.5 * width, 0.1 * height, 0.1 * width, 0.05 * height));
  
}

void draw() {
  
  background(0);

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
  
  for (Brick element: bricks) {
    element.display();
  }
  
  // Check if boxes must be removed
  for (int i = balls.size() - 1; i >= 0; i--) {
    Ball b = balls.get(i);
    if (b.done()) {
      balls.remove(i);
    }
  }
  
  if (balls.size() == 0) {
    // Add a ball
    Ball p = new Ball(0.5 * width, 0.5 * height);
    balls.add(p);
  }
  
  textSize(24);
  colorMode(RGB);
  fill(255);
  text("FrameRate: " + int(frameRate), 10, 30);
  text("Elements: " + balls.size(), 10, 60);
}

void keyPressed() {

  if (key ==  ' ') {
  
    for (int i = 0; i < balls.size(); i++) {
      balls.get(i).kickoff();
    }
  
  }

}
