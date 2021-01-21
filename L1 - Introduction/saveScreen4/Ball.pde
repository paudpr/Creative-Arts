/*

 DIGITAL FABRICATION FOR INTERACTION 19/20
 
 MODULE: Visual Arts
 
 DATE: 6/3/2020
 
 */



// Defining a Ball class to define ball objects
class Ball { 

  float centerX;
  float centerY;  
  float diameter;
  float speedX;
  float speedY;
  color ballcolor;
  SoundFile audio_attribute;      // We store a reference to audio object.

  // Here the constructor receives a reference to the audio object as a parameter from main sketch
  Ball (SoundFile audio) { 

    centerX = 0.5 * width;
    centerY = 0.5 * height;

    diameter = random(10, 200);

    speedX = random(-10, 10);
    speedY = random(-10, 10);

    colorMode(HSB);
    ballcolor = color(random(0, 255), 255, 255);

    audio_attribute = audio;
  } 

  // Update method, all calculations belong here
  // If a collision with a border is detected:
  // 1) Change ball color
  // 2) Play a sound
  void update() { 

    // Check horizontal borders
    if ((centerX > width - 0.5 * diameter) || (centerX < 0.5 * diameter)) {
      speedX *= -1;
      ballcolor = color(random(0, 255), 255, 255);
      audio_attribute.play();
    }

    // Check vertical borders
    if ((centerY > height - 0.5 * diameter) || (centerY < 0.5 * diameter)) {
      speedY *= -1;
      ballcolor = color(random(0, 255), 255, 255);
      audio_attribute.play();
    }  

    centerX += speedX;
    centerY += speedY;
  }

  // Display method, all drawings are contained here
  void display() {

    fill(ballcolor);
    noStroke();
    ellipse(centerX, centerY, diameter, diameter);
  }
}  
