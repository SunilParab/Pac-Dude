public class Blinky extends Ghost {

  public Blinky(int x, int y) {
    xPos = x;
    yPos = y;
    trueXPos = x*26+13;
    trueYPos = y*26+13;
  }
  
  public void move() {
    System.out.println(mode);
    if (modetimer <= 0 && (mode.equals("Scatter") || mode.equals("Chase"))) {
      if (mode.equals("Scatter")) {
        mode = "Chase";
      } else {
        mode = "Scatter";
      }
      modetimer = 600;
    }
    switch (mode) {
    case "Chase": 
      {
        movecounter = 10;
        moveTo();
        break;
      }
    case "Scatter": 
      {
        movecounter = 10;
        moveTo();
        break;
      }
    }   
  }
  
  
  public void drawSelf() {
    modetimer--;
    fill(255, 0, 0);
    if(movecounter > 0){
      if(getDirection() == "Up") {circle(getXPos()*26+13, getYPos()*26+13+26*movecounter/10 - 5, 15); rect(getXPos()*26, getYPos()*26+26*movecounter/10, 15,15); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13+26.0*movecounter/10);}
      else if(getDirection() == "Down") {circle(getXPos()*26+13, getYPos()*26+13-26*movecounter/10 - 5, 15); rect(getXPos()*26, getYPos()*26-26*movecounter/10, 15,15); setTrueXPos(getXPos()*26+13); setTrueYPos(getYPos()*26+13-26.0*movecounter/10);}
      else if(getDirection() == "Left") {circle(getXPos()*26+13+26*movecounter/10, getYPos()*26+13 - 5, 15); rect(getXPos()*26+26*movecounter/10, getYPos()*26, 15,15); setTrueXPos(getXPos()*26+13+26.0*movecounter/10); setTrueYPos(getYPos()*26+13);}
      else if(getDirection() == "Right") {circle(getXPos()*26+13-26*movecounter/10, getYPos()*26+13 - 5, 15); rect(getXPos()*26-26*movecounter/10, getYPos()*26, 15,15); setTrueXPos(getXPos()*26+13-26.0*movecounter/10); setTrueYPos(getYPos()*26+13);}
      movecounter--;
    } else {
      circle(getXPos()*26+13, getYPos()*26+13 - 5, 15);
      rect(getXPos()*26, getYPos()*26, 15,15);
      move();
    }
  }
  
}
