/*

 DIGITAL FABRICATION FOR INTERACTION 19/20
 
 MODULE: Visual Arts
 
 DATE: 6/3/2020
 
 */


//import sound library
import processing.sound.*;

SoundFile introSound;
SoundFile kickoffSound;
SoundFile hitSound;
SoundFile goalSound;
SoundFile winnerSound;


// Declare my ball object
Ball ball;

// Declare two player objects
Player player1, player2;

//Declare Status Object


// Declare a variable to store the game STATUS/SCREEN
int status;


boolean goalplayer1, goalplayer2;
boolean winner = false; // is there a winner?


PImage atariLogo;

int N = 6;
float[] Y = new float[N]; // para animacion de Congo Pong
PFont atariFont;
color background;


void setup() {

  PFont.list();  
  atariFont = createFont("AtariClassic-gry3.ttf.ttf", 32);
  textFont(atariFont);


  // Set canvas size
  size(1080, 720);

  //Initialize Sounds
  winnerSound = new SoundFile (this, "winnerSound.mp3");
  hitSound = new SoundFile (this, "hitSound.wav");
  kickoffSound = new SoundFile (this, "kickoffSound.mp3");
  goalSound = new SoundFile (this, "goalSound.wav");
  //  introSound = new SoundFile (this, "introSound.wav");

  //Initialize Image
  atariLogo = loadImage ("Atari-logo.jpg");

  // Initialize ball object
  ball = new Ball(kickoffSound);

  // Initialize both players
  player1 = new Player(1);
  player2 = new Player(2);


  // Presentation Slide
  status = 0;
  
   
}






void draw() {
  
  //Changing the background depending on who scored the last point.
  // initial state, background Black.
  //Player One scores, background turns red.
  //Player two scores, background turns blue.
  
 if (goalplayer1 == true) { 
 background(255,0,0); } 
 else if (goalplayer2 == true) {
   background (0,0,255); } else if
   (goalplayer1 == false && goalplayer2 == false) {
   background (0); 
   }

  // Status set to 0 in voidSetup. Show Presentation Slide
  if (status == 0) {
    
    fill (0);
    rect (0, 0, width, height);
    imageMode (CENTER);
    image (atariLogo, width/2, height/3, 1920/8, 1080/8);
    fill (255);
    
    textAlign (CENTER);
    textSize (32);
    text ("CONGO-PONG", width/2, height/2);
    textSize(18);
    text ("Press Space Key to Start", width/2, 500);
    textSize(12);
    text ("Developed by Kelvin Feliz. 2020", width/2, 700);
   // textAlign (CENTER,BOTTOM);
  

    player1.goals = 0;
    player2.goals = 0;
    player1.reset(1);
    player2.reset(2);
    winner = false;
  }


  // Check my status and draw the proper screen
  if (status == 1) {

    // introSound.stop(); - this sounded horrible when I loaded it!
    
    

    // Update my ball position
    ball.update();

    // Check if any collision between balls and players has happened
    if (player1.collision(ball.position)) { 
      ball.changeDirection();
      hitSound.play();
    }
    if (player2.collision(ball.position)) { 
      ball.changeDirection();
      hitSound.play();
    }

    // Finally, display players
    player1.display();
    player2.display();

    // Display ball
    ball.display();

    // display scores
    textSize(30);
    fill(255);
    textAlign(CENTER, CENTER);
    textFont (atariFont);
    text(player1.goals + "  -  " + player2.goals, 0.5 * width, 0.05 * height);

    // Check if someone has scored a goal and if so:
    // a) Update score
    // b) Reset the ball to initial position and speed
    // c) set goalplayer true and false to set new background color
    if (ball.isGoal() ==1) {
      player1.goals += 1; 
     goalplayer1 = true;
     goalplayer2 = false;
      goalSound.play();
      ball.reset();
    } else if (ball.isGoal() == 2) {
      player2.goals += 1;
     goalplayer2 = true;
     goalplayer1 = false;
      goalSound.play();
      ball.reset();
    }



    // Mark a winner after player scores 3 points
    if (player1.goals == 3) {
      winnerSound.play();
      winnerSound.rate(1.05);
      status = 2;
    } else if (player2.goals == 3) {
      winnerSound.play();
      winnerSound.rate (1.05);
      status = 2;
    }
  }

  //Prints which player won and set winner to true and goalplayer to false to return to black background
  if (status == 2 && player2.goals == 3) {
    
    fill (0,0,255);
    textFont (atariFont);
    text ("Player Two Wins!", width/2, height/2);
    winner = true;
    goalplayer1 = false;
    goalplayer2 = false;
    print (winner); //to see if the code is working.
  } else if (status == 2 && player1.goals == 3) {
    fill (255, 0, 0);
    textFont (atariFont);
    text ("Player One Wins!", width/2, height/2); 
    winner = true;
    goalplayer1 = false;
    goalplayer2 = false;
    print (winner);
  }
}




// Function which triggers automatically when some key is pressed
void keyPressed() {

  // If space is pressed, kick-off and start game
  //if winner is false starts the game and kickoff ball
  //if winner is true, restarts the game
  if (winner == false) {
    if (key ==' ') {
      ball.kickoff();
      status = 1;
    }
  }

  if (winner == true) {
    if (key ==' ') {
      status = 0;
    }
  }

  // If Q or A keys are pressed, move player 1
  if (key =='Q' || key=='q') {
    player1.moveUp();
  }

  if (key =='A' || key=='a') {
    player1.moveDown();
  }

  // If O or L keys are pressed, move player 2
  if (key =='O' || key=='o') {
    player2.moveUp();
  }

  if (key =='L' || key=='l') {
    player2.moveDown();
  }
}
