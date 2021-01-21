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

int status, points, lifes;

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

  // Add my player
  player = new Player(0.5 * width, 0.9 * height);

  // Initialize status to value zero
  status = 0;

  resetGame();
}

void draw() {

  background(0);

  if (status == 0) {

    fill(255);
    textSize(60);
    textAlign(CENTER, CENTER);
    text("ARKANOID", 0.5 * width, 0.5 * height);
  }

  else if (status == 1 || status == 2) {
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
        balls.remove(i); //<>//
        lifes--;
        if (lifes == 0) {
          status = 3;
        }
      }
    }

    // Check if bricks must be removed
    for (int i = bricks.size() - 1; i >= 0; i--) {
      Brick b = bricks.get(i);
      if (b.done()) {
        bricks.remove(i);
      }
    }  

    // If we lose the ball, add a new one
    if (balls.size() == 0) {
      status = 1;
      // Add a ball
      Ball p = new Ball(0.5 * width, 0.85 * height);
      balls.add(p);
    }

    // Move the player to the mouse position
    player.move(mouseX, mouseY);

    if (status == 1) { 
      for (int i = 0; i < balls.size(); i++) {
        balls.get(i).move(mouseX, mouseY);
      }
    }

    textSize(0.03 * width);
    colorMode(RGB);
    fill(255);
    textAlign(LEFT, CENTER);
    text("FrameRate: " + int(frameRate), 0.02 * width, 0.94 * height );
    text("Elements: " + balls.size(), 0.02 * width, 0.97 * height);

    textAlign(RIGHT, CENTER);
    text("Points: " + points, 0.98 * width, 0.94 * height );
    text("Lifes: " + lifes, 0.98 * width, 0.97 * height);
  }
  
  else if (status == 3) {
  
    fill(255);
    textSize(42);
    textAlign(CENTER, CENTER);
    text("Score: " + points, 0.5 * width, 0.5 * height);
  
  }
}


void resetGame() {

  // In case there are still bricks from the previous game: delete them
  for (int i = bricks.size() - 1; i >= 0; i--) {
    bricks.get(i).killBody();
    bricks.remove(i);
  }

  // Add two rows of bricks (10 bricks per row)
  int nrows = 4;
  int ncols = 10;

  for (int i = 0; i < nrows; i++) {
    for (int j = 0; j < ncols; j++) {
      bricks.add(new Brick((j + 0.5)  * width / ncols, (i + 0.5) * 0.05 * height, width / ncols, 0.05 * height));
    }
  }

  // Initialize points to zero
  points = 0;

  // Initialize lifes to three
  lifes = 3;
}


// Method to detect key press
void keyPressed() {

  // If we press <SPACE> start the game
  if (key == ' ' && status == 0) status = 1;
  
  if (key ==  ' ' && status == 1) {
    status = 2;
    for (int i = 0; i < balls.size(); i++) {
      balls.get(i).kickoff();
    }
  }
  
  if (key == ' ' && status == 3) {
    resetGame();
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
    return;
  }

  if (o1.getClass() == Brick.class && o2.getClass() == Ball.class) {
    Brick p1 = (Brick) o1;
    p1.delete();
    points += 10;
  }

  if (o1.getClass() == Ball.class && o2.getClass() == Brick.class) {
    Brick p2 = (Brick) o2;
    p2.delete();
    points += 10;
  }
}

// Objects stop touching each other
void endContact(Contact cp) {
}
