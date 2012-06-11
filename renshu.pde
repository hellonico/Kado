class Renshu {
  public String name;
  String file;
  Card[] cards;
  
  Renshu(String path) {
    name = new File(path).getName().substring(0, path.indexOf("csv")-1).toUpperCase();
    file = new File(path).getPath();
  }
  
 void loadCards() {
   String[] lines = loadStrings(file);
   cards = new Card[lines.length-1];
   for (int i = 1; i < lines.length; i++) {
     cards[i-1] = new Card(lines[i]);
   }
 }
 
 Card randomCard() {
    return cards[int(random(cards.length))]; 
 }
 
}
