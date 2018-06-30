void keyPressed() {
  if (phase==0) {
    if (keyCode==ENTER) {
      resetCell();
      makeCell();
    }
  } else if (phase==1) {
  } else if (phase==2) {
  } else if (phase==3) {
    switch (keyCode) {
    case RIGHT:
      rankName.change(0);
      break;
    case LEFT:
      rankName.change(1);
      break;
    case UP:
      rankName.change(2);
      break;
    case DOWN:
      rankName.change(3);
      break;
    case ENTER:
      rankName.write(rankRenew);
      phase=4;
      break;
    }
  } else if (phase==4) {
    phase = 0;
  }
}

void mousePressed() {
  if (phase==0) {
    phase++;
    makeCell();
    time = 1800;
    rankRenew = -1;
  } else if (phase==1) {
    if (waitPhase==0) {
      for (int j=0; j<cellSize; j++) {
        for (int i=0; i<cellSize; i++) {
          if (mouseY>j*60&&mouseY<(j+1)*60) {
            if (mouseX>i*60&&mouseX<(i+1)*60) {
              handCell.setHand(cell.get(j*cellSize+i).cellColor, j*cellSize+i);
              cell.get(j*cellSize+i).cellColor=0;
            }
          }
        }
      }
    }
  } else if (phase==2) {
  } else if (phase==3) {
  } else if (phase==4) {
    phase = 0;
  }
}

void mouseReleased() {
  if (waitPhase==0) {
    if (handCell.mouseOn==1) {
      handCell.releaseHand();
      waitPhase=1;
      waitCount=waitTime;
      deleteCheck();
    }
    /*
    deleteCheckCell();
     spotReset();
     cellFall();
     putCell();
     */
  }
}

