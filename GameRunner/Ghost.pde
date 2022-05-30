public abstract class Ghost implements Entities {
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

  public String getDirection() {
    return direction;
  }

  public void setDirection(String newdir) {
    direction = newdir;
  }

  public boolean nextToBlock(String checkdir) {
    switch (checkdir) {
    case "Up": 
      {
        return (gameMap.map[yPos-1][xPos] == 1);
      }
    case "Down": 
      {
        return (gameMap.map[yPos+1][xPos] == 1);
      }
    case "Left": 
      {
        return (gameMap.map[yPos][xPos-1] == 1 );
      }
    case "Right": 
      {
        return (gameMap.map[yPos][xPos+1] == 1 );
      }
    }
    return true;
  }


  public void move() {
   if(nextToBlock("right")){
     xPos++;
   }
   
  }

  public void respawn() {
    //to be implemented later
  }

  public void wander() {
    //to be implemented soon
  }
}
