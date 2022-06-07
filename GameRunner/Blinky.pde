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
    switch (mode) {
    case "Chase": 
      {
        movecounter = 10;
        moveTo(Player.getXPos(), Player.getYPos());
        break;
      }
    case "Scatter": 
      {
        movecounter = 10;
        moveTo(24, 0);
        break;
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
      fill(255, 0, 0);
    }
    if (movecounter > 0) {
      if (getDirection() == "Up") {
        circle(getXPos()*26+13, getYPos()*26+13+26*movecounter/10, 15); 
        setTrueXPos(getXPos()*26+13); 
        setTrueYPos(getYPos()*26+13+26.0*movecounter/10);
      } else if (getDirection() == "Down") {
        circle(getXPos()*26+13, getYPos()*26+13-26*movecounter/10, 15); 
        setTrueXPos(getXPos()*26+13); 
        setTrueYPos(getYPos()*26+13-26.0*movecounter/10);
      } else if (getDirection() == "Left") {
        circle(getXPos()*26+13+26*movecounter/10, getYPos()*26+13, 15);  
        setTrueXPos(getXPos()*26+13+26.0*movecounter/10); 
        setTrueYPos(getYPos()*26+13);
      } else if (getDirection() == "Right") {
        circle(getXPos()*26+13-26*movecounter/10, getYPos()*26+13, 15);  
        setTrueXPos(getXPos()*26+13-26.0*movecounter/10); 
        setTrueYPos(getYPos()*26+13);
      }
      movecounter--;
    } else {
      circle(getXPos()*26+13, getYPos()*26+13, 15);
      move();
    }
  }
}
