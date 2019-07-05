class Saliva
{
  float x;
  float y;
  int r;
  int a=1;
  int speed=10;
  boolean exist;
  PImage png;
  Share coordinate;
  Saliva(Share coordinate) {
    this.coordinate = coordinate;
    exist = true;
    x = coordinate.x;
    y = coordinate.y;
    png = loadImage("saliva.png");
    r=10;
  }
  void update() {
    if (exist) {
      cal();
    }
  }
  void cal() {
    x+=16;
    y=y-speed;
    speed=speed-a;
    
   
  }
  void des() {
    if (y<-100) {
      exist=false;
    }
  }
 void display(){
  
 update();
 if(exist){
  image(png,x-7,y+17);
 }
 }
}
