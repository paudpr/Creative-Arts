/**
 * This sketch shows how to use the Waveform class to analyze a stream
 * of sound. Change the number of samples to extract and draw a longer/shorter
 * part of the waveform.
 */

import processing.sound.*;

// Declare the sound source and Waveform analyzer variables
SoundFile sample;
Waveform waveform;
Amplitude loudness;


// Define how many samples of the Waveform you want to be able to read at once
int samples = 100;

int graph_width = 640;

public void setup() {
  size(1280, 360);
  background(255);

  // Load and play a soundfile and loop it.
  sample = new SoundFile(this, "beat.aiff");
  sample.loop();

  // Create the Waveform analyzer and connect the playing soundfile to it.
  waveform = new Waveform(this, samples);
  waveform.input(sample);
  
  // Create the amplitude analyzer and connect to soundfile
  loudness = new Amplitude(this);

  // Patch the input to the volume analyzer
  loudness.input(sample);
  
}

public void draw() {
  // Set background color, noFill and stroke style
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();

  // Perform the analysis
  waveform.analyze();
  
  beginShape();
  for(int i = 0; i < samples; i++){
    // Draw current data of the waveform
    // Each sample in the data array is between -1 and +1 
    vertex(
      map(i, 0, samples, 50, graph_width - 50),
      map(waveform.data[i], -1, 1, 50, height - 50)
    );
  }
  endShape();
  
  // Analyze volume and paint it
  float volume = loudness.analyze();
  
  // Display a rectangle depending on volume
  
  float rect_height = map(volume, 0, 1, 0, height);
  
  if (volume > 0.3) background(255);
  
  fill(255, 0, 0);
  rect(0.6 * width, height - rect_height, 0.3 * width, rect_height);
  
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(16);
  text(volume, 0.55 * width, 0.05 * height);

}
