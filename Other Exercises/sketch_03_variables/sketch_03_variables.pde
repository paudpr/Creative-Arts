
//type name assignment
int counter = 0;
void setup () {
  size(500, 500);
}

void draw () {
  //so the loop erases the last moved ellipse
  background(200);
  
  //same as counter++
  counter = counter + 1;
  ellipse(counter, 100, 50, 50); 
  println(counter);
  
  //using counter as a way of moving because translate would make anything we add later move too
  //otherwise use translate(counter, 0)
  //also can rotate
  rotate(0.5);
  rect(10, 200, 40, 40);
  
  //memememememe (will recover the coordinate system)
  popMatrix();
  
}
