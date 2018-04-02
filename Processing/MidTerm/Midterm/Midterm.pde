// ********** Midterm *********** 
// Team Members
// Vivek Bejugama
// Adarsh Kannan

String inputTextFile = "HP1.txt";
String inputTextFile2 = "HP2.txt";
WordFreq table,table2;
PFont fnt;    
int N = 500;   
int ReportNum = 1;

void setup() {
  size(1300, 1000); 
  fnt = createFont("Georgia",1);
  textFont(fnt);
  //noLoop();
  String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!∼";
  
  String [] fileContents = loadStrings(inputTextFile);
  String rawText = join(fileContents, " ");
  rawText = rawText.toLowerCase();
  String [] tokens;
  tokens = splitTokens(rawText, delimiters);
  println(tokens.length+" tokens found in file: "+inputTextFile);
  
  table = new WordFreq(tokens);
  println("Max frequency:"+table.maxFreq());
  table.arrange(N);
  
  String [] fileContents2 = loadStrings(inputTextFile2);
  String rawText2 = join(fileContents2, " ");
  rawText2 = rawText2.toLowerCase();
  String [] tokens2;
  
  tokens2 = splitTokens(rawText2, delimiters);
  println(tokens2.length+" tokens found in file: "+inputTextFile2);
  
  table2 = new WordFreq(tokens2);
  println("Max frequency:"+table2.maxFreq());
  table2.arrange(N);
} 

void draw() {
  switch(ReportNum) {
    case 1:  //Report 1
        background(95,111,175);
        table.display(N);
        //table.interact(mouseX,mouseY);
        break;
    case 2:  // Report 2
        background(95,151,175);
        table.barGraph(20);
        break;
    case 3:  //Report 3
        background(95,111,175);
        table2.display(N);
        //table.interact(mouseX,mouseY);
        break;
    case 4:  // Report 4
        background(95,151,175);
        table2.barGraph(20);
        break;
  } 
} 


void mouseClicked() {
 if (ReportNum == 4){
   ReportNum = 1;
  }
 else { ReportNum++; } 
}