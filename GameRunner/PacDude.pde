public class PacDude implements Entities {
  
  //This is copy pasted from ghost
  
  public int xPos;
  public int yPos;
  public String direction;
  
  public int getXPos() {
    return xPos;
  }
  public int getYPos() {
    return yPos;
  }
  public void setXPos(int newpos) {
    xPos = newpos;
  }
  public void setYPos(int newpos) {
    yPos = newpos;
  }
  public boolean nextToBlock() {
    //to be implemented soon
    return false;
  }
  public void changeDirection(String newdir) {
    direction = newdir;
  }
  public void move() {
    //to be implemented soon
  }
  public void respawn() {
    //to be implemented later
  }
  public void wander() {
    //to be implemented soon
  }
  
}
