

String inputTextFile = "HP1.txt";
WordFreq table;
PFont fnt;    
int N = 11;   

void setup() {

  String [] fileContents = loadStrings(inputTextFile);
  String rawText = join(fileContents, " ");
  rawText = rawText.toLowerCase();
  String [] tokens;
  String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!∼";
  
  tokens = splitTokens(rawText, delimiters);
  println(tokens.length+" tokens found in file: "+inputTextFile);

  size(1000, 900); //(1000, 900, OPENGL)
  
  fnt = createFont("Georgia",1);
  textFont(fnt);
  noLoop();

  table = new WordFreq(tokens);
  println("Max frequency:"+table.maxFreq());
  table.arrange(N);
} 

void draw() {
  background(95,111,175);
  table.display(N);
  table.tabulate(N);
  
} 