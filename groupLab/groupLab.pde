interface Displayable {
  void display();
}

interface Moveable {
  void move();
}
interface Collideable {
  boolean isTouching(Thing other);
}


abstract class Thing implements Displayable {
  float x, y;//Position of the Thing
  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

class Rock extends Thing implements Collideable {
  PImage img;
  PImage colImg;
  int mode;
  Rock(float x, float y, PImage p, PImage collisionImage) {
    super(x, y);
    img = p;
    colImg = collisionImage;
  }

  boolean isTouching(Thing other) {
    float x1 = other.x;
    float y1 = other.y;
    float distCenterX = abs(x1 - x);
    float distCenterY = abs(y1-y);
    float minDistBetweenX=0;
    float minDistBetweenY=0;

    if (other instanceof Ball) {
      minDistBetweenX = (img.width)/2.0 + ((Ball)other).xSize / 2.0;
      minDistBetweenY = (img.height)/2.0 + ((Ball)other).ySize / 2.0;
    } else if (other instanceof Rock) {
      minDistBetweenX = (img.width)/2.0 + ((Rock)other).img.width / 2.0;
      minDistBetweenY = (img.height)/2.0 + ((Rock)other).img.height / 2.0;
    }
    if (distCenterX>minDistBetweenX && distCenterY > minDistBetweenY) return false;
    return true;
  }

  void display() {
    for ( Collideable c : ListOfCollideables) {
      if (c!=this && c.isTouching(this)) 
        image(colImg, x, y); 
      else
        image(img, x, y);
    }
  }
}

public class LivingRock extends Rock implements Moveable {
  PImage eyeImg;
  float radius;
  int di; //clockwise counterclockwise
  int shapeC; //orbit shape (circle, ellipse, vertical ellipse)
  LivingRock(float x, float y, PImage p, PImage collisionImage, PImage eye) {
    super(x, y, p, collisionImage);
    this.eyeImg = eye;
    di = (int) random(2); 
    radius = random(1, 3);
    shapeC = (int) random(3);
  }
  void move() {
    float t = millis()/1000.00;
    int d;
    if (di == 0) d = -1;
    else d = 1;
    //shapeC = circlular path
    if (shapeC == 0) {
      x+= d* radius * cos(t);
      y += radius*sin(t);
    } 
    //shapeC = horizontal elliptical path
    else if (shapeC == 1) {
      x+= d* radius * cos(t);
      y += radius/2 * sin(t);
    }
    //shapeC = veritcal elliptical path
    else {
      x += d * radius/2 * cos(t);
      y += radius * sin(t);
    }
  }
  void display() {
    super.display();
    image(eyeImg, x, y);
  }
}

abstract class Ball extends Thing implements Moveable {
  int xSize;
  int ySize;
  int randColorR, randColorG, randColorB; 
  int xDirection = 1;
  int yDirection = 1; 
  color c; 
  int xspeed = (int)random(5) + 1;
  int yspeed = (int)random(5) + 1; 
  Ball(float x, float y, int xSize, int ySize) {
    super(x, y);
    this.xSize = xSize;
    this.ySize = ySize;
    randColorR = (int)random(255);
    randColorG = (int)random(255);
    randColorB = (int)random(255);
    c = color(0, 0, 255);
  }
  abstract void display() ;
  abstract void move();
}
class simpleBall extends Ball {
  simpleBall(float x, float y, int xSize, int ySize) {
    super(x, y, xSize, ySize);
  }
  void display() {
    fill(c);
    ellipse(x, y, xSize, ySize);
    fill(255, 165, 0);
    ellipse(x+10, y-15, 10, 10);
    fill(255, 0, 0); 
    ellipse(x - 13, y, 10, 10);
    fill(0, 255, 0);
    ellipse(x, y - 20, 10, 10);
    fill(0, 192, 199);
    ellipse(x, y, 10, 10);
    fill(122, 192, 88);
    ellipse(x, y+15, 10, 10);
    fill(150, 150, 150);
    ellipse(x-15, y-15, 10, 10);
    fill(200, 32, 200);
    ellipse(x+15, y+10, 10, 10);
    fill(50, 0, 102);
    ellipse(x-10, y+13, 10, 10);
    fill(60, 120, 180);
    ellipse(x+13, y, 10, 10);
  }
  void move() {
  }
}
class circBall extends Ball {
  int d;
  float xSpeed = 2;
  float ySpeed = 2;
  float xOfPoint=x;
  float yOfPoint=y; 
  circBall(float x, float y, int xSize, int ySize) {
    super(x, y, xSize, ySize);
    
  }
  void dDeter() {
     if (xDirection == 0) {
      if (yDirection == 1) d = 270;
      if (yDirection == -1) d = 90;
    }
    else if (xDirection == 1) {
      if (yDirection == 1) d = 315;
      if (yDirection == 0) d = 0;
      if (yDirection == -1) d = 45;
    }
    else {
      if (yDirection == 1) d = 215;
      if (yDirection == 0) d = 135;
    }
  }
  void display() {
    fill(c);
    ellipse(x, y, xSize, ySize);
    fill(10, 255, 0); 
    rectMode(CENTER);
    square(x, y, 10);
    fill(70, 0, 70);
    square(x+10, y-15, 10);
  }
  
  void move() {
    xOfPoint += xSpeed;
    yOfPoint += ySpeed;
    y = yOfPoint + 40*sin(xOfPoint/30) * sin(radians(45)+radians(90)) ;
    x = xOfPoint + 40*sin(xOfPoint/30) * cos(radians(45)+radians(90)) ;
    
    if (x + 25 >= width || x - 25 <= 0) {
      xSpeed *= -1;
    }
    if (y + 25 >= height || y - 25<= 0) {
      ySpeed *= -1;
    }
  }
}




/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
ArrayList<Collideable> ListOfCollideables;

void setup() {
  PImage beauty = loadImage("beautyrock.png");
  beauty.resize(50, 50);
  PImage ugly = loadImage("uglyrock.png");
  ugly.resize(50, 50);
  PImage eyes = loadImage("eyeballs.png");
  eyes.resize(35, 35);
  size(1000, 800);
  PImage p;
  PImage poke = loadImage("pokeball.png"); 
  PImage explosive = loadImage("fireRock.png");
  explosive.resize(50, 50);
  poke.resize(50, 50);
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  ListOfCollideables = new ArrayList<Collideable>();
  for (int i = 0; i < 10; i++) {
    Ball b;
    if ((int)random(2) ==1) {
      b = new simpleBall(50+random(width-100), 50+random(height-100), 50, 50 );
    } else {
      b = new circBall(50+random(width-100), 50 + random(height-100), 50, 50);
    }
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    int j =(int)(random(2));
    if (j==0) {
      p = beauty;
    } else p = ugly;
    Rock r = new Rock(50+random(width-100), 50+random(height-100), p, explosive);
    thingsToDisplay.add(r);
    ListOfCollideables.add(r);
  }
  for (int i = 0; i < 3; i++) {
    int j =(int)(random(2));
    if (j==0) {
      p = beauty;
    } else p = ugly;
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100), p, explosive, eyes);
    thingsToDisplay.add(m);
    thingsToMove.add(m);
    ListOfCollideables.add(m);
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
