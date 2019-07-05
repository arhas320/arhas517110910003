class Share
{
  int x;
  int y;
  int score;
  int blood;
  int prv;
  ArrayList<Saliva>saliva;
  ArrayList<Enemy>enemy;
  boolean pause;
  PImage show;
  boolean restart;
  int oldhighscore;
  int LF = 10;
  boolean keyboard;
  boolean shoot;
  PrintWriter output;
  BufferedReader reader;
  String line;
  Share(int x, int y) {
    this.x = x;
    this.y = 460;
    score = 1;
    prv = -3;
    blood = 3;
    shoot = true;
    saliva = new ArrayList<Saliva>();
    enemy = new ArrayList<Enemy>();
    show = loadImage("player2.png");
    reader = createReader("positions.txt");

    try {
      line = reader.readLine();
    }catch(Exception e){
      line = null;
    }
    if (line == null) {
    } else {
      oldhighscore=Integer.parseInt(line);
      println("this is the high;"+oldhighscore);
    }
  }
  void display() {
    if (blood<1&&!restart) {
      textSize(80);
      text("Game is Over!", 400, 400);
      if (score>oldhighscore) {
        output = createWriter("positions.txt");
        output.flush();
        output.println(""+score);
        output.close();
        noLoop();
      }
    }
    if (restart) {
      restart = !restart;
      saliva = new ArrayList<Saliva>();
      enemy = new ArrayList<Enemy>();
      if (score>oldhighscore) {
        oldhighscore = score;
        output = createWriter("positions.txt");
        output.flush();
        output.println(""+score);
        output.close();
      }
      score = 1;
      prv = -3;
      blood = 3;
    }
    for (int i = 0, j=50; i<blood; i++, j+=50) {
      fill(250, 0, 0);
      image(show, j, 0,12,24);
      fill(255);
    }
  }
}
