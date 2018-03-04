// Define the ball class
class ball {   
  
// Attributes
  PVector location;       
  color ballColor;  
  float radius; 
  PVector speed;

  box b;

  //float gravity = 1;
  //float damp = .65 ;
  //float fric = .84;

// Default Constructor
  ball(box b) {
    this(random(width), random(0,height/6),25 ,color(155, 180, 150), b);
  } 
  
// Constructor 1
  ball(float _x, float _y, float _radius, color c, box _b ) {
    location = new PVector(_x,_y);
    radius = _radius;
    ballColor = c;
    speed = new PVector(random(0.3,2.5),random(0.3,2.5));
    b = _b;
  }
  
/*/ Constructor 2
  ball(float r, color c){
    location.x = random(width);
    location.y = random(height);
    radius = r;
    ballColor = c;
  }
*/

// Methods
  void display() {
    fill(ballColor);
    ellipse(location.x, location.y, 2*radius, 2*radius);
  }
  
  void move(){
    location.add(speed);
  //  speed.y += gravity ;
    
    bounce();
  }
  
  void bounce(){
    if (location.x > (b.w - radius)) {
      location.x = b.w-radius;
      speed.x *= -1;
    }
    if ( location.x < radius){
      location.x = radius;
      speed.x *= -1;
    }
    if ( location.y > (b.h - radius)) {
      location.y = b.h - radius;
      speed.y *= -1;
    //  speed.y *= damp;
    //  speed.x *= fric;
    }
    if (location.y < radius){
      location.y = radius;
      speed.y *= -1;
    }
  }
} 