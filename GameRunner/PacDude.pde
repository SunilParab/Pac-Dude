public class PacDude implements Entities {
<<<<<<< HEAD
  private int xPos;
  private int yPos;
  public int incX; //will be used later
  public int incY; //will be used later
  public int pelletCounter; //will be used later
  private boolean specialAbility;
  private String direction;
  private String queueddir;
  
=======
  public int xPos;
  public int yPos;
  public int incX;
  public int incY;
  public int pelletEaten;
  public boolean specialAbility;
  public String direction;

>>>>>>> a60efb0cd7092fd03f49757a49ae22df5d8aada3
  public PacDude(int x, int y) {
    xPos = x;
    yPos = y;
    pelletEaten = 0;
    specialAbility = false;
    direction = "Left";
    queueddir = "None";
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
<<<<<<< HEAD
  
  public String getQueuedDirection() {
    return queueddir;
  }
  
  public void setQueuedDirection(String newdir) {
    queueddir = newdir;
  }
  
=======

>>>>>>> a60efb0cd7092fd03f49757a49ae22df5d8aada3
  public boolean getSpecial() {
    return specialAbility;
  }

  public void setSpecial(boolean hasspec) {
    specialAbility = hasspec;
  }

  public boolean nextToBlock(String checkdir) {
    switch (checkdir) {
    case "Up": 
      {
        return (gameMap.map[yPos-1][xPos] == 1 || gameMap.map[yPos-1][xPos] == 4);
      }
    case "Down": 
      {
        return (gameMap.map[yPos+1][xPos] == 1 || gameMap.map[yPos+1][xPos] == 4);
      }
    case "Left": 
      {
        return (gameMap.map[yPos][xPos-1] == 1 || gameMap.map[yPos][xPos-1] == 4);
      }
    case "Right": 
      {
        return (gameMap.map[yPos][xPos+1] == 1 || gameMap.map[yPos][xPos+1] == 4);
      }
    }
    return true;
  }
  
  public int getPelletCounter(){ 
    return pelletEaten; 
  } 
  
  public void eatPellet(){ 
    pelletEaten ++;
  } 
  
    
  
  
  public void move() {
    if (!nextToBlock(direction)) {
      movecounter = 20;
      switch (direction) {
<<<<<<< HEAD
        case "Up": {
          yPos--;
          break;
        }
        case "Down": {
          yPos++;
          break;
=======
      case "Up": 
        {
          yPos++;
        }
      case "Down": 
        {
          yPos--;
>>>>>>> a60efb0cd7092fd03f49757a49ae22df5d8aada3
        }
      case "Left": 
        {
          xPos--;
          break;
        }
      case "Right": 
        {
          xPos++;
          break;
        }
      }
    }
  }
}
