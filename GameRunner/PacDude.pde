public class PacDude implements Entities {
  public int xPos;
  public int yPos;
  public String direction;
  
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
  
  public boolean nextToBlock() {
    switch (direction) {
      case "Up": {
        //return !(gameMap[xPos][yPos+1] != 3 && gameMap[xPos][yPos+1] != 4);
        break;
      }
      case "Down": {
        //return !(gameMap[xPos][yPos-1] != 3 && gameMap[xPos][yPos-1] != 4);
        break;
      }
      case "Left": {
        //return !(gameMap[xPos-1][yPos] != 3 && gameMap[xPos-1][yPos] != 4);
        break;
      }
      case "Right": {
        //return !(gameMap[xPos+1][yPos] != 3 && gameMap[xPos+1][yPos] != 4);
        break;
      }
    }
    //change this true later, but shouldn't matter
    return false;
  }
  
  public void changeDirection(String newdir) {
    direction = newdir;
  }
  
  public void move() {
    //to be implemented soon
  }
  
  public void respawn() {
    //to be implemented later
  }
  
  public void wander() {
    //to be implemented soon
  }
  
}
