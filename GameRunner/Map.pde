public class Map {

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
    {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1},
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1},
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1},
    {1, 4, 4, 4, 4, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 4, 4, 4, 4, 1},
    {1, 4, 4, 4, 4, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 4, 4, 4, 4, 1},




};


  public Map() {
    map = preset;
  }

  public Map(int hi, int wi) {
    map = new int[hi][wi];
  }

  // will attempt to fill the empty spaces within the map with pellets
  public void generatePellets(int[][] nums) {
    for (int i =0; i < nums.length; i++) {
      for (int j =0; j < nums[i].length; j++) {
        if (nums[i][j] == 0) nums[i][j] = 1;
      }
    }
  }

  // will print out the map for debugging purposes
  public String toString() {
    String temp = "";
    for (int i =0; i < map.length; i++) {
      for (int j =0; j < map[i].length; j++) {
        if(map[i][j] == 1){
          temp += "x";
        }
        if(map[i][j] == 4 || map[i][j] == 0){
          temp += " ";
        }
        if(map[i][j] == 2){
          temp += "*";
        }
      }
      temp += "\n";
    }
    return temp;
  }





}
