public class Map{ 
  
  int height; 
  int width; 
  int[][] map; 
  final int empty = 0; 
  final int pellet = 1; 
  final int powerPellet = 2; 
  final int wall = 3; 
  final int ghostOnly = 4; 
  final int teleportWall; 
  
  int[][] preset = new int[][]
                   { {1,1,1,1,1,1,1,1,1,1},
                     {1,0,0,0,0,0,0,0,0,1}, 
                     {1,0,0,0,0,0,0,0,0,1}, 
                     {1,0,0,0,0,0,0,0,0,1}, 
                     {1,0,0,0,0,0,0,0,0,1}, 
                     {1,0,0,0,0,0,0,0,0,1}, 
                     {1,1,1,1,1,1,1,1,1,1} }; 
  
  
  
  
  
  public Map(){ 
    map = new int[31][29];
  } 
  
  public Map(int hi,int wi){ 
    map = new int[hi][wi]; 
  }
  
  
  
  
 
   
  
  
  

  
} 
