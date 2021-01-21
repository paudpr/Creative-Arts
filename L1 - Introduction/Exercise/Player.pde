/*

 DIGITAL FABRICATION FOR INTERACTION 19/20
 
 MODULE: Visual Arts
 
 LESSON 1: Introduction
 
 DATE: 6/3/2020
 
*/


// Class Player for Pong Game
class Player {

  // Atributes of my player
  PVector position;
  float playerwidth;
  float playerheight;
  color playercolor;
  int speed;
  int goals;

  // Player constructor. It receives a integer "type" as a parameter.
  // Type indicates:
  // 1 - Left Player
  // 2 - Right Player
  Player(int type) {

    // Check type and locate player in its proper position (left or right)
    if (type == 1) {
      position = new PVector(0.1*width, height/2);
    } else if (type == 2) {
      position = new PVector(0.9*width, height/2);
    }

    // Set initial values for every attribute
    playerwidth = int(0.01 * width);
    playerheight= 0.2 * height;
    playercolor = color(255);
    speed = 10;
    goals=0;
  }

  // Method to move my player UP. 
  // When it reachs top it does not move anymore.
  void moveUp() {

    if (position.y > 0) position.y-= speed * 4;
  }

  // Method to move my player DOWN. 
  // When it reachs bottom it does not move anymore.
  void moveDown() {
    if (position.y + playerheight < height) position.y+= speed * 4;
  }

  // Method to score a goal
  void ScoreGoal() {
    goals++;
    
    if (goals == 3) {
   text ("Winner", width/2, height/2); 
  }
    
  }
  
  

  // Method to check if the ball is collisioning with the player
  // Ball position is passed as a parameter in "vec"
  // When "vec" is inside my player, it returns TRUE
  // otherwise, it returns FALSE
  boolean collision(PVector vec) {

    if (vec.x > position.x && vec.x <= position.x + playerwidth) {

      if (vec.y > position.y && vec.y <= position.y + playerheight) {

        return true;
      } else return false;
    } else return false;
  }

  // Method to display my players
  void display() {
    fill(playercolor);
    noStroke();
    rect(position.x, position.y, playerwidth, playerheight);
  }
  
  // Method that reset players when starting a new game.
  void reset(int type) {
    
  
        if (type == 1) {
      position.set(0.1*width, height/2); }
   if (type == 2) {
      position.set(0.9*width, height/2);
    }
    

  }
  

  
  
  
}
