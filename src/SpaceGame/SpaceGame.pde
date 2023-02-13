//Park James |  Nov 28th 2022 | SpaceGame
SpaceShip s1;
PImage ship;
PImage gameover;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Timer rockTimer, puTimer;
Star[] stars = new Star[100];
int score, level, rockTime, rockCount, laserCount;
boolean play;
float transparency = 255;

void setup() {
  size(800, 800);
  s1 = new SpaceShip();
  puTimer = new Timer(5000);
  puTimer.start();
  rockTime = 1000;
  rockCount = 0;
  laserCount = 0;
  rockTimer = new Timer(rockTime);
  rockTimer.start();
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  play = false;
}

void draw() {
  if (play) {
    startScreen();
  } else {
    background(0);

    infoPanel();
    // Render Stars
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    // Add Rocks on Timer
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      rockCount++;
    }

    //Add PowerUps

    // Rendering PowerUps and Detecting Ship Collision
    //Renders Rocks and detecting ship collision
    for (int i=0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        // to do- call the explosion animation
        //add a sonud for the explosion
        // todo : consider adding rock health
        score+=r.diam;
        rocks.remove(r);
      }

      if (r.reachedBottom()) {
        rocks.remove(r);
        println("Rocks: " + rocks.size());
      } else {
        r.display();
        println(r.y);
        r.move();
      }
    }
    noCursor();
    //render lasers and detect rock collision
    for (int i = 0; i<lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (r.intersect(l)) {
          score+=r.diam;
          //todo: add sound to collision
          //todo: add animation to the collision
          // todo:
          lasers.remove(l);
          rocks.remove(r);
        }
        if (l.reachedTop()) {
          lasers.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }
    s1.display(mouseX, mouseY);
    if (s1.health<1) {
      gameOver();
    }
  }
}

void mousePressed() {
  lasers.add(new Laser(s1.x, s1.y));
}


void infoPanel() {
  fill(128, 128);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(15);
  text("SPACEGAME " + "| Level: " + level  + " | Score: " + score + " | Health: " + s1.health + " | Ammo: " + s1.ammo + " | Rocks: " + rockCount, 20, 30);
}

void startScreen() {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Press any key to begin", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  gameover = loadImage("GAMEOVER.png");
  if (transparency > 0) {
    transparency -= 0.25;
  }
  tint(255, transparency);
  image(gameover, width/2, height/2);
  textAlign(CENTER);
  text("ПОМЕР!", width/2, height/1.2);
  noLoop();
}
