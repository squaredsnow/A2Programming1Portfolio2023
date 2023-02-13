class Laser {
  int x, y, w, h, speed;

  //Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 2;
    h = 27;
    speed = 22;
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    fill(255);
    noStroke();
    rect(x, y, w, h);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y < -50) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<rock.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
