public class Inky extends Ghost {

  public Inky(int x, int y) {
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
        int targetX = Player.getXPos();
        int targetY = Player.getYPos();
        switch (Player.getDirection()) {
        case "Up": 
          {
            targetY -= 2;
            break;
          }
        case "Down": 
          {
            targetY +=2 ;
            break;
          }
        case "Left": 
          {
            targetX -= 2;
            break;
          }
        case "Right": 
          {
            targetX += 2;
            break;
          }
        }
        targetX -= Ghosts[0].getXPos() - Player.getXPos();
        targetY -= Ghosts[0].getYPos() - Player.getYPos();
        movecounter = 10;
        moveTo(targetX,targetY);
        break;
      }
    case "Scatter": 
      {
        movecounter = 10;
        moveTo(27,26);
        break;
      }
    }   
  }
  
  public void drawSelf() {
    PImage img = loadImage("Pinky5.png");
    
    modetimer--;
    fill(0, 255, 255);
    if(movecounter > 0){
      if(getDirection() == "Up") {image(img, getXPos()*26+13, getYPos()*26+13+26*movecounter/10); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13+26.0*movecounter/10);}
      else if(getDirection() == "Down") {image(img, getXPos()*26+13, getYPos()*26+13-26*movecounter/10); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13-26.0*movecounter/10);}
      else if(getDirection() == "Left") {image(img, getXPos()*26+13+26*movecounter/10, getYPos()*26+13); setTrueXPos(getXPos()*26+13+26.0*movecounter/10); setTrueYPos(getYPos()*26+13);}
      else if(getDirection() == "Right") {image(img,getXPos()*26+13-26*movecounter/10, getYPos()*26+13); setTrueXPos(getXPos()*26+13-26.0*movecounter/10); setTrueYPos(getYPos()*26+13);}
      movecounter--;
    } else {
      image(img,getXPos()*26+13, getYPos()*26+13);
      move();
    }
  }
  
}
