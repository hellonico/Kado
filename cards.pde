Card[] cards;
Renshu[] renshuus;

boolean renshuStarted = false;
boolean modeDisplayAll = false;
Renshu currentRenshu;  
Card currentCard;

void loadRenshuFiles(File baseDir) {
  println(baseDir.getPath());
  
  java.io.FilenameFilter filter = new java.io.FilenameFilter() {
     public boolean accept(File dir, String name) {
        return name.endsWith(".csv");
     } 
  }; 

  String[] files = baseDir.list(filter);
  
  renshuus = new Renshu[files.length];
  for(int i = 0; i< files.length;i++) {
     renshuus[i] = new Renshu(files[i]); 
  }
}

void listRenshuuFiles() {
  try {
    loadRenshuFiles(dataFile(".").getParentFile());
  } catch (Exception e) {
    // get the list of files from a text file
    String[] files = loadStrings("list.txt");
    renshuus = new Renshu[files.length];
    for(int i = 0; i< files.length;i++) {
     renshuus[i] = new Renshu(files[i]); 
    }
  }
}

void setup() {
  listRenshuuFiles();
  size(displayHeight, displayWidth);
  fill(255);
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
  } else {    
    
    
  }
}

void startRenshu(int index) {
   currentRenshu = renshuus[index];
   println("Starting "+currentRenshu.name);
   currentRenshu.loadCards();
   renshuStarted = true;
   changeCard();
}

void changeCard() {
    background(0);
    currentCard = currentRenshu.randomCard();
    if(modeDisplayAll) {
       currentCard.display(); 
    } else {
       currentCard.displayHint(); 
    }
    redraw();
}

void mousePressed() {
  if(!renshuStarted) {
    int index = (mouseY-50+15)/40;
    if(index < renshuus.length) {
      startRenshu(index);
    } 
  } else {
    if(!currentCard.displayed) {
      background(0);
      currentCard.display();
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
      modeDisplayAll = !modeDisplayAll;
      println("Display All:"+ modeDisplayAll);
    }
}


