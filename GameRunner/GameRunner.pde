Map gameMap;
PacDude Player;
Ghost ghost1; 
int movecounter;

void setup() {
  gameMap = new Map();
  Player = new PacDude(1, 1);
  size(729, 703); 
  PrintMap();
}

void draw() {
  PrintMap();
  fill(255, 255, 0);
  float anglestart = 0;
  float angleend = 0;
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
      arc(Player.getXPos()*26+13, Player.getYPos()*26+13+26*movecounter/20, 26, 26, radians(anglestart), radians(angleend));
    } else if (Player.getDirection() == "Down") {
      arc(Player.getXPos()*26+13, Player.getYPos()*26+13-26*movecounter/20, 26, 26, radians(anglestart), radians(angleend));
    } else if (Player.getDirection() == "Left") {
      arc(Player.getXPos()*26+13+26*movecounter/20, Player.getYPos()*26+13, 26, 26, radians(anglestart), radians(angleend));
    } else if (Player.getDirection() == "Right") {
      arc(Player.getXPos()*26+13-26*movecounter/20, Player.getYPos()*26+13, 26, 26, radians(anglestart), radians(angleend));
    }
    movecounter--;
  } else {
    arc(Player.getXPos()*26+13, Player.getYPos()*26+13, 26, 26, radians(anglestart), radians(angleend));
  }
}

void keyPressed() {
  System.out.println(""+Player.nextToBlock("Right")+" "+Player.getXPos());
  if (key == CODED) {
    if (keyCode == UP && !Player.nextToBlock("Up")) {
      Player.setDirection("Up");
      Player.setYPos(Player.getYPos()-1);
      if (gameMap.getVal(Player.getYPos(), Player.getXPos()) == 2) {
        gameMap.setVal(Player.getXPos(), Player.getYPos(), 0); 
        Player.eatPellet();
      } 
      movecounter = 20;
    } else if (keyCode == DOWN && !Player.nextToBlock("Down")) {
      Player.setDirection("Down");
      Player.setYPos(Player.getYPos()+1);
      if (gameMap.getVal(Player.getYPos(), Player.getXPos()) == 2) {
        gameMap.setVal(Player.getXPos(), Player.getYPos(), 0); 
        Player.eatPellet();
      } 
      movecounter = 20;
    } else if (keyCode == LEFT && !Player.nextToBlock("Left")) {
      Player.setDirection("Left");
      Player.setXPos(Player.getXPos()-1);
      if (gameMap.getVal(Player.getYPos(), Player.getXPos()) == 2) {
        gameMap.setVal(Player.getXPos(), Player.getYPos(), 0); 
        Player.eatPellet();
      }
      movecounter = 20;
    } else if (keyCode == RIGHT && !Player.nextToBlock("Right")) {
      Player.setDirection("Right");
      Player.setXPos(Player.getXPos()+1);
      if (gameMap.getVal(Player.getYPos(), Player.getXPos()) == 2) {
        gameMap.setVal(Player.getXPos(), Player.getYPos(), 0); 
        Player.eatPellet();
      } 
      movecounter = 20;
    }
  }
}

void PrintMap() {
  background(0);
  for (int i =0; i < 27; i ++) { 
    for (int j= 0; j < 28; j++) { 
      if (gameMap.getVal(i, j) == 1) { 
        stroke(255);
        fill(0, 0, 255);
        rect(j * 26, i * 26, 26, 26);
      }
      if (gameMap.getVal(i, j) == 2 || gameMap.getVal(i, j) == 5) { 
        fill(255); 
        circle(j * 26 + 13, i * 26 + 13, 5 );
      }
    }
  }
}
