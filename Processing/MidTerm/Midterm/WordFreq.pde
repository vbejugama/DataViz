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
  } 
  
  void tabulate(int n) {  
    //int n = wordFrequency.size();
    
    println("There are "+N()+" entries.");
    for (int i=0; i < n; i++) {
      println(wordFrequency.get(i));
    }
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
      tile.display();
    }
  }  
  
  int N() { 
      return wordFrequency.size();
  } 
  
  String[] samples() {  // Returns all the words
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
    
    boolean clear(int n) { // Is tile, i clear of tiles 0..i-1?
      WordTile tile1 = wordFrequency.get(n);
      for (int i=0; i < n; i++) {
        WordTile tile2 = wordFrequency.get(i);
        if (tile1.intersect(tile2)) {
          return false;
        }
      } 
      return true;
    } // clear()
} 