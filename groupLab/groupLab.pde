interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

abstract class Thing implements Displayable {
  float x, y;//Position of the Thing

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  abstract void display();
}

class Rock extends Thing {
  Rock(float x, float y) {
    super(x, y);
  }

  void display() {
    for(int i = 0;i<50;i++){
      float green = random(255);
      float red = random(255);
      float blue = random(255);
      color c = color(red,green,blue);
      stroke(c);
      ellipse(x,y,i,i);
  }
}
}

public class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y) {
    super(x, y);
  }
  void move() {
    float dx = random(-1,1);
    if (x+dx<width && x+dx>0) {
      x+=dx;
    }
    float dy = random(-1,1);
    if (y+dy<height && y+dy>0) {
      y+=dy;
    }
  }
}

class Ball extends Thing implements Moveable {
  PImage p = new PImage();
  Ball(float x, float y) {
    super(x, y);
    p = loadImage("pokeball.png");
    p.resize(50,50);
  }

  void display() {
    image(p,x,y);
    /* ONE PERSON WRITE THIS */
    ellipse(x,y,50,50);
  }

  void move() {
    /* ONE PERSON WRITE THIS (Jawwad) */
    float mx = random(-1,1); //random cardinal direction
    float my = random(-1,1);//random cardinal direction
    x+= mx * random(-100,100);
    y+= my * random(-80,80);
    
  }
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  size(1000, 800);

  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    Rock r = new Rock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(r);
  }
  for (int i = 0; i < 3; i++) {
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(m);
    thingsToMove.add(m);
  }
}
void draw() {
  background(255);

  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}
