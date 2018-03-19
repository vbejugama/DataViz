
class Word {
  String word;
  int freq;
  
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
} 