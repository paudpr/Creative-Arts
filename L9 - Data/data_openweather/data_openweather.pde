void setup() {
  size(200, 200);
  
  // http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=8eca2cd5a4c72157f4a65930187ff45d 
  
  String apiKey = "8eca2cd5a4c72157f4a65930187ff45d";
  String url = "http://api.openweathermap.org/data/2.5/weather";
  String query = "?q=Madrid";

  // Make the API query
  // Here, I format the call to the API by joing the URL with the API key with the query string.
  //api.openweathermap.org/data/2.5/weather?q={city name}&appid={your api key}
  //JSONObject json = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?q=Madrid&APPID=8eca2cd5a4c72157f4a65930187ff45d");
  JSONObject json = loadJSONObject(url+query+"&APPID="+apiKey);
  
  float temp = json.getJSONObject("main").getFloat("temp");
  background(255);
  fill(0);
  text(str(temp), 10, 10, 180, 190);
}
