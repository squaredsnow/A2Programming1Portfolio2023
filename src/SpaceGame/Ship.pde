class SpaceShip {
  int x, y, w, ammo, lCount, turretCount, health;
  PImage ship;

  SpaceShip() {
    x = 0;
    y = 0;
    w = 100;
    ammo = 1000;
    lCount = 100;
    turretCount = 1;
    health = 100;
    ship = loadImage("Sship.png");
  }

  void display (int tempx, int tempy) {
    x = tempx;
    y = tempy;
    imageMode(CENTER);
    ship.resize(w, w);
    image(ship, x, y);
  }

  void move() {
  }

  boolean fire() {
    if (lCount>0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<40) {
      return true;
    } else {
      return false;
    }
  }
}
