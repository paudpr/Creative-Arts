String txt = "sensor:";
int sec;
PFont font1;

void setup(){
  size(400,400);
  font1 = loadFont (".HelveticaNeueDeskInterface-MediumP4-30.vlw");
  
}

void draw(){
  textSize(30);
  text ("hola caracola", 30,60); //these parameters are ("text", x origin point, y origin point)
  fill (0);
  
  //to create a text that changes in relation to a function
  background(200);
  sec= second();
  textFont (font1, 30);
  text(txt + sec, 60, 120);

//backslash n means change of line in text

//how to change font; fonts have to be rasterized
     //herramientas, crear fuente, select the font and the size. 
     //this creates a font inside the sketch folder (inside data folder) in format .vlw
     //add on the top PFont font; 
     //in the setup load the font (font1= loadFont("name of the font");)
     //in the draw textFont (font1, size of the font in pixels);
     
}
