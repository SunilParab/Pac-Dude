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
  arc(50, 50, Player.getXPos()*28, Player.getYPos()*31,QUARTER_PI, PI+HALF_PI+QUARTER_PI, PIE);
}
