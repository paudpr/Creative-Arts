
//different kinds of functions


void setup(){
  size(400,400);
  
}

void draw(){
  //change background color randomly from 0 to established (255)
  //background(random(255));
  
  changeColor();
  fill(0);
  textSize(80);
  text(add(3,5) + sayYo(), 20, 80);
  
}

//add a void for whole function and then just reference it in the v.draw
void changeColor(){
  background(random(255));
}

//text referenced function
String sayYo(){
  return "Yo!";
}

//function the has other functions
int add(int a, int b){
  return a+b;
}

//two diffferent things can be named the same, depending on the arguments that deffine it
