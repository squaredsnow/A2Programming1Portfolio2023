//Park James | Nov 2022 | Calculator Project

class Button {
  // Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  // Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(100);
    c2 = color(200);
    on = false;
  }
  // Member Methods
  void display() {
    rectMode(CENTER);
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x, y, w, h, 8);
    fill(0);
    textAlign(CENTER);
    if (val=='C') {
      text("Clear", x, y);
    } else if(val=='c') {
      text("Cos",x,y);
    } else if(val=='s') {
      text("Sin",x,y);
    } else {
      text(val, x, y);
    }
    
  }

  void hover(int mx, int my) {
    on = (mx > x - w/2 && mx < x + w/2 && my > y-h/2 && my<y+h/2);
  }
}
