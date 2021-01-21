/*
 * Example inspired by the earlier tutorial by blprnt
 * See http://twitter4j.org/javadoc/ for the in-depth
 * documentation about the many thing you can do with
 * the twitter4j library
 */
import gohai.simpletweet.*;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.TwitterException;
import twitter4j.User;

SimpleTweet simpletweet;
ArrayList<Status> tweets;

int r, g, b;

void setup() {
  size(500, 500);
  frameRate(0.5);
  simpletweet = new SimpleTweet(this);

  /*
   * Create a new Twitter app on https://apps.twitter.com/
   * then go to the tab "Keys and Access Tokens"
   * copy the consumer key and secret and fill the values in below
   * click the button to generate the access tokens for your account
   * copy and paste those values as well below
   */
  simpletweet.setOAuthConsumerKey("v12TnKki20oJ3YOFCbQeA");
  simpletweet.setOAuthConsumerSecret("Vy1lotZogW6pErrlXuZaWCWWqNeRLesz5bcD2druqiA");
  simpletweet.setOAuthAccessToken("14078613-xKZkGxkda8UCe5KfM3WofSjGNh6L53dOju13Q6xEv");
  simpletweet.setOAuthAccessTokenSecret("RtxhkgR6lLW3opNzPAVynXwbmb4fcwijzZJvL4Py1y0qa");

  tweets = search("#rgb_light_ied");
  
  r = 0;
  g = 255;
  b = 0;
}

void draw() {
  
  if (frameCount % 20 == 0) {
    println("Fetching Data from Twitter...");
    tweets = search("#rgb_light_ied");
    println("Done...");

  }
  
  background(r, g, b);

  
  if (tweets.size() > 0) {
  Status lastTweet = tweets.get(0);
  
  String message = lastTweet.getText();
  
  println(message);
  
  // PUT NEW VALUES TO RGB
  // r = 0;
  // g = 255;
  // b = 0;
    
  User user = lastTweet.getUser();
  PImage userPicture = loadImage(user.getProfileImageURL() );
  image(userPicture, 0, 0);
  String username = user.getScreenName();
  text(message + "by @" + username, 0, 80, width, height);
  }
}


ArrayList<Status> search(String keyword) {
  // request 100 results
  Query query = new Query(keyword);
  query.setCount(100);

  try {
    QueryResult result = simpletweet.twitter.search(query);
    ArrayList<Status> tweets = (ArrayList)result.getTweets();
    // return an ArrayList of Status objects
 	return tweets;
  } catch (TwitterException e) {
    println(e.getMessage());
    return new ArrayList<Status>();
  }
}
