int s;
int posXs=2;
float posYs=0;
int posXm=2;
int posYm=0;
float i;

Time[] circles= new Time[60];
Time min= new Time(posXs, posYs, posXm, posYm);


void setup() {
  background(255);
  size(600, 600, P3D);
  ellipseMode(CORNER);


  for (int i=0; i<60; i++) {
    circles[i]= new Time(posXs, posYs, posXm, posYm);
    posXs=posXs+10;
  }
}


void draw() {
  background(255);
  smooth();
  circles[second()].circlesAsSeconds();

  /*if (posXs<600) {
   if ((second())>=s) {
   println("segundo "+second());
   println("posx "+posXs);
   circles[second()].circlesAsSeconds();
   delay(1000);
   
   
   
   s=second();
   }
   }*/

  min.rectAsMinutes();
}


////////


class Time {
  int posXs;
  float posYs;
  int posXm;
  int posYm;

  Time (int posXs, float posYs, int posXm, int posYm) {

    this.posXs=posXs;
    this.posYs=posYs;
    this.posXm=posXm;
    this.posYm=posYm;
  }

  void circlesAsSeconds() {
    //ellipse(posXs, posYs, 6, 6);



    for (int i=0; i<600&&posYs<600; i++) {
      ellipse(posXs, posYs, 6, 6);
      posYs+=0.7;

      println(posYs);
    }
  }

  void rectAsMinutes() {

    translate(width/2, height/2);
    rotateY(i += .0015);
    box(100);
    translate(0, 0);
  }
}
