Map gameMap;
PacDude Player;
Inky ghost1; 
Blinky ghost2; 
Pinky ghost3; 
int score = 0; 

int movecounter;
boolean started;

void setup() {
  gameMap = new Map();
  Player = new PacDude(1, 1);
  size(729, 729);
  started = false;
  PrintStart();
  ghost1 = new Inky(12, 16);
  ghost2 = new Blinky(4, 21);
  ghost3 = new Pinky(21, 16);
  frameCount = 60;
}

void draw() {
  System.out.println(Player.getPelletsEaten() +" " + gameMap.getPellets());
  if(!started) {
    PrintStart();
  } else if(Player.getPelletsEaten() != gameMap.getPellets()) {
    PrintMap();
    fill(255, 255, 0);
    Player.drawPacDude();
  } else {
    PrintEnd();
  }

  if (frameCount % 25 == 0) {
    ghost1.chase();
    ghost2.chase();
    ghost3.chase();
  }

  fill(255, 0, 0);
  circle(ghost1.getXPos()*26+13, ghost1.getYPos()*26+13, 15);
  fill(0, 255, 0);
  circle(ghost2.getXPos()*26+13, ghost2.getYPos()*26+13, 15);
  fill(0, 255, 255);
  circle(ghost3.getXPos()*26+13, ghost3.getYPos()*26+13, 15);
  
  score = Player.getPelletsEaten() * 10;
  
}

void keyPressed() {
  if (!started) {
    if (key == ENTER) {
      started = true;
    }
  } else {
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
    textSize(20);
    fill(255,0,255);

    text("Score: " + score,80,725);
    text("lives: ",400,725);


}

void PrintStart() {
  background(0);
  textSize(80);
  fill(0,128,255);
  text("PacDude",195,200);
  textSize(30);
  fill(255);
  text("Press Enter to Play",230,500);
  fill(255,255,0);
  arc(370, 350, 50, 50, radians(30), radians(330));
}

void PrintEnd() {
  background(0);
  textSize(80);
  fill(0,128,255);
  text("Game Over",150,200);
  textSize(30);
  fill(255);
  text("Now Get Out",275,500);
}
