public class Pinky extends Ghost {

  public Pinky(int x, int y) {
    xPos = x; 
    yPos = y;
    trueXPos = x*26+13;
    trueYPos = y*26+13;
  }

  public void move() {
    if (modetimer <= 0) {
      modenum = (modenum + 1) % modes.length;
      modetimer = 600;
    }
    switch (modenum) {
    case 0: 
      {
        movecounter = 10;
        chase();
        break;
      }
    case 1: 
      {
        movecounter = 10;
        wander();
        break;
      }
    }   
  }
  
  public void chase(){ 
    double right; 
    double left; 
    double up; 
    double down; 
    int targetx = Player.getXPos();
    int targety = Player.getYPos();
    switch (Player.getDirection()) {
    case "Up": 
      {
        targety -= 4;
      }
    case "Down": 
      {
        targety += 4;
      }
    case "Left": 
      {
        targetx -= 4;
      }
    case "Right": 
      {
        targetx += 4;
      }
    }
    
    // right dist
    if (direction != "Left" && !nextToBlock("Right")) {
      right = Math.sqrt( ( (targetx - (xPos+1)) * (targetx - (xPos+1)) ) + ( (targety - yPos)  * (targety - yPos) ) ) ;
    } else {
      right = 2000000;
    }
    
    // left dist
    if (direction != "Right" && !nextToBlock("Left")) {
      left = Math.sqrt( ( (targetx - (xPos-1)) * (targetx - (xPos-1)) ) + ( (targety - yPos)  * (targety - yPos) ) ) ;
    } else {
      left = 2000000;
    }
    
    // up dist 
    if (direction != "Down" && !nextToBlock("Up")) {
      up = Math.sqrt( ( (targetx - (xPos)) * (targetx - (xPos)) ) + ( (targety - (yPos - 1))  * (targety - (yPos-1)) ) ) ;
    } else {
      up = 2000000;
    }
    
    // down dist
    if (direction != "Up" && !nextToBlock("Down")) {
      down = Math.sqrt( ( (targetx - (xPos)) * (targetx - (xPos)) ) + ( (targety - (yPos+1))  * (targety - (yPos+1)) ) ) ;
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
    }     else if (right <= left && right <= down && right <= up && !nextToBlock("Right")) { 
      xPos++;
      if (gameMap.getVal(getYPos(), getXPos()) == 5) {
        setXPos(1);
      }
      direction = "Right";
    } 
  } 
  
  public void drawSelf() {
    System.out.println(modenum);
    modetimer--;
    fill(255, 169, 180);
    if(movecounter > 0){
      if(getDirection() == "Up") {circle(getXPos()*26+13, getYPos()*26+13+26*movecounter/10, 15); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13+26.0*movecounter/10);}
      else if(getDirection() == "Down") {circle(getXPos()*26+13, getYPos()*26+13-26*movecounter/10, 15); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13-26.0*movecounter/10);}
      else if(getDirection() == "Left") {circle(getXPos()*26+13+26*movecounter/10, getYPos()*26+13, 15); setTrueXPos(getXPos()*26+13+26.0*movecounter/10); setTrueYPos(getYPos()*26+13);}
      else if(getDirection() == "Right") {circle(getXPos()*26+13-26*movecounter/10, getYPos()*26+13, 15); setTrueXPos(getXPos()*26+13-26.0*movecounter/10); setTrueYPos(getYPos()*26+13);}
      movecounter--;
    } else {
      circle(getXPos()*26+13, getYPos()*26+13, 15);
      move();
    }
  }
  
}
