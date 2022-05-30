Map gameMap;
PacDude Player;
Ghost ghost1; 
Ghost ghost2; 
Ghost ghost3; 
Ghost ghost4; 

int movecounter;

void setup() {
  gameMap = new Map();
  Player = new PacDude(1, 1);
  ghost1 = new Inky(12, 13);
  frameCount = 60;
  size(729, 703); 
  PrintMap();
}

void draw() {
  System.out.println(Player.getYPos());
  PrintMap();
  fill(255, 255, 0);
  float anglestart = 0;
  float angleend = 0;
  if (movecounter == 0 && !Player.nextToBlock(Player.getQueuedDirection())) {
    Player.setDirection(Player.getQueuedDirection());
    Player.setQueuedDirection("None");
  }
  if (Player.getDirection() == "Up") {
    anglestart = 300; 
    angleend = 600;
  } else if (Player.getDirection() == "Down") {
    anglestart = 120; 
    angleend = 420;
  } else if (Player.getDirection() == "Left") {
    anglestart = 210; 
    angleend = 510;
  } else if (Player.getDirection() == "Right") {
    anglestart = 30; 
    angleend = 330;
  }
  if (movecounter > 0) {
    if (Player.getDirection() == "Up") {
      arc(Player.getXPos()*26+13, Player.getYPos()*26+13+26*movecounter/20, 22, 22, radians(anglestart), radians(angleend));
    } else if (Player.getDirection() == "Down") {
      arc(Player.getXPos()*26+13, Player.getYPos()*26+13-26*movecounter/20, 22, 22, radians(anglestart), radians(angleend));
    } else if (Player.getDirection() == "Left") {
      arc(Player.getXPos()*26+13+26*movecounter/20, Player.getYPos()*26+13, 22, 22, radians(anglestart), radians(angleend));
    } else if (Player.getDirection() == "Right") {
      arc(Player.getXPos()*26+13-26*movecounter/20, Player.getYPos()*26+13, 22, 22, radians(anglestart), radians(angleend));
    }
    movecounter--;
  } else {
    arc(Player.getXPos()*26+13, Player.getYPos()*26+13, 22, 22, radians(anglestart), radians(angleend));
    Player.move();
  }

  if (frameCount % 10 == 0) {
    ghost1.move();

  }

  fill(255, 0, 0);
  circle(ghost1.getXPos()*26+13, ghost1.getYPos()*26+13, 15);

}

void keyPressed() {

  if (keyCode == UP) {
    Player.setQueuedDirection("Up");
  } else if (keyCode == DOWN) {
    Player.setQueuedDirection("Down");
  } else if (keyCode == LEFT) {
    Player.setQueuedDirection("Left");
  } else if (keyCode == RIGHT) {
    Player.setQueuedDirection("Right");
  }
}


void PrintMap() {
  background(0);
  for (int i =0; i < 27; i ++) { 
    for (int j= 0; j < 28; j++) { 
      if (gameMap.getVal(i, j) == 1) { 
        fill(0, 0, 255);
        rect(j * 26, i * 26, 26, 26);
      }
      if (gameMap.getVal(i, j) == 2) { 
        fill(255); 
        circle(j * 26 + 13, i * 26 + 13, 5 );
      }
      if (gameMap.getVal(i, j) == 3) { 
        fill(255); 
        circle(j * 26 + 13, i * 26 + 13, 12 );
      }
    }
  }
}
