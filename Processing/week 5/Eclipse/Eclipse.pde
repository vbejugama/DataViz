//Adarsh Kannan, Vivek Bejugama
//Project 5

//PImage Sun = loadImage("sun.jpg");
//PImage Earth= loadImage("earth.jpg");
//PImage Moon = = loadImage("moon.jpg");


//Setup and size of background

  float angleInDegrees = 15;
  
  
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
  
  int aMoon = aEarth/8 ; // major axis of Earths movememnt 
  int bMoon = bEarth/2 ; // minor axis of Earths movememnt 
  
  // Parameter for Speed for earth and moon, 
  float t = millis()/2500.0f;
  float tMoon = t*15;
  
  float sunDia = width/14;
  
  fill(255,255,255);
  ellipse(random(width), random(height), 10,5); 
  fill(250,32,2);
  ellipse(random(width), random(height), 5,5); 
  fill(32, 250, 2);
  ellipse(random(width), random(height), 5,10);
  
  translate(cx,cy);

  // Sun 
  fill(255, 140, 0);
  ellipse(0, 0, sunDia, sunDia);  

  // The earth rotates around the sun
  rotate( radians(angleInDegrees) ); 
  fill(0,191,255);
  int x = (int)( aEarth * cos(t));
  int y = (int)( bEarth * sin(t));
  ellipse(x, y, sunDia/2, sunDia/2);
  angleInDegrees += .25;
  
  
  // Moon rotates around the earth
   translate(x,y);
   rotate( radians(angleInDegrees) ); 
   fill(190,190,190);
   int x_m = (int)(aMoon * cos(tMoon));
   int y_m = (int)(bMoon * sin(tMoon));
   ellipse(x_m, y_m, sunDia/4, sunDia/4);
   angleInDegrees += 1;

}