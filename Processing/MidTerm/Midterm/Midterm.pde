

String inputTextFile = "HP1.txt";
WordFreq table;
PFont fnt;    
int N = 500;   
int ReportNum = 1;

void setup() {

  String [] fileContents = loadStrings(inputTextFile);
  String rawText = join(fileContents, " ");
  rawText = rawText.toLowerCase();
  String [] tokens;
  String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!∼";
  
  tokens = splitTokens(rawText, delimiters);
  println(tokens.length+" tokens found in file: "+inputTextFile);

  size(1300, 1000); 
  
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
        background(95,151,175);
        table.barGraph(20);
        break;
  } 
} 


void mouseClicked() {
 if (ReportNum == 2){
   ReportNum = 1;
  }
 else { ReportNum++; } 
}