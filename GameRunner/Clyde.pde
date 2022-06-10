public class Clyde extends Ghost {
      PImage up = loadImage("yellowUp.png");
    PImage right = loadImage("yellowRight.png");
    PImage down = loadImage("yellowDown.png");
    PImage left = loadImage("yellowLeft.png");


  public Clyde(int x, int y ) {
    xPos = x; 
    yPos = y; 
    trueXPos = x*26+13;
    trueYPos = y*26+13;
    timeToSpawn = 1500;
  }
  
  public void move() {
    if(!alive) {
      maxmovecounter = deadmove;
      movecounter = deadmove;
      if (xPos < 14) {
        houseLeave(13,11);
      } else {
        houseLeave(14,11);
      }
      if (gameMap.getVal(xPos,yPos) == 4) {
        alive = true;
        eaten = true;
      }
    } else if(timeToSpawn > 0) {
      maxmovecounter = normmove;
      movecounter = normmove;
      houseMove();
    } else if (spawned == false) {
      maxmovecounter = normmove;
      movecounter = normmove;
      houseLeave(14,11);
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
            moveTo(0,26);
          } else {
            maxmovecounter = normmove;
            movecounter = normmove;
            moveTo(Player.getXPos(),Player.getYPos());
          }
          break;
        }
      case "Scatter": 
        {
          maxmovecounter = normmove;
          movecounter = normmove;
          moveTo(0,26);
          break;
        }
      }   
    }
  }
  
<<<<<<< HEAD
    public void drawSelf() {


    
    modetimer--;
    fill(0, 255, 255);
    if(movecounter > 0){
      if(getDirection() == "Up") {image(up, 3 +getXPos()*26, getYPos()*26+26*movecounter/10 + 3); setTrueXPos(getXPos()*26); setTrueYPos(getYPos()*26+26.0*movecounter/10);}
      else if(getDirection() == "Down") {image(down, 3+ getXPos()*26, getYPos()*26-26*movecounter/10 +3 ); setTrueXPos(getXPos()*26); setTrueYPos(getYPos()*26-26.0*movecounter/10);}
      else if(getDirection() == "Left") {image(left, 3+  getXPos()*26+26*movecounter/10, getYPos()*26 +3); setTrueXPos(getXPos()*26+26.0*movecounter/10); setTrueYPos(getYPos()*26);}
      else if(getDirection() == "Right") {image(right,3 + getXPos()*26-26*movecounter/10, getYPos()*26 +3); setTrueXPos(getXPos()*26-26.0*movecounter/10); setTrueYPos(getYPos()*26);}
=======
  public void drawSelf() {
    if(timeToSpawn > 0){
      timeToSpawn--; 
    }
    if (Player.getSpecial() && !eaten) {
      fill(0, 0, 255);
    } else {
      fill(255, 150, 0);
    }
    if(movecounter > 0){
      if(getDirection() == "Up") {circle(getXPos()*26+13, getYPos()*26+13+26*movecounter/maxmovecounter, 15); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13+26.0*movecounter/maxmovecounter);}
      else if(getDirection() == "Down") {circle(getXPos()*26+13, getYPos()*26+13-26*movecounter/maxmovecounter, 15); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13-26.0*movecounter/maxmovecounter);}
      else if(getDirection() == "Left") {circle(getXPos()*26+13+26*movecounter/maxmovecounter, getYPos()*26+13, 15); setTrueXPos(getXPos()*26+13+26.0*movecounter/maxmovecounter); setTrueYPos(getYPos()*26+13);}
      else if(getDirection() == "Right") {circle(getXPos()*26+13-26*movecounter/maxmovecounter, getYPos()*26+13, 15); setTrueXPos(getXPos()*26+13-26.0*movecounter/maxmovecounter); setTrueYPos(getYPos()*26+13);}
>>>>>>> 23b54fbfc650e00c706b0021160a9278038db5ce
      movecounter--;
    } 
        else if(movecounter <= 0){

      if(getDirection() == "Up") {image(up, 3 +getXPos()*26, getYPos()*26 +3 ); }
      else if(getDirection() == "Down") {image(down, 3+ getXPos()*26, getYPos()*26 +3); }
      else if(getDirection() == "Left") {image(left, 3+ getXPos()*26, getYPos()*26 +3 ); }
      else if(getDirection() == "Right") {image(right,3+ getXPos()*26, getYPos()*26 +3); }   
      move(); 
  }
}
  
}
