

String inputTextFile = "HP1.txt";
WordFreq table;
PFont tnr;    
int N = 2;   

void setup() {

  String [] fileContents = loadStrings(inputTextFile);
  String rawText = join(fileContents, " ");
  rawText = rawText.toLowerCase();
  String [] tokens;
  String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!∼";
  
  tokens = splitTokens(rawText, delimiters);
  println(tokens.length+" tokens found in file: "+inputTextFile);

  size(800, 800, OPENGL);
  
  tnr = createFont("Times New Roman", 120);
  textFont(tnr);
  textSize(1);
  noLoop();

  table = new WordFreq(tokens);
  println("Max frequency:"+table.maxFreq());
  table.arrange(N);
} 

void draw() {
  background(255);
  table.display(N);
  table.tabulate(N);
} 


void mouseClicked() {
  table.display(N);
}