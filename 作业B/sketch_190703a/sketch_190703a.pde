import processing.serial.*;
Player player;
Share coordinate;
Serial myPort;
PImage img;

void setup() {
  size(1280, 720);
  img = loadImage("scene01.png");
  coordinate = new Share(300, 300);
  player = new Player(coordinate);
 
  try {
    myPort = new Serial(this, "COM6", 9600);
    myPort.clear();
  }
  catch(Exception e ) {
    coordinate.keyboard = true;
  }
}

void draw() {
  image(img, 0, 0, 1280, 720);
  player.display();
  salivaDisplay();
  enemyDisplay();
  bloodDisplay();
  scoreDisplay();
  coordinate.display();
  if (!coordinate.keyboard)serialControl();
  highscore();
  mode();
}
void keyPressed()
{
  if (key == 'w') {if(!player.lock){player.setjump(310);player.lock=true;}}
  if (key == 'a') player.direction[0] =true;
  if (key == 'd') player.direction[1] =true;
 

}
void keyReleased()
{
  //if (key == 'w') player.direction[0] =false;
  if (key == 'a') player.direction[0] =false;
  if (key == 'd') player.direction[1] =false;
  if(key == 'q') 

    coordinate.pause = !coordinate.pause;
    if (coordinate.pause)noLoop();
 else loop();{
  }
  if (key == 'r') {
    coordinate.restart = true;
    loop();
  }
  if (key == 'c') {
    if (coordinate.keyboard) {
      try {
        myPort = new Serial(this, "COM6", 9600);
        myPort.clear();
        coordinate.keyboard = false;
      }
      catch(Exception e) {
      }
    } else coordinate.keyboard = true;
  }
}
void salivaDisplay() {
  if (coordinate.shoot == true) {
    if (frameCount - coordinate.prv > 15) {
      coordinate.saliva.add(new Saliva(coordinate));
      coordinate.prv = frameCount;
    }
  }
  for (Saliva i : coordinate.saliva) {
    i.display();
  }
}

void enemyDisplay() {
  if ((coordinate.score%10)==0) {
    coordinate.score++;
    coordinate.enemy.add(new Enemy(coordinate, 1));
  }
  if (random(10)<0.2) {
    coordinate.enemy.add(new Enemy(coordinate, 0));
  }
  for (Enemy i : coordinate.enemy) {
    i.display();
  }
}
void bloodDisplay() {
  textSize(24);
  fill(#151313);
  text(coordinate.blood, 50, 50);
  fill(#151313);
}
void scoreDisplay()
{
  textSize(15);
  text("score:",80, 50);
    text(coordinate.score-1, 120, 50);
}

void mode()
{
  if (!coordinate.keyboard) {
    textSize(15);
    text("on serial", 400, 50);
    fill(#080808);
  } else {
    textSize(15);
    text("on keyboard", 400, 50);
    fill(#080808);
  }
}
void serialControl()
{
  String message = myPort.readStringUntil(coordinate.LF);
  if (message != null) {
    String[]data = message.split(",");
    if (data[0].charAt(0) =='M') {
      if (data.length >2) {
        int tempX = Integer.parseInt(data[1]);
        int tempY = Integer.parseInt(data[2]); 
        print("x:");
        print("y:");
        println(tempX);
        println(tempY);
        if(tempY<400){if(!player.lock){player.setjump(310);player.lock=true;}}
      
        
        if (tempX<400) {
          player.direction[0] =true;
        } else if (tempX>600) {
          player.direction[1] =true;
        }else{
          player.direction[0]=false;
          player.direction[1]=false;
        }
      }
    }
  }
}
void highscore()
{
textSize(15);
fill(#151313);
text("highscore:"+coordinate.oldhighscore,250,50);
}
