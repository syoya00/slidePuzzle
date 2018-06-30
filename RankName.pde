class RankName {
  int [] nameCode = new int [3];
  int select;
  String [] name = new String [3];
  RankName() {
    for (int i=0;i<3;i++) {
      nameCode[i]=0;
      name[i] = " ";
    }
    select=0;
  }
  void display() {
    background(0);
    noStroke();
    fill(100, 200, 255);
    rect(select*40+365, 250, 40, 60);
    textSize(40);
    fill(255);
    text("NEW RECORD!", 270, 100);
    textSize(20);
    text("what your name?", 340, 200);
    textSize(40);
    for (int i=0;i<3;i++) {
      text(name[i], 370+i*40, 300);
    }
  }
  void change(int d) {
    if (d==0) {
      select++;
      if (select==3) {
        select=0;
      }
    }
    else if (d==1) {
      select--;
      if (select==-1) {
        select=2;
      }
    }
    else if (d==2) {
      for (int i=0;i<3;i++) {
        if (select==i) {
          nameCode[i]--;
          if (nameCode[i]==-1) {
            nameCode[i]=26;
          }
          code(i, nameCode[i]);
        }
      }
    }
    else if (d==3) {
      for (int i=0;i<3;i++) {
        if (select==i) {
          nameCode[i]++;
          if (nameCode[i]==27) {
            nameCode[i]=0;
          }
          code(i, nameCode[i]);
        }
      }
    }
  }
  void code(int i, int c) {
    if (c==0) {
      name[i]=" ";
    }
    else 
      if (c==1) {
      name[i]="A";
    }
    else 
      if (c==2) {
      name[i]="B";
    }
    else 
      if (c==3) {
      name[i]="C";
    }
    else 
      if (c==4) {
      name[i]="D";
    }
    else 
      if (c==5) {
      name[i]="E";
    }
    else 
      if (c==6) {
      name[i]="F";
    }
    else 
      if (c==7) {
      name[i]="G";
    }
    else 
      if (c==8) {
      name[i]="H";
    }
    else 
      if (c==9) {
      name[i]="I";
    }
    else 
      if (c==10) {
      name[i]="J";
    }
    else 
      if (c==11) {
      name[i]="K";
    }
    else 
      if (c==12) {
      name[i]="L";
    }
    else 
      if (c==13) {
      name[i]="M";
    }
    else 
      if (c==14) {
      name[i]="N";
    }
    else 
      if (c==15) {
      name[i]="O";
    }
    else 
      if (c==16) {
      name[i]="P";
    }
    else 
      if (c==17) {
      name[i]="Q";
    }
    else 
      if (c==18) {
      name[i]="R";
    }
    else 
      if (c==19) {
      name[i]="S";
    }
    else 
      if (c==20) {
      name[i]="T";
    }
    else 
      if (c==21) {
      name[i]="U";
    }
    else 
      if (c==22) {
      name[i]="V";
    }
    else 
      if (c==23) {
      name[i]="W";
    }
    else 
      if (c==24) {
      name[i]="X";
    }
    else 
      if (c==25) {
      name[i]="Y";
    }
    else 
      if (c==26) {
      name[i]="Z";
    }
  }
  void write(int l) {
    String [] lines = loadStrings("ranking.txt");
    lines[l+5] = name[0] + name[1] + name[2];
    saveStrings("ranking.txt", lines);
  }
}

