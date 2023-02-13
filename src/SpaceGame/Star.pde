class Star {
  int x, y, speed, diam;

  //Constructor
  Star() {
    circle(x, y, 0);
    x = int(random(width));
    y = int(random(height));
    speed = int(random(1, 3));
    diam = int(random(1, 4));
  }

  void display() {
    circle(x, y, random(1, 2.5));
    fill(#FFFFFF);
  }

  void move() {
    if (y>height+5) {
      y = -5;
    }
    y += speed;
  }

  boolean ReachBottom() {
    return true;
  }
}
