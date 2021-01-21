// Library imports
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
ArrayList<Ball> balls;
ArrayList<Brick> bricks;

Player player;


void setup() {

  size(480, 640);

  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  // Turn on collision listening!
  box2d.listenForCollisions();

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
  
  // Add my player
  player = new Player(0.5 * width, 0.9 * height);

  // Add two rows of bricks (10 bricks per row)
  int nrows = 4;
  int ncols = 10;

  for (int i = 0; i < nrows; i++) {
    for (int j = 0; j < ncols; j++) {
      bricks.add(new Brick((j + 0.5)  * width / ncols, (i + 0.5) * 0.05 * height, width / ncols, 0.05 * height));
    }
  }
}

void draw() {

  background(0);

  // We must always step through time!
  box2d.step();

  // Display all the boundaries 
  for (int i = 0; i < boundaries.size(); i++) {
    boundaries.get(i).display();
  }

  // Display all my balls
  for (Ball element : balls) {
    element.display();
  }

  for (Brick element : bricks) {
    element.display();
  }
  
  player.display();

  // Check if balls must be removed
  for (int i = balls.size() - 1; i >= 0; i--) {
    Ball b = balls.get(i);
    if (b.done()) {
      balls.remove(i);
    }
  }

  // Check if bricks must be removed
  for (int i = bricks.size() - 1; i >= 0; i--) {
    Brick b = bricks.get(i);
    if (b.done()) {
      bricks.remove(i);
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

// Collision event functions!
void beginContact(Contact cp) {
  
  // Get both shapes
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1==null || o2==null) {
    println("Return");
    return;
  }

  if (o1.getClass() == Brick.class && o2.getClass() == Ball.class) {
    Brick p1 = (Brick) o1;
    p1.delete();
  }

  if (o1.getClass() == Ball.class && o2.getClass() == Brick.class) {
    Brick p2 = (Brick) o2;
    p2.delete();
  }
}

// Objects stop touching each other
void endContact(Contact cp) {
}

void mouseMoved() {

  player.move(mouseX, mouseY);
  
}
