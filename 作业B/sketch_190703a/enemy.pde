class Enemy
{
  float x;
  float y;
  int r;
  int state;
  int blood;
  float distance1;
  float distance2;
  boolean exist;
  //int shape;
  Share coordinate;
  Death temp;
  PImage photo;
  String name;
  boolean ok;
  int timer;
  Enemy( Share coordinate, int state) {
    this.coordinate = coordinate;
    this.x = 1280;
    this.y = 450;
    this.state = state;
    exist = true;
    if (state == 0) {
      r=20;
      blood = 1;
      name = "enmey1";
      //shape = int(random(2));
      //name +=(shape);
      name +=".png";
      distance1 = 900;
      distance2 = 1500;
    }
    if (state == 1) {
      r=30;
      blood = 12;
      name = "enmey2";
      //shape = int(random(2));
      //name+=(shape);
      name +=".png";
      distance1 = 3000;
      distance2 = 3000;
    }
    //shape = int(random(4));
    photo = loadImage(name);
  }
  void run() {
    if (state ==1) {
      x-=4;
      y+=0;
    }
    if (state ==0) {
      x-=6;
      y+=0;
    }
  }
  void update() {
    for (Saliva i : coordinate.saliva) {
      if (i.exist&&exist&&((pow(x-i.x, 2)+pow(y-i.y, 2))<distance1)) {
        blood--;
        i.exist = false;
        if (blood ==0) {
          exist = false;
          coordinate.score+=7;
        }
      }
    }
    if (exist&&(pow(x-coordinate.x, 2)+pow(y-coordinate.y, 2))<distance2) {
      exist = false;
      coordinate.blood-=1;
      coordinate.score++;
    }
  }

  void display() {
    update();
    if (exist) {
      run();
      image(photo, x-20, y-15,70,120);
    } else {
      if (!ok) {
        temp = new Death(x, y);
        temp.exist = true;
        ok = !ok;
      }
      if (timer--==0) {
        temp.die();
      }
      temp.display();
    }
  }
}
