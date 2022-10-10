class Cell {
  
 int xPos;
 int yPos;
 boolean state;
 
 Cell(int tempXPos, int tempYPos, boolean tempState) {
   xPos = tempXPos;
   yPos = tempYPos;
   state = tempState;
 }

 void setAlive() {
  state = true;
 }

 void setDead() {
  state = false;
 }
 
 void setState(boolean newState) {
  state = newState;
 }
 
 
}
