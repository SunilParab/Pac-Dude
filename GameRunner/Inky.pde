public class Inky extends Ghost {

  public Inky(int x, int y) {
    xPos = x; 
    yPos = y;
  }
  
  public void move() {
    int rando = (int) (Math.random() * 4 + 1);

    if (rando == 1 && gameMap.getVal(yPos + 1, xPos) != 1) {
      yPos++;
    }
    if (rando == 2 && gameMap.getVal(yPos, xPos +1) != 1) {
      xPos++;
    }
    if (rando == 3 && gameMap.getVal(yPos -1, xPos) != 1 ) {
      yPos--;
    } 
    if (rando == 4 && gameMap.getVal(yPos, xPos -1) != 1) {
      xPos--;
    }
  }
}
