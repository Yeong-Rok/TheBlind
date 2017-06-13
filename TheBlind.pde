import ddf.minim.*;
import ddf.minim.ugens.*;
import queasycam.*;
import processing.sound.*;

//for 3d image
import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;

QueasyCam cam;
Busstation station, station2;
Buscar bus;
Player player;
Minim minim;
Ground ground;
Bollard[] bollards = new Bollard[12];
Car car2;
Footstep steps;
imgInsert insert;
Building building;
Tree[] trees = new Tree[10];
Streetlamp[] lamps = new Streetlamp[6];
float groundBlockSize = 10;
int scoreNum=100;

PFont font;
String status;
String status2;

boolean crashed= false;

taillessMonkey human1;
taillessMonkey human2;
taillessMonkey human3;
taillessMonkey human4;
taillessMonkey human5;
taillessMonkey human6;

Bush[] bushes = new Bush[8];

AudioPlayer lampcrash;
AudioPlayer TT;
AudioPlayer bgm;

// *********************
boolean success = false;
IBK ibk;

int stage = 0;
int currentFloor = 5;
int playerFloor = 1;
Elevator elevator;

EDoor rightDoor;
EDoor leftDoor;

Room room1, room2, room3;
// *********************

void setup() {
  fullScreen( P3D);
  strokeWeight(2);

  //human
  human3 = new taillessMonkey(new PVector(50, -5, 10), 7);
  human2 = new taillessMonkey(new PVector(170, -5, 13), 7);
  human1 = new taillessMonkey(new PVector(100, -5, 11), 7);
  human4 = new taillessMonkey(new PVector(80, -5, 50), 7);
  human5 = new taillessMonkey(new PVector(110, -5, 51), 7);
  human6 = new taillessMonkey(new PVector(190, -5, 48), 7);

  station = new Busstation(this, 13, 5);
  station2 = new Busstation(this, 52, 47);

  //lamp
  for (int i = 0; i<lamps.length; i++) {
    if (i<3) {
      lamps[i] = new Streetlamp(this, i*90, 13.5, 0);
    } else {
      lamps[i] = new Streetlamp(this, (i-3)*90, 46.5, 90);
    }
  }

  //sound
  minim = new Minim(this);
  lampcrash = minim.loadFile("lampcrash.mp3");
  TT =  minim.loadFile("TT.wav");
  bgm = minim.loadFile("bgm.wav");

  bgm.loop();

  player = new Player(this);
  building = new Building(5);
  ground = new Ground(); // 20 x 20 size
  for (int i = 0; i<trees.length; i++) {
    if (i<5) trees[i] = new Tree(this, i*40, 5);
    else trees[i] = new Tree(this, (i-5)*40, 55);
  }

  bollards[0] = new Bollard(this, 35, 13.5);
  bollards[1] = new Bollard(this, 275, 13.5);
  bollards[2] = new Bollard(this, 275, 46.5);
  bollards[3] = new Bollard(this, 35, 46.5);
  bollards[4] = new Bollard(this, 41, 13.5);
  bollards[5] = new Bollard(this, 29, 13.5);
  bollards[6] = new Bollard(this, 281, 46.5);
  bollards[7] = new Bollard(this, 269, 46.5);
  bollards[8] = new Bollard(this, 269, 13.5);
  bollards[9] = new Bollard(this, 281, 13.5);
  bollards[10] = new Bollard(this, 41, 46.5);
  bollards[11] = new Bollard(this, 29, 46.5);
  insert = new imgInsert(this);

  //moving car
  //car1 = new Car(this, 10, -10, 5, 0.3);
  car2 = new Car(this, 290, -10, 35, -2);
  bus = new Buscar(this, 20, -10, 20, 1);

  for (int i = 0; i < bushes.length; i++) {
    bushes[i] = new Bush(this, (i+50)*3.5, 55);
  }

  ground.setPlayerAtStart(player);

  //step sound
  steps = new Footstep();

  font =   createFont ( "휴먼견출고딕", 32);
  textFont (font);

  // *********************
  ibk = new IBK(15);
  room1 = new Room(this, 320, 30, 60, 80);
  room2 = new Room(this, 330, 80, 40, 20);
  room3 = new Room(this, 345, 115, 10, 50);


  elevator = new Elevator(5);
  leftDoor = new EDoor(this, elevator.e_Boards[7].position.x, elevator.e_Boards[7].position.y, elevator.e_Boards[7].position.z);
  rightDoor = new EDoor(this, elevator.e_Boards[8].position.x, elevator.e_Boards[8].position.y, elevator.e_Boards[8].position.z);
  // *********************
}

void draw() {
  switch(stage) {
  case 0:
    background(0);
    break;
  case 1:
    background(51);
    //lights();
    pushMatrix();
    for (int i = 0; i<bollards.length; i++) {
      bollards[i].update();
      bollards[i].display();
    }

    car2.update();
    car2.display();
    car2.move();

    bus.update();
    bus.display();
    bus.move();

    station.update();
    station.display();
    station2.update();
    station2.display();
///////////////////

elevator.update();
    elevator.display();
    elevator.floorCounter();
    elevator.buttons_display();

    leftDoor.update();
    leftDoor.display();
    rightDoor.update();
    rightDoor.display();

    leftDoor.position.x = elevator.e_Boards[7].position.x;
    rightDoor.position.x = elevator.e_Boards[8].position.x;

    for (int i = 0; i < elevator.osButtons.length; i++) {
      if (elevator.osButtons[i].isSelected) elevator.moveTo(playerFloor);
    }
    for (int i = 0; i < elevator.isButtons.length; i++) {
      if (elevator.isButtons[i].isSelected) elevator.moveTo(i+1);
    }
    
    if (currentFloor == 3 && frameCount % 360 == 0) success = true;
///////////////////



    building.update();
    building.display();

    ground.update();
    ground.display();
    player.update();
    //amblyopia.display();  //약시
    steps.walk();



    for (int i =0; i<trees.length; i++) {
      trees[i].update();
      trees[i].display();
    }
    //
    human1.be();
    human1.update();
    human1.move();

    human2.be();
    human2.update();
    human2.move();

    human3.be();
    human3.update();
    human3.move();

    human4.be();
    human4.update();
    human4.move();

    human5.be();
    human5.update();
    human5.move();

    human6.be();
    human6.update();
    human6.move();

    for (int i = 0; i<bushes.length; i++) {
      bushes[i].update();
      bushes[i].display();
    }

    for (int i = 0; i< lamps.length; i++) {
      lamps[i].update();
      lamps[i].display();
    }
    insert.display();
    popMatrix();


    //fill(50,210);
    //blur(0,0,width,height);

    fill(255);
    textSize(32);
    textFont(font);
    score();
    showTextInHUD(status);
    break;
  case 2:
  background(51);
    //lights();
    pushMatrix();
    for (int i = 0; i<bollards.length; i++) {
      bollards[i].update();
      bollards[i].display();
    }

    car2.update();
    car2.display();
    car2.move();

    bus.update();
    bus.display();
    bus.move();

    station.update();
    station.display();
    station2.update();
    station2.display();
///////////////////

elevator.update();
    elevator.display();
    elevator.floorCounter();
    elevator.buttons_display();

    leftDoor.update();
    leftDoor.display();
    rightDoor.update();
    rightDoor.display();

    leftDoor.position.x = elevator.e_Boards[7].position.x;
    rightDoor.position.x = elevator.e_Boards[8].position.x;

    for (int i = 0; i < elevator.osButtons.length; i++) {
      if (elevator.osButtons[i].isSelected) elevator.moveTo(playerFloor);
    }
    for (int i = 0; i < elevator.isButtons.length; i++) {
      if (elevator.isButtons[i].isSelected) elevator.moveTo(i+1);
    }
    
    if (currentFloor == 3 && frameCount % 360 == 0) success = true;
///////////////////



    building.update();
    building.display();

    ground.update();
    ground.display();
    player.update();
    //amblyopia.display();  //약시
    steps.walk();



    for (int i =0; i<trees.length; i++) {
      trees[i].update();
      trees[i].display();
    }
    //
    human1.be();
    human1.update();
    human1.move();

    human2.be();
    human2.update();
    human2.move();

    human3.be();
    human3.update();
    human3.move();

    human4.be();
    human4.update();
    human4.move();

    human5.be();
    human5.update();
    human5.move();

    human6.be();
    human6.update();
    human6.move();

    for (int i = 0; i<bushes.length; i++) {
      bushes[i].update();
      bushes[i].display();
    }

    for (int i = 0; i< lamps.length; i++) {
      lamps[i].update();
      lamps[i].display();
    }
    insert.display();
    popMatrix();


    //fill(50,210);
    //blur(0,0,width,height);

    fill(255);
    textSize(32);
    textFont(font);
    black();
    score();
    showTextInHUD(status);
    break;
case 3:  
    // *********************
    ibk.update();
    ibk.display();
    player.update();
    steps.walk();

    elevator.update();
    elevator.display();
    elevator.floorCounter();
    elevator.buttons_display();

    leftDoor.update();
    leftDoor.display();
    rightDoor.update();
    rightDoor.display();

    leftDoor.position.x = elevator.e_Boards[7].position.x;
    rightDoor.position.x = elevator.e_Boards[8].position.x;

    for (int i = 0; i < elevator.osButtons.length; i++) {
      if (elevator.osButtons[i].isSelected) elevator.moveTo(playerFloor);
    }
    for (int i = 0; i < elevator.isButtons.length; i++) {
      if (elevator.isButtons[i].isSelected) elevator.moveTo(i+1);
    }
    println("x is " + player.position.x);
    println("z is " + player.position.z);
    
    room1.display();
    room1.update();
    room2.display();
    room2.update();
    room3.display();
    room3.update();
    // *********************
    break;

  case 4:
    stage3();
    break;
  }
}

//2d 구현
//텍스트
void showTextInHUD(String str1) {
  camera();
  hint(DISABLE_DEPTH_TEST);
  noLights();
  textMode(MODEL);
  if (str1!=null)

    text(str1, width*2/3, height*2/3, width*1/4-40, height/3);

  hint(ENABLE_DEPTH_TEST);

  if (player.position.y == 15) {
    status =null;
  }
} // func 

//사각형
//void red() {

//  camera();
//  hint(DISABLE_DEPTH_TEST);
//  fill(255, 0, 0);
//  rect(0, 0, width, height);
//  //hint(ENABLE_DEPTH_TEST);
//} // func 

void yellow() {
  background(#FEFF0D);
  camera();
  hint(DISABLE_DEPTH_TEST);
  fill(#FEFF0D);
  rect(0, 0, width, height);
  hint(ENABLE_DEPTH_TEST);
} 

void score() {

  camera();
  hint(DISABLE_DEPTH_TEST);
  fill(#FF811A);
  strokeWeight(2);
  stroke(0);
  rect(width*3/5, height/7, scoreNum*3, 15);

  textMode(MODEL);
  fill(255);
  text("의지", width*3/5, height/7-10);
  hint(ENABLE_DEPTH_TEST);

  //other place not the crosswalks: minus points
  if ((player.position.z>= 15 && player.position.z<= 45) &&( player.position.x>= 285||(player.position.x<= 265) && (player.position.x>= 45)||(player.position.x<= 265) &&(player.position.x>= 45)|| (player.position.x<= 25))) {
    status="-1 point! You are in the wrong way. Please use the crosswalk";
    scoreNum-=0.1;
  }

  if (scoreNum <= 0) {
    stage3();
  }
} 


void stage3() {

  background(0);
  textMode(MODEL);
  textAlign(CENTER, CENTER);
  fill(255);
  text("GAME OVER!! YOU ARE HIT BY A CAR, OR LOSE ALL THE SCORE.", width*1/2, height*1/3);
  text("PRESS SPACE TO RESTART", width*1/2, height/2);
  hint(ENABLE_DEPTH_TEST);


  if (key == ' ') {
    reset();
  }
} 

void reset() {
  scoreNum=100;
  ground.setPlayerAtStart(player);

  showTextInHUD(status);
}



void mousePressed() {
  if (stage == 0) {
    stage = 1;
  } else if (stage == 1) {
    stage = 2;
  } else if (stage == 2) {
    stage = 3;
  } else if (stage == 3 && success) {
    stage = 0;
  }
}

void black() {
 pushMatrix();
 translate(width/2, height/2);
  camera();
  hint(DISABLE_DEPTH_TEST);
  fill(0, 200);
  rect(0, 0, width*2, height*2);
  hint(ENABLE_DEPTH_TEST);
  popMatrix();
} 