public class Pinky extends Ghost {

  public Pinky(int x, int y) {
    xPos = x; 
    yPos = y;
    trueXPos = x*26+13;
    trueYPos = y*26+13;
  }

  public void move() {
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
        switch (Player.getDirection()) {
        case "Up": 
          {
            moveTo(Player.getXPos(), Player.getYPos() - 4);
            break;
          }
        case "Down": 
          {
            moveTo(Player.getXPos(), Player.getYPos() + 4);
            break;
          }
        case "Left": 
          {
            moveTo(Player.getXPos(), Player.getYPos() - 4);
            break;
          }
        case "Right": 
          {
            moveTo(Player.getXPos(), Player.getYPos() + 4);
            break;
          }
        }
        break;
      }
    case "Scatter": 
      {
        movecounter = 10;
        moveTo(0, 2);
        break;
      }
    }
  }

    public void drawSelf() {
    PImage up = loadImage("redGhostUp.png");
    PImage right = loadImage("redGhostRight.png");
    PImage down = loadImage("redGhostDown.png");
    PImage left = loadImage("redGhostLeft.png");

    
    modetimer--;
    fill(0, 255, 255);
    if(movecounter > 0){
      if(getDirection() == "Up") {image(up, 5 +getXPos()*26, getYPos()*26+26*movecounter/10); setTrueXPos(getXPos()*26); setTrueYPos(getYPos()*26+26.0*movecounter/10);}
      else if(getDirection() == "Down") {image(down, 5+ getXPos()*26, getYPos()*26-26*movecounter/10); setTrueXPos(getXPos()*26); setTrueYPos(getYPos()*26-26.0*movecounter/10);}
      else if(getDirection() == "Left") {image(left, 5+ getXPos()*26+26*movecounter/10, getYPos()*26); setTrueXPos(getXPos()*26+26.0*movecounter/10); setTrueYPos(getYPos()*26);}
      else if(getDirection() == "Right") {image(right,5+ getXPos()*26-26*movecounter/10, getYPos()*26); setTrueXPos(getXPos()*26-26.0*movecounter/10); setTrueYPos(getYPos()*26);}
      movecounter--;
    } 
        else if(movecounter <= 0){

      if(getDirection() == "Up") {image(up, 5 +getXPos()*26, getYPos()*26); }
      else if(getDirection() == "Down") {image(down, 5+ getXPos()*26, getYPos()*26); }
      else if(getDirection() == "Left") {image(left, 5+ getXPos()*26, getYPos()*26); }
      else if(getDirection() == "Right") {image(right,5+ getXPos()*26, getYPos()*26); }   
      move(); 
  }
}
}
