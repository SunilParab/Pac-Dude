public abstract class Ghost implements Entities {
  public int xPos;
  public int yPos;
  public float trueXPos;
  public float trueYPos;
  public float radius = 7.5;
  public String direction;
  public int modetimer = 600;
  public int movecounter;
  public String mode = "Scatter";
  final public String[] modes = new String[] {"Chase","Wander"};

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
  
  public float getTrueXPos() {
    return trueXPos;
  }

  public float getTrueYPos() {
    return trueYPos;
  }

  public void setTrueXPos(float newpos) {
    trueXPos = newpos;
  }

  public void setTrueYPos(float newpos) {
    trueYPos = newpos;
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


  public void moveTo() { 
    double right; 
    double left; 
    double up; 
    double down; 

    // right dist
    if (direction != "Left" && !nextToBlock("Right")) {
      right = Math.sqrt(((Player.getXPos() - xPos + 1) * (Player.getXPos() - xPos + 1)) + ((Player.getYPos() - yPos) * (Player.getYPos() - yPos)));
    } else {
      right = 2000000;
    }
    
    // left dist
    if (direction != "Right" && !nextToBlock("Left")) {
      left = Math.sqrt(((Player.getXPos() - xPos - 1) * (Player.getXPos() - xPos - 1) ) + ((Player.getYPos() - yPos) * (Player.getYPos() - yPos)));
    } else {
      left = 2000000;
    }
    
    // up dist 
    if (direction != "Down" && !nextToBlock("Up")) {
      up = Math.sqrt(((Player.getXPos() - xPos) * (Player.getXPos() - xPos)) + ((Player.getYPos() - yPos - 1) * (Player.getYPos() - yPos - 1)));
    } else {
      up = 2000000;
    }
    
    // down dist
    if (direction != "Up" && !nextToBlock("Down")) {
      down = Math.sqrt(((Player.getXPos() - xPos) * (Player.getXPos() - xPos)) + ((Player.getYPos() - yPos + 1) * (Player.getYPos() - yPos + 1)));
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
