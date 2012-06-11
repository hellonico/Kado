class Renshu {
  public String name;
  String file;
  Card[] cards;
  int state = 0;
  int displayType = DisplayType.HIRAGANA_FIRST;
  
  Renshu(String path) {
    name = new File(path).getName().substring(0, path.indexOf("csv")-1).toUpperCase();
    file = new File(path).getPath();
  }
  
  void setDisplayType(int type) {
     this.displayType = type; 
  }
  
 void loadCards() {
   String[] lines = loadStrings(file);
   cards = new Card[lines.length-1];
   for (int i = 1; i < lines.length; i++) {
     cards[i-1] = new Card(lines[i]);
   }
 }
 
 Card randomCard() {
   state = 0;
   return cards[int(random(cards.length))]; 
 }
 
 void nextView(Card card) {
    if(state == 0) {
      switch(displayType) {
       case DisplayType.HIRAGANA_FIRST:
         card.displayHiragana(); 
         break;
       case DisplayType.KANJI_FIRST:
         card.displayKanji();
         break;
       case DisplayType.KANJI_HIRAGANA:
         card.display();
       default: 
      }
      state ++;  
    } else {
      card.display();
      state ++;
    }
 }
 
}
