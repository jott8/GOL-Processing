class Grid {
  
 int n;
 Cell[][] cells;
 boolean lightTheme = true;
 color colorAlive = 0;
 color colorDead = 255;
 color strokeColor = 150;
  
  Grid(int tempN){
    n = tempN;
    cells = new Cell[n][n];
    
    for(int x = 0; x < n; x++) {
      for(int y = 0; y < n; y++) {
        cells[x][y] = new Cell(x, y, false);
      }
     }
    
  }

  void setTheme(boolean isLight) {
    if(isLight) {
      lightTheme = !lightTheme;
     
     colorDead = 255;
     colorAlive = 0;
     strokeColor = 100; 
    }
    if(!isLight) {
     lightTheme = !lightTheme;
     
     colorDead = 0;
     colorAlive = color(255, 153, 204);
     strokeColor = 100; 
    }

  }
  
  void drawMe() {
    float squareWidth = width/n;
  
    for(int x = 0; x < n; x++) {
      for(int y = 0; y < n; y++) {          
        stroke(strokeColor);
     
        if(!cells[x][y].state) {
          fill(colorDead);  
        }
        else{
          fill(colorAlive); 
        } 
        if(cells[x][y].state) {
        }
        else {
        }
        rect(x*squareWidth, y*squareWidth, squareWidth, squareWidth);     
      }
    }
  }
  
  void updateEditing() {
    int tempX = (int) mouseX / (width/n);
    int tempY = (int) mouseY / (width/n);
    
    if(tempX != 0 && tempX != n-1 && tempY != 0 && tempY != n-1) {
      if(cells[tempX][tempY].state) {
      cells[tempX][tempY].setDead();  
    }
      else {
        cells[tempX][tempY].setAlive(); 
      }
      drawMe();
    }
  }
 
  int countAliveNeighbours(Cell cell) {
    int count = 0;
    // Zeile darueber
        if(cell.yPos >= 1) {
            for(int i = cell.xPos-1 ; i <= cell.xPos+1 ; i++) {
                if(cells[i][cell.yPos-1].state && cell.xPos >= 1) {
                    count++;
                }
            }
        }
        
        // Zeile darunter
        for(int i = cell.xPos-1 ; i <= cell.xPos+1 ; i++) {
          
            if(cells[i][cell.yPos+1].state && cell.xPos >= 1) {
                count++;
            }
            
        }
        // Links
        if(cells[cell.xPos-1][cell.yPos].state && cell.xPos >= 1) {
            count++;;
        }
        // Rechts
        if(cells[cell.xPos+1][cell.yPos].state) {
            count++;
        }
    return count;
  }
  
  boolean willSurvive(int x, int y) {
    
    Cell cell = cells[x][y];
    
    int neighbours = countAliveNeighbours(cell);
   
    if(cell.state){
      if(neighbours == 2 || neighbours == 3) {
        return true; 
      }
      if(neighbours > 3 || neighbours < 2) {
        return false; 
      }
    }
    if(!cell.state && neighbours == 3) {
      return true; 
    }
    return false;
  }
  
 Grid getNextGen() {
  Grid nextGrid = new Grid(n);
  
  for(int x = 1 ; x < n-1 ; x++) {
    for(int y = 1 ; y < n-1 ; y++) {
     nextGrid.cells[x][y].setState(this.willSurvive(x, y));
    }
  }
   return nextGrid;
 }
}

  
