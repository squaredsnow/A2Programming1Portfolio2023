//Park James | Nov 2022 | Calculator Project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0.0";
char op = ' ';
float l, r, result;
boolean left = true;

//Calculator
void setup() {
  size(300, 470);
  shininess(9.0);
  numButtons[0] = new Button(105, 300, 50, 50, '0');
  numButtons[1] = new Button(50, 120, 50, 50, '1');
  numButtons[2] = new Button(105, 120, 50, 50, '2');
  numButtons[3] = new Button(160, 120, 50, 50, '3');
  numButtons[4] = new Button(50, 180, 50, 50, '4');
  numButtons[5] = new Button(105, 180, 50, 50, '5');
  numButtons[6] = new Button(160, 180, 50, 50, '6');
  numButtons[7] = new Button(50, 240, 50, 50, '7');
  numButtons[8] = new Button(105, 240, 50, 50, '8');
  numButtons[9] = new Button(160, 240, 50, 50, '9');
  opButtons[0] = new Button(240, 360, 100, 50, '=');
  opButtons[1] = new Button(50, 300, 50, 50, '.');
  opButtons[2] = new Button(50, 360, 50, 50, '+');
  opButtons[3] = new Button(105, 360, 50, 50, '-');
  opButtons[4] = new Button(160, 300, 50, 50, '÷');
  opButtons[5] = new Button(160, 360, 50, 50, '×');
  opButtons[6] = new Button(240, 300, 100, 50, 'C');
  opButtons[7] = new Button(50, 420, 50, 50, '±');
  opButtons[8] = new Button(105, 420, 50, 50, 'c');
  opButtons[9] = new Button(160, 420, 50, 50, 's');
  opButtons[10] = new Button(215, 420, 50, 50, 'π');
  opButtons[11] = new Button(270, 420, 50, 50, '^');

  square(120, 100, 220);
}

void draw () {
  background(80);
  rect(240, 180, 100, 180, 28);
  fill(0, 0, 0);
  textAlign(CENTER);
  text("Привет человек!", 240, 180);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed () {
  println("key:" + key);
  println("KeyCode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51) {
    handleEvent("3", true);
  } else if (keyCode == 52) {
    handleEvent("4", true);
  } else if (keyCode == 53) {
    handleEvent("5", true);
  } else if (keyCode == 54) {
    handleEvent("6", true);
  } else if (keyCode == 55) {
    handleEvent("7", true);
  } else if (keyCode == 56) {
    handleEvent("8", true);
  } else if (keyCode == 57) {
    handleEvent("9", true);
  } else if (keyCode == 48) {
    handleEvent("0", true);
  } else if (keyCode == 46) {
    handleEvent(".", true);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 32) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) { // All opButtons here
    dVal = "0";
    left = true;
    l = 0;
    r = 0;
    result = 0;
    op = ' ';
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  }
}

void mouseReleased() {
  for (int i = 0; i>numButtons.length; i++) {
    if (numButtons[i].on && dVal.length() < 18) {
    }
  }



  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      if (dVal.equals("0.0")) {
        dVal = str(numButtons[i].val);
      } else {
        dVal += str(numButtons[i].val);
      }
      if (left) {
        l = float(dVal);
      } else {
        r = float(dVal);
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent("C", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      op = '+';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op = '-';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '×') {
      op = '×';
      left = false;
      dVal = "0.0";
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      op = '÷';
      left = false;
      dVal = "0.0";
    } else if (opButtons[i].on & opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == 'c') {
      if (left) {
        l = cos(l);
        dVal = str(l);
      } else {
        r = cos(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      if (left) {
        l = sin(l);
        dVal = str(l);
      } else {
        r = sin(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      op = '±';
      left = false;
      dVal = "0.0";
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    }
    println("l:" + l + " r:" + r + op + "Left:" + left + " Result:" + result);
  }
}

void updateDisplay() {
  fill(127);
  rect(150, 50, 280, 65);
  fill(255);
  textAlign(RIGHT);
  text(dVal, width-70, 60);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '×') {
    result = l * r;
  } else if (op == '÷') {
    result = l/r;
  }
  dVal = str(result);
  l = result;
  left = true;
}
