// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Box2DProcessing example

// A rectangular box
class Ball {

  // We need to keep track of a Body and a width and height
  Body body;
  float d;

  // Constructor
  Ball(float x, float y) {
    d = 20;
    // Add the box to the box2d world
    makeBody(new Vec2(x, y), d);
  }

  // Method for kick-off and start game
  void kickoff() {
    
    Vec2 pos = body.getWorldCenter();
    Vec2 force_pixels = new Vec2(random(-50000, 50000), -50000);
    Vec2 force = box2d.coordPixelsToWorld(force_pixels);
    // Calling the Body's applyForce() function
    body.applyForce(force, pos);

  }
  
  // Method to move my ball before kick-off
  void move(float x, float y) {
    Vec2 pos = body.getWorldCenter();
    Vec2 target = box2d.coordPixelsToWorld(x, y);
    
    target.y = pos.y;
    
    // A vector pointing from the body position to the Mouse
    Vec2 v = target.sub(pos);
    v.mulLocal(5);
    body.setLinearVelocity(v);
  }
  
  
  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+d) {
      killBody();
      return true;
    }
    return false;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    rectMode(CENTER);
    colorMode(RGB);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    ellipse(0, 0, 0.5 * d, 0.5 * d);
    line(0, 0, 0.25 * d, 0);
    popMatrix();
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float d_) {

    // Define a polygon (this is what we use for a rectangle)
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(0.5 * d_);
    
    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0;
    fd.restitution = 1.0;

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(0, 0));
    body.setAngularVelocity(0);
    
    body.setUserData(this);
  }
}
