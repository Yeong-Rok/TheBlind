class imgInsert {
  Box [] roadboxes1 = new Box[30];
  Box [] roadboxes2 = new Box[30];
  Box [] roadboxes3 = new Box[30];
  Box [] grassbox1 = new Box[30];
  Box [] grassbox2 = new Box[48];
  Box [] grassbox3 = new Box[18];
  Box [] sidewalk1 = new Box[60];
  Box [] sidewalk2 = new Box[54];
  Box [] crosswalk1 = new Box[6];
  Box [] crosswalk2 = new Box[6];
  Box [] brailleStop = new Box[24];
  Box [] brailleGo = new Box[8];

  Box building;
  Box door;
  Box skybox;

  PVector roadPosition[] = new PVector[3];
  PVector grassPosition;
  PVector sidewalkPos;
  PVector crosswalkPos;
  PVector buildingPos;
  PVector doorPos;
  PVector brailleStopPos;
  PVector brailleGoPos;
  PVector skyPos;
  float x = 50;
  float y = -0.003;
  float z = 50;

  imgInsert(PApplet parent) {

    brailleStopPos = new PVector(x, y, z);    
    for (int i = 0; i<brailleStop.length; i++) {
      brailleStop[i] = new Box(parent, 3, 10, 3);
      brailleStop[i].setTexture("stop.jpeg");
      brailleStop[i].drawMode(S3D.TEXTURE);
    }

    brailleGoPos = new PVector(x, y, z);
    for (int i = 0; i< brailleGo.length; i++) {
      brailleGo[i] = new Box(parent, 3, 10, 3);
      brailleGo[i].setTexture("go.jpeg");
      brailleGo[i].drawMode(S3D.TEXTURE);
    }

    doorPos = new PVector(x, y, z);    
    door = new Box(parent, 20, 20, 30);
    door.setTexture("door2.png");
    door.drawMode(S3D.TEXTURE);


    buildingPos = new PVector(x, y, z);    
    building = new Box(parent, 50, 30, 30);
    building.setTexture("building1.jpg");
    building.drawMode(S3D.TEXTURE);


    skyPos = new PVector(x, y, z);  
    skybox = new Box(parent, 500, 500, 500);
    skybox.setTexture("back.jpg", Box.FRONT);
    skybox.setTexture("front.jpg", Box.BACK);
    skybox.setTexture("left.jpg", Box.LEFT);
    skybox.setTexture("right.jpg", Box.RIGHT);
    skybox.setTexture("sky.jpg", Box.TOP);
    skybox.visible(false, Box.BOTTOM);
    skybox.drawMode(S3D.TEXTURE);

    //road
    for (int i = 0; i<3; i++) {
      roadPosition[i] = new PVector(x, y, z);
    }
    for (int i = 0; i<roadboxes1.length; i++) {
      roadboxes1[i] = new Box(parent, 10, 10, 10);
      roadboxes1[i].setTexture("road.png", Box.TOP);
      roadboxes1[i].drawMode(S3D.TEXTURE);
      roadboxes2[i] = new Box(parent, 10, 10, 10);
      roadboxes2[i].setTexture("road.png", Box.TOP);
      roadboxes2[i].drawMode(S3D.TEXTURE);
      roadboxes3[i] = new Box(parent, 10, 10, 10);
      roadboxes3[i].setTexture("road.png", Box.TOP);
      roadboxes3[i].drawMode(S3D.TEXTURE);
    }

    //grass
    grassPosition = new PVector(x, y, z);
    for (int i = 0; i<grassbox1.length; i++) {
      grassbox1[i] = new Box(parent, 10, 10, 10);
      grassbox1[i].setTexture("grass2.jpg", Box.TOP);
      grassbox1[i].drawMode(S3D.TEXTURE);
    }
    for (int i = 0; i<grassbox2.length; i++) {
      grassbox2[i] = new Box(parent, 10, 10, 10);
      grassbox2[i].setTexture("grass2.jpg", Box.TOP);
      grassbox2[i].drawMode(S3D.TEXTURE);
    }
    for (int i = 0; i<grassbox3.length; i++) {
      grassbox3[i] = new Box(parent, 10, 10, 10);
      grassbox3[i].setTexture("grass2.jpg", Box.TOP);
      grassbox3[i].drawMode(S3D.TEXTURE);
    }
    //sidewalk
    sidewalkPos = new PVector(x, y, z);
    for (int i = 0; i<sidewalk1.length; i++) {
      sidewalk1[i] = new Box(parent, 10, 10, 10);
      sidewalk1[i].setTexture("sidewalk.jpg", Box.TOP);
      sidewalk1[i].drawMode(S3D.TEXTURE);
    }
    for (int i = 0; i<sidewalk2.length; i++) {
      sidewalk2[i] = new Box(parent, 10, 10, 10);
      sidewalk2[i].setTexture("sidewalk.jpg", Box.TOP);
      sidewalk2[i].drawMode(S3D.TEXTURE);
    }

    //crosswalk
    crosswalkPos = new PVector(x, y, z);
    for (int i = 0; i<crosswalk1.length; i++) {
      crosswalk1[i] = new Box(parent, 10, 10, 10);
      crosswalk1[i].setTexture("crosswalk.png", Box.TOP);
      crosswalk1[i].drawMode(S3D.TEXTURE);
    }
    for (int i = 0; i<crosswalk2.length; i++) {
      crosswalk2[i] = new Box(parent, 10, 10, 10); 
      crosswalk2[i].setTexture("crosswalk2.png", Box.TOP);
      crosswalk2[i].drawMode(S3D.TEXTURE);
    }
  }
  void showText(String str1, float xpos, float ypos) {
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    textMode(MODEL);
    text(str1, xpos, ypos);
    hint(ENABLE_DEPTH_TEST);
  }
  void display() {
    //3d image

    ////building door
    doorPos.x = 267;
    doorPos.y = -10 ;
    doorPos.z = 90;
    door.moveTo(doorPos.x, doorPos.y, doorPos.z);
    door.rotateTo(0, radians(30), 0);
    door.draw();

    //building
    buildingPos.x = 270;
    buildingPos.y = -35 ;
    buildingPos.z = 90;
    building.moveTo(buildingPos.x, buildingPos.y, buildingPos.z);
    building.rotateTo(0, radians(30), 0);
    building.draw();

    //sky
    skyPos.x = 150;
    skyPos.y = -250;
    skyPos.z = 0;
    skybox.moveTo(skyPos.x, skyPos.y, skyPos.z);
    skybox.draw();

    //road
    for (int i = 0; i< roadboxes1.length; i++) {
      roadPosition[0].x = i*10;
      roadPosition[0].z = 20;
      roadPosition[1].x = i*10;
      roadPosition[1].z = 30;
      roadPosition[2].x = i*10;
      roadPosition[2].z = 40;
      roadboxes1[i].moveTo(roadPosition[0].x, roadPosition[0].y, roadPosition[0].z);
      roadboxes1[i].rotateTo(0, radians(90), 0);
      roadboxes1[i].draw();
      roadboxes2[i].moveTo(roadPosition[1].x, roadPosition[1].y, roadPosition[1].z);
      roadboxes2[i].rotateTo(0, radians(90), 0);
      roadboxes2[i].draw();
      roadboxes3[i].moveTo(roadPosition[2].x, roadPosition[2].y, roadPosition[2].z);
      roadboxes3[i].rotateTo(0, radians(90), 0);
      roadboxes3[i].draw();
    }

    //grass
    for (int i=0; i<grassbox1.length; i++) {
      grassPosition.x = i*10;
      grassPosition.z = 0;
      grassbox1[i].moveTo(grassPosition.x, grassPosition.y, grassPosition.z);
      grassbox1[i].rotateTo(0, radians(90), 0);
      grassbox1[i].draw();
    }
    for (int i=0; i<grassbox2.length; i++) {
      if (i<12) {
        grassPosition.x = i*10;
        grassPosition.z = 60;
        grassbox2[i].moveTo(grassPosition.x, grassPosition.y, grassPosition.z);
        grassbox2[i].rotateTo(0, radians(90), 0);
        grassbox2[i].draw();
      } else if (i<24) {
        grassPosition.x = (i-12)*10;
        grassPosition.z = 70;
        grassbox2[i].moveTo(grassPosition.x, grassPosition.y, grassPosition.z);
        grassbox2[i].rotateTo(0, radians(90), 0);
        grassbox2[i].draw();
      } else if (i<36) {
        grassPosition.x = (i-24)*10;
        grassPosition.z = 80;
        grassbox2[i].moveTo(grassPosition.x, grassPosition.y, grassPosition.z);
        grassbox2[i].rotateTo(0, radians(90), 0);
        grassbox2[i].draw();
      } else {
        grassPosition.x = (i-36)*10;
        grassPosition.z = 90;
        grassbox2[i].moveTo(grassPosition.x, grassPosition.y, grassPosition.z);
        grassbox2[i].rotateTo(0, radians(90), 0);
        grassbox2[i].draw();
      }
    }
    for (int i = 0; i<grassbox3.length; i++) {
      if (i<9) {
        grassPosition.x = (i+12)*10;
        grassPosition.z = 60;
        grassbox3[i].moveTo(grassPosition.x, grassPosition.y, grassPosition.z);
        grassbox3[i].rotateTo(0, radians(90), 0);
        grassbox3[i].draw();
      } else if (i<15) {
        grassPosition.x = (i+3)*10;
        grassPosition.z = 70;
        grassbox3[i].moveTo(grassPosition.x, grassPosition.y, grassPosition.z);
        grassbox3[i].rotateTo(0, radians(90), 0);
        grassbox3[i].draw();
      } else {
        grassPosition.x = (i-3)*10;
        grassPosition.z = 80;
        grassbox3[i].moveTo(grassPosition.x, grassPosition.y, grassPosition.z);
        grassbox3[i].rotateTo(0, radians(90), 0);
        grassbox3[i].draw();
      }
    }

    //sidewalk
    for (int i=0; i<sidewalk1.length; i++) {
      if (i<30) {
        sidewalkPos.x = i*10;
        sidewalkPos.z = 10;
        sidewalk1[i].moveTo(sidewalkPos.x, sidewalkPos.y, sidewalkPos.z);
        sidewalk1[i].rotateTo(0, radians(90), 0);
        sidewalk1[i].draw();
      } else {
        sidewalkPos.x = (i-30)*10;
        sidewalkPos.z = 50;
        sidewalk1[i].moveTo(sidewalkPos.x, sidewalkPos.y, sidewalkPos.z);
        sidewalk1[i].rotateTo(0, radians(90), 0);
        sidewalk1[i].draw();
      }
    }
    for (int i=0; i<sidewalk2.length; i++) {
      if (i<18) {
        sidewalkPos.x = (i+12)*10;
        sidewalkPos.z = 90;
        sidewalk2[i].moveTo(sidewalkPos.x, sidewalkPos.y, sidewalkPos.z);
        sidewalk2[i].rotateTo(0, radians(90), 0);
        sidewalk2[i].draw();
      } else if (i<33) {
        sidewalkPos.x = (i-3)*10;
        sidewalkPos.z = 80;
        sidewalk2[i].moveTo(sidewalkPos.x, sidewalkPos.y, sidewalkPos.z);
        sidewalk2[i].rotateTo(0, radians(90), 0);
        sidewalk2[i].draw();
      } else if (i<45) {
        sidewalkPos.x = (i-15)*10;
        sidewalkPos.z = 70;
        sidewalk2[i].moveTo(sidewalkPos.x, sidewalkPos.y, sidewalkPos.z);
        sidewalk2[i].rotateTo(0, radians(90), 0);
        sidewalk2[i].draw();
      } else {
        sidewalkPos.x = (i-24)*10;
        sidewalkPos.z = 60;
        sidewalk2[i].moveTo(sidewalkPos.x, sidewalkPos.y, sidewalkPos.z);
        sidewalk2[i].rotateTo(0, radians(90), 0);
        sidewalk2[i].draw();
      }
    }

    //crosswalk
    for (int i=0; i<crosswalk1.length; i++) {
      if (i<3) {
        crosswalkPos.x = 30;
        crosswalkPos.y = -0.007;
        crosswalkPos.z = 20+i*10;
        crosswalk1[i].rotateTo(0, radians(180), 0);
      } else {
        crosswalkPos.x = 270;
        crosswalkPos.z = 20+(i-3)*10;
        crosswalk1[i].rotateTo(0, radians(180), 0);
      }
      crosswalk1[i].moveTo(crosswalkPos.x, crosswalkPos.y, crosswalkPos.z);
      crosswalk1[i].draw();
    }
    for (int i=0; i<crosswalk2.length; i++) {
      if (i<3) {
        crosswalkPos.x = 40;
        crosswalkPos.z = 20+i*10;
        crosswalk2[i].rotateTo(0, radians(90), 0);
      } else {
        crosswalkPos.x = 280;
        crosswalkPos.z = 20+(i-3)*10;
        crosswalk2[i].rotateTo(0, radians(90), 0);
      } 
      crosswalk2[i].moveTo(crosswalkPos.x, crosswalkPos.y, crosswalkPos.z);
      crosswalk2[i].draw();
    }


    for (int i = 0; i<brailleGo.length; i++) {
      brailleGoPos.y = -0.006;
      if (i<2) {
        brailleGoPos.x = 35;
        brailleGoPos.z = (i+3)*3;
      } else if (i<4) {
        brailleGoPos.x = 35;
        brailleGoPos.z = (i-3+17)*3;
      } else if (i<6) {
        brailleGoPos.x = 277;
        brailleGoPos.z = (i-5+4)*3;
      } else {
        brailleGoPos.x = 277;
        brailleGoPos.z = (i-5+15)*3;
      }
      brailleGo[i].moveTo(brailleGoPos.x, brailleGoPos.y, brailleGoPos.z);
      brailleGo[i].draw();

      if ((abs(player.position.x - brailleStopPos.x)<1) && (abs(player.position.z - brailleStopPos.z)<1))
      {
        fill(255);
        textSize(100);
        showText("STOP", width/2, height/2);
      }
    }

    for (int i = 0; i< brailleStop.length; i++) {
      brailleStopPos.y = -0.006;
      if (i<6) {
        brailleStopPos.x = (i+9.5)*3;
        brailleStopPos.z = 13;
      } else if (i<12) {
        brailleStopPos.x = (i-12+95.5)*3;
        brailleStopPos.z = 13;
      } else if (i<18) {
        brailleStopPos.x = (i-18+95.5)*3;
        brailleStopPos.z = 47;
      } else {
        brailleStopPos.x = (i-18+9.5)*3;
        brailleStopPos.z = 47;
      }
      brailleStop[i].moveTo(brailleStopPos.x, brailleStopPos.y, brailleStopPos.z);
      brailleStop[i].draw();

      if ((abs(player.position.x - brailleStopPos.x)<1) && (abs(player.position.z - brailleStopPos.z)<1))
      {
        fill(255);
        textSize(100);
        showText("STOP", width/2, height/2);
      }
    }
  }
}