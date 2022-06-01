public abstract class Ghost implements Entities {
  public int xPos;
  public int yPos;
  public String direction;
  public int movecounter;

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
    //Implemented Inside of each Ghost
    //This might be implemented here instead later
  }

  public void respawn() {
    //to be implemented later
  }

  public void wander() {
    ArrayList<String> direcs = new ArrayList<String>();
    if (direction != "Down" && !nextToBlock("Up")) { 
      direcs.add("Up");
    } 
    if (direction != "Right" && !nextToBlock("Left")) {
      direcs.add("Left");
    } 
    if (direction != "Up" && !nextToBlock("Down")) { 
      direcs.add("Down");
    } 
    if (direction != "Left" && !nextToBlock("Right")) { 
      direcs.add("Right");
    } 
    System.out.println(direcs.size());
    String chosenddir = direcs.get((int)(Math.random() * direcs.size()));
    direction = chosenddir;
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
          if (gameMap.getVal(getYPos(), getXPos()) == 5) {
            setXPos(26);
          } 
          break;
        }
      case "Right": 
        {
          xPos++;
          if (gameMap.getVal(getYPos(), getXPos()) == 5) {
            setXPos(0);
          } 
          break;
        }
    }
  }
}
