//Adarsh Kannan, Vivek Bejugama
//Project 5

//PImage Sun = loadImage("sun.jpg");
//PImage Earth= loadImage("earth.jpg");
//PImage Moon = = loadImage("moon.jpg");


//Setup and size of background
  float angleInDegrees = 15;
  PImage Asteroid;
  PImage Asteroid2; 
  float Ast2XCo = 906;
  float Ast2YCo = 35;
  float AstXCo = 82;
  float AstYCo = 55;
  
  
void setup() {
  size(1200, 1200,P3D); 
  Asteroid2 = loadImage("Asteroid2.png");
  Asteroid = loadImage("Asteroid.png");
}

void draw() {
  
  //Black Background and Stars
  background(200);
  stroke(0);
  
  Asteroid2.resize(80,80);
  Asteroid.resize(80,80);
  image(Asteroid2, Ast2XCo, Ast2YCo); 
   Ast2XCo += -4;
   Ast2YCo +=1;

 image(Asteroid, AstXCo, AstYCo); 
   AstXCo += 4;
   AstYCo +=7;
   
  float cx = width/2;
  float cy = height/2;
  
  int aEarth = int(width/2.4) ; // major axis of Earths movememnt 
  int bEarth = int(width/4.5); // minor axis of Earths movememnt 
  
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
  //ellipse(0, 0, sunDia, sunDia);
  sphere(sunDia/1.4); 

  // The earth rotates around the sun
  rotate( radians(angleInDegrees) ); 
  fill(0,191,255);
  int x = (int)( aEarth * cos(t));
  int y = (int)( bEarth * sin(t));
  //ellipse(x, y, sunDia/2, sunDia/2);
  translate(x,y);
  sphere(sunDia/3);
  angleInDegrees += .25;
  
  
  // Moon rotates around the earth

   rotate( radians(angleInDegrees) ); 
   fill(190,190,190);
   int x_m = (int)(aMoon * cos(tMoon));
   int y_m = (int)(bMoon * sin(tMoon));
   translate(x_m,y_m);
   //ellipse(x_m, y_m, sunDia/4, sunDia/4);
   sphere(sunDia/5);
   angleInDegrees += 1;

}