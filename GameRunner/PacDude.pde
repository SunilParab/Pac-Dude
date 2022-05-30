public class PacDude implements Entities {
  private int xPos;
  private int yPos;
  public int pelletsEaten;
  private boolean specialAbility;
  private String direction;
  private String queueddir;

  public PacDude(int x, int y) {
    xPos = x;
    yPos = y;
    pelletsEaten = 0;
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

  public String getQueuedDirection() {
    return queueddir;
  }

  public void setQueuedDirection(String newdir) {
    queueddir = newdir;
  }

  public boolean getSpecial() {
    return specialAbility;
  }

  public void setSpecial(boolean hasspec) {
    specialAbility = hasspec;
  }

  public int getPelletsEaten() { 
    return pelletsEaten;
  } 

  public void eatPellet() { 
    pelletsEaten++;
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
        return (gameMap.map[yPos][xPos-1] == 1 || gameMap.map[yPos][xPos-1] == 4 );
      }
    case "Right": 
      {
        return (gameMap.map[yPos][xPos+1] == 1 || gameMap.map[yPos][xPos+1] == 4 );
      }
    }
    return true;
  }

  public void move() {
    if (gameMap.getVal(Player.getYPos(), Player.getXPos()) == 2 || gameMap.getVal(Player.getYPos(), Player.getXPos()) ==  ) {
      gameMap.setVal(Player.getXPos(), Player.getYPos(), 0); 
      Player.eatPellet();
    } 
    if (!nextToBlock(direction)) {
      movecounter = 20;
      switch (direction) {
      case "Up": 
        {
          yPos--;
          break;
        }
      case "Down": 
        {
          yPos++;
          break;
        }
      case "Left": 
        {
          xPos--;
          if (gameMap.getVal(Player.getYPos(), Player.getXPos()) == 5) {
            Player.setXPos(26);
          } 
          break;
        }
      case "Right": 
        {
          xPos++;
          if (gameMap.getVal(Player.getYPos(), Player.getXPos()) == 5) {
            Player.setXPos(0);
          } 
          break;
        }
      }
    }
  }
}
