// Library imports
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

import processing.sound.*;

// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
ArrayList<Ball> balls;
ArrayList<Brick> bricks;
ArrayList <Player> players;

int status;
int points;
int gameOverCounter;
int turnsLeft = 5;

boolean newGame = true;

//Columnas y filas de bricks
int nrows = 4;
int ncols = 10;

SoundFile brickSound;
SoundFile ballLostSound;
SoundFile gameOverSound;

PFont atariFont;
PFont arial;

Player player;

void setup() {

  //Loading different fonts
  PFont.list();  
  atariFont = createFont("AtariClassic-gry3.ttf.ttf", 20);
  textFont(atariFont);
  arial = loadFont("ArialMT-48.vlw");


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
  Ball p = new Ball(0.5 * width, 0.89 * height);
  balls.add(p);

  //add my player
  player = new Player(0.5 * width, 0.9 * height);

  // Add bricks
  for (int i = 0; i < nrows; i++) {
    for (int j = 0; j < ncols; j++) {
      bricks.add(new Brick((j + 0.5)  * width / ncols, (i + 0.5) * 0.05 * height, width / ncols, 0.05 * height));
    }
  }

  //set status to intro screen
  status = 3;

  brickSound = new SoundFile (this, "brickSound.mp3");
  ballLostSound = new SoundFile (this, "ballLostSound.wav");
  gameOverSound = new SoundFile (this, "gameOverSound.mp3");
}



void draw() {



  background(0);

  // We must always step through time!
  box2d.step();

  // Display all the boundaries and bricks
  for (int i = 0; i < boundaries.size(); i++) {
    boundaries.get(i).display();
  }
  for (Brick element : bricks) {
    element.display();
  }


  //Show intro screen / game reseted.

  if (status == 3) {
    rectMode (CENTER);
    fill (255);
    stroke (255, 0, 0);
    strokeWeight(random(10));
    rect (width/2, height/2, width, height);
    textAlign(CENTER, CENTER);
    fill(255, 0, 0);
    textFont(atariFont);
    text ("Nervious Bricks", width/2, height/2);

    textFont(arial, 18);
    textAlign (CENTER);
    text ("Press Space Key to Start", width/2, height * 0.6);
    text ("Developed by Kelvin Feliz, 2020", width/2, height * 0.9);
    points = 0;
    gameOverCounter = 0;
    turnsLeft = 5;

    if (newGame == false) {
      for (int i = 0; i < nrows; i++) {
        for (int j = 0; j < ncols; j++) {
          bricks.add(new Brick((j + 0.5)  * width / ncols, (i + 0.5) * 0.05 * height, width / ncols, 0.05 * height));
        }
      }
      for (int i = balls.size() - 1; i >= 0; i--) {
        Ball b = balls.get(i);
        balls.remove(i);
      }
newGame = true;
  
      
    }
  }

  /*
  ATTEMPTED TO CREATE A WINNER STATE BUT DIDNT GOT IT... YET!
  if (status == 4) { //WINNER SCREEN
    rectMode (CENTER);
    fill (255);
    stroke (255, 0, 0);
    strokeWeight(random(10));
    rect (width/2, height/2, width, height);
    textAlign(CENTER, CENTER);
    fill(255, 0, 0);
    textFont(atariFont);
    text ("YOU WON!", width/2, height/2);

    textFont(arial, 18);
    textAlign (CENTER);
    text ("Press Space Key to Play Again", width/2, height * 0.6);
    text ("Developed by Kelvin Feliz, 2020", width/2, height * 0.9);
    points = 0;
    gameOverCounter = 0;
    turnsLeft = 5;
  }
  */



  //Show ball and player
  if (status == 0) {
    for (Ball element : balls) {
      element.display();
      element.moveBall(mouseX, mouseY);
      player.display();
      player.move(mouseX, mouseY);
      newGame = false;
    }
  }


  //Gameplay
  if (status == 1) {
    for (Ball element : balls) {
      element.display();
      player.display();
      newGame = false;
    }
  }



  // Check if balls must be removed
  //change status to 0
  for (int i = balls.size() - 1; i >= 0; i--) {
    Ball b = balls.get(i);
    if (b.done()) {
      balls.remove(i);
      status = 0;
      player = new Player(0.5 * width, 0.9 * height);
      ballLostSound.play();
      newGame = false;
      gameOverCounter = gameOverCounter + 1;
      turnsLeft = turnsLeft - 1;
    }
  }

//IF THE BALL IS DROPPED 5 TIMES... GAME RESTARTS
  if (gameOverCounter == 5) {
    status =2;
  }

  if (status == 2) {
    rectMode (CORNER);
    fill (255);
    text ("Game Over!", width/2, height/2);
    points = 0;
    gameOverSound.play();
    gameOverCounter = 0;
    newGame = true;
    if (newGame == true) {
      for (int i = 0; i < nrows; i++) {
        for (int j = 0; j < ncols; j++) {
          bricks.add(new Brick((j + 0.5)  * width / ncols, (i + 0.5) * 0.05 * height, width / ncols, 0.05 * height));
        }
      }
      status = 3;
    }
  }


  // Check if bricks must be removed
  for (int i = bricks.size() - 1; i >= 0; i--) {
    Brick b = bricks.get(i);
    if (b.done()) {
      bricks.remove(i);
      points = points + 10;
      brickSound.play();
      brickSound.rate(2);
    }
  }  


  // Move the player to the mouse position
  player.move(mouseX, mouseY);

  // If we lose the ball, add a new one
  if (balls.size() == 0) {
    // Add a ball
    Ball p = new Ball(0.5 * width, 0.89 * height);
    balls.add(p);
  }

 
/* 
THIS WAS FOR MY WINNER STATE ATTEMP!!!

  if (bricks.size() == 0) {
    status = 4;
    newGame = false;
  }
*/

  textSize(24);
  colorMode(RGB);
  fill(255);
  textFont(atariFont);
  textAlign(CORNER);
  text("Pts: " + points, 15, 30);
  text ("Turns: " + turnsLeft, 15, 60);


  textFont(arial, 10);
  text("FrameRate: " + int(frameRate), 20, height * 0.95);
  //text("Elements: " + balls.size(), 10, 60);


  println("status: " + status);
}




// Method to detect key press
void keyPressed() {

  // If we press <SPACE> start the game
  if (status == 0) {
    if (key ==  ' ') {
      for (int i = 0; i < balls.size(); i++) {
        balls.get(i).kickoff();
        status = 1;
      }
    }
  }

  if (status == 2) {
    if (key == ' ') {
      status = 0;
    }
  }

  if (status == 3) {
    if (key == ' ') {
      status = 0;
    }
  }
  
/* THIS IS FOR MY WINNER STATE ATTEMPT!
  if (status == 4) {
    if (key == ' ') {
      status = 3;
    }
  }
  */
  
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
    p1.firstHit();
  }

  if (o1.getClass() == Brick.class && o2.getClass() == Ball.class) {
    Brick p1 = (Brick) o1;
    p1.delete();
  }
}



// Objects stop touching each other
void endContact(Contact cp) {
}
