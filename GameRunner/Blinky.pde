public class Blinky extends Ghost {

  public Blinky(int x, int y) {
    xPos = x;
    yPos = y;
    trueXPos = x*26+13;
    trueYPos = y*26+13;
    timeToSpawn = 0;
    spawned = true;
  }

  public void move() {
    if(!alive) {
      maxmovecounter = 2;
      movecounter = 2;
      if (xPos < 14) {
        houseLeave(13,11);
      } else {
        houseLeave(14,11);
      }
      if (gameMap.getVal(xPos,yPos) == 4) {
        alive = true;
      }
    } else if (Player.getSpecial() && !eaten) {
      maxmovecounter = 20;
      movecounter = 20;
      wander();
    } else {
      switch (mode) {
      case "Chase": 
        {
          maxmovecounter = 15;
          movecounter = 15;
          moveTo(Player.getXPos(), Player.getYPos());
          break;
        }
      case "Scatter": 
        {
          maxmovecounter = 15;
          movecounter = 15;
          moveTo(24, 0);
          break;
        }
      }
    }
  }


  public void drawSelf() {
    if(timeToSpawn > 0){
      timeToSpawn--; 
    }
    if (Player.getSpecial() & !eaten) {
      fill(0, 0, 255);
    } else {
      fill(255, 0, 0);
    }
    if (movecounter > 0) {
      if (getDirection() == "Up") {
        circle(getXPos()*26+13, getYPos()*26+13+26*movecounter/maxmovecounter, 15); 
        setTrueXPos(getXPos()*26+13); 
        setTrueYPos(getYPos()*26+13+26.0*movecounter/maxmovecounter);
      } else if (getDirection() == "Down") {
        circle(getXPos()*26+13, getYPos()*26+13-26*movecounter/maxmovecounter, 15); 
        setTrueXPos(getXPos()*26+13); 
        setTrueYPos(getYPos()*26+13-26.0*movecounter/maxmovecounter);
      } else if (getDirection() == "Left") {
        circle(getXPos()*26+13+26*movecounter/maxmovecounter, getYPos()*26+13, 15);  
        setTrueXPos(getXPos()*26+13+26.0*movecounter/maxmovecounter); 
        setTrueYPos(getYPos()*26+13);
      } else if (getDirection() == "Right") {
        circle(getXPos()*26+13-26*movecounter/maxmovecounter, getYPos()*26+13, 15);  
        setTrueXPos(getXPos()*26+13-26.0*movecounter/maxmovecounter); 
        setTrueYPos(getYPos()*26+13);
      }
      movecounter--;
    } else {
      circle(getXPos()*26+13, getYPos()*26+13, 15);
      move();
    }
  }
}
