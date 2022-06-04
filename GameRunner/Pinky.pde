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
        movecounter = 10;
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
    if(movecounter > 0){
      if(getDirection() == "Up") {circle(getXPos()*26+13, getYPos()*26+13+26*movecounter/10, 15); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13+26.0*movecounter/10);}
      else if(getDirection() == "Down") {circle(getXPos()*26+13, getYPos()*26+13-26*movecounter/10, 15); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13-26.0*movecounter/10);}
      else if(getDirection() == "Left") {circle(getXPos()*26+13+26*movecounter/10, getYPos()*26+13, 15); setTrueXPos(getXPos()*26+13+26.0*movecounter/10); setTrueYPos(getYPos()*26+13);}
      else if(getDirection() == "Right") {circle(getXPos()*26+13-26*movecounter/10, getYPos()*26+13, 15); setTrueXPos(getXPos()*26+13-26.0*movecounter/10); setTrueYPos(getYPos()*26+13);}
      movecounter--;
    } else {
      circle(getXPos()*26+13, getYPos()*26+13, 15);
      move();
    }
  }
  
}
