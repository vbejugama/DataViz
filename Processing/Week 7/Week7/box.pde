
class box {
  
  float x, y, w, h;  
  int nBalls;        
  int ballRadius = 12;
  
  ball [] balls;   
  
  box(float x, float y, float w, float h, int n) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.nBalls = n;

    balls = new ball[nBalls];
    
    for (int i=0; i < balls.length; i++) {
      balls[i] = new ball(random(w), random(h), random(2,13), color(random(255),random(255),random(255)),this);
    }
  } 
  
  void display() {
      // draw box
      pushMatrix();
      translate(x, y);
      stroke(0);
      fill(random(100,130),random(150,170),random(200,250));
      rect(0, 0, w, h);

      for (int i=0; i < balls.length; i++) {
        balls[i].display();
      }
      popMatrix();
    } 
    
  void update() {
      for (int i=0; i < balls.length; i++) {
        balls[i].move();
      }
    } 
} 