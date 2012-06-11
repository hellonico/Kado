class Card {
  String kanji;
  String hiragana;
  boolean displayed = false;
  int count = 1;
  
  PFont font = createFont("AppleGothic", 55);
  PFont small = createFont("Verdana", 16);
  
  public Card(String lin) {
    String[] st = split(lin, ",");
    kanji = st[0].replaceAll("\"","");
    hiragana = st[1].replaceAll("\"","");
  }
 
  void displayHint() {
    textFont(font);
    fill(255, 255, 255);
    text(hiragana, 15, 50);
    displayed=false;
  }
 
  void display() {
    textFont(font);
    fill(255, 255, 255);
    text(hiragana, 15, 50);
    fill(0, 102, 153);
    text(kanji, 15, 120);
    
    textFont(small);
    text(count, 15, 180);
    
    displayed = true;
    count++;
  } 
  
}
