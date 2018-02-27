// Week 6 By Vivek Bejugama and Adarsh Kannan


float[] month, date, year, openPrice, dayHigh, dayLow, closePrice, dayVol;
float minPrice, maxPrice, maxDate, minDate;
float X1, Y1, X2, Y2;

void setup() {
  size(1000, 800);
  background(110,110,170);
  
  X1 = 55; 
  Y1 = 55;
  X2 = width - 15;
  Y2 = height - Y1;

  rectMode(CORNERS);
  noStroke();
  fill(255);
  rect(X1, Y1, X2, Y2);
  
  smooth();
  
  // Read Datset
  String[] rows = loadStrings("BTC-USD.csv");
  
  date = new float[rows.length];
  openPrice = new float[rows.length];
  dayHigh = new float[rows.length];
  dayLow = new float[rows.length]; 
  closePrice = new float[rows.length];
  dayVol = new float[rows.length];
  
  // Parse the needed data
  for (int i=0; i<rows.length; i++) {
    // Split fields from each line with delimitor ','
    String[] fields = split(rows[i], ",");

    //month[i] = float(fields[0]);
    //date[i] = float(fields[1]);
    //year[i] = float(fields[2]);
    openPrice[i] = float(fields[3]);
    dayHigh[i] = float(fields[4]);
    dayLow[i] = float(fields[5]);
    closePrice[i] = float(fields[6]);
    dayVol[i] = float(fields[7]);
  }
  
  println("Data Loaded: "+closePrice.length+" entries.");

  minPrice = min(closePrice);
  maxPrice = max(closePrice);
  println("Min: "+minPrice);
  println("Max: "+maxPrice);
  
  fill(255);
  textSize(18);
  textAlign(LEFT);
  text("Price of Bitcoin - 2017 to 2018", X1, Y1 - 10);
  textSize(10);
  textAlign(RIGHT, BOTTOM);
  text("Source: Yahoo! Finance (finance.yahoo.com)", width-10, height-10);
   
  drwGrph(closePrice, minPrice, maxPrice);
  
  // axis labels
  drawXLabels();
  drawYLabels();
  
  movingAverage(closePrice, minPrice, maxPrice,30);
  movingAverage2(closePrice, minPrice, maxPrice,60);
} 

void drwGrph(float[] data, float yMin, float yMax) {
 stroke(0);
 
 beginShape();
  for (int i=0; i < data.length; i++) {
    float x = map(i, 0, data.length-1, X1, X2);
    float y = map(data[i], yMin, yMax, Y2, Y1);
    curveVertex(x, y);
  }
  endShape();
} 

void drawYLabels () {
  fill(255);
  textSize(10);
  textAlign(RIGHT);
  stroke(255);
  for (float i=minPrice; i <= maxPrice; i += 1500) {
    float y = map(i, minPrice, maxPrice, Y2, Y1);
    text(floor(i), X1-10, y);
    line(X1, y, X1-5, y);
  }
  textSize(18);
  text("$", X1-40, height/2);
} 

void drawXLabels() {
  fill(255);
  textSize(10);
  textAlign(BOTTOM);
  stroke(255);
  
  for (int i=0; i <= 14; i += 1) {
    float x = map(i, 0, 14, X1, X2);
    text(date[i], x , Y2+15 );
    //line(x, Y2-, x, x);
  }
  textSize(18);
  text("Month", Y2-10, width/2);
}


void movingAverage(float[] data, float yMin, float yMax, int MAP) {
  noFill();
  stroke(255, 0, 0);
  strokeWeight(2);
  beginShape();
  for (int i=MAP-1; i < data.length; i++) {
    float sum = 0;
    for (int k=i-(MAP-1); k <= i; k++) {
      sum += data[k];
    }
    float MA = sum/MAP;
    float x = map(i, 0, data.length-1, X1, X2);
    float y = map(MA, yMin, yMax, Y2, Y1);
    vertex(x, y);
  }
  endShape();
}

void movingAverage2(float[] data, float yMin, float yMax, int MAP) {
  noFill();
  stroke(255, 100, 0);
  strokeWeight(2);
  beginShape();
  for (int i=MAP-1; i < data.length; i++) {
    float sum = 0;
    for (int k=i-(MAP-1); k <= i; k++) {
      sum += data[k];
    }
    float MA = sum/MAP;
    float x = map(i, 0, data.length-1, X1, X2);
    float y = map(MA, yMin, yMax, Y2, Y1);
    vertex(x, y);
  }
  endShape();
}