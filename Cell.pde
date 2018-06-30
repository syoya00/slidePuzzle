class Cell {
  int posX;
  int posY;
  int cellColor;
  int cellNum;
  Cell(int x, int y, int c, int n) {
    posX = x;
    posY = y;
    cellColor = c;
    cellNum =n;
  }
  void display() {
    noStroke();
    switch (cellColor) {
    case 0:
      noFill();
      break;
    case 1:
      fill(255, 0, 0);
      break;
    case 2:
      fill(0, 255, 0);
      break;
    case 3:
      fill(0, 0, 255);
      break;
    case 4:
      fill(255, 255, 0);
      break;
    case 5:
      fill(0, 255, 255);
      break;
    case 6:
      fill(255, 0, 255);
      break;
    }
    if (cellColor==0) {
      //println(0);
    }
    rect(posX*60+5, posY*60+5, 50, 50);
    noFill();
  }
}

void makeCell() {
  for (int j=0; j<cellSize; j++) {
    for (int i=0; i<cellSize; i++) {
      cell.add(new Cell(i, j, int(random(1, cellVar)), j*cellSize+i));
    }
  }
}


void resetCell() {
  for (int j=0; j<cellSize; j++) {
    for (int i=0; i<cellSize; i++) {
      cell.remove(0);
    }
  }
}

void exchange(int now, int after) {
  sound[4].rewind();
  sound[4].play();
  cell.get(after).cellColor = cell.get(now).cellColor;
  cell.get(now).cellColor = 0;
  handCell.handNum = now;
  //println("exchanged : " + now + " to " + after);
}

boolean deleteCheck() {
  boolean result=false;
  for (int j=0; j<cellSize; j++) {
    for (int i=0; i<cellSize; i++) {
      cellSpot[i][j] = 0;
    }
  }
  for (int j=0; j<cellSize; j++) {
    for (int i=0; i<cellSize; i++) {
      if (i+2<cellSize) {
        if (cell.get(j*cellSize+i).cellColor==cell.get(j*cellSize+i+1).cellColor&&cell.get(j*cellSize+i).cellColor==cell.get(j*cellSize+i+2).cellColor) {
          cellSpot[i][j] = 1;
          cellSpot[i+1][j] = 1;
          cellSpot[i+2][j] = 1;
          result=true;
        }
      }
    }
  }
  for (int j=0; j<cellSize; j++) {
    for (int i=0; i<cellSize; i++) {
      if (j+2<cellSize) {
        if (cell.get(j*cellSize+i).cellColor==cell.get(j*cellSize+i+cellSize).cellColor&&cell.get(j*cellSize+i).cellColor==cell.get(j*cellSize+i+2*cellSize).cellColor) {
          cellSpot[i][j] = 1;
          cellSpot[i][j+1] = 1;
          cellSpot[i][j+2] = 1;
          result=true;
        }
      }
    }
  }
  return result;
}

void deleteCheckCell() {
  deleteNum = 0;
  for (int j=0; j<cellSize; j++) {
    for (int i=0; i<cellSize; i++) {
      if (cellSpot[i][j]==1) {
        cell.get(j*cellSize+i).cellColor = 0;
        deleteNum++;
      }
    }
  }
  println(deleteNum);
}

void spotReset() {
  for (int j=0; j<cellSize; j++) {
    for (int i=0; i<cellSize; i++) {
      cellSpot[i][j]=0;
    }
  }
}

void cellFall() {
  for (int i=0; i<cellSize; i++) {
    for (int j=1; j<cellSize; j++) {
      if (cell.get(j*cellSize+i).cellColor==0) {
        for (int k=0; k<j; k++) {
          cell.get((j-k)*cellSize+i).cellColor=cell.get((j-k-1)*cellSize+i).cellColor;
        }
        cell.get(i).cellColor=0;
      }
    }
  }
}

void putCell() {
  for (int j=0; j<cellSize; j++) {
    for (int i=0; i<cellSize; i++) {
      if (cell.get(j*cellSize+i).cellColor==0) {
        cell.get(j*cellSize+i).cellColor=int(random(1, cellVar));
      }
    }
  }
}

