void allDisplay() {
  if (phase==0) {
    background(255);
    fill(0);
    textSize(100);
    text("SLIDE PUZZLE", 50, 300);
    textSize(20);
    text("click start", 350, 420);
  } else if (phase==1) {
    background(0);
    for (int j=0; j<cellSize; j++) {
      for (int i=0; i<cellSize; i++) {
        if (cellSpot[i][j]==1) {
          fill(255);
        } else {
          fill(100, 100, 0);
        }
        strokeWeight(4);
        stroke(0);
        rect(i*60, j*60, 60, 60);
      }
    }
    for (int j=0; j<cellSize; j++) {
      for (int i=0; i<cellSize; i++) {
        cell.get(i*cellSize+j).display();
      }
    }
    stroke(100, 100, 100);
    fill(150, 150, 150);
    rect(600, 0, 800, 600);

    //debug

    fill(255);
    textSize(20);
    text("time : " + time, 620, 50);
    text("score : " + score, 620, 100);
    text("waitPhase : " + waitPhase, 620, 500);
    text("waitCount : " + waitCount, 620, 550);

    if (waitPhase!=0) {
      text(comboCount + " combo!", 620, 200);
      if (waitPhase>1) {
        text(deleteNum*100 + " x " + comboCount, 620, 260);
      }
    }
  } else if (phase==2) {
    background(0);
    for (int j=0; j<cellSize; j++) {
      for (int i=0; i<cellSize; i++) {
        if (cellSpot[i][j]==1) {
          fill(255);
        } else {
          fill(100, 100, 0);
        }
        strokeWeight(4);
        stroke(0);
        rect(i*60, j*60, 60, 60);
      }
    }
    for (int j=0; j<cellSize; j++) {
      for (int i=0; i<cellSize; i++) {
        cell.get(i*cellSize+j).display();
      }
    }
    stroke(100, 100, 100);
    fill(150, 150, 150);
    rect(600, 0, 800, 600);

    //debug

    fill(255);
    textSize(20);
    text("time : " + time, 620, 50);
    text("score : " + score, 620, 100);
    text("waitPhase : " + waitPhase, 620, 500);
    text("waitCount : " + waitCount, 620, 550);

    if (waitPhase!=0) {
      text(comboCount + " combo!", 620, 200);
      if (waitPhase>1) {
        text(deleteNum*100 + " x " + comboCount, 620, 260);
      }
    }

    noStroke();
    fill(0);
    rect(0, 250, width, 100);
    fill(255);
    textSize(100);
    text("finish", 280, 340);
  } else if (phase==3) {
    rankName.display();
  } else if (phase==4) {
    String [] lines = loadStrings("../ranking.txt");
    background(0);
    textSize(40);
    text("RANKING", 330, 100);
    textSize(30);
    text("1st", 100, 250);
    text(lines[5], 200, 250);
    text(ranking[0], 600, 250);
    text("2nd", 100, 300);
    text(lines[6], 200, 300);
    text(ranking[1], 600, 300);
    text("3rd", 100, 350);
    text(lines[7], 200, 350);
    text(ranking[2], 600, 350);
    text("4th", 100, 400);
    text(lines[8], 200, 400);
    text(ranking[3], 600, 400);
    text("5th", 100, 450);
    text(lines[9], 200, 450);
    text(ranking[4], 600, 450);
    textSize(20);
  }
}

