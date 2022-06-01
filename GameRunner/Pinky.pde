public class Pinky extends Ghost {

  public Pinky(int x, int y) {
    xPos = x; 
    yPos = y;
  }

  public void chase(){ 
     double right; 
    double left; 
    double up; 
    double down; 

    // right dist 
    right = Math.sqrt( ( (Player.getXPos() - (xPos+1)) * (Player.getXPos() - (xPos+1)) ) + ( (Player.getYPos() - yPos)  * (Player.getYPos() - yPos) ) ) ;
    // left dist 
    left = Math.sqrt( ( (Player.getXPos() - (xPos-1)) * (Player.getXPos() - (xPos-1)) ) + ( (Player.getYPos() - yPos)  * (Player.getYPos() - yPos) ) ) ;
    // up dist 
    up = Math.sqrt( ( (Player.getXPos() - (xPos)) * (Player.getXPos() - (xPos)) ) + ( (Player.getYPos() - (yPos - 1))  * (Player.getYPos() - (yPos-1)) ) ) ;
    // down dist
    down = Math.sqrt( ( (Player.getXPos() - (xPos)) * (Player.getXPos() - (xPos)) ) + ( (Player.getYPos() - (yPos+1))  * (Player.getYPos() - (yPos+1)) ) ) ;

    System.out.println(right); 
    System.out.println(left); 
    System.out.println(up); 
    System.out.println(down);

    if (gameMap.getVal(yPos -1, xPos) == 1) { 
      up += 100;
    } 
    if (gameMap.getVal(yPos, xPos-1) == 1) { 
      left += 100;
    } 
    if (gameMap.getVal(yPos +1, xPos) == 1) { 
      down += 100;
    } 
    if (gameMap.getVal(yPos, xPos+1) == 1) { 
      right += 100;
    } 

    if (up < right && up < left && up < down) { 
      yPos--;
    } 
    if (left < right && left < up && left < down) {
      xPos --;
    } 
    if (down < right && down < up && down < left) { 
      yPos++;
    } 
    if (right < left && right < down && right < up) { 
      xPos++;
    }
    
  } 
}
