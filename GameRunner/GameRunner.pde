import processing.sound.*; //<>// //<>//
import java.util.*;


Map gameMap;
PacDude Player;
int score = 0; 
Ghost[] Ghosts; 
int Lives;
boolean started;
int modetimer;
String mode;

int soundtimer = 600; 
SoundFile file; 
SoundFile pellet; 
SoundFile eyes; 

void setup() {
  Lives = 3;
  gameMap = new Map();
  Player = new PacDude(1, 1);
  size(729, 729);
  started = false;
  PrintStart();

  Ghosts = new Ghost[4];
  Ghosts[0] = new Blinky(13, 11);
  Ghosts[1] = new Clyde(15, 13);
  Ghosts[2] = new Inky(13, 13);
  Ghosts[3] = new Pinky(11, 13);
  modetimer = 600;
  mode = "Scatter";
  file = new SoundFile(this, "vov.wav"); // starter music 
  pellet = new SoundFile(this, "nopp.wav");
  eyes = new SoundFile(this, "neva.wav");

  file.play();
}

void draw() {
  if (!started) {
    PrintStart();
  } else if (Player.getPelletsEaten() != gameMap.getPellets() && Lives > 0) {
    modetimer--;

    if (modetimer <= 0) {
      if (mode.equals("Scatter")) {
        mode = "Chase";
      } else {
        mode = "Scatter";
      }
      modetimer = 600;
    }
    PrintMap();
    fill(255, 255, 0);
    Player.drawSelf();
    for (int i = 0; i < Ghosts.length; i ++) {
      Ghosts[i].drawSelf();
      // if the player has special then the ghost will die 
      // however this ability only last for a mode timer of 510, or 8.5 seconds 
      if (Player.getSpecial()) {
        if (Ghosts[i].alive && !Ghosts[i].eaten && abs(Ghosts[i].getTrueXPos() - Player.getTrueXPos()) <= Player.radius + Ghosts[i].radius && abs(Ghosts[i].getTrueYPos() - Player.getTrueYPos()) <= Player.radius + Ghosts[i].radius) {
          Ghosts[i].respawn();
          int ghostseaten = 0;
          for (int j = 0; j < Ghosts.length; j++) {
            if (Ghosts[j].eaten || !Ghosts[j].alive) {
              ghostseaten++;
            }
          }
        } else if (Ghosts[i].alive && abs(Ghosts[i].getTrueXPos() - Player.getTrueXPos()) <= Player.radius + Ghosts[i].radius && abs(Ghosts[i].getTrueYPos() - Player.getTrueYPos()) <= Player.radius + Ghosts[i].radius) {
          respawn();
        }
      } else {
        if (Ghosts[i].alive && abs(Ghosts[i].getTrueXPos() - Player.getTrueXPos()) <= Player.radius + Ghosts[i].radius && abs(Ghosts[i].getTrueYPos() - Player.getTrueYPos()) <= Player.radius + Ghosts[i].radius) {
          respawn();
        }
      }
    }
  } else {
    PrintEnd();
  }
}


void keyPressed() {
  if (!started) {
    if (key == ENTER) {
      started = true;
    }
  } else {
    if (key == CODED) {
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
  }
}


void PrintMap() {
  background(0);

  for (int i =0; i < 28; i ++) { 
    for (int j= 0; j < 27; j++) { 
      if (gameMap.getVal(i, j) == 1) { 
        fill(0, 0, 255);
        rect(i * 26, j * 26, 26, 26);
      }
      if (gameMap.getVal(i, j) == 2) { 
        fill(255); 
        circle(i * 26 + 13, j * 26 + 13, 5 );
      }

      if (gameMap.getVal(i, j) == 3) { 
        if ((!(modetimer % 10 ==0)) ) {
          fill(255, 255, 0);
          circle(i * 26 + 13, j * 26 + 13, 14);
        }
      }
    }
  }

  textSize(20);
  fill(255, 255, 0);

  text("Score: " + score, 80, 725);
  text("Lives: " + Lives, 400, 725);
}

void PrintStart() {
  background(0);
  textSize(80);
  fill(0, 128, 255);
  text("PacDude", 195, 200);
  textSize(30);
  fill(255);
  text("Press Enter to Play", 230, 500);
  fill(255, 255, 0);
  arc(370, 350, 50, 50, radians(30), radians(330));
}

void PrintEnd() {
  background(0);
  textSize(80);
  fill(0, 128, 255);
  text("Game Over", 150, 200);
  textSize(30);
  fill(255);
  text("Now Get Out", 275, 500);
}

void respawn() {
  Lives--;
  if (Lives != 0) {
    Player = new PacDude(1, 1, Player.getPelletsEaten());
    Ghosts[0] = new Blinky(13, 11);
    Ghosts[1] = new Clyde(15, 13);
    Ghosts[2] = new Inky(13, 13);
    Ghosts[3] = new Pinky(11, 13);
    modetimer = 600;
    mode = "Scatter";
  }
}
