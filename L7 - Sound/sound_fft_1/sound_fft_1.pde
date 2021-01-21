import processing.sound.*;

AudioIn input;
FFT fft;

// Define how many FFT bands to use (this needs to be a power of two)
int bands = 128;

// Define a smoothing factor which determines how much the spectrums of consecutive
// points in time should be combined to create a smoother visualisation of the spectrum.
// A smoothing factor of 1.0 means no smoothing (only the data from the newest analysis
// is rendered), decrease the factor down towards 0.0 to have the visualisation update
// more slowly, which is easier on the eye.
float smoothingFactor = 0.2;

// Create a vector to store the smoothed spectrum data in
float[] sum = new float[bands];

// Variables for drawing the spectrum:
// Declare a scaling factor for adjusting the height of the rectangles
int scale = 1000;
// Declare a drawing variable for calculating the width of the 
float barWidth;

void setup() {
  size(640, 360, P3D);
  background(255);

  // Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);

  // Begin capturing the audio input
  input.start();
  
  // start() activates audio capture so that you can use it as
  // the input to live sound analysis, but it does NOT cause the
  // captured audio to be played back to you. if you also want the
  // microphone input to be played back to you, call
  //    input.play();
  // instead (be careful with your speaker volume, you might produce
  // painful audio feedback. best to first try it out wearing headphones!)
  
  // Calculate the width of the rects depending on how many bands we have
  barWidth = width/float(bands);

  // Create the FFT analyzer and connect the playing soundfile to it.
  fft = new FFT(this, bands);
  fft.input(input);
}

void draw() {

  background(0);
  noStroke();
  noFill();
  
  // Perform the analysis
  fft.analyze();

    for (int i = 0; i < bands; i++) {
      // Smooth the FFT spectrum data by smoothing factor
      sum[i] += (fft.spectrum[i] - sum[i]) * smoothingFactor;
    }

  
    for (int i = 0; i < bands-1; i++) {
      float z = -50;
      float x = map(i, 0, bands, 0, width);
      float y = sum[i]*scale;
      pushMatrix();
      translate(x, height - 0.5 * y, z);
      stroke(255);
      strokeWeight(1);
      box(5, y, 5);
      popMatrix();
    }
 
}
