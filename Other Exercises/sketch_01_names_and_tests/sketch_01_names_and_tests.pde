//changing the canvas size from the original 100x100pixel
//changing the grosor of the line
size(400,400);
strokeWeight(3);

//change background color
background(0, 70, 0);

//   x1  y1   x2   y2
line(10, 100, 10,  10);
line(10, 10,  50,  10);
line(50, 10,  50,  50);
line(50, 50,  10,  50);

//changing color with RGB system
stroke(250, 0, 0);
//   x1    y1   x2   y2
line(110, 100, 110,  10);
line(110, 10,  150,  10);
line(150, 10,  150,  50);
line(150, 50,  110,  50);

//adding transparency as a 4th coordinate on the color change
//translate to move everything
translate(0, 100);
stroke(250, 0, 0, 100);
//   x1    y1   x2   y2
line(110, 100, 110,  10);
line(110, 10,  150,  10);
line(150, 10,  150,  50);
line(150, 50,  110,  50);

//drawing ellipse 
//translate again so the previous doesnt affect the origin of the ellipse
translate(0, -100);
ellipse(200, 200, 200, 50);

//filling with color
fill(50);
ellipse(200, 200, 50, 50);
