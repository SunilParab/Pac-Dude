public class Clyde extends Ghost {
  PImage up = loadImage("yellowUp.png");
  PImage right = loadImage("yellowRight.png");
  PImage down = loadImage("yellowDown.png");
  PImage left = loadImage("yellowLeft.png");
  PImage dead = loadImage("scareddd.png"); 



  public Clyde(int x, int y ) {
    xPos = x; 
    yPos = y; 
    trueXPos = x*26+13;
    trueYPos = y*26+13;
    timeToSpawn = 1500;
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
      houseLeave(14, 11);
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
          double distance = Math.sqrt(((Player.getXPos() - xPos) * (Player.getXPos() - xPos)) + ((Player.getYPos() - yPos) * (Player.getYPos() - yPos)));
          if (distance <= 8) {
            maxmovecounter = normmove;
            movecounter = normmove;
            moveTo(0, 26);
          } else {
            maxmovecounter = normmove;
            movecounter = normmove;
            moveTo(Player.getXPos(), Player.getYPos());
          }
          break;
        }
      case "Scatter": 
        {
          maxmovecounter = normmove;
          movecounter = normmove;
          moveTo(0, 26);
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
      
      // if pacman doesnt have special 
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
      
      // if pacman has special and the ghost have left house 
      // left house is set true in the leaving house mehthod 
      if (Player.getSpecial()  && lefthouse) {
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
      // if pacman has the special and the ghost have not left the spawn 
      if (Player.getSpecial()  && !lefthouse) {
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
    } else if (movecounter <= 0) {
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

      if (Player.getSpecial()) {
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

      if (Player.getSpecial()  && !lefthouse) {
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



      move();
    }
  }
}
