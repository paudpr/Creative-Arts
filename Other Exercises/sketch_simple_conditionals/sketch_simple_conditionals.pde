int counter = 0;

void setup(){
  
}

void draw(){
  
  counter = counter + 1;
  
  // "=" means assignment, as in x = 4
  // "==" means question, as in if (x == 4)
  if (counter == 50) {
    println("reached 50");
  }
  if (counter < 50) {
   println("still not 50"); 
}
}
