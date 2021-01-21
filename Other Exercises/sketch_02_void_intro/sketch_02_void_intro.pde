
//to write a function; void + name of function + variables inbetween () + {function}
void setup() {
  //whatever is written here will be executed just once
  //it will be at the beggining
  size(500, 500);
}

void draw() {
  //whatever is written here will be executed all the time after setup
line(0, 0, 100, 100);
//there are different internal values to be found; mouseX and mouseY
line(0, 0, mouseX, mouseY);
 //frameRate to measure the speed
println(frameRate);
}
