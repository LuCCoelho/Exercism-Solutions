class Minesweeper {
  var minefield;
  int rowCount = 0;
  int columnCount = 0;

  Minesweeper(List<String> minefield) {
    if (minefield.length == 0) {
      this.minefield = [];
    } else {
      this.minefield = minefield;
      this.rowCount = minefield.length;
      this.columnCount = minefield[0].length;
    }
  } 

  List<String> get annotated {
    // Parse minefield - transform into a matrix of integers

      var parsedField = this.parseMinefield();
    
    // Add mine count - check the adjacent squares of each square
    // that does not have a bomb and count how many of them have bombs

      var calculatedField = this.addMineCount(parsedField);

    // Format minefield - transforms back into a list o Strings

      return this.formatCalculatedField(calculatedField);
    
  }

  /**
   * This method is going to accept a list of integers in the format
   * [[1,-1,2,-1,1]] and return ['1*2*1']
   * or
   * [[-1,-1,-1],[-1,8,-1],[-1,-1,-1]] and return ['***', '*8*', '***']
   */
  List<String> formatCalculatedField(List<List<int>>calculatedField) {
    List<String> formatedField = [];
    for (int i = 0; i < rowCount; i++) {
      formatedField.add('');
      for (int j = 0; j < columnCount; j++) {
        int square = calculatedField[i][j];
        if (square == -1) {
          formatedField[i] += '*';
        }
        if (square == 0) {
          formatedField[i] += ' ';
        } 
        if (square > 0) {
          formatedField[i] += '$square';
        }
      }
    }
    return formatedField;
  }

  /**
   * This method is going to parse this.minefield in the following way
   * ['   ', ' * ', '   '] will return [[0,0,0],[0,-1,0],[0,0,0]]
   * or
   * ['*   *'] will return [[-1,0,0,0,-1]]
   */
  List<List<int>> parseMinefield() {
    List<List<int>> parsedField = [];
    for (int i = 0; i < rowCount; i++) {
      parsedField.add([]);
      for (int j = 0; j < columnCount; j++) {
        String square = this.minefield[i][j];
        if (square == '*'){
          parsedField[i].add(-1);
        } else {
          parsedField[i].add(0);
        }
      }
    }
    return parsedField;
  }

  /**
   * This method is going to accept a list of integers in the format
   * [[0,0,0],[0,-1,0],[0,0,0]] and return [[1,1,1],[1,-1,1],[1,0,0]]
   * or
   * [[-1,-1,-1],[-1,8,-1],[-1,-1,-1]] and return ['***', '*8*', '***']
   */
  List<List<int>> addMineCount(List<List<int>> parsedField) {
    for (int x = 0; x < rowCount; x++){
      for (int y = 0; y < columnCount; y++) {
        if (parsedField[x][y] != -1) {
          List<List<int>> neighbors = getNeighbors(x, y);
          int mineCount = 0;
          for (List<int> neighbor in neighbors) {
            int neighborX = neighbor[0];
            int neighborY = neighbor[1];
            if (parsedField[neighborX][neighborY] == -1) {
              mineCount += 1;
            }
          }
          parsedField[x][y] = mineCount;
        }
      }
    }
    return parsedField;
  }


  /**
   * This method accepts two integers that represent coordinates in
   * the format
   * 1, 2 and return [[0,2],[0,1],[1,1],[2,1],[2,2]] if the matrix is 3x3
   * or
   * 1, 2 and return [[0,2],[0,1],[1,1]] if the matrix is 2x3
   */
  List<List<int>> getNeighbors(int x, int y) {
    List<List<int>> neighbors = [];

    if (x-1 >= 0) {
      List<int> neighborTop = [x-1, y];
      neighbors.add(neighborTop);

      if (y-1 >= 0) {
        List<int> neighborLeftTop = [x-1, y-1];
        neighbors.add(neighborLeftTop);
      }

      if (y+1 < columnCount) {
        List<int> neighborRightTop = [x-1, y+1];
        neighbors.add(neighborRightTop);
      }
    }

    if (y-1 >= 0) {
      List<int> neighborLeft = [x, y-1];
      neighbors.add(neighborLeft);

      if (x+1 < rowCount) {
        List<int> neighborLeftBottom = [x+1, y-1];
        neighbors.add(neighborLeftBottom);
      }
    }

    if (y+1 < columnCount) {
      List<int> neighborRight = [x, y+1];
      neighbors.add(neighborRight);

      if (x+1 < rowCount) {
        List<int> neighborRightBottom = [x+1, y+1];
        neighbors.add(neighborRightBottom);
      }
    }

    if (x+1 < rowCount) {
      List<int> neighborBottom = [x+1, y];
      neighbors.add(neighborBottom);
    }

    return neighbors;
  }
}