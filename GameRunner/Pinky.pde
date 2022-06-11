public class Pinky extends Ghost {
  PImage up = loadImage("pinkUp.png");
  PImage right = loadImage("pinkRight.png");
  PImage down = loadImage("pinkDown.png");
  PImage left = loadImage("pinkLeft.png");
  PImage dead = loadImage("scareddd.png"); 
  PImage eyes = loadImage("eyess.png"); 

  public Pinky(int x, int y) {
    xPos = x; 
    yPos = y;
    trueXPos = x*26+13;
    trueYPos = y*26+13;
    timeToSpawn = 480;
  }

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
    } else if (timeToSpawn > 0) {
      maxmovecounter = normmove;
      movecounter = normmove;
      houseMove();
    } else if (spawned == false) {
      maxmovecounter = normmove;
      movecounter = normmove;
      houseLeave(13, 11);
      if (yPos <= 11) {
        spawned = true;
      }
    } else if (Player.getSpecial() && !eaten) {
      maxmovecounter = slowmove;
      movecounter = slowmove;
      wander();
    } else {
      switch (mode) {
      case "Chase": 
        {
          maxmovecounter = normmove;
          movecounter = normmove;
          switch (Player.getDirection()) {
          case "Up": 
            {
              moveTo(Player.getXPos(), Player.getYPos() - 4);
              break;
            }
          case "Down": 
            {
              moveTo(Player.getXPos(), Player.getYPos() + 4);
              break;
            }
          case "Left": 
            {
              moveTo(Player.getXPos(), Player.getYPos() - 4);
              break;
            }
          case "Right": 
            {
              moveTo(Player.getXPos(), Player.getYPos() + 4);
              break;
            }
          }
          break;
        }
      case "Scatter": 
        {
          maxmovecounter = normmove;
          movecounter = normmove;
          moveTo(0, 2);
          break;
        }
      }
    }
  }

  public void drawSelf() {    
    if (timeToSpawn > 0) {
      timeToSpawn--;
    }
    if (Player.getSpecial() && !eaten) {
      fill(0, 0, 255);
    } else {
      fill(255, 169, 180);
    }

    if (movecounter > 0) {

      // condition 1a 
      if (!Player.getSpecial() && alive) {
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

      // condition 1b 
      if (Player.getSpecial()  && lefthouse && alive ) {
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

      // condition 1c 
      if (alive && Player.getSpecial()  && !lefthouse && alive) {
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

      // condition 1d
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
    } else if (movecounter <= 0) {

      //condition 2a
      if (!Player.getSpecial() && alive ) {
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

      //condition 2c
      if (alive && Player.getSpecial()  && !lefthouse) {
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

      // condition 2d
      if (!alive) {
        if (getDirection() == "eyes") {
          image(eyes, 3 +getXPos()*26, getYPos()*26+26*movecounter/maxmovecounter + 3); 
          setTrueXPos(getXPos()*26); 
          setTrueYPos(getYPos()*26+26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "eyes") {
          image(eyes, 3+ getXPos()*26, getYPos()*26-26*movecounter/maxmovecounter +3 ); 
          setTrueXPos(getXPos()*26); 
          setTrueYPos(getYPos()*26-26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "eyes") {
          image(eyes, 3+  getXPos()*26+26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(getXPos()*26+26.0*movecounter/maxmovecounter); 
          setTrueYPos(getYPos()*26);
        } else if (getDirection() == "eyes") {
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
