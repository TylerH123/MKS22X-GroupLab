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
  PImage p;
  int mode;
  Rock(float x, float y, PImage p) {
    super(x, y);
    this.p=p;
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
    image(p, x, y);
  }
}

public class LivingRock extends Rock implements Moveable {
  PImage eyes;
  LivingRock(float x, float y, PImage p, PImage eye) {
    super(x, y, p);
    eyes = eye;
  }
  void move() {
    float dx = random(-1, 1);
    if (x+dx<width && x+dx>0) {
      x+=dx;
    }
    float dy = random(-1, 1);
    if (y+dy<height && y+dy>0) {
      y+=dy;
    }
  }
  void display() {
    super.display();
    image(eyes, x, y);
  }
}

class Ball extends Thing implements Moveable {
  PImage img; 
  int direction;
  int radius;
  int shapeC;
  int randColorR, randColorG, randColorB; 
  Ball(float x, float y, PImage p) {
    super(x, y);
    img = p; 
    img.resize(50, 50);
    radius = (int) random(1, 11);
    direction = (int) random(2); //1 will be clockwise, 0 counterclockwise
    shapeC = (int) random(3); //0 is image, 1 is ellipse, 2 is complex
    randColorR = (int)random(255);
    randColorG = (int)random(255);
    randColorB = (int)random(255);
  }
  void complex() {
    rectMode(CENTER);
    rect(x, y, 20, 50);
    rect(x, y, 50, 20);
  }
  void display() {
    fill(randColorR, randColorG, randColorB);
    if (shapeC == 0) image(img, x, y);
    if (shapeC == 1) ellipse(x, y, 50, 50);
    if (shapeC == 2) complex();
    /* ONE PERSON WRITE THIS */
  }
  void bounce() {
    if (direction == 0) direction = 1;
    else direction = 0;
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
    float t = millis()/1000.0;
    if ( x < width && y < height) {
      if (shapeC == 0) {
        if (direction == 0) {
          x+= -1 * radius * cos(t);
        } else {
          x += radius*cos(t);
        }
        y += radius*sin(t);
      } else if (shapeC == 1) {
        if (direction == 0) {
          x+= -1 * radius * cos(t);
        } else {
          x+= radius * cos(t);
        }
        y += radius/2 * sin(t)+random(2);
      } else {
        if (direction == 0) {
          x += -1 * radius/2 * cos(t);
        } else {
          x += radius/2 * cos(t);
        }
        y += radius * sin(t);
      }
    } else {
      bounce();
    }
  }
}



  /*DO NOT EDIT THE REST OF THIS */

  ArrayList<Displayable> thingsToDisplay;
  ArrayList<Moveable> thingsToMove;

  void setup() {
    PImage beauty = loadImage("beautyrock.jpg");
    beauty.resize(50, 50);
    PImage ugly = loadImage("uglyrock.jpeg");
    ugly.resize(50, 50);
    PImage eyes = loadImage("eyeballs.png");
    eyes.resize(35, 35);
    size(1000, 800);
    PImage p;
    PImage poke = loadImage("pokeball.png"); 
    thingsToDisplay = new ArrayList<Displayable>();
    thingsToMove = new ArrayList<Moveable>();
    for (int i = 0; i < 10; i++) {
      Ball b = new Ball(50+random(width-100), 50+random(height-100), poke);
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