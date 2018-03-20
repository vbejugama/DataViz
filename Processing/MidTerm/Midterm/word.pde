
class Word implements Comparable<Word>{
  String word;
  int freq;
  
  // Constructor
  Word(String newWord) {  
    word = newWord;
    freq = 1;
  } 
  
  String getWord() {
    return word;
  } 
  
  int getFreq() {
    return freq;
  } 
  
  void incr() {  
    freq++;
  } 
  
  String toString() {  
    return "<"+word+", "+freq+">";
  } 
  
  public int compareTo(Word w) {
       return freq - w.freq;
  }
  
  int wordLenght(){
   return word.length(); 
  }
} 