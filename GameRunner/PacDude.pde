public class PacDude implements Entities {
  public int xPos;
  public int yPos;
  public int incX;
  public int incY;
  public int pelletCounter;
  public boolean specialAbility;
  public String direction;
  
  public PacDude(int x, int y) {
    xPos = x;
    yPos = y;
    pelletCounter = 0;
    specialAbility = false;
    direction = "Left";
  }
  
  public int getXPos() {
    return xPos;
  }
  
  public int getYPos() {
    return yPos;
  }
  
  public void setXPos(int newpos) {
    xPos = newpos;
  }
  
  public void setYPos(int newpos) {
    yPos = newpos;
  }
  
  public String getDirection() {
    return direction;
  }
  
  public void setDirection(String newdir) {
    direction = newdir;
  }
  
  public boolean getSpecial() {
    return specialAbility;
  }
  
  public void setSpecial(boolean hasspec) {
    specialAbility = hasspec;
  }
  
  public boolean nextToBlock(String checkdir) {
    switch (checkdir) {
      case "Up": {
        return (gameMap.map[xPos][yPos+1] == 1 || gameMap.map[xPos][yPos+1] == 4);
      }
      case "Down": {
        return (gameMap.map[xPos][yPos-1] == 1 || gameMap.map[xPos][yPos-1] == 4);
      }
      case "Left": {
        return (gameMap.map[xPos-1][yPos] == 1 || gameMap.map[xPos-1][yPos] == 4);
      }
      case "Right": {
        return (gameMap.map[xPos+1][yPos] == 1 || gameMap.map[xPos+1][yPos] == 4);
      }
    }
    return true;
  }
  
  public void move() {
    if (!nextToBlock(direction)) {
      switch (direction) {
        case "Up": {
          yPos++;
        }
        case "Down": {
          yPos--;
        }
        case "Left": {
          xPos--;
        }
        case "Right": {
          xPos++;
        }
      }
    }
  }
  
}
