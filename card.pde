

class Card {
  String kanji;
  String hiragana;
  int count = 1;
  
  PFont font = createFont("Gothic", 35);
 // loadFont("mika.otf");  //createFont("AppleGothic", 50);
  PFont small = createFont("Verdana", 16);
  
  public Card(String lin) {
    String[] st = split(lin, ",");
    kanji = st[0].replaceAll("\"","");
    hiragana = st[1].replaceAll("\"","");
  }
  
  void displayBG() {
    if(count ==1) {
      background(0);  
    } else {
      background(loadImage("black.png"));
    }
  }
 
  void displayHiragana() {
    displayBG();
    textFont(font);
    fill(255, 255, 255);
    
    text(hiragana, 15, 100);
  }
  
  void displayKanji() {
    displayBG();
    textFont(font);
    fill(0, 150, 200);
    
    text(kanji, 15, 170);
  }
 
  void display() {
    displayBG();
    
    textFont(font);
    
    fill(255, 255, 255);
    text(hiragana, 15, 100);
    
    fill(0, 150, 200);
    text(kanji, 15, 170);
    
    textFont(small);
    
    text(count, 15, 300);
    
    count++;
  } 
  
}
