class PowerUp {
  int x, y, speed, diam;
  char type;

  //Constructor
  PowerUp() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 6));
    diam = int(random(30, 90));
    if (random(2)==0) {
      type = 'H';
    } else {
      type = 'A';
    }
  }


  void display() {
    fill(0, 222, 0);
    ellipse(x, y, diam, diam);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height + 100) {
      return true;
    } else {
      return false;
    }
  }
}
