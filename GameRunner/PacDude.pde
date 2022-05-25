public class PacDude implements Entities {
  public int xPos;
  public int yPos;
  public int incX;
  public int incY;
  public int pelletCounter;
  public boolean specialAbility;
  public String direction;
  
  public PacDude() {
    //assign all variable
    //to be implemented very soon
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
  
  public void changeDirection(String newdir) {
    direction = newdir;
  }
  
  public boolean getSpecial() {
    return specialAbility;
  }
  
  public void setSpecial(boolean hasspec) {
    specialAbility = hasspec;
  }
  
  public boolean nextToBlock() {
    switch (direction) {
      case "Up": {
        return !(gameMap.map[xPos][yPos+1] != 3 && gameMap.map[xPos][yPos+1] != 4);
      }
      case "Down": {
        return !(gameMap.map[xPos][yPos-1] != 3 && gameMap.map[xPos][yPos-1] != 4);
      }
      case "Left": {
        return !(gameMap.map[xPos-1][yPos] != 3 && gameMap.map[xPos-1][yPos] != 4);
      }
      case "Right": {
        return !(gameMap.map[xPos+1][yPos] != 3 && gameMap.map[xPos+1][yPos] != 4);
      }
    }
    return true;
  }
  
  public void move() {
    //to be implemented soon
  }
  
}
