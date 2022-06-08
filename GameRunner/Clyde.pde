public class Clyde extends Ghost {

  public Clyde(int x, int y ) {
    xPos = x; 
    yPos = y; 
    trueXPos = x*26+13;
    trueYPos = y*26+13;
  }
  
  public void move() {
    if (modetimer <= 0 && (mode.equals("Scatter") || mode.equals("Chase"))) {
      if (mode.equals("Scatter")) {
        mode = "Chase";
      } else {
        mode = "Scatter";
      }
      modetimer = 600;
    }
    switch (mode) {
    case "Chase": 
      { 
        double distance = Math.sqrt(((Player.getXPos() - xPos) * (Player.getXPos() - xPos)) + ((Player.getYPos() - yPos) * (Player.getYPos() - yPos)));
        if (distance <= 8) {
          movecounter = 10;
          moveTo(0,26);
        } else {
          movecounter = 10;
          moveTo(Player.getXPos(),Player.getYPos());
        }
        break;
      }
    case "Scatter": 
      {
        movecounter = 10;
        moveTo(0,26);
        break;
      }
    }   
  }
  
   public void drawSelf() {
    PImage img = loadImage("Pinky5.png");
    
    modetimer--;
    fill(0, 255, 255);
    if(movecounter > 0){
      if(getDirection() == "Up") {image(img, 5 +getXPos()*26, getYPos()*26+26*movecounter/10); setTrueXPos(getXPos()*26); setTrueYPos(getYPos()*26+26.0*movecounter/10);}
      else if(getDirection() == "Down") {image(img, 5+ getXPos()*26, getYPos()*26-26*movecounter/10); setTrueXPos(getXPos()*26); setTrueYPos(getYPos()*26-26.0*movecounter/10);}
      else if(getDirection() == "Left") {image(img, 5+ getXPos()*26+26*movecounter/10, getYPos()*26); setTrueXPos(getXPos()*26+26.0*movecounter/10); setTrueYPos(getYPos()*26);}
      else if(getDirection() == "Right") {image(img,5+ getXPos()*26-26*movecounter/10, getYPos()*26); setTrueXPos(getXPos()*26-26.0*movecounter/10); setTrueYPos(getYPos()*26);}
      movecounter--;
    } else {
      image(img,5+ getXPos()*26, getYPos()*26);
      move();
    }
  }
  
}
