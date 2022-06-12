import processing.sound.*; //<>//
import java.util.*;

Map gameMap;
PacDude Player;
int score = 0; 
Ghost[] Ghosts; 
int Lives;
boolean started;
boolean won;
boolean lost;
int modetimer;
String mode;
int startDelay;

int soundtimer = 600; 
SoundFile file; 
SoundFile pellet; 
SoundFile eye; 
SoundFile death; 

//these lines break smt
//PImage red = loadImage("redGhostUp.png");
//PImage orange = loadImage("yellowUp.png");
//PImage blue = loadImage("blueUp.png");
//PImage pink = loadImage("pinkUp.png");

void setup() {
  Lives = 3;
  gameMap = new Map();
  Player = new PacDude(13, 16);
  size(729, 729);
  started = false;
  won = false;
  lost = false;
  PrintStart();
  startDelay = 180;

  Ghosts = new Ghost[4];
  Ghosts[0] = new Blinky(13, 11);
  Ghosts[1] = new Clyde(15, 13);
  Ghosts[2] = new Inky(13, 13);
  Ghosts[3] = new Pinky(11, 13);
  modetimer = 600;
  mode = "Scatter";
  file = new SoundFile(this, "vov.wav"); // starter music 
  pellet = new SoundFile(this, "nopp.wav");
  eye = new SoundFile(this, "neva.wav");
  death = new SoundFile(this, "op.wav");

  

  file.play();
}

void draw() {
  if (won) {
    gameMap = new Map();
    Player = new PacDude(13, 16);
    won = false;
    Ghosts = new Ghost[4];
    Ghosts[0] = new Blinky(13, 11);
    Ghosts[1] = new Clyde(15, 13);
    Ghosts[2] = new Inky(13, 13);
    Ghosts[3] = new Pinky(11, 13);
    modetimer = 600;
    mode = "Scatter";
    startDelay = 180;
  }
  if (!started) {
    PrintStart();
  } else if (!lost) {
    if (startDelay > 0) {
      startDelay--;
      PrintMap();
      //image(red, 3 + 13*26, 11*26+26 + 3);
      //do this for the other three ghosts
      arc(13*26+13, 16*26+13, 22, 22, radians(225), radians(495));
    } else {
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
        if (Ghosts[i].alive && dist(Player.getTrueXPos(),Player.getTrueYPos(),Ghosts[i].getTrueXPos(),Ghosts[i].getTrueYPos()) <= 20) {
          if (Player.getSpecial() && !Ghosts[i].eaten) {
            Ghosts[i].respawn();
            int ghostseaten = 0;
            for (int j = 0; j < Ghosts.length; j++) {
              if (Ghosts[j].eaten || !Ghosts[j].alive) {
                ghostseaten++;
              }
            }
            score += Math.pow(2,ghostseaten) * 100;
          } else {
            respawn();
            death.play();
          }
        }
      }
      won = Player.getPelletsEaten() == gameMap.getPellets();
      lost = Lives <= 0;
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
  } else if (lost) {
    if (key == ENTER) {
      Lives = 3;
      gameMap = new Map();
      Player = new PacDude(13, 16);
      score = 0;
      size(729, 729);
      started = true;
      won = false;
      lost = false;
      Ghosts = new Ghost[4];
      Ghosts[0] = new Blinky(13, 11);
      Ghosts[1] = new Clyde(15, 13);
      Ghosts[2] = new Inky(13, 13);
      Ghosts[3] = new Pinky(11, 13);
      modetimer = 600;
      mode = "Scatter";
      startDelay = 180;
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
  
    fill(255);

    textSize(15);

    text("Everyone from your village has been killed by evil ghosts.", 155, 475);
    text("However you can go back in time and stop it from happening.", 140, 500);
    text("To get this power, you must first collect all the pellets!", 159, 525);

  
  
  
  
  textSize(30);
  fill(255);
  text("Press Enter to Play", 230, 700);
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
  
  file.stop(); 
  pellet.stop(); 
  eye.stop(); 
}

void respawn() {
  Lives--;
  if (Lives != 0) {
    Player = new PacDude(13, 16, Player.getPelletsEaten());
    Ghosts = new Ghost[4];
    Ghosts[0] = new Blinky(13, 11);
    Ghosts[1] = new Clyde(15, 13);
    Ghosts[2] = new Inky(13, 13);
    Ghosts[3] = new Pinky(11, 13);
    modetimer = 600;
    mode = "Scatter";
    startDelay = 180;
  }
}
