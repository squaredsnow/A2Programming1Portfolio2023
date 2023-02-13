class Rock {
  int x, y, speed, diam;
  PImage rock;

  //Constructor
  Rock() {
    x = int(random(width));
    y = -50;
    speed = int(random(3, 9));
    diam = 50;
    rock = loadImage("Rock.png");
  }

  void display() {
    imageMode(CENTER);
    image(rock, x, y);
  }

  void move() {
    y += speed;
  }
  
  boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d<30) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y > height + 100) {
      return true;
    } else {
      return false;
    }
  }
}
