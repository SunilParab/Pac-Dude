Map gameMap = new Map();
PacDude Player;

void setup() {
  //Map gameMap = new Map();
  size(700,775);
  fill(255,255,0);
  Player = new PacDude(2,2);
}

void draw() {
  background(0);
  fill(255,255,0);
  if(Player.getDirection() == "Up") {arc(Player.getXPos()*28, Player.getYPos()*31, 50, 50, radians(300), radians(600));}
  else if(Player.getDirection() == "Down") {arc(Player.getXPos()*28, Player.getYPos()*31, 50, 50, radians(120), radians(420));}
  else if(Player.getDirection() == "Left") {arc(Player.getXPos()*28, Player.getYPos()*31, 50, 50, radians(210), radians(510));}
  else if(Player.getDirection() == "Right") {arc(Player.getXPos()*28, Player.getYPos()*31, 50, 50, radians(30), radians(330));}
}

void keyPressed() {
  if (key == CODED) {
    if(keyCode == UP && !Player.nextToBlock("Up")) {
      Player.setDirection("Up");
      Player.setYPos(Player.getYPos()-1);
    } else if (keyCode == DOWN && !Player.nextToBlock("Down")) {
      Player.setDirection("Down");
      Player.setYPos(Player.getYPos()+1);
    } else if (keyCode == LEFT && !Player.nextToBlock("Left")) {
      Player.setDirection("Left");
      Player.setXPos(Player.getXPos()-1);
    } else if (keyCode == RIGHT && !Player.nextToBlock("Right")) {
      Player.setDirection("Right");
      Player.setXPos(Player.getXPos()+1);
    }
  }
}
