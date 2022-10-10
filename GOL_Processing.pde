int N = 10;
Grid GRID = new Grid(N);
Grid NEXTGEN;
boolean EDITING = true;
boolean RUNNING = !EDITING;

void setup() {
  
  size(800, 800);
  background(0);
  
  GRID.drawMe();
  
}

void draw() {
  
  if(RUNNING) {
   GRID = GRID.getNextGen();
   GRID.drawMe();
   delay(100);
  }
  
}

void mousePressed() {
  // Fill or unfill cell by mousepress
  if(EDITING) {
    GRID.updateEditing();
  }
  
  
  
}

void keyPressed() {
 
  
  // Clear grid in editing mode
  if(EDITING && key == 'c' || key == 'C') {
   GRID = new Grid(N);
   GRID.drawMe();
  }
  
  // Enter editing mode and leave running mode or other way around
  if(key == 'e' || key == 'E' || key == ' ') {
     RUNNING = !RUNNING;
     EDITING = !EDITING;
     println("Editing: " + EDITING);
  }
  
  // Change theme, light->dark, dark->light
  if(EDITING && key == 't' || key == 'T') {
    
    GRID.themeSetDark();
    GRID.drawMe();
    
  }
  
  // one step forward
  if(EDITING && key == 's' || key == 'S') {
    GRID = GRID.getNextGen();
    GRID.drawMe();
  }
  
  // edit N with arrow keys betwenn 10 and 100, only when EDITING, will delete cells
  if(EDITING && key == CODED) {
   if(N <= 100 && keyCode == 38) {
    clear();
     N+=10;
     GRID = new Grid(N);
     GRID.drawMe();
     println(N);
   }
   
   
   
   if(N > 10 && keyCode == 40) {
     clear();
     N-=10;
     GRID = new Grid(N);
     GRID.drawMe();
     println(N);
   }
   
  }
  
  // Exit program
  if(key == 'x' || key == 'X') {
    exit(); 
  }
  
}
   
  
