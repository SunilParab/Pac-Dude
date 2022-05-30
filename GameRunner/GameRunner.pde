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
  System.out.println(Player.getPelletsEaten() +" " + gameMap.getPellets());
  PrintMap();
  fill(255, 255, 0);
  Player.drawPacDude();
}

void keyPressed() {
  if (key == CODED) {
    if(keyCode == UP) {
      Player.setQueuedDirection("Up");
    } else if (keyCode == DOWN) {
      Player.setQueuedDirection("Down");
    } else if (keyCode == LEFT) {
      Player.setQueuedDirection("Left");
    } else if (keyCode == RIGHT) {
      Player.setQueuedDirection("Right");
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
      if (gameMap.getVal(i, j) == 2) { 
        fill(255); 
        circle(j * 26 + 13, i * 26 + 13, 5 );
      }
    }
  }
}
