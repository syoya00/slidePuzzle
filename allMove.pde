void allMove() {
  if (phase==0) {
  } else if (phase==1) {
    if (waitPhase!=0) {
      if (waitPhase==1) {
        if (waitCount==0) {
          comboCount++;
          deleteCheckCell();
          waitPhase=2;
          waitCount=waitTime;
          if (comboCount<4) {
            sound[comboCount-1].rewind();
            sound[comboCount-1].play();
          } else {
            sound[3].rewind();
            sound[3].play();
          }
        }
      } else if (waitPhase==2) {
        if (waitCount==0) {
          spotReset();
          waitPhase=3;
          waitCount=waitTime;
        }
      } else if (waitPhase==3) {
        if (waitCount==0) {
          cellFall();
          waitPhase=4;
          waitCount=waitTime;
        }
      } else if (waitPhase==4) {
        if (waitCount==0) {
          putCell();
          score += deleteNum*100*comboCount;
          if (deleteCheck()) {
            waitPhase=1;
            waitCount=waitTime;
          } else {
            waitPhase=0;
            comboCount=0;
          }
        }
      } else {
        println("erroed");
      }
      waitCount--;
    }

    if (handCell.mouseOn==1) {
      handCell.display();
      for (int j=0; j<cellSize; j++) {
        for (int i=0; i<cellSize; i++) {
          if (mouseX>i*60&&mouseX<(i+1)*60&&mouseY>j*60&&mouseY<(j+1)*60&&cell.get(j*cellSize+i).cellColor!=0) {
            if (handCell.handNum==j*cellSize+i) {
              ellipse(700, 100, 10, 10);
            }
            if (handCell.handNum==j*cellSize+i) {
            } else if (handCell.handNum==j*cellSize+i-1) {
              exchange(j*cellSize+i, j*cellSize+i-1);
            } else if (handCell.handNum==j*cellSize+i+1) {
              exchange(j*cellSize+i, j*cellSize+i+1);
            } else if (handCell.handNum==j*cellSize+i-cellSize) {
              exchange(j*cellSize+i, j*cellSize+i-cellSize);
            } else if (handCell.handNum==j*cellSize+i+cellSize) {
              exchange(j*cellSize+i, j*cellSize+i+cellSize);
            } else if (handCell.handNum==j*cellSize+i-1+cellSize) {
              exchange(j*cellSize+i, j*cellSize+i-1+cellSize);
            } else if (handCell.handNum==j*cellSize+i+1+cellSize) {
              exchange(j*cellSize+i, j*cellSize+i+1+cellSize);
            } else if (handCell.handNum==j*cellSize+i-1-cellSize) {
              exchange(j*cellSize+i, j*cellSize+i-1-cellSize);
            } else if (handCell.handNum==j*cellSize+i+1-cellSize) {
              exchange(j*cellSize+i, j*cellSize+i+1-cellSize);
            }
          }
        }
      }
    }

    time--;
    if (time<=0) {
      if (waitPhase==0) {
        if (handCell.mouseOn==1) {
          handCell.releaseHand();
          waitPhase=1;
          waitCount=waitTime;
          deleteCheck();
        }
        phase = 2;
      }
    }
  } else if (phase==2) {
    if (waitPhase!=0) {
      if (waitPhase==1) {
        if (waitCount==0) {
          comboCount++;
          deleteCheckCell();
          waitPhase=2;
          waitCount=waitTime;
          if (comboCount<4) {
            sound[comboCount-1].rewind();
            sound[comboCount-1].play();
          } else {
            sound[3].rewind();
            sound[3].play();
          }
        }
      } else if (waitPhase==2) {
        if (waitCount==0) {
          spotReset();
          waitPhase=3;
          waitCount=waitTime;
        }
      } else if (waitPhase==3) {
        if (waitCount==0) {
          cellFall();
          waitPhase=4;
          waitCount=waitTime;
        }
      } else if (waitPhase==4) {
        if (waitCount==0) {
          putCell();
          score += deleteNum*100*comboCount;
          if (deleteCheck()) {
            waitPhase=1;
            waitCount=waitTime;
          } else {
            waitPhase=0;
            comboCount=0;
          }
        }
      } else {
        println("erroed");
      }
      waitCount--;
    }

    time++;
    if (time>150) {
      resetCell();

      String [] lines = loadStrings("ranking.txt");
      for (int i=0; i<5; i++) {
        ranking[i] = int(lines[i]);
        println(ranking[i]);
      }
      for (int i=0; i<5; i++) {
        if (score>=ranking[i]&&rankRenew==-1) {
          for (int j=4; j>i; j--) {
            ranking[j] = ranking[j-1];
            lines[j] = str(ranking[j-1]);
            lines[j+5] = lines[j+4];
          }
          ranking[i] = score;
          lines[i] = str(ranking[i]);
          saveStrings("ranking.txt", lines);
          rankRenew = i;
        }
      }

      score = 0;
      println(rankRenew);
      if (rankRenew==-1) {
        phase=4;
      } else {
        phase=3;
      }
    }
  } else if (phase==3) {
  } else if (phase==4) {
  }
}

