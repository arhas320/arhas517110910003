class Player
{
  int r ;
  Share coordinate;
  int state;
  boolean[]direction;
  PImage player;
  int a;
  int speed;
  int goalheight;
  boolean lock;
  Player(Share coordinate) {
    this.coordinate = coordinate;
    direction = new boolean[3];
    player = loadImage("player2.png");
    r=50;
    goalheight = 460;
    speed = 15;
    a = 1;
  }
  void setjump(int x) {
    goalheight = x;
  }
  void up() {

    if (coordinate.y !=goalheight) {
      if (coordinate.y<goalheight) {
        coordinate.y+=speed;
        speed-=a;
      } else if (coordinate.y>goalheight) {
        coordinate.y-=speed;
        speed-=a;
      }
    } else {
      goalheight = 460;
      speed = 17;
      if (coordinate.y == 460)lock =false;
    }
  }





  void left() {
    if (direction[0]&&coordinate.y>0) {
      coordinate.x-=4;
    }
  }
  void right() {
    if (direction[1]&&coordinate.y>0) {
      coordinate.x+=4;
    }
  }
  void display() {
    up();

    left();
    right();

    image(player, coordinate.x-25, coordinate.y-25, 70, 120);
  }
}
