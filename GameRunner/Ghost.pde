public abstract class Ghost implements Entities{
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
