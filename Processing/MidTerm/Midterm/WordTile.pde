
class WordTile extends Word {
  PVector location;    // The top left corner of the tile (x, y)
  float tileW, tileH;  // width and height of the tile
  color tileColor;     // fill color of word
  float tileFS = 24;   // the font size of tile, default is 24
  
  WordTile(String newWord) { 
    super(newWord);
    setSize();
    location = new PVector(0, 0);
    tileColor = color(0);
  } 
  
  void setXY (float x, float y) {
    location.x = x;
    location.y = y;
  } 
  
  void setFontSize() {
    tileFS = map(freq, 1, 210, 10, 150); //(freq, 1, 30, 10, 120)
    setSize();
  } 
  
  void setSize() {
    textSize(tileFS);
    tileW = textWidth(word);
    tileH = textAscent();
  } 
  
  void display() {
    fill(tileColor);
    textSize(tileFS);
    text(word, location.x, location.y);
  } 
  
  boolean intersect(WordTile t2) {
    float left1 = location.x;                 // the first tile's bounding box
    float right1 = location.x+tileW;
    float top1 = location.y-tileH;
    float bot1 = location.y;
    float left2 = t2.location.x;              // the second tile's bounding box
    float right2 = left2+t2.tileW;
    float bot2 = t2.location.y;
    float top2 = bot2-t2.tileH;
    return !(right1 < left2 || left1 > right2 || bot1 < top2 || top1 > bot2);   // testing intersection
  } // intersect()
} 