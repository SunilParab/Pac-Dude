public class Pinky extends Ghost {

  public Pinky(int x, int y) {
    xPos = x; 
    yPos = y;
    trueXPos = x*26+13;
    trueYPos = y*26+13;
    timeToSpawn = 480;
  }

  public void move() {
    if(timeToSpawn > 0) {
      movecounter = 10;
      houseMove();
    } else if (spawned == false) {
      movecounter = 10;
      houseLeave(13,11);
      if (yPos <= 11) {
        spawned = true;
      }
    } else {
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
  }
  
  public void drawSelf() {
    if(timeToSpawn > 0){
      timeToSpawn--; 
    }
    if (Player.getSpecial()) {
      fill(0, 0, 255);
    } else {
      fill(255, 169, 180);
    }
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
