Map gameMap;

void setup() {
  size(729, 702); 
  background(0);

  Map gameMap = new Map();
  
  
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

void draw() {
  
}
