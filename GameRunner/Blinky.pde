public class Blinky extends Ghost {

  public Blinky(int x, int y) {
    xPos = x;
    yPos = y;
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

    // right dist
    if (direction != "Left" && !nextToBlock("Right")) {
      right = Math.sqrt( ( (Player.getXPos() - (xPos+1)) * (Player.getXPos() - (xPos+1)) ) + ( (Player.getYPos() - yPos)  * (Player.getYPos() - yPos) ) ) ;
    } else {
      right = 2000000;
    }
    
    // left dist
    if (direction != "Right" && !nextToBlock("Left")) {
      left = Math.sqrt( ( (Player.getXPos() - (xPos-1)) * (Player.getXPos() - (xPos-1)) ) + ( (Player.getYPos() - yPos)  * (Player.getYPos() - yPos) ) ) ;
    } else {
      left = 2000000;
    }
    
    // up dist 
    if (direction != "Down" && !nextToBlock("Up")) {
      up = Math.sqrt( ( (Player.getXPos() - (xPos)) * (Player.getXPos() - (xPos)) ) + ( (Player.getYPos() - (yPos - 1))  * (Player.getYPos() - (yPos-1)) ) ) ;
    } else {
      up = 2000000;
    }
    
    // down dist
    if (direction != "Up" && !nextToBlock("Down")) {
      down = Math.sqrt( ( (Player.getXPos() - (xPos)) * (Player.getXPos() - (xPos)) ) + ( (Player.getYPos() - (yPos+1))  * (Player.getYPos() - (yPos+1)) ) ) ;
    } else {
      down = 2000000;
    }

    System.out.println();
    System.out.println(up);
    System.out.println(down);
    System.out.println(left);
    System.out.println(right);

    if (up <= right && up <= left && up <= down && !nextToBlock("Up")) { 
      yPos--;
      direction = "Up";
    } 
    if (left <= right && left <= up && left <= down && !nextToBlock("Left")) {
      xPos --;
      if (gameMap.getVal(getYPos(), getXPos()) == 5) {
        setXPos(25);
      }
      direction = "Left";
    } 
    if (down <= right && down <= up && down <= left && !nextToBlock("Down")) { 
      yPos++;
      direction = "Down";
    } 
    if (right <= left && right <= down && right <= up && !nextToBlock("Right")) { 
      xPos++;
      if (gameMap.getVal(getYPos(), getXPos()) == 5) {
        setXPos(1);
      }
      direction = "Right";
    } 
  } 
  
  public void drawSelf() {
    modetimer--;
    fill(255, 0, 0);
    if(movecounter > 0){
      if(getDirection() == "Up") {circle(getXPos()*26+13, getYPos()*26+13+26*movecounter/10, 15);}
      else if(getDirection() == "Down") {circle(getXPos()*26+13, getYPos()*26+13-26*movecounter/10, 15);}
      else if(getDirection() == "Left") {circle(getXPos()*26+13+26*movecounter/10, getYPos()*26+13, 15);}
      else if(getDirection() == "Right") {circle(getXPos()*26+13-26*movecounter/10, getYPos()*26+13, 15);}
      movecounter--;
    } else {
      circle(getXPos()*26+13, getYPos()*26+13, 15);
      move();
    }
  }
  
}
