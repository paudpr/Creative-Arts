// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2012
// Box2DProcessing example

// A fixed boundary class

class Brick {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  
  color colorBrick;
  boolean finished;
  
  // But we also have to make a body for box2d to know about it
  Body b;

  Brick(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    finished = false;
    
    colorMode(HSB);
    colorBrick = color(random(255), 255, 255);

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    
    Vec2 world_pos = box2d.coordPixelsToWorld(x,y);
    bd.position.set(world_pos);
    b = box2d.createBody(bd);
    b.setUserData(this);
    
    // Attached the shape to the body using a Fixture
    b.createFixture(sd,1);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
    fill(colorBrick);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
  
  void delete() {
    finished = true;
  }
  
    // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(b);
  }

  // Is the particle ready for deletion?
  boolean done() {
    if (finished) {
      killBody();
      return true;
    }
    return false;
  }

}
