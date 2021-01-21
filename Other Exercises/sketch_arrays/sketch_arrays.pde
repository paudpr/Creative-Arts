//array 
//[] indicate tha's an array
//arays have index 0 (empieza a contar desde 0, 1, 2, n)
int X [] = {9, 5, 7, 2, 4};
float Y [] = new float [10];
float Z [] = new float [10];

void setup() {
  println( X[0] );
  for(int i = 0 ; i < 10; i = i + 1){
    Y[i] =random (0, width);
    Z[i]=random (0,height);
  }
}



void draw() {
  for(int i = 0 ; i < 10; i = i + 1){
    ellipse (Y[i], Z[i], 50, 50);
    
}
}
