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
    //
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
    image(eyeImg, x-17, y-3);
  }
}

abstract class Ball extends Thing implements Moveable {
  int xSize;
  int ySize;
  int randColorR, randColorG, randColorB; 
  int xDirection = 1;
  int yDirection = 1; 
  color c; 
  float xspeed = random(-2,2);
  float yspeed = random(-2,2); 
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
  int d = 1;
  float cx = x;
  float cy = y;
  float r = random(3, 4);

  simpleBall(float x, float y, int xSize, int ySize) {
    super(x, y, xSize, ySize);
  }
  void display() {
    stroke(224, 224, 224);
    fill(224, 224, 224);
    ellipse(x, y, 80, 10);
    fill(255, 255, 255);
    ellipse(x, y, 60, 10);
    stroke(47, 63, 163);
    fill(47, 63, 163);
    circle(x, y, 50);
    stroke(52, 72, 193);
    fill(52, 72, 193);
    circle(x, y, 40);
    stroke(60, 110, 255);
    fill(60, 110, 255);
    circle(x, y, 30);
    fill(70, 120, 255);
    circle(x, y, 20);
    fill(61, 80, 201);
    circle(x-10, y+10, 5);
    fill(150, 250, 255);
    ellipse(x, y, 10, 5);
    fill(56, 72, 202);
    ellipse(x+4, y-3, 15, 6);
  }
  void move() {
    if(xspeed>50) xspeed =2;
    if(xspeed<-50) xspeed =-2;
    if(yspeed>50) yspeed =2;
    if(yspeed<-50) yspeed = -2;
    xspeed += .5;
    yspeed += .5;
    x+= xspeed;
    y+= yspeed;
    if (x > width-25 || x < 25) {
      xspeed *= -1;
      x+=2*xspeed;
    }
    if (y > height-25 || y < 25) {
      yspeed *= -1;
      y+=2*yspeed;
    }
  }
}

class circBall extends Ball {
  float xOfPoint=x;
  float yOfPoint=y; 
  circBall(float x, float y, int xSize, int ySize) {
    super(x, y, xSize, ySize);
  }
  void display() {
    fill(c);
    for ( Collideable co : ListOfCollideables) {
      if (co!=this && co.isTouching(this)) 
        fill(color(255, 0, 0));
    }
    stroke(255, 255, 106);
    fill(255, 225, 106);
    ellipse(x, y, 60, 10);
    ellipse(x, y, 10, 60);
    fill(255, 230, 145);
    circle(x, y, 50);
    fill(100, 255, 60);
    circle(x-15, y, 10);
    fill(255, 55, 40);
    circle(x+15, y, 10);
    fill(60, 220, 255);
    circle(x-10, y-10, 10);
    fill(255, 70, 210);
    circle(x+10, y-10, 10);
    fill(255, 160, 60);
    circle(x, y-15, 10);
    fill(255, 250, 60);
    circle(x, y, 15);
  }

  void move() {
    xOfPoint += xspeed;
    yOfPoint += yspeed;
    float theta = atan (yspeed / xspeed);
    if (xspeed < 0) theta += PI;
    y = yOfPoint + 30*sin(xOfPoint/20) * sin(theta+radians(90)) ;
    x = xOfPoint + 30*sin(xOfPoint/20) * cos(theta+radians(90)) ;

    if (x + 25 >= width || x - 25 <= 0) {
      xspeed *= -1;
      xOfPoint += 3* xspeed;
      yOfPoint+=3* yspeed;
    }
    if (y + 25 >= height || y - 25<= 0) {
      yspeed *= -1;
      xOfPoint += 3* xspeed;
      yOfPoint+=3* yspeed;
    }
  }
}




/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
ArrayList<Collideable> ListOfCollideables;

void setup() {
  imageMode(CENTER);
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
  for (int i = 0; i < 19; i++) {
    Ball b;
    if (i < 10) {
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
