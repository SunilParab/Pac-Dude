public interface Entities{
  public int getXPos();
  public int getYPos();
  public void setXPos(int newpos);
  public void setYPos(int newpos);
  public boolean nextToBlock(String checkdir);
  public void changeDirection(String newdir);
  public void move();
}
