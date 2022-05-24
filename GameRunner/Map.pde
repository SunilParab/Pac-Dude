public class Map{ 
  
  int height; 
  int width; 
  int[][] map; 
  final int empty = 0; 
  final int pellet = 1; 
  final int powerPellet = 2; 
  final int wall = 3; 
  final int ghostOnly = 4; 
  final int teleportWall = 5; 
  
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
  
  // will attempt to fill the empty spaces within the map with pellets 
  public void generatePellets(int[][] nums){ 
    for(int i =0; i < nums.length; i++){ 
      for(int j =0; j < nums[i].length; j++){ 
        if(nums[i][j] == 0) nums[i][j] = 1; 
      } 
    } 
  }
  
  public String toString(){ 
     for(int i =0; i < nums.length; i++){ 
      for(int j =0; j < nums[i].length; j++){ 
        System.out.print(nums[i][j]); 
      } 
      System.out.print("");; 
    } 
  
    
  
  
  
  
 
   
  
  
  

  
} 
