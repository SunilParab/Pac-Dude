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
SoundFile eye; 
SoundFile death; 
SoundFile rain;
int count;

PImage wall;
PImage fire;
PImage leftred; 
PImage leftyellow;
PImage rightblue;
PImage rightpink;
PImage victorymap;
PImage yup;

void setup() {
  Lives = 3;
  gameMap = new Map();
  Player = new PacDude(1, 1);
  size(729, 729);
  started = false;
  fire = loadImage("firevillage.gif");
  leftred = loadImage("redGhostLeft.png");
  leftyellow = loadImage("yellowLeft.png");
  rightblue = loadImage("blueRight.png");
  rightpink = loadImage("pinkRight.png");
  victorymap = loadImage("victorymap.jpg");
  yup = loadImage("yup.jpg");

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
  eye = new SoundFile(this, "neva.wav");
  death = new SoundFile(this, "op.wav");
  wall = loadImage("walll.jpg");
  rain = new SoundFile(this, "rain.wav");


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
          death.play();
        }
      } else {
        if (Ghosts[i].alive && abs(Ghosts[i].getTrueXPos() - Player.getTrueXPos()) <= Player.radius + Ghosts[i].radius && abs(Ghosts[i].getTrueYPos() - Player.getTrueYPos()) <= Player.radius + Ghosts[i].radius) {
          respawn();
          death.play();
        }
      }
    }
  } else {
    PrintEnd();
    if (count == 0) {
      rain.play(); 
      count++;
    }
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
        fill(0, 255, 100);
        image(wall, i* 26, j *26 );
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
  background(fire);
  textSize(80);
  fill(0, 128, 255);
  text("Pac-Dude", 195, 200);

  fill(255);

  textSize(15);

  text("Everyone from your village has been killed by evil ghosts.", 155, 475);
  text("However you can go back in time and stop it from happening.", 140, 500);
  text("To get this power, you must first collect all the pellets!", 159, 525);

  image(leftyellow, 425, 350); 
  image(leftred, 475, 350); 
  image(rightblue, 295, 350); 
  image(rightpink, 245, 350); 
  textSize(30);
  fill(255);
  text("Press Enter to Play", 230, 700);
  fill(255, 255, 0);
  arc(370, 350, 50, 50, radians(30), radians(330));
}

void PrintEnd() {

  file.stop(); 
  pellet.stop(); 
  eye.stop();
  death.stop();

  if (gameMap.getPellets() - Player.getPelletsEaten() == 0) { 
    background(victorymap);

    textSize(50);
    fill(255, 0, 150);
    text("Congratulations Pac-Dude!", 50, 350);
    fill(255, 0, 0);
    textSize(40);
    text("You Saved Everyone!", 175, 400);
  } 

  if (gameMap.getPellets() - Player.getPelletsEaten() != 0) {
    background(yup);
  }
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
    pellet.stop();
  }
}
