/*

 DIGITAL FABRICATION FOR INTERACTION 19/20
 
 MODULE: Visual Arts
 
 DATE: 6/3/2020
 
*/


// Class Ball for Pong Game
class Ball {

  // Attributes for my ball "How is it?"
  PVector position;
  PVector speed;
  int diameter;
  color ballcolor;
  int scoreA;
  int scoreB;
  SoundFile audio_attribute; 

  // Constructor for my ball class. Initializes parameter values.
  Ball(SoundFile audio) {
    position = new PVector(width/2, height/2);
    speed = new PVector(0, 0);
    diameter = 25;
    ballcolor = color (255);
    audio_attribute = audio;
  }

  // Update ball position and check collisions with top/bottom borders
  void update() {

    // Update positions
    position.add(speed);

    // If a collision with horizontal borders is detected, change signus of 
    // vertical component of speed (to change direction)
    if ((position.y < 0) || (position.y > height)) {
      speed.y *= -1;
    }
  }

  // Method to display the ball
  void display() {
    fill(ballcolor);
    noStroke();
    ellipse(position.x, position.y, diameter, diameter);
  }

  // Method to assign a random speed to ball on kick-off
  void kickoff() {
    speed = PVector.random2D().mult(7);
    audio_attribute.play();
    audio_attribute.rate(4); //acelera el audio
  }

  // Method to change direction of ball in X axis 
  // (called when collisioning with a player)
  void changeDirection() {
    speed.x *= -1;
  }

  // Method to check if somebody has scored a goal. It returns:
  // 1 - If player 1 has scored
  // 2 - If player 2 has scored
  // 0 - If no goal has been scored
  int isGoal() {
    if (position.x > width) return 1;
    if (position.x <0) return 2;
    return 0;
  }

  // Method to reset game after goal. 
  void reset() {
    // Put ball in the field center
    position.set(width/2, height/2);
    // Stop it
    speed.set(0, 0);
  }
}
