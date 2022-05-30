public class Inky extends Ghost {

  public Inky(int x, int y) {
    xPos = x; 
    yPos = y;
  }

  public void move() {
    double right; 
    double left; 
    double up; 
    double down; 

    // right dist 
    right = Math.sqrt( ( (Player.getXPos() - (xPos+1)) * (Player.getXPos() - (xPos+1)) ) + ( (Player.getYPos() - yPos)  * (Player.getYPos() - yPos) ) ) ;
    // left dist 
    left = Math.sqrt( ( (Player.getXPos() - (xPos-1)) * (Player.getXPos() - (xPos-1)) ) + ( (Player.getYPos() - yPos)  * (Player.getYPos() - yPos) ) ) ;
    // up dist 
    up = Math.sqrt( ( (Player.getXPos() - (xPos)) * (Player.getXPos() - (xPos)) ) + ( (Player.getYPos() - (yPos+1))  * (Player.getYPos() - (yPos+1)) ) ) ;
    // down dist
    down = Math.sqrt( ( (Player.getXPos() - (xPos)) * (Player.getXPos() - (xPos)) ) + ( (Player.getYPos() - (yPos-1))  * (Player.getYPos() - (yPos-1)) ) ) ;

    System.out.println(right); 
    System.out.println(left); 
    System.out.println(up); 
    System.out.println(down);
  }
}
