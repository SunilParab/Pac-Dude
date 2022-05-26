Map gameMap;
PacDude Player;

void setup() {
  Map gameMap = new Map();
  size(700,775);
  fill(255,255,0);
  Player = new PacDude(1,1);
}

void draw() {
  background(0);
  fill(255,255,0);
  arc(Player.getXPos()*28, Player.getYPos()*31, 50, 50, radians(30), radians(330));
}

void keyPressed() {
  if (key == CODED) {
    if(keyCode == UP) {
      Player.setYPos(Player.getYPos()-1);
    } else if (keyCode == DOWN) {
      Player.setYPos(Player.getYPos()+1);
    } else if (keyCode == LEFT) {
      Player.setXPos(Player.getXPos()-1);
    } else if (keyCode == RIGHT) {
      Player.setXPos(Player.getXPos()+1);
    }
  }
}
