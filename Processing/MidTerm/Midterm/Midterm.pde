

String inputTextFile = "HP1.txt";
WordFreq table;
PFont fnt;    
int N = 470;   
int ReportNum = 1;

void setup() {

  String [] fileContents = loadStrings(inputTextFile);
  String rawText = join(fileContents, " ");
  rawText = rawText.toLowerCase();
  String [] tokens;
  String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!∼";
  
  tokens = splitTokens(rawText, delimiters);
  println(tokens.length+" tokens found in file: "+inputTextFile);

  size(1300, 1000); //(1000, 900, OPENGL)
  
  fnt = createFont("Georgia",1);
  textFont(fnt);
  //noLoop();

  table = new WordFreq(tokens);
  println("Max frequency:"+table.maxFreq());
  table.arrange(N);
  
} 

void draw() {
  switch(ReportNum) {
    case 1:  //Report 1
        background(95,111,175);
        table.display(N);
        break;
    case 2:  // Report 2
        background(255);
        table.barGraph();
        break;
    case 3:  // Report 3
        background(255);
        break;
  }
} 


void mouseClicked() {
 if (ReportNum == 3){
   ReportNum = 1;
  }
 else { ReportNum++; } 
}