class WordFreq {
  ArrayList<WordTile> wordFrequency;
  String [] stopWords = loadStrings("StopWords.txt");
  
  // Constructor
  WordFreq(String[] tokens) {  
    wordFrequency = new ArrayList();

    for (String t : tokens) {
      if (!_isStopWord(t)) {
        // See if token t is already a known word
        int index = _search(t, wordFrequency);
        if (index >= 0) {
          (wordFrequency.get(index)).incr();
        }
        else {
          wordFrequency.add(new WordTile(t));
        }
      }
    } 
   println("There are "+N()+" unique entries.");
   _sort(wordFrequency);
  } 
  
  
  void arrange(int N) {  
    WordTile tile;
    for (int i=0; i < N; i++) {
        tile = wordFrequency.get(i);    // the tile to be placed
        tile.setFontSize();
        do {  // find a random x, y for tile, i
          float x = random(width-tile.tileW);
          float y = random(tile.tileH, height);
          tile.setXY(x, y);
        } // until the tile is clear of all other tiles
        while (!clear(i));
    }
  } 
  
  void display(int N) {
    for (int i=0; i < N; i++) {
      WordTile tile = wordFrequency.get(i);
      if ( tile.freq > 5 ) {
        tile.display();
       // println(wordFrequency.get(i));
      }
    }
  }  
  
  int N() { 
      return wordFrequency.size();
  } 
  
  String[] samples() {  
      String [] k = new String[N()];
      int i=0;
      for (WordTile w : wordFrequency) {
         k[i++] = w.getWord();
        }
        return k;
      } 
    
  int[] counts() {  
      int [] v = new int[N()];
      int i=0;
      for (WordTile w : wordFrequency) {
        v[i++] = w.getFreq();
      }
      return v;
    } 
    
   int maxFreq() {  // The max frequency
      return max(counts());
    } 
    
   int _search(String w, ArrayList<WordTile> L) {
      for (int i=0; i < L.size(); i++) {
        if (L.get(i).getWord().equals(w))
          return i;
        }
      return -1;
    }
    
   boolean _isStopWord(String word) {  
     for (String stopWord : stopWords) {
        if (word.equals(stopWord)) {
          return true;
        }
      }
      return false;
    } 
    
    String toString() {  
      return "Word Frequency Table with"+N()+" entries.";
    } 
    
    boolean clear(int n) { 
      WordTile tile1 = wordFrequency.get(n);
      for (int i=0; i < n; i++) {
        WordTile tile2 = wordFrequency.get(i);
        if (tile1.intersect(tile2)) {
          return false;
        }
      } 
      return true;
    }
    
    void barGraph(int n){
      for (int i=0; i < n; i++) {
        WordTile tile = wordFrequency.get(i);
        fill(124,23,54);
        rect (i*60+50, height-100-map(tile.getFreq(),5,210,10,height*.5), 40, map(tile.getFreq(),5,210,10,height*.5)-30);
        
        fill(255);
        textSize(15);
        textAlign(BOTTOM);
        stroke(255);
        
        text(tile.getWord(), i*60+50 , height - 60 );
       }
    }
    
    void scatterPlort(){  
    }
      
    void _sort(ArrayList<WordTile> A) {
      for (int i=0; i < A.size(); i++) {
        WordTile a = A.get(i);     
        int pos = i;
        while ((pos > 0) && (a.compareTo(A.get(pos-1))>=1)) {
          A.set(pos, A.get(pos-1));
          pos--;
        } 
        A.set(pos, a);
      }
    }   
} 