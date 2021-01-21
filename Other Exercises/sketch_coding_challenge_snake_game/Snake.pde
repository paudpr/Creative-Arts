class Snake {

  float x = 0; 
  float y = 0;
  float xspeed;
  float yspeed;

  void update () {

    //s.x = 0;
    //s.y = 0;
    //s.xspeed = 1;
    //s.yspeed = 1;


    //moving up and down
    if (key == CODED) {
      if (keyCode == UP) {
        yspeed = -1;
        xspeed = 0;
      } else if (keyCode == DOWN) {
        yspeed = 1;
        xspeed = 0;
      }
    }

    //moving left and right
    if (key == CODED) {
      if (keyCode == LEFT) {
        xspeed = -1;
        yspeed = 0;
      } else if (keyCode == RIGHT) {
        xspeed = 1;
        yspeed = 0;
      }
    }

    s.x = s.x + s.xspeed*scl;
    s.y = s.y + s.yspeed*scl;

    if (s.x > width) {
      s.x = 0;
    }
    if (s.y > height) {
      s.y = 0;
    }
    if (s.x < 0 ) {
      s.x = width; 
    }
    if (s.y < 0) {
      s.y = height;
    }
  }

  void display () {
    fill (255);
    rect (s.x, s.y, scl, scl);
  }
  
  void eat (food){
    
  }
}
