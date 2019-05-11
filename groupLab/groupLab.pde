interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

abstract class Thing implements Displayable {
  float x, y;//Position of the Thing
  PImage img;
  PImage img2;
  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  } 
  abstract void display();
}

class Rock extends Thing {
  int mode;
  Rock(float x, float y, PImage p) {
    super(x, y);
    this.img=p;
  }
  void display() {
    switch(mode) {
      /*case 0:
       simpleDisplay();
       break;
       case 1:
       complexDisplay();
       break;*/
    default:
      imageDisplay();
    }
  }
  /*void simpleDisplay() {
   ellipse(x, y, 50, 50);
   }
   void complexDisplay() {
   float green = 100;
   float red =   200;
   float blue =  100;
   for (float i = 50; i>0; i-=0.5) {
   color c = color(red, green, blue);
   fill(c);
   ellipse(x, y, i, i);
   ellipse(x + random(10), y+random(10), i, i);
   ellipse(x - random(10), y-random(10), i, i);
   ellipse(x, y-random(10), i, i);
   red-=1;
   green+=6;
   blue+=3;
   }
   }*/
  void imageDisplay() {
    image(img, x, y);
  }
}

public class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y, PImage p, PImage eye) {
    super(x, y, p);
    this.img2 = eye;
  }
  void move() {
    int speed=1;
    int dir=1;
    float dx = speed*dir;
    boolean collide = false;
    if (x+dx<width-25 && x+dx>25) {
      x+=dx;
    } else {
      dir*=-1;
    }
    float dy = speed*dir;
    if (y+dy<height-25 && y+dy>25) {
      y+=dy;
    } else {
      dir*=-1;
    }
  }
  void display() {
    super.display();
    image(img2, x, y);
  }
}

class Ball extends Thing implements Moveable { 
  int direction;
  int radius;
  int shapeC;
  int randColorR, randColorG, randColorB; 
  int sDirection = 1; 
  color c ; 
  int xspeed = (int)random(5);
  int yspeed = (int)random(5); 
  Ball(float x, float y) {
    super(x, y);
    //this.img = p; 
    radius = (int) random(1, 11);
    direction = (int) random(2); //1 will be clockwise, 0 counterclockwise
    shapeC = (int) random(3); //0 is image, 1 is ellipse, 2 is complex
    randColorR = (int)random(255);
    randColorG = (int)random(255);
    randColorB = (int)random(255);
    c = color(0,0,255);
  }
  /**void complex() {
   rectMode(CENTER);
   rect(x, y, 20, 50);
   rect(x, y, 50, 20);
   }**/
  void display() {
    fill(c);
    /**if (shapeC == 0) image(img, x, y);
    if (shapeC == 1) ellipse(x, y, 50, 50);
    if (shapeC == 2) complex(); **/
    /* ONE PERSON WRITE THIS */
    ellipse(x,y,50,50);
  }
  /**void bounce() {
    if (shapeC == 0) {
      if (x +50 >= width) x-= random(50, 100);
      if (y + 50 >= height) y-=random(50, 100);
      if (x <= 0) x+= random(10, 100);
      if (y <= 0) y+=random(10, 100);
    } else {
      if (x >= width) x-= random(10, 100);
      if (y >= height) y -= random(10, 100);
      if (x <= 0) x+= random(10, 100);
      if (y <= 0) y+= random(10, 100);
    }
    changeD();
    radius+= .9;
    hM();
  } **/

  void changeD() {
    if (direction == 0) direction = 1;
    else direction = 0;
  }

  /**void hM() {
    float t = millis()/1000.00;
    //if (t % 10 == 0) radius *= random(1,4);
    //shapeC = circlular path
    if (shapeC == 0) {
      if (direction == 0) {
        x+= -1 * radius * cos(t) + random(10);
      } else {
        x += radius*cos(t) + random(10);
      }
      y += radius*sin(t) + random(2);
    } 
    //shapeC = horizontal elliptical path
    else if (shapeC == 1) {
      if (direction == 0) {
        x+= -1 * radius * cos(t) + random(10);
      } else {
        x+= radius * cos(t)+ random(10);
      }
      y += radius/2 * sin(t)+random(2) + random(2);
    }
    //shapeC = veritcal elliptical path
    else {
      if (direction == 0) {
        x += -1 * radius/2 * cos(t) + random(2);
      } else {
        x += radius/2 * cos(t) + random(2);
      }
      y += radius * sin(t) + random(2);
    }
  }

  void move() {
    /* ONE PERSON WRITE THIS (Jawwad) */
    /*int[] mx= {0, 1, 1, 1, 0, -1, -1, -1};
     int[] my = {1, 1, 0, -1, -1, -1, 0, 1};
     int i = (int) random(8);
     if (x < width && y < height) {
     x += mx[i] * width/10;
     y += my[i] * height/10;
     } elder randomized version*/
    //clockwise circle
    /**if ( x >= 0 && y >= 0 && x<= width -50 && y<= height- 50) { //basically when inside range
      hM();
    } 
    if (x + 50 >= width || y + 50 >= height || x <= 0 || y <= 0) bounce();
  }**/

  void move() {
    x += xspeed * sDirection; 
    y += yspeed * sDirection;
    if (x + 25 >= width || y + 25 >= height || x - 25 <= 0 || y - 25<= 0) sDirection *= -1;
  }
  void collision(Rock r){
    if (r.x == this.x && r.y == this.y){
      c = color(255,0,0); 
      sDirection *= -1;
    }
  }
}



/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  PImage beauty = loadImage("beautyrock.png");
  beauty.resize(50, 50);
  PImage ugly = loadImage("uglyrock.png");
  ugly.resize(50, 50);
  PImage eyes = loadImage("eyeballs.png");
  eyes.resize(35, 35);
  size(1000, 800);
  PImage p;
  //PImage poke = loadImage("pokeball.png"); 
  //poke.resize(50, 50);
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    int j =(int)(random(2));
    if (j==0) {
      p = beauty;
    } else p = ugly;
    Rock r = new Rock(50+random(width-100), 50+random(height-100), p);
    thingsToDisplay.add(r);
  }
  for (int i = 0; i < 3; i++) {
    int j =(int)(random(2));
    if (j==0) {
      p = beauty;
    } else p = ugly;
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100), p, eyes);
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
