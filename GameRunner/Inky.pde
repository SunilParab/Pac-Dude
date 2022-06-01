public class Inky extends Ghost {

  public Inky(int x, int y) {
    xPos = x; 
    yPos = y;
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

    System.out.println(right);
    System.out.println(left);
    System.out.println(up);
    System.out.println(down);

    if (up < right && up < left && up < down && !nextToBlock("Up")) { 
      yPos--;
      direction = "Up";
    } 
    if (left < right && left < up && left < down && !nextToBlock("Left")) {
      xPos --;
      direction = "Left";
    } 
    if (down < right && down < up && down < left && !nextToBlock("Down")) { 
      yPos++;
      direction = "Down";
    } 
    if (right < left && right < down && right < up && !nextToBlock("Right")) { 
      xPos++;
      direction = "Right";
    } 
  } 
  
  public void drawSelf() {
    fill(0, 255, 255);
    circle(getXPos()*26+13, getYPos()*26+13, 15);
  }
  
}
