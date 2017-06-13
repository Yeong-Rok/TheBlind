//the human class, is the one that manages the shapes that make up the human

class taillessMonkey {

  //there will be one joint array to keep track of all joints
  joint[] aJoint;
  PVector position;
  PVector dimensions;
  boolean goFront = true;
  float humanspeed = 0.08;
  float distance=0;

  PVector humanAngles;//the humans angles around the different axises

  float Height;//the height of the human

  float headHeight;//the height of the head (the distance from bottom of head to top of head)
  float heightOfHead;//the height the head is at
  PShape head;//the smartest part of a human
  PShape lowerMouth;//the part of a human used to eat, talk and eat with
  PShape eye;//there are to eyes, but i only need one shape, since they always are looking in the same direction.
  PVector eyePos;//the position of the eyes, (they are mirror images of one another)

  float throat;//the distance between the head and torso, i wont make it a shape

  float torsoHeight;//the height of the torso
  float heightOfTorso;//The height the torso is at
  PShape torso;//the torso

  PShape foot;//the feets

  float upperLegHeight; //the height the upper leg is at
  float upperLegXPos; //the x position the upper leg is at
  PShape upperLeg; //the upper leg

  float lowerLegHeight;//the height of the lower legs relative to the top legs
  PShape lowerLeg; //the lower leg

  float upperArmHeight; // the height of the upper arms
  float upperArmXPos; //the xPos of the upper arms
  PShape upperArm; //the upper arm

  float lowerArmHeight;//the height of the lower arm relative to the upper arm
  PShape lowerArm; //the lower arm

  float heightOfHand;//the height of the hand, relative to the lower arm
  PShape hand; //the hand without fingers

  //all fingerparts are the same length and radius.

  float fingerHeight;
  float fingerRadius;
  PShape fingerPart;//the fingerpartShape

  //all the optional variables that has to do with the size of the human in the constructor, except for the height, and the angle the eye is of center, is relative to the height.
  taillessMonkey(PVector tempPos, float tempHeight) {
    //TT = minim.loadFile("TT.wav");
    float shoulderWidthToHeight = 0.11;
    float torsoWidthLowToHeight = 0.11;
    float torsoWidthMiddleToHeight= 0.1;
    float fatnessLowToHeight = 0.06;
    float fatnessMiddleToHeight = 0.05;
    float fatnessHighToHeight= 0.06;
    float throatToHeight = 0.005;
    float upperLegLowWidthToHeight = 0.05;
    float upperLegMiddleWidthToHeight = 0.0525;
    float upperLegTopWidthToHeight = 0.055;
    float lowerLegLowWidthToHeight = 0.05;
    float lowerLegMiddleWidthToHeight = 0.0525;
    float lowerLegTopWidthToHeight = 0.05;
    float upperArmLowWidthToHeight = 0.03;
    float upperArmMiddleWidthToHeight = 0.04;
    float upperArmTopWidthToHeight = 0.03;
    float lowerArmLowWidthToHeight = 0.03;
    float lowerArmMiddleWidthToHeight =0.035;
    float lowerArmTopWidthToHeight = 0.035;
    float handHeightToHeight = 0.1;
    float handWidthToHeight = 0.01;
    float handLengthToHeight = 0.035;
    float feetHeightToHeight = 0.1;
    float feetLengthToHeight = 0.1;
    float feetWidthToHeight = 0.05;
    float eyeOfCenterAng = 2;
    position = tempPos;
    //as many variables as posiply will only exist in the constructor
    Height = tempHeight;
    humanAngles = new PVector(0, radians(90), 0);
    dimensions = new PVector(0.5, 10, 1.2);
    throat = throatToHeight*Height;
    float headToHeight = 0.2;
    headHeight = headToHeight*tempHeight;//calculate the headheight
    float headRadiusToHeight = 0.1;
    float headRadius = headRadiusToHeight*Height;//calculate the headRadius
    heightOfHead = Height-headHeight;//calculate the head position
    head = headShape(headHeight, headRadius);//create the head
    lowerMouth = lowerMouth(headHeight, headRadius);//create the lower mouth
    eye = eyeShape();//crete the eyes
    eyePos = new PVector(headRadius*cos(radians(270-eyeOfCenterAng)), headHeight/2, headRadius*sin(radians(270-eyeOfCenterAng))+1);

    float torsoToHeight = 0.37;
    torsoHeight = torsoToHeight*Height;


    float shoulderWidth = shoulderWidthToHeight*Height;
    float torsoWidthLow = torsoWidthLowToHeight*Height;
    float torsoWidthMiddle = torsoWidthMiddleToHeight*Height;
    float fatnessLow = fatnessLowToHeight*Height;
    float fatnessMiddle = fatnessMiddleToHeight*Height;
    float fatnessHigh = fatnessHighToHeight*Height;
    heightOfTorso =  -(heightOfHead-torsoHeight-throat);
    torso = torsoShape(torsoHeight, torsoWidthLow, torsoWidthMiddle, shoulderWidth, fatnessLow, fatnessMiddle, fatnessHigh);

    //the length of the legs, are the total height-headHeight-throatHeight-torsoHeight
    float legLength = Height-headHeight-throat-torsoHeight;

    float handHeight = handHeightToHeight*Height;//the height of the hands

    float feetHeight = feetHeightToHeight*Height;//and the feets

    float upperLegLowWidth = upperLegLowWidthToHeight*Height;
    float upperLegMiddleWidth = upperLegMiddleWidthToHeight*Height;
    float upperLegTopWidth = upperLegTopWidthToHeight*Height;
    upperLegHeight = -(heightOfHead-torsoHeight-throat);
    upperLegXPos = torsoWidthLow/2;
    upperLeg = legOrArmShape((legLength-feetHeight)/2, upperLegLowWidth, upperLegMiddleWidth, upperLegTopWidth);

    float lowerLegLowWidth = lowerLegLowWidthToHeight*Height;
    float lowerLegMiddleWidth = lowerLegMiddleWidthToHeight*Height;
    float lowerLegTopWidth = lowerLegTopWidthToHeight*Height;
    lowerLegHeight = (legLength-feetHeight)/2;
    lowerLeg = armShape((legLength-feetHeight)/2, lowerLegLowWidth, lowerLegMiddleWidth, lowerLegTopWidth);


    float armLength = (Height-shoulderWidth)/2;

    float upperArmLowWidth = upperArmLowWidthToHeight*Height;
    float upperArmMiddleWidth = upperArmMiddleWidthToHeight*Height;
    float upperArmTopWidth = upperArmTopWidthToHeight*Height;
    upperArmHeight = -(heightOfHead-throat-torsoHeight/8);
    upperArmXPos = torsoWidthLow+upperArmTopWidth;
    upperArm = legOrArmShape((armLength-handHeight)/2, upperArmLowWidth, upperArmMiddleWidth, upperArmTopWidth);

    float lowerArmLowWidth = lowerArmLowWidthToHeight*Height;
    float lowerArmMiddleWidth = lowerArmMiddleWidthToHeight*Height;
    float lowerArmTopWidth = lowerArmTopWidthToHeight*Height;
    lowerArmHeight = (armLength-handHeight)/2;
    lowerArm = armShape((armLength-handHeight)/2, lowerArmLowWidth, lowerArmMiddleWidth, lowerArmTopWidth);

    float handLength = handLengthToHeight*Height;
    float handWidth = handWidthToHeight*Height;
    heightOfHand = lowerArmHeight;//the height of the hand, is the same as the height of the lower arm

    //the hand is really a super complex thing, that i will never be able to do justice, so why even try, just a flat topped cone.
    hand = uniteLayers(flatTopCone(handHeight/2, lowerArmLowWidth, lowerArmLowWidth, handWidth, handLength, 0));

    float feetLength = feetLengthToHeight*Height;
    float feetWidth = feetWidthToHeight*Height;//the width of the feets, is also their radius
    foot = footShape(feetWidth, feetLength, feetHeight, lowerLegLowWidth);

    fingerHeight = handHeight/6;//the height of each fingerpart
    fingerPart = fingerShape(fingerHeight, handLength, handWidth);//make the fingerpart shape

    aJoint = new joint[33];

    // the maximum and minimum values for the human is based on how much i can strech myself.
    aJoint[0] = new joint(0, -HALF_PI, HALF_PI, 0.2, "head to neck y");
    aJoint[1] = new joint(0, -HALF_PI/3, HALF_PI/3, 0.2, "head to neck x");
    aJoint[2] = new joint(0, -HALF_PI/2, HALF_PI/2, 0.1, "eye x");
    aJoint[3] = new joint(0, -HALF_PI/2, HALF_PI/2, 0.1, "eye y");
    aJoint[4] = new joint(0, 0, HALF_PI/3, 0.1, "lower mouth x");
    aJoint[5] = new joint(0, -HALF_PI, HALF_PI/3, 0.2, "right arm to shoulder x");
    aJoint[6] = new joint(0, -HALF_PI, HALF_PI/3, 0.2, "left arm to shoulder x");
    aJoint[7] = new joint(0, -PI, HALF_PI/3, 0.2, "right arm to shoulder z");
    aJoint[8] = new joint(0, -HALF_PI/3, PI, 0.2, "left arm to shoulder z");
    aJoint[9] = new joint(0, -HALF_PI, HALF_PI, 0.2, "right arm to shoulder y");
    aJoint[10] = new joint(0, -HALF_PI, HALF_PI, 0.2, "left arm to shoulder y");
    aJoint[11] = new joint(0, -HALF_PI*3/2, 0, 0.2, "right arm joint x");
    aJoint[12] = new joint(0, -HALF_PI*3/2, 0, 0.2, "left arm joint x");
    aJoint[13] = new joint(0, -HALF_PI, HALF_PI, 0.2, "right hand joint y");
    aJoint[14] = new joint(0, -HALF_PI, HALF_PI, 0.2, "left hand joint y");
    aJoint[15] = new joint(0, -HALF_PI/2, HALF_PI, 0.2, "right hand joint z");
    aJoint[16] = new joint(0, -HALF_PI, HALF_PI/2, 0.2, "left hand joint z");
    aJoint[17] = new joint(HALF_PI, 0, HALF_PI, 0.2, "right hand finger part 1 joint z");
    aJoint[18] = new joint(-HALF_PI, -HALF_PI, 0, 0.2, "left hand finger part 1 joint z");
    aJoint[19] = new joint(HALF_PI, 0, HALF_PI, 0.2, "right hand finger part 2 joint z");
    aJoint[20] = new joint(-HALF_PI, -HALF_PI, 0, 0.2, "left hand finger part 2 joint z");
    aJoint[21] = new joint(HALF_PI, 0, HALF_PI, 0.2, "right hand finger part 3 joint z");
    aJoint[22] = new joint(-HALF_PI, -HALF_PI, 0, 0.2, "left hand finger part 3 joint z");
    aJoint[23] = new joint(0, -PI*0.9, 0, 0.2, "right leg to torso joint x");
    aJoint[24] = new joint(0, -PI*0.9, 0, 0.2, "left leg to torso joint x");
    aJoint[25] = new joint(0, -HALF_PI/2, 0, 0.2, "right leg to torso joint z");
    aJoint[26] = new joint(0, 0, HALF_PI/2, 0.2, "left leg to torso joint z");
    aJoint[27] = new joint(0, 0, PI*0.9, 0.2, "right leg joint x");
    aJoint[28] = new joint(0, 0, PI*0.9, 0.2, "left leg joint x");
    aJoint[29] = new joint(0, -HALF_PI/2, HALF_PI/3, 0.2, "right foot joint x");
    aJoint[30] = new joint(0, -HALF_PI/2, HALF_PI/3, 0.2, "left foot joint x");
    aJoint[31] = new joint(0, -HALF_PI/2, HALF_PI/2, 0.2, "right foot joint y");
    aJoint[32] = new joint(0, -HALF_PI/2, HALF_PI/2, 0.2, "left foot joint y");
  }

  void be() {//to be or not to be, it's all here
    pushMatrix();
    translate(position.x, position.y, position.z);

    rotateX(humanAngles.x);
    rotateZ(humanAngles.z);
    rotateY(humanAngles.y);

    displayHead();//display the head
    displayTorso();//the torso
    displayLeg(upperLegXPos, 0);//display the two legs
    displayLeg(-upperLegXPos, 1);
    displayArm(upperArmXPos, 0);//display the arms
    displayArm(-upperArmXPos, 1);

    popMatrix();
  }

  void displayHead() {//the head, is also the eyes, and the lower mouth
    pushMatrix();

    translate(0, -heightOfHead, 0);//move the head to its location

    rotateY(aJoint[0].ang);    
    rotateX(aJoint[1].ang);

    shape(head);//shape the head

    popMatrix();
  }

  void displayTorso() {//not a lot of code, in this function, but it whould look weird withhout it
    pushMatrix();
    translate(0, heightOfTorso, 0);//move to the torsoposition
    shape(torso);//shape the torso
    popMatrix();
  }

  void displayLeg(float xPos, int i) {
    pushMatrix();
    translate(xPos, upperLegHeight, 0);//move to the upper leg

    rotateX(aJoint[23+i].ang);

    rotateZ(aJoint[25+i].ang);

    shape(upperLeg);//shape an upper leg

    translate(0, lowerLegHeight, 0);//move to the lower leg, beneath this upper leg

    rotateX(aJoint[27+i].ang);
    fill(0, 255, 0);

    shape(lowerLeg);//shape a lower leg

    translate(0, lowerLegHeight, 0);//move to the foot

    rotateY(aJoint[31+i].ang);
    rotateX(aJoint[29+i].ang);

    shape(foot);


    popMatrix();
  }

  void displayArm(float xPos, int i) {
    pushMatrix();

    translate(xPos, upperArmHeight, 0);//move the arm to where it should be
    rotateZ(aJoint[7+i].ang);
    rotateX(aJoint[5+i].ang);
    rotateY(aJoint[9+i].ang);

    shape(upperArm);//shape an upper arm


    translate(0, lowerArmHeight, 0);//move down to the lower arms position

    rotateX(aJoint[11+i].ang);

    shape(lowerArm);//shape a lower arm

    translate(0, heightOfHand, 0);//move down to the hands position

    rotateY(aJoint[13+i].ang);
    rotateZ(aJoint[15+i].ang);

    shape(hand);//shape a hand

    //display the fingers inside the glove the human is wearing to simplify things


    translate(0, fingerHeight*3, 0);//move the finger to where it should be

    rotateZ(aJoint[17+i].ang);

    shape(fingerPart);//shape a fingerpart

    translate(0, fingerHeight, 0);//move to the next fingerpart

    rotateZ(aJoint[19+i].ang);

    shape(fingerPart);//shape a fingerpart

    translate(0, fingerHeight, 0);//move to the next fingerpart

    rotateZ(aJoint[21+i].ang);

    shape(fingerPart);//shape a fingerpart



    popMatrix();
  }

  void update() {
    float playerLeft = player.position.x - player.dimensions.x/2;
    float playerRight = player.position.x + player.dimensions.x/2;
    float playerTop = player.position.y - player.dimensions.y/2;
    float playerBottom = player.position.y + player.dimensions.y/2;
    float playerFront = player.position.z - player.dimensions.z/2;
    float playerBack = player.position.z + player.dimensions.z/2;

    float boxLeft = position.x - dimensions.x/2;
    float boxRight = position.x + dimensions.x/2;
    float boxTop = position.y - dimensions.y/2;
    float boxBottom = position.y + dimensions.y/2;
    float boxFront = position.z - dimensions.z/2;
    float boxBack = position.z + dimensions.z/2;

    float boxLeftOverlap = playerRight - boxLeft;
    float boxRightOverlap = boxRight - playerLeft;
    float boxTopOverlap = playerBottom - boxTop;
    float boxBottomOverlap = boxBottom - playerTop;
    float boxFrontOverlap = playerBack - boxFront;
    float boxBackOverlap = boxBack - playerFront;

    if (((playerLeft > boxLeft && playerLeft < boxRight || (playerRight > boxLeft && playerRight < boxRight)) && ((playerTop > boxTop && playerTop < boxBottom) || (playerBottom > boxTop && playerBottom < boxBottom)) && ((playerFront > boxFront && playerFront < boxBack) || (playerBack > boxFront && playerBack < boxBack)))) {
      crashed=true;

      float xOverlap = max(min(boxLeftOverlap, boxRightOverlap), 0);
      float yOverlap = max(min(boxTopOverlap, boxBottomOverlap), 0);
      float zOverlap = max(min(boxFrontOverlap, boxBackOverlap), 0);

      if (xOverlap < yOverlap && xOverlap < zOverlap) {
        if (boxLeftOverlap < boxRightOverlap) {
          player.position.x = boxLeft - player.dimensions.x/2;
        } else {
          player.position.x = boxRight + player.dimensions.x/2;
        }
      } else if (yOverlap < xOverlap && yOverlap < zOverlap) {
        if (boxTopOverlap < boxBottomOverlap) {
          player.position.y = boxTop - player.dimensions.y/2;
          player.velocity.y = 0;
          player.grounded = true;
        } else {
          player.position.y = boxBottom + player.dimensions.y/2;
        }
      } else if (zOverlap < xOverlap && zOverlap < yOverlap) {
        if (boxFrontOverlap < boxBackOverlap) {
          player.position.z = boxFront - player.dimensions.x/2;
        } else {
          player.position.z = boxBack + player.dimensions.x/2;
        }
      }
    }
    if (crashed==true) {
      background(0);
      player.position.x -=1.5;
      player.position.z -=1.5;
      scoreNum-=10;
       yellow();
      crashed=false;
       status= "You are crashed with people!";
    }
  }

  void move() {
    float d1 = player.position.dist(position);
    distance = d1;
    if (distance<30) {
      if (player.position.z - position.z > 0.5) TT.setPan(-1.0);
      else if (player.position.z - position.z < -0.5) TT.setPan(1.0);
      else TT.setPan(0);
      TT.play();
      if ( abs(TT.position() - TT.length())<5 )
      {
        TT.rewind();
      } else {
        TT.pause();
      }
    }
    if (goFront) {
      position.x = position.x - humanspeed;
    } else {
      position.x = 0;
    }
    if (position.x==290 || position.x==0) {
      goFront = !goFront;
    }
  }
}