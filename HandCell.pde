class HandCell {
  int mouseOn;
  int onColor;
  int handNum;
  HandCell() {
    mouseOn = 0;
    onColor = 0;
    handNum = -1;
  }
  void display() {
    switch (onColor) {
    case 0:
      fill(0);
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
    stroke(255);
    strokeWeight(3);
    rect(mouseX-30, mouseY-30, 60, 60);
    fill(0);
    //text(handNum, mouseX-10, mouseY-10);
  }
  void setHand(int c, int n) {
    mouseOn = 1;
    onColor = c;
    handNum = n;
  }
  void releaseHand() {
    cell.get(handNum).cellColor = onColor;
    mouseOn = 0;
    onColor = 0;
    handNum = -1;
  }
}

