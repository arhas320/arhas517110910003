class Death
{
  int state;
  float x;
  float y;
  boolean exist;
  PImage  []photo;
  String name;
  Death(float x, float y) {
    state = 0;
    this.x = x;
    this.y = y;
    photo = new PImage[5];
    for (int i=0; i<5; i++) {
      name = "pic"+(i+2)+".png";
      photo[i]=loadImage(name);
    }
  }

  void die() {
    image(photo[state], x, y,70,120);
    state = ++state%5;
  }
  void display() {
    if (exist) {
      die();
      if (state == 0) {
        exist = false;
      }
    }
  }
}
