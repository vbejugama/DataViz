//Adarsh Kannan, Preeti Swaminathan
//Project 4

// Angle of rotation around sun and planets
float theta = 0;
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
  fill(255,255,255);
  ellipse(random(width), random(height), 5,5); 
  fill(250,32,2);
  ellipse(random(width), random(height), 5,5); 
  fill(32, 250, 2);
   ellipse(random(width), random(height), 5,5);
  

  //Translate the sun to the center of the picture
  translate(width/2, height/2);
  fill(255, 140, 0);
  ellipse(0, 0, 100, 100);

  // The earth rotates around the sun
  
  //pushMatrix is used to save prior coordinates in the stack and generates new coordinates as well. 
  pushMatrix();
  rotate(theta);
  translate(200, 0);
  fill(0,191,255);
  ellipse(0, 0, 44.6, 44.6);
  

  // Moon rotates around the earth

  pushMatrix(); 
  rotate(theta/29);
  translate(36, 0);
  fill(190,190,190);
  ellipse(0, 0, 20, 20);
  popMatrix();


  popMatrix();
  //increases angle
  theta += 0.01;
}