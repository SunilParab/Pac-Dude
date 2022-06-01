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
    int rando = (int) (Math.random() * 4 + 1);

    if (rando == 1 && gameMap.getVal(yPos + 1, xPos) != 1) {
        yPos++;
    }
     if (rando == 2 && gameMap.getVal(yPos, xPos +1) != 1) {
        xPos++;
    }
     if (rando == 3 && gameMap.getVal(yPos -1, xPos) != 1 && gameMap.getVal(yPos -1, xPos) != 4) {
        yPos--;
    } 
     if (rando == 4 && gameMap.getVal(yPos, xPos -1) != 1) {
        xPos--;
    }
  }

  public void respawn() {
    //to be implemented later
  }

  public void wander() {
    //to be implemented soon
  }
}
