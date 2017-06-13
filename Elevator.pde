class Elevator {  
  Block[] e_Boards;
  /*
   e_Boards[0] = e_FrontTop
   e_Boards[1] = e_FrontLeft
   e_Boards[2] = e_FrontRight
   e_Boards[3] = e_Left
   e_Boards[4] = e_Right
   e_Boards[5] = e_Back
   e_Boards[6] = e_Top
   e_Boards[7] = leftDoor;
   e_Boards[8] = rightDoor;
   e_Boards[9] = w_FrontTop
   e_Boards[10] = w_FrontLeft
   e_Boards[11] = w_FrontRight
   e_Boards[12]  w_Left
   e_Boards[13] = w_Right
   e_Boards[14] = w_Top
   */
  Button[] osButtons = new Button[2];
  Button[] isButtons = new Button[5];
  Button[] openAndCloseButtons = new Button[2];
  float w = 10;
  float h = 15;
  float d = 10;
  float x = 265;
  float y = -groundBlockSize/2 - h/2;
  float z = 90;
  float e_thickness = w/8;
  float doorWidth = w/3;
  float doorHeight = h * 0.8;
  float doorDepth = e_thickness;
  float doorSpeed = 0.01;
  int time = 0;
  boolean buttonIsSeleted = true;
  color e_B_Color = color(105, 96, 91);
  color doorColor = color(100, 200, 100, 0);
  color wallColor = color(105, 96, 91);
  PFont digitalfont;
  PImage elevator_inside, elevator_top, elevator_bottom, front_middle, front_left, front_right;
  AudioPlayer arrival1, arrival2, arrival3, arrival4, arrival5;


  Elevator(int size) {
    digitalfont = loadFont("Digital.vlw");
    e_Boards = new Block[15];
    e_Boards[0] = new Block(x, -groundBlockSize/2 - h * 0.9, z-d/2, doorWidth*2, h/5, e_thickness, e_B_Color, 0);
    e_Boards[1] = new Block(x-w/12*5, y, z-d/2, doorWidth/2, h, e_thickness, e_B_Color,0);
    e_Boards[2] = new Block(x+w/12*5, y, z-d/2, doorWidth/2, h, e_thickness, e_B_Color, 0);
    e_Boards[3] = new Block(x-w/2-e_thickness/2, y, z, e_thickness, h, w, e_B_Color,0);
    e_Boards[4] = new Block(x+w/2+e_thickness/2, y, z, e_thickness, h, w, e_B_Color,0);
    e_Boards[5] = new Block(x, y, z+d/2, w, h, e_thickness, e_B_Color,0);
    e_Boards[6] = new Block(x, y - h/2 - e_thickness/2, z, w, e_thickness, d, e_B_Color,0);
    e_Boards[7] = new Block(x-doorWidth/2, -groundBlockSize/2 - doorHeight/2, z-d/2-e_thickness/2-doorDepth/2, doorWidth, doorHeight, doorDepth, doorColor,0);
    e_Boards[8] = new Block(x+doorWidth/2, -groundBlockSize/2 - doorHeight/2, z-d/2-e_thickness/2-doorDepth/2, doorWidth, doorHeight, doorDepth, doorColor,0);
    e_Boards[9] = new Block(x, -groundBlockSize/2 - h * 0.9, z-d/2-e_thickness-doorDepth/2-e_thickness/2, doorWidth*2, h/5, e_thickness, wallColor,0);
    e_Boards[10] = new Block(x-doorWidth*2, y, z-d/2-e_thickness-doorDepth/2-e_thickness/2, doorWidth*2, h, e_thickness, wallColor,0);
    e_Boards[11] = new Block(x+doorWidth*2, y, z-d/2-e_thickness-doorDepth/2-e_thickness/2, doorWidth*2, h, e_thickness, wallColor, 0);
    e_Boards[12] = new Block(x-w+e_thickness/2, y, z, e_thickness, h, w+e_thickness+doorDepth+e_thickness, wallColor, 0);
    e_Boards[13] = new Block(x+w-e_thickness/2, y, z, e_thickness, h, w+e_thickness+doorDepth+e_thickness, wallColor, 0);
    e_Boards[14] = new Block(x, y, z+d/2+e_thickness+doorDepth, w*2, h, e_thickness, wallColor, 0);

    for (int i = 0; i < size*size*size/10; i++) {
      for (int j = 0; j < e_Boards.length; j++) {
        if (!e_Boards[j].visited) e_Boards[j].moveDown();
        e_Boards[j].visited = true;
      }
    }

    // osButtons
    for (int i = 0; i < osButtons.length; i++) osButtons[i] = new Button(0, i*h/25*2, 0, h/25, h/25);
    //popMatrix();
    // isButtons
    for (int i = 0; i < isButtons.length; i++) isButtons[i] = new Button(x+w/12*5, y - i*h/25*1.2 + h/25*2, z-d/2+e_thickness/2+0.01, h/25, h/25);
    // open and close Buttons
    for (int i = 0; i < openAndCloseButtons.length; i++) openAndCloseButtons[i] = new Button(x+w/12*5 - (h/25/3*2) + (h/25/3*2)*i*2, y+h/25*4, z-d/2+e_thickness/2+0.01, h/25, h/25);

    elevator_inside = loadImage("elevator_inside.png");
    elevator_top = loadImage("elevator_top.png");
    elevator_bottom = loadImage("elevator_bottom.png");
    front_middle = loadImage("front_middle.png");
    front_left = loadImage("front_left.png");
    front_right = loadImage("front_right.png");

    arrival1 = minim.loadFile("arrival1.wav");
    arrival2 = minim.loadFile("arrival2.wav");
    arrival3 = minim.loadFile("arrival3.wav");
    arrival4 = minim.loadFile("arrival4.wav");
    arrival5 = minim.loadFile("arrival5.wav");
  }

  void update() {
    for (int j = 0; j < e_Boards.length; j++) {
      e_Boards[j].update();
    }
  }

  void display() {
    for (int j = 0; j < e_Boards.length; j++) {
      e_Boards[j].display();
    }

    // mapping
    pushMatrix();
    translate(x, -groundBlockSize/2 - h * 0.9, z);
    imageMode(CENTER);
    translate(0, 0, -d/2+e_thickness/2+0.005);
    image(front_middle, 0, 0, doorWidth*2, h/5);
    translate(-w/12*5, h*0.4, 0);
    image(front_left, 0, 0, doorWidth/2, h);
    translate(w/12*10, 0, 0);
    image(front_right, 0, 0, doorWidth/2, h);
    popMatrix();
    pushMatrix();
    translate(x, y, z);
    // back
    translate(0, 0, d/2-e_thickness/2-0.005);
    image(elevator_inside, 0, 0, w, h);
    // left
    translate(-w/2+0.005, 0, -d/2+e_thickness/2+0.005);
    rotateY(PI/2);
    image(elevator_inside, 0, 0, w-e_thickness, h);
    // right
    translate(0, 0, w-0.01);
    rotateY(PI);
    image(elevator_inside, 0, 0, w-e_thickness, h);
    popMatrix();
    pushMatrix();
    translate(x, y, z);
    rotateX(PI/2);
    translate(0, 0, -h/2+0.005);
    image(elevator_bottom, 0, 0, w, d+e_thickness);
    translate(0, 0, h-0.01);
    image(elevator_top, 0, 0, w, d-e_thickness);
    popMatrix();
  }

  void floorCounter() {
    float fc_w = doorWidth/3*2;
    float fc_h = h/20;
    // outside floorCounter
    pushMatrix();
    translate(x, -groundBlockSize/2 - h * 0.9, z-d/2-e_thickness-doorDepth/2-e_thickness-0.01); 
    fill(0);
    noStroke();    
    rotateY(PI);
    rectMode(CENTER);
    rect(0, 0, fc_w, fc_h);
    textFont(digitalfont);
    fill(255, 0, 0);
    textSize(0.5);
    textAlign(CENTER, CENTER);
    text(currentFloor, 0, 0);
    popMatrix();

    // inside floorCounter
    pushMatrix();
    translate(x, -groundBlockSize/2 - h * 0.9, z-d/2+e_thickness/2+0.01);
    fill(0);
    noStroke();
    rect(0, 0, fc_w, fc_h);
    textFont(digitalfont);
    fill(255, 0, 0);
    textSize(0.5);
    textAlign(CENTER, CENTER);
    text(currentFloor, 0, 0);
    popMatrix();
  }

  void buttons_display() {
    //osButtons[0].setTitle("▲");
    //osButtons[1].setTitle("▼");
    osButtons[0].setTitle("UP");
    osButtons[1].setTitle("DN");
    isButtons[0].setTitle("1");
    isButtons[1].setTitle("2");
    isButtons[2].setTitle("3");
    isButtons[3].setTitle("4");
    isButtons[4].setTitle("5");
    openAndCloseButtons[0].setTitle("OP");
    openAndCloseButtons[1].setTitle("CL");


    for (int i = 0; i < osButtons.length; i++) {
      pushMatrix();
      translate(x-w/12*5, y, z-d/2-e_thickness-doorDepth/2-e_thickness-0.01);
      rotateY(PI);
      osButtons[i].display();
      osButtons[i].theSelector();
      popMatrix();
    }

    for (int i = 0; i < isButtons.length; i ++) {
      isButtons[i].display();
      isButtons[i].theSelector();
    }


    for (int i = 0; i < openAndCloseButtons.length; i ++) {
      openAndCloseButtons[i].display();
      openAndCloseButtons[i].theSelector();
    }

    for (int i = 0; i < osButtons.length; i++) {
      if (osButtons[i].isSelected) elevator.moveTo(playerFloor);
      if (currentFloor == playerFloor) {
        if (playerFloor == 1) arrival1.play();
        if (playerFloor == 2) arrival2.play();
        if (playerFloor == 3) arrival3.play();
        if (playerFloor == 4) arrival4.play();
        if (playerFloor == 5) arrival5.play();
      }
    }

    for (int i = 0; i < isButtons.length; i++) {
      if (isButtons[i].isSelected) {
        elevator.moveTo(i);
        if (currentFloor == i+1) {
          playerFloor = currentFloor;
          if (i == 0) arrival1.play();
          if (i == 1) arrival2.play();
          if (i == 2) arrival3.play();
          if (i == 3) arrival4.play();
          if (i == 4) arrival5.play();
        }
      }
    }
  }

  void moveTo(int targetFloor) {
    if (targetFloor == currentFloor) {
      time++;
      if (time > 300) {
        doorMove();
        doorBounce();
      }
    } else if (targetFloor > currentFloor && frameCount % 90 == 0) {
      currentFloor++;
    } else if (targetFloor < currentFloor && frameCount % 90 == 0) {
      currentFloor--;
    }
  }

  void doorMove() {
    e_Boards[7].position.x -= doorSpeed;
    e_Boards[8].position.x += doorSpeed;

    if (e_Boards[7].position.x > x - doorWidth/2) {      
      osButtons[0].isSelected = false;
      osButtons[1].isSelected = false;
      isButtons[0].isSelected = false;
      isButtons[1].isSelected = false;
      isButtons[2].isSelected = false;
      isButtons[3].isSelected = false;
      isButtons[4].isSelected = false;
      openAndCloseButtons[0].isSelected = false;
      openAndCloseButtons[1].isSelected = false;
      time = 0;
    }
  }

  void doorBounce() {
    if (e_Boards[7].position.x < x - doorWidth*2 || e_Boards[7].position.x > x - doorWidth/2) doorSpeed *= -1;
    if (openAndCloseButtons[1].isSelected) doorSpeed = -0.01; // close Button
  }
}