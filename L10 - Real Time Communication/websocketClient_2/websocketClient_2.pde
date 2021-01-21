import websockets.*;

WebsocketClient wsc;
ArrayList<String> received;
String message;
String name;
String time;

void setup(){
  size(640,480);
  frameRate(30);
  
  received = new ArrayList<String>();
  
  wsc= new WebsocketClient(this, "ws://gentle-plains-13485.herokuapp.com/");
  
  message = "Hello Websockets!";
}

void draw(){

  background(0);
  name = "Kike";
  time = hour() + ":" + minute() + ":" + second();
  message = name + " - " + time + "\n" + "Mensaje de Kike";
  textAlign(CENTER, CENTER);
  
  for (int i = 0; i < received.size(); i++) {
    text(received.get(i), 0.5*width, 0.5*height - i * 20);
  }
    
}

void webSocketEvent(String msg){
 println(msg);
 received.add(msg);
}

void mousePressed() {
  wsc.sendMessage(message);
}
