public class Pinky extends Ghost {
    
  public Pinky(int x, int y) {
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
        movecounter = 10;
        switch (Player.getDirection()) {
        case "Up": 
          {
            moveTo(Player.getXPos(),Player.getYPos() - 4);
            break;
          }
        case "Down": 
          {
            moveTo(Player.getXPos(),Player.getYPos() + 4);
            break;
          }
        case "Left": 
          {
            moveTo(Player.getXPos(),Player.getYPos() - 4);
            break;
          }
        case "Right": 
          {
            moveTo(Player.getXPos(),Player.getYPos() + 4);
            break;
          }
        }
        break;
      }
    case "Scatter": 
      {
        movecounter = 10;
        moveTo(0,2);
        break;
      }
    }   
  }
  
  public void drawSelf() {
    modetimer--;
    fill(255, 169, 180);
    PImage img = loadImage("Pinky5.png");

    if(movecounter > 0){
      if(getDirection() == "Up") {image(img,getXPos()*26+13, getYPos()*26+13+26*movecounter/10); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13+26.0*movecounter/10);}
      else if(getDirection() == "Down") {image(img,getXPos(), getYPos()); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13-26.0*movecounter/10);}
      else if(getDirection() == "Left") {image(img,getXPos(), getYPos()); setTrueXPos(getXPos()*26+13+26.0*movecounter/10); setTrueYPos(getYPos()*26+13);}
      else if(getDirection() == "Right") {image(img,getXPos(), getYPos()); setTrueXPos(getXPos()*26+13-26.0*movecounter/10); setTrueYPos(getYPos()*26+13);}
      movecounter--;
    } else {
        image(img,getXPos(), getYPos()); 
    }
  }
  
}
