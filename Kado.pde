import apwidgets.*;

APWidgetContainer widgetContainer; 
APCheckBox checkBox;

Card[] cards;
Renshu[] renshuus;

boolean renshuStarted = false;
boolean modeDisplayAll = false;
int displayType = DisplayType.HIRAGANA_FIRST;
Renshu currentRenshu;  
Card currentCard;

void loadRenshuFiles(File baseDir) {
  java.io.FilenameFilter filter = new java.io.FilenameFilter() {
     public boolean accept(File dir, String name) {
       return name.endsWith(".csv");
     } 
  };
  
  String[] files = null;
  try {
     files = baseDir.list(filter);
     renshuus = new Renshu[files.length];
  } catch(java.lang.NullPointerException e) {
     // we are on android, retrieve the list from a text file
     files = loadStrings("list.txt");
     renshuus = new Renshu[files.length];
  }
  
  for(int i = 0; i< files.length;i++)
    renshuus[i] = new Renshu(files[i]); 
}

void setup() {
  loadRenshuFiles(dataFile(".").getParentFile());
  size(500, 400);
//  widgetContainer = new APWidgetContainer(this);
  noLoop();
}

void draw() {
  if(!renshuStarted) {
    background(0);
    fill(255);
    textFont( createFont("AppleGothic", 30) );
    for(int i = 0 ; i<renshuus.length; i++) {
      text(renshuus[i].name, 15, 50+i*40);
    }
//    checkBox = new APCheckBox(10, 200, "Kanji First");
//    widgetContainer.addWidget(checkBox);
  } else {    
    
  }
//  if(checkBox.isChecked()) {
//      displayType = 1;
//      currentRenshu.setDisplayType(displayType);
//  }
}

void updateDisplayType() {
  displayType++;
  if(displayType > 1) {
     displayType = 0; 
  }  
  currentRenshu.setDisplayType(displayType);
}

void startRenshu(int index) {
   currentRenshu = renshuus[index];
   println("Starting "+currentRenshu.name);
   currentRenshu.loadCards();
   currentRenshu.setDisplayType(displayType);
   renshuStarted = true;
   changeCard();
}                                     

void changeCard() {
    background(0);
    currentCard = currentRenshu.randomCard();
    currentRenshu.nextView(currentCard); 
    redraw(); 
}

void mousePressed() {
  if(!renshuStarted) {
    int index = (mouseY-50+15)/40;
    if(index < renshuus.length) {
      startRenshu(index);
    } 
  } else {
    if(currentRenshu.state == 0 || currentRenshu.state == 1) {
      currentRenshu.nextView(currentCard); 
      redraw();
    } else {
      changeCard();
    }
  }
}

void keyPressed() {
    if(keyCode==82) {
      renshuStarted = false;
      redraw();  
    } else {
      updateDisplayType();
      println("Display Type:"+ displayType);
    }
}


