public class Inky extends Ghost {

  public Inky(int x, int y) {
    xPos = x; 
    yPos = y;
    trueXPos = x*26+13;
    trueYPos = y*26+13;
    timeToSpawn = 960;
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
  }
  
  public void drawSelf() {
    if(timeToSpawn > 0){
      timeToSpawn--; 
    }
    if (Player.getSpecial()) {
      fill(0, 0, 255);
    } else {
      fill(0, 255, 255);
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
