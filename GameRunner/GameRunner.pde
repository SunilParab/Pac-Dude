Map gameMap;
PacDude Player;

void setup() {
  gameMap = new Map();
  Player = new PacDude(1,1);
  size(729, 702); 
  PrintMap();
}

void draw() {
  PrintMap();
  fill(255,255,0);
  if(Player.getDirection() == "Up") {arc(Player.getXPos()*26+13, Player.getYPos()*26+13, 26, 26, radians(300), radians(600));}
  else if(Player.getDirection() == "Down") {arc(Player.getXPos()*26+13, Player.getYPos()*26+13, 26, 26, radians(120), radians(420));}
  else if(Player.getDirection() == "Left") {arc(Player.getXPos()*26+13, Player.getYPos()*26+13, 26, 26, radians(210), radians(510));}
  else if(Player.getDirection() == "Right") {arc(Player.getXPos()*26+13, Player.getYPos()*26+13, 26, 26, radians(30), radians(330));}
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

void PrintMap() {
  background(0);
  for(int i =0; i < 27; i ++){ 
    for(int j= 0; j < 28; j++){ 
        if(gameMap.getVal(i,j) == 1){ 
         stroke(255);
         fill(0,0,255);
         rect(j * 26, i * 26, 26, 26);
        } 
    } 
  } 
}
