//Adarsh Kannan, Vivek Bejugama
//Project 5

//PImage Sun = loadImage("sun.jpg");
//PImage Earth= loadImage("earth.jpg");
//PImage Moon = = loadImage("moon.jpg");


//Setup and size of background
void setup() {
  size(1000, 1000); 
}

void draw() {
  
  //Black Background and Stars
  background(0);
  stroke(0);
  float cx = width/2;
  float cy = height/2;
  
  int aEarth = width/3 ; // major axis of Earths movememnt 
  int bEarth = width/6; // minor axis of Earths movememnt 
  
  int aMoon = 40 ; // major axis of Earths movememnt 
  int bMoon = 100; // minor axis of Earths movememnt 
  
  float t = millis()/1000.0f;
  float tMoon = millis()/300.0f;
  
  fill(255,255,255);
  ellipse(random(width), random(height), 10,5); 
  fill(250,32,2);
  ellipse(random(width), random(height), 5,5); 
  fill(32, 250, 2);
  ellipse(random(width), random(height), 5,10);
  
  fill(255, 140, 0);
  ellipse(cx, cy, 100, 100);

  // The earth rotates around the sun
  fill(0,191,255);
  int x = (int)(cx + aEarth * cos(t));
  int y = (int)(cy + bEarth * sin(t));
  ellipse(x, y, 44.6, 44.6);
  
  // Moon rotates around the earth
  fill(190,190,190);
  int x_m = (int)(x + aMoon * cos(tMoon));
  int y_m = (int)(y + bMoon * sin(tMoon));
  ellipse(x_m, y_m, 20, 20);

}