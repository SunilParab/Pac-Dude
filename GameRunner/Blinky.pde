public class Blinky extends Ghost {

  public Blinky(int x, int y) {
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
        moveTo(Player.getXPos(),Player.getYPos());
        break;
      }
    case "Scatter": 
      {
        movecounter = 10;
        moveTo(0,24);
        break;
      }
    }   
  }
  
  public void moveTo(int x, int y) { 
    double right; 
    double left; 
    double up; 
    double down; 

    // right dist
    if (direction != "Left" && !nextToBlock("Right")) {
      right = Math.sqrt(((x - xPos + 1) * (x - xPos + 1)) + ((y - yPos) * (y - yPos)));
    } else {
      right = 2000000;
    }
    
    // left dist
    if (direction != "Right" && !nextToBlock("Left")) {
      left = Math.sqrt(((x - xPos - 1) * (y - xPos - 1) ) + ((y - yPos) * (y - yPos)));
    } else {
      left = 2000000;
    }
    
    // up dist 
    if (direction != "Down" && !nextToBlock("Up")) {
      up = Math.sqrt(((y - xPos) * (x - xPos)) + ((y - yPos - 1) * (y - yPos-1)));
    } else {
      up = 2000000;
    }
    
    // down dist
    if (direction != "Up" && !nextToBlock("Down")) {
      down = Math.sqrt(((x - xPos) * (x - xPos)) + ((y - yPos + 1) * (y - yPos+1)));
    } else {
      down = 2000000;
    }

    if (up <= right && up <= left && up <= down && !nextToBlock("Up")) { 
      yPos--;
      direction = "Up";
    } 
    else if (left <= right && left <= up && left <= down && !nextToBlock("Left")) {
      xPos --;
      if (gameMap.getVal(getYPos(), getXPos()) == 5) {
        setXPos(25);
      }
      direction = "Left";
    } 
    else if (down <= right && down <= up && down <= left && !nextToBlock("Down")) { 
      yPos++;
      direction = "Down";
    } 
    else if (right <= left && right <= down && right <= up && !nextToBlock("Right")) { 
      xPos++;
      if (gameMap.getVal(getYPos(), getXPos()) == 5) {
        setXPos(1);
      }
      direction = "Right";
    } 
  } 
  
  public void drawSelf() {
    modetimer--;
    fill(255, 0, 0);
    if(movecounter > 0){
      if(getDirection() == "Up") {circle(getXPos()*26+13, getYPos()*26+13+26*movecounter/10 - 5, 15); rect(getXPos()*26, getYPos()*26+26*movecounter/10, 15,15); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13+26.0*movecounter/10);}
      else if(getDirection() == "Down") {circle(getXPos()*26+13, getYPos()*26+13-26*movecounter/10 - 5, 15); rect(getXPos()*26, getYPos()*26-26*movecounter/10, 15,15); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13-26.0*movecounter/10);}
      else if(getDirection() == "Left") {circle(getXPos()*26+13+26*movecounter/10, getYPos()*26+13 - 5, 15); rect(getXPos()*26+26*movecounter/10, getYPos()*26, 15,15); setTrueXPos(getXPos()*26+13+26.0*movecounter/10); setTrueYPos(getYPos()*26+13);}
      else if(getDirection() == "Right") {circle(getXPos()*26+13-26*movecounter/10, getYPos()*26+13 - 5, 15); rect(getXPos()*26-26*movecounter/10, getYPos()*26, 15,15); setTrueXPos(getXPos()*26+13-26.0*movecounter/10); setTrueYPos(getYPos()*26+13);}
      movecounter--;
    } else {
      circle(getXPos()*26+13, getYPos()*26+13 - 5, 15);
      rect(getXPos()*26, getYPos()*26, 15,15);
      move();
    }
  }
  
}
