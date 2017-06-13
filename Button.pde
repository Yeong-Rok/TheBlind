class Button {
  float xpos, ypos, zpos;
  float centerX, centerY, w, h;
  color on, off;
  String buttonTitle = "B";
  boolean isSelected = false;  
  PFont buttonFont;
  PFont braille;

  Button(float _xpos, float _ypos, float _zpos, float _w, float _h) {
    xpos = _xpos;
    ypos = _ypos;
    zpos = _zpos;
    centerX = 0;
    centerY = 0;
    w = _w;
    h = _h;
    on = color(255, 0, 0);
    off = color(100, 0, 0);    
    buttonFont = loadFont("ArialMT-8.vlw");
    braille = loadFont("Braille.vlw");
  }

  void display() {
    pushMatrix();
    translate(xpos, ypos, zpos);
    fill(158, 156, 154);
    noStroke();
    rectMode(CENTER);
    rect(centerX, centerY, w, h, 5);
    if (isSelected) {
      fill(on);
    } else {
      fill(off);
    }
    textFont(braille);
    textAlign(CENTER, CENTER);
    textSize(0.3);
    text(buttonTitle, centerX, centerY);
    popMatrix();
  }

  void setTitle(String title) {
    buttonTitle = title;
  }

  void theSelector() {
    int tolerance = 30;
    float checkX = getScreenX();
    if (checkX >= (mouseX-tolerance) && checkX <= (mouseX+tolerance)) {
      float checkY = getScreenY();
      if (checkY >= (mouseY-tolerance) && checkY <= (mouseY+tolerance)) {
        ////// text what you want! ///// ((display))
        //camera();
        //hint(DISABLE_DEPTH_TEST);
        //textMode(MODEL);
        //textAlign(CENTER, CENTER);
        //fill(255);
        //textSize(130);
        //text(buttonTitle, width/2, height/2);
        //hint(ENABLE_DEPTH_TEST);
        brailleOn = true;
        if (mousePressed) {
          setSelected();
        }
      } else {
        brailleOn = false;
      }
    }
  }

  void setSelected() {
    this.isSelected = true;
  }

  float getScreenX() {
    float f = screenX(xpos, ypos, zpos);
    return f;
  }

  float getScreenY() {
    float f = screenY(xpos, ypos, zpos);
    return f;
  }
}