import websockets.*;

WebsocketClient wsc;
String message;
String name;
String time;

void setup(){
  size(200,200);
  
  
  wsc= new WebsocketClient(this, "ws://gentle-plains-13485.herokuapp.com/");
  
}

void draw(){

  name = "Kike";
  time = hour() + ":" + minute() + ":" + second();
  message = name + " - " + time + "\n" + "Mensaje de Kike";
    
}

void webSocketEvent(String msg){
 println(msg);
}

void mousePressed() {
  wsc.sendMessage(message);
}
