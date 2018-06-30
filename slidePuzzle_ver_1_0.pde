import ddf.minim.*;
Minim minim;
AudioPlayer bgm1;
AudioSnippet [] sound = new AudioSnippet [5];

int phase = 0;

ArrayList <Cell> cell = new ArrayList <Cell> ();
HandCell handCell;
int cellSize = 10;
int cellSpot [][] = new int [cellSize][cellSize];
int waitCount = -1;
int waitPhase = 0;
int waitTime = 10;
int cellVar = 6;
int comboCount = 0;
int score = 0;
int deleteNum = 0;
int time;

RankName rankName;
int rankRenew = -1;
int [] ranking = new int [5];

void setup() {

  frameRate(60);

  size(800, 600);
  minim = new Minim(this);
  bgm1 = minim.loadFile("data/bgm.mp3");
  bgm1.loop();
  for (int i=1; i<=5; i++) {
    sound[i-1] = minim.loadFile("data/sound" + i + ".mp3");
  }

  handCell = new HandCell();
  for (int j=0; j<cellSize; j++) {
    for (int i=0; i<cellSize; i++) {
      cellSpot[i][j] = 0;
    }
  }
  time = 0;

  rankName = new RankName();
}

void draw() {
  allDisplay();
  allMove();
}

void stop() {
  bgm1.close();
  for (int i=0; i<5; i++) {
    sound[i].close();
  }
  minim.stop();
  super.stop();
}

