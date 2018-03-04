box []boxes;
float thetha = PI/2;
int r = int(random(10,60));
int g = int(random(10,60));
int b = int(random(10,60));
int nBoxes = 100 ;
PVector []boxXY;
int boxL = 100;
int boxH = 100;
int strtX, strtY;

void setup () {
 size(1220,1000);
 smooth();

 boxes = new box[nBoxes];
 
 strtX = 20;
 strtY = 7;
 int k =0;
 for (int j=0; j <9 ; j++) {
   for (int i=0; i < 10; i++) {
     boxes[k] = new box(strtX, strtY, boxL, boxH, 10);
     strtX += boxL+20;
     k += 1;
     println(k);
   }     
  strtX = 20;
  strtY += boxL+10;
 }
}


void draw(){
 background(r,g,5);
 r += int(random(-5,5));
 g += int(random(-5,5));
 b += int(random(-5,5));
 noStroke();
 
 for (int i=0; i < 90; i++) {
   boxes[i].display();
   boxes[i].update();
 }
}