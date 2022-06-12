public class Blinky extends Ghost {
  // instance variables 
  PImage up = loadImage("redGhostUp.png");
  PImage right = loadImage("redGhostRight.png");
  PImage down = loadImage("redGhostDown.png");
  PImage left = loadImage("redGhostLeft.png");
  PImage dead = loadImage("scareddd.png"); 
  PImage eyes = loadImage("eyess.png"); 

  // constructor 
  public Blinky(int x, int y) {
    xPos = x;
    yPos = y;
    trueXPos = x*26+13;
    trueYPos = y*26+13;
    timeToSpawn = 0;
    spawned = true;
  }
  
  //method 
  public void move() {
    if (!alive) {
      maxmovecounter = deadmove;
      movecounter = deadmove;
      if (xPos < 14) {
        houseLeave(13, 11);
      } else {
        houseLeave(14, 11);
      }
      if (gameMap.getVal(xPos, yPos) == 4) {
        alive = true;
        eaten = true;
      }
    } else if (Player.getSpecial() && !eaten) {
      maxmovecounter = slowmove;
      movecounter = slowmove;
      wander();
    } else if (gameMap.getPellets() - Player.getPelletsEaten() <= 20) {
      maxmovecounter = 10;
      movecounter = 10;
      moveTo(Player.getXPos(), Player.getYPos());
    } else {
      switch (mode) {
      case "Chase": 
        {
          maxmovecounter = normmove;
          movecounter = normmove;
          moveTo(Player.getXPos(), Player.getYPos());
          break;
        }
      case "Scatter": 
        {
          maxmovecounter = normmove;
          movecounter = normmove;
          moveTo(24, 0);
          break;
        }
      }
    }
  }

  public void drawSelf() {    
    modetimer--;
    fill(0, 255, 255);
    // condition 1 
    if (movecounter > 0) {

      // condition 1a: no special stay normal 
      if (!Player.getSpecial()) {
        if (getDirection() == "Up") {
          image(up, 3 +getXPos()*26, getYPos()*26+26*movecounter/maxmovecounter + 3); 
          setTrueXPos(getXPos()*26); 
          setTrueYPos(getYPos()*26+26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Down") {
          image(down, 3+ getXPos()*26, getYPos()*26-26*movecounter/maxmovecounter +3 ); 
          setTrueXPos(getXPos()*26); 
          setTrueYPos(getYPos()*26-26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Left") {
          image(left, 3+  getXPos()*26+26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(getXPos()*26+26.0*movecounter/maxmovecounter); 
          setTrueYPos(getYPos()*26);
        } else if (getDirection() == "Right") {
          image(right, 3 + getXPos()*26-26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(getXPos()*26-26.0*movecounter/maxmovecounter); 
          setTrueYPos(getYPos()*26);
        }
        movecounter--;
      }

      // condition 1b: has special = turn blue 
      if (Player.getSpecial() && alive) {
        if (getDirection() == "Up") {
          image(dead, 3 +getXPos()*26, getYPos()*26+26*movecounter/maxmovecounter + 3); 
          setTrueXPos(getXPos()*26); 
          setTrueYPos(getYPos()*26+26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Down") {
          image(dead, 3+ getXPos()*26, getYPos()*26-26*movecounter/maxmovecounter +3 ); 
          setTrueXPos(getXPos()*26); 
          setTrueYPos(getYPos()*26-26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Left") {
          image(dead, 3+  getXPos()*26+26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(getXPos()*26+26.0*movecounter/maxmovecounter); 
          setTrueYPos(getYPos()*26);
        } else if (getDirection() == "Right") {
          image(dead, 3 + getXPos()*26-26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(getXPos()*26-26.0*movecounter/maxmovecounter); 
          setTrueYPos(getYPos()*26);
        }
        movecounter--;
      }
      
      //condition 1c: if not alive turn into eyes 
      if (!alive) {
        if (getDirection() == "Up") {
          image(eyes, 3 +getXPos()*26, getYPos()*26+26*movecounter/maxmovecounter + 3); 
          setTrueXPos(getXPos()*26); 
          setTrueYPos(getYPos()*26+26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Down") {
          image(eyes, 3+ getXPos()*26, getYPos()*26-26*movecounter/maxmovecounter +3 ); 
          setTrueXPos(getXPos()*26); 
          setTrueYPos(getYPos()*26-26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Left") {
          image(eyes, 3+  getXPos()*26+26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(getXPos()*26+26.0*movecounter/maxmovecounter); 
          setTrueYPos(getYPos()*26);
        } else if (getDirection() == "Right") {
          image(eyes, 3 + getXPos()*26-26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(getXPos()*26-26.0*movecounter/maxmovecounter); 
          setTrueYPos(getYPos()*26);
        }
        movecounter--;
      }
      
      
      // condition 2 
    } else if (movecounter <= 0) {
      
      //condition2a
      if (!Player.getSpecial()) {
        if (getDirection() == "Up") {
          image(up, 3 +getXPos()*26, getYPos()*26 +3 );
        } else if (getDirection() == "Down") {
          image(down, 3+ getXPos()*26, getYPos()*26 +3);
        } else if (getDirection() == "Left") {
          image(left, 3+ getXPos()*26, getYPos()*26 +3 );
        } else if (getDirection() == "Right") {
          image(right, 3+ getXPos()*26, getYPos()*26 +3);
        }
      }
        
      // condition 2b
      if (Player.getSpecial() && alive) {
        if (getDirection() == "Up") {
          image(dead, 3 +getXPos()*26, getYPos()*26+26*movecounter/maxmovecounter + 3); 
          setTrueXPos(getXPos()*26); 
          setTrueYPos(getYPos()*26+26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Down") {
          image(dead, 3+ getXPos()*26, getYPos()*26-26*movecounter/maxmovecounter +3 ); 
          setTrueXPos(getXPos()*26); 
          setTrueYPos(getYPos()*26-26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Left") {
          image(dead, 3+  getXPos()*26+26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(getXPos()*26+26.0*movecounter/maxmovecounter); 
          setTrueYPos(getYPos()*26);
        } else if (getDirection() == "Right") {
          image(dead, 3 + getXPos()*26-26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(getXPos()*26-26.0*movecounter/maxmovecounter); 
          setTrueYPos(getYPos()*26);
        }
        movecounter--;
      }

      // condition 2c 
      if (!alive) {
        if (getDirection() == "Up") {
          image(eyes, 3 +getXPos()*26, getYPos()*26+26*movecounter/maxmovecounter + 3); 
          setTrueXPos(getXPos()*26); 
          setTrueYPos(getYPos()*26+26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Down") {
          image(eyes, 3+ getXPos()*26, getYPos()*26-26*movecounter/maxmovecounter +3 ); 
          setTrueXPos(getXPos()*26); 
          setTrueYPos(getYPos()*26-26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Left") {
          image(eyes, 3+  getXPos()*26+26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(getXPos()*26+26.0*movecounter/maxmovecounter); 
          setTrueYPos(getYPos()*26);
        } else if (getDirection() == "Right") {
          image(eyes, 3 + getXPos()*26-26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(getXPos()*26-26.0*movecounter/maxmovecounter); 
          setTrueYPos(getYPos()*26);
        }
        movecounter--;
      }

      move();
    }
  }
}
