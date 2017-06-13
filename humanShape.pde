//the different parts of the human are different PShapes

/*
A humanShape shall include these independent shapes
 
 1* head
 2* eyes
 1 lower mouth
 
 1* body
 2* upper arm
 2* lower arm
 2* hand
 2* upper leg
 2* lower leg
 2* foot
 
 6 moveable handparts,
 
 and i will just asume the person is wearing shoes, and gloves so that i can ignore the toes and fingers
 and i will also ignore all hair.
 
 okay it will properly be more like a dummy that looks like a human
 
 
 
 */

PShape headShape(float Height, float radius) {
  PShape head = createShape(GROUP);

  //the head shape is terrible, i didn't plan it properly, i didn't use enough comments, and most of the stuff is kind of improvised.
  //i had to spend ages fixing all the mistakes i made early on, note to yourself PLAN YOUR PROJECT BEFORE STARTING.

  fill(#F5CA8A);
  noStroke();
  float bottomHeadHeight = Height/2;//the bottomHead's height
  float bottomHeadTopWidth = radius*0.9;//the width of the head is smaller than the length
  float bottomHeadTopLength = radius;//the top length of the head
  float bottomHeadBottomWidth = radius/3*2*0.9;//the bottom width of the head
  float bottomHeadBottomLength = radius/3*2;//the bottom length of the head
  float heightOfBottomHead = Height/2;//the height the bottom head is at

  //use the variables to make the layers of the bottom head, and unite them into one shape, and add it to the head
  head.addChild(uniteLayers(flatTopCone(bottomHeadHeight, bottomHeadTopWidth, bottomHeadTopLength, bottomHeadBottomWidth, bottomHeadBottomLength, heightOfBottomHead)));

  fill(0); 
  float topOfHeadHeightRadius = Height/2;
  float topOfHeadWidthRadius = radius*0.9;
  float topOfHeadLengthRadius = radius;
  float heighOfTopOfHead = -Height/2;

  head.addChild(uniteLayers(halfEllipsoidLayers(topOfHeadWidthRadius, topOfHeadHeightRadius, topOfHeadLengthRadius, heighOfTopOfHead)));

  fill(#F5CA8A);
  //the upper mouth is half a flatTopCone
  PShape[] upperMouthLayer = new PShape[6];//the upper part of the mouth, is also made the same way as the head and the lower mouth

  for (int i = 0; i < upperMouthLayer.length; i++) {

    upperMouthLayer[i] = createShape();
    upperMouthLayer[i].beginShape();

    //i will add the lower mouth to the head, so i nead to know where it is
    float thisLayerHeight = Height-Height/(20)*(i+2);
    float thisLayerWidth = map(thisLayerHeight, Height/2, Height, radius*0.9, radius/3*2*0.9);
    float maximumLayerLength = map(Height-Height/(20)*(2), Height-Height/(20)*3, Height, radius, radius*0.8);//the length of the top layer at the lower mouth
    float thisLayerLenght= map(i, 0, upperMouthLayer.length, maximumLayerLength, radius*0.85);

    upperMouthLayer[i].fill(170);
    upperMouthLayer[i].noStroke();

    for (int j = 90; j <= 270; j+=20) {

      upperMouthLayer[i].vertex(sin(radians(j))*thisLayerWidth, thisLayerHeight-Height, thisLayerLenght*cos(radians(j)));
    }

    upperMouthLayer[i].endShape(CLOSE);

    head.addChild(upperMouthLayer[i]);
  }

  head.addChild(uniteLayers(upperMouthLayer));


  // i could not find a simple way of making the nose in a for loop, every vertex of the different layers need to be placed by hand
  PShape[] noseLayer;

  noseLayer = new PShape[7];

  noseLayer[0] = createShape();
  noseLayer[0].beginShape();


  float thisNoseLayerHeight = Height-Height/(20)*(2+2);

  noseLayer[0].fill(170);
  noseLayer[0].noStroke();

  noseLayer[0].vertex(sin(radians(165))*radius*0.9, thisNoseLayerHeight-Height, radius*0.9*cos(radians(165)));
  noseLayer[0].vertex(sin(radians(170))*radius*0.95, thisNoseLayerHeight-Height, radius*1*cos(radians(170)));
  noseLayer[0].vertex(sin(radians(180))*radius*1.1, thisNoseLayerHeight-Height, radius*1.2*cos(radians(180)));
  noseLayer[0].vertex(sin(radians(190))*radius*0.95, thisNoseLayerHeight-Height, radius*1*cos(radians(190)));
  noseLayer[0].vertex(sin(radians(195))*radius*0.9, thisNoseLayerHeight-Height, radius*0.9*cos(radians(195)));

  noseLayer[0].endShape(CLOSE);


  //next nose layer

  noseLayer[1] = createShape();
  noseLayer[1].beginShape();


  thisNoseLayerHeight = Height-Height/(20)*(2+3);

  noseLayer[1].fill(170);
  noseLayer[1].noStroke();

  noseLayer[1].vertex(sin(radians(165))*radius*0.85, thisNoseLayerHeight-Height, radius*0.85*cos(radians(165)));
  noseLayer[1].vertex(sin(radians(170))*radius*0.925, thisNoseLayerHeight-Height, radius*0.925*cos(radians(170)));
  noseLayer[1].vertex(sin(radians(180))*radius, thisNoseLayerHeight-Height, radius*1.15*cos(radians(180)));
  noseLayer[1].vertex(sin(radians(190))*radius*0.925, thisNoseLayerHeight-Height, radius*0.925*cos(radians(190)));
  noseLayer[1].vertex(sin(radians(195))*radius*0.85, thisNoseLayerHeight-Height, radius*0.85*cos(radians(195)));

  noseLayer[1].endShape(CLOSE);


  //next nose layer

  noseLayer[2] = createShape();
  noseLayer[2].beginShape();


  thisNoseLayerHeight = Height-Height/(20)*(2+4);

  noseLayer[2].fill(170);
  noseLayer[2].noStroke();

  noseLayer[2].vertex(sin(radians(165))*radius*0.85, thisNoseLayerHeight-Height, radius*0.85*cos(radians(165)));
  noseLayer[2].vertex(sin(radians(170))*radius*0.925, thisNoseLayerHeight-Height, radius*0.925*cos(radians(170)));
  noseLayer[2].vertex(sin(radians(180))*radius, thisNoseLayerHeight-Height, radius*1.1*cos(radians(180)));
  noseLayer[2].vertex(sin(radians(190))*radius*0.925, thisNoseLayerHeight-Height, radius*0.925*cos(radians(190)));
  noseLayer[2].vertex(sin(radians(195))*radius*0.85, thisNoseLayerHeight-Height, radius*0.85*cos(radians(195)));

  noseLayer[2].endShape(CLOSE);


  //next nose layer

  noseLayer[3] = createShape();
  noseLayer[3].beginShape();


  thisNoseLayerHeight = Height-Height/(20)*(2+5);

  noseLayer[3].fill(170);
  noseLayer[3].noStroke();

  noseLayer[3].vertex(sin(radians(165))*radius*0.85, thisNoseLayerHeight-Height, radius*0.85*cos(radians(165)));
  noseLayer[3].vertex(sin(radians(170))*radius*0.925, thisNoseLayerHeight-Height, radius*0.925*cos(radians(170)));
  noseLayer[3].vertex(sin(radians(180))*radius, thisNoseLayerHeight-Height, radius*1.05*cos(radians(180)));
  noseLayer[3].vertex(sin(radians(190))*radius*0.925, thisNoseLayerHeight-Height, radius*0.925*cos(radians(190)));
  noseLayer[3].vertex(sin(radians(195))*radius*0.85, thisNoseLayerHeight-Height, radius*0.85*cos(radians(195)));

  noseLayer[3].endShape(CLOSE);



  noseLayer[4] = createShape();
  noseLayer[4].beginShape();


  thisNoseLayerHeight = Height-Height/(20)*(2+6);

  noseLayer[4].fill(170);
  noseLayer[4].noStroke();

  noseLayer[4].vertex(sin(radians(165))*radius*0.85, thisNoseLayerHeight-Height, radius*0.85*cos(radians(165)));
  noseLayer[4].vertex(sin(radians(170))*radius*0.925, thisNoseLayerHeight-Height, radius*0.925*cos(radians(170)));
  noseLayer[4].vertex(sin(radians(180))*radius, thisNoseLayerHeight-Height, radius*1.025*cos(radians(180)));
  noseLayer[4].vertex(sin(radians(190))*radius*0.925, thisNoseLayerHeight-Height, radius*0.925*cos(radians(190)));
  noseLayer[4].vertex(sin(radians(195))*radius*0.85, thisNoseLayerHeight-Height, radius*0.85*cos(radians(195)));

  noseLayer[4].endShape(CLOSE);



  noseLayer[5] = createShape();
  noseLayer[5].beginShape();


  thisNoseLayerHeight = Height-Height/(20)*(2+7);

  noseLayer[5].fill(170);
  noseLayer[5].noStroke();

  noseLayer[5].vertex(sin(radians(165))*radius*0.85, thisNoseLayerHeight-Height, radius*0.85*cos(radians(165)));
  noseLayer[5].vertex(sin(radians(170))*radius*0.925, thisNoseLayerHeight-Height, radius*0.925*cos(radians(170)));
  noseLayer[5].vertex(sin(radians(180))*radius, thisNoseLayerHeight-Height, radius*1*cos(radians(180)));
  noseLayer[5].vertex(sin(radians(190))*radius*0.925, thisNoseLayerHeight-Height, radius*0.925*cos(radians(190)));
  noseLayer[5].vertex(sin(radians(195))*radius*0.85, thisNoseLayerHeight-Height, radius*0.85*cos(radians(195)));

  noseLayer[5].endShape(CLOSE);




  noseLayer[6] = createShape();
  noseLayer[6].beginShape();


  thisNoseLayerHeight = Height-Height/(20)*(2+8);

  noseLayer[6].fill(170);
  noseLayer[6].noStroke();

  noseLayer[6].vertex(sin(radians(165))*radius*0.85, thisNoseLayerHeight-Height, radius*0.85*cos(radians(165)));
  noseLayer[6].vertex(sin(radians(170))*radius*0.925, thisNoseLayerHeight-Height, radius*0.925*cos(radians(170)));
  noseLayer[6].vertex(sin(radians(180))*radius, thisNoseLayerHeight-Height, radius*0.975*cos(radians(180)));
  noseLayer[6].vertex(sin(radians(190))*radius*0.925, thisNoseLayerHeight-Height, radius*0.925*cos(radians(190)));
  noseLayer[6].vertex(sin(radians(195))*radius*0.85, thisNoseLayerHeight-Height, radius*0.85*cos(radians(195)));

  noseLayer[6].endShape(CLOSE);


  //unite the nose layers and add it to the head
  head.addChild(uniteLayers(noseLayer));



  //  PShape[] ear = new PShape[2];//there are to ears, on at each side of the head (obviously)

  //  ear[0] = createShape();
  //  ear[1] = createShape();

  //  ear[0].beginShape(TRIANGLE_FAN);
  //  ear[1].beginShape(TRIANGLE_FAN);
  //  //i could properly do it much better, but i dont want to use to much time on such a small thing


  //  float earHeightRadius = 5;
  //  float earLengthRadius = 2.5;

  //  ear[0].noStroke();
  //  ear[1].noStroke();

  //  ear[0].fill(190);
  //  ear[1].fill(190);

  //  ear[0].vertex(radius*0.9, -Height/2, 0);//the ears arent really that realistic, just a disc at the side of the head.
  //  ear[1].vertex(-radius*0.9, -Height/2, 0);
  //  for (int i = 0; i <= 360; i+=10) {
  //    ear[0].vertex(radius*0.9, -Height/2+earHeightRadius*sin(radians(i)), earLengthRadius*cos(radians(i)));//the ears arent really that realistic, just a disc at the side of the head.  
  //    ear[1].vertex(-radius*0.9, -Height/2+earHeightRadius*sin(radians(i)), earLengthRadius*cos(radians(i)));//the ears arent really that realistic, just a disc at the side of the head.
  //  }

  //  ear[0].endShape();
  //  ear[1].endShape();

  //  //i will also turn the ears a little around the y axis
  //  for (int i = 0; i < ear[0].getVertexCount (); i++) {
  //    PVector v1 = ear[0].getVertex(i);
  //    PVector v2 = ear[1].getVertex(i);


  //    float ang1 = atan2(v1.x+radius*0.9, v1.z);//the angle between the center of the ear, and the position
  //    float distance1 = dist(v1.x, v1.z, radius*0.9, 0);

  //    if (v1.z < 0) {//the dist funcion doesn't know about positive and negative numbers
  //      ang1 = atan2(v1.x+radius*0.9, v1.z);
  //      distance1 = -dist(v1.x, v1.z, radius*0.9, 0);
  //    }


  //    float ang2 = atan2(v2.x-radius*0.9, v2.z);
  //    float distance2 = dist(v2.x, v2.z, -radius*0.9, 0);

  //    if (v2.z < 0) {
  //      ang2 = atan2(v2.x-radius*0.9, v2.z);
  //      distance2 = -dist(v2.x, v2.z, -radius*0.9, 0);
  //    }


  //    v1.x = cos(ang1-0.4)*distance1+radius*0.9;
  //    v1.z = sin(ang1-0.4)*distance1;

  //    v2.x = cos(ang2+0.4)*distance2-radius*0.9;
  //    v2.z = sin(ang2+0.4)*distance2;

  //    ear[0].setVertex(i, v1.x, v1.y, v1.z);
  //    ear[1].setVertex(i, v2.x, v2.y, v2.z);
  //  }


  //  head.addChild(ear[0]);
  //  head.addChild(ear[1]);


  return  head;
}
PShape lowerMouth(float Height, float radius) {//the lower part of the mouth
  PShape lowerMouth = createShape(GROUP);

  //the lower mouth is 3 layers
  PShape[] lowerMouthLayer = new PShape[3];

  //its made the same way as the upper mouth
  for (int i = 0; i < lowerMouthLayer.length; i++) {

    lowerMouthLayer[i] = createShape();
    lowerMouthLayer[i].beginShape();

    //the lower mouth shall look like its a part of the head, so it needs to be the right size relative to it
    float thisLayerHeight = Height-Height/(20)*i;

    float thisLayerWidth = map(thisLayerHeight, Height/2, Height, radius*0.9, radius/3*2*0.9);
    float thisLayerLenght= map(thisLayerHeight, Height-Height/(20)*lowerMouthLayer.length, Height, radius, radius*0.8);

    lowerMouthLayer[i].fill(170);
    lowerMouthLayer[i].noStroke();

    for (int j = 90; j <= 270; j+=20) {

      lowerMouthLayer[i].vertex(sin(radians(j))*thisLayerWidth, thisLayerHeight-Height, thisLayerLenght*cos(radians(j)));
    }


    lowerMouthLayer[i].endShape(CLOSE);
    lowerMouth.addChild(lowerMouthLayer[i]);
  }


  lowerMouth.addChild(uniteLayers(lowerMouthLayer));
  return lowerMouth;
}

PShape eyeShape() {//an eye
  //all eyes has the same radius, no matter the radius of the head,
  float eyeRadiusHeight = 1;
  float eyeRadiusWidth = 5;

  PShape eye = createShape(GROUP);

  //the eye is the only ellipsoid, that isn't half
  PShape[] eyeLayer = new PShape[18];


  for (int i = 0; i < 18; i++) {

    float thisLayerHeight = sin(radians(i*10+90))*eyeRadiusHeight;
    float thisLayerRadius = cos(radians(i*10+90))*eyeRadiusWidth;

    eyeLayer[i] = createShape();
    eyeLayer[i].beginShape();

    for (int j = 0; j <= 360; j+=10) {
      eyeLayer[i].vertex(thisLayerRadius*cos(radians(j)), thisLayerHeight, thisLayerRadius*sin(radians(j)));
    }  
    eyeLayer[i].endShape();
  }

  //i cant use the unite funcion, because i need a black spot in the middle of the eye, and i want the rest of the eye to be white
  PShape[] eyeSide;
  eyeSide = new PShape[eyeLayer.length-1];


  for (int i = 0; i < eyeSide.length; i++) {
    eyeSide[i] = createShape();

    eyeSide[i].beginShape(QUAD_STRIP);
    for (int n = 0; n < eyeLayer[0].getVertexCount (); n++) {

      PVector v_1 = eyeLayer[i].getVertex(n);
      PVector v_2 = eyeLayer[i+1].getVertex(n);
      PVector v_3 = eyeLayer[i].getVertex((n+1)%eyeLayer[0].getVertexCount());
      PVector v_4 = eyeLayer[i+1].getVertex((n+1)%eyeLayer[0].getVertexCount());

      eyeSide[i].noStroke();

      eyeSide[i].fill(255);

      if (n == eyeLayer[0].getVertexCount()/4+1 || n == eyeLayer[0].getVertexCount()/4 || n == eyeLayer[0].getVertexCount()/4-1 || n == eyeLayer[0].getVertexCount()/4-2) {
        if (i > 5 && i < 18-5) {
          eyeSide[i].fill(0);//make a dark spot in the middle of the eye (its the thing we see with)
        }
      }


      eyeSide[i].vertex(v_1.x, v_1.y, v_1.z);
      eyeSide[i].vertex(v_2.x, v_2.y, v_2.z);
      eyeSide[i].vertex(v_3.x, v_3.y, v_3.z);
      eyeSide[i].vertex(v_4.x, v_4.y, v_4.z);
    }
    eyeSide[i].endShape();
    eye.addChild(eyeSide[i]);
  }

  return eye;
}


PShape  torsoShape(float Height, float lowWidth, float middleWidth, float shoulderWidth, float fatnessLow, float fatnessMiddle, float fatnessHigh) {
  PShape torso = createShape(GROUP);

  //there are 3 different circles, one at the buttom, one in the middle and one at the top.
  //They are conected by two flat top cones
  fill(random(0, 225), random(0, 225), random(0, 225));

  float lowTorsoHeight = Height/8*3;//the low torso's height
  float heightOflowTorso = Height/2;//the height the low torso is at

  torso.addChild(uniteLayers(flatTopCone(lowTorsoHeight, middleWidth, fatnessMiddle, lowWidth, fatnessLow, heightOflowTorso)));

  float topTorsoHeight = Height/8*3;//the top torso's height
  float heightOftopTorso = Height/8*7;//the height the top torso is at

  torso.addChild(uniteLayers(flatTopCone(topTorsoHeight, shoulderWidth, fatnessHigh, middleWidth, fatnessMiddle, heightOftopTorso)));


  float shoulderHeight = (Height)/8;//find the height radius of the shoulder, which is the distance to the head
  float heightOfShoulder = -(Height)/8*7;//the height the shoulder is at

  torso.addChild(uniteLayers(halfCyllinderLayers(shoulderWidth, shoulderHeight, fatnessHigh, heightOfShoulder)));//make the shoulder

  //i am not sure whether or not this is a he or a she, therefor is the bottom the least detailed part
  float bottomHeight = -(Height)/8;//find the height radius of the buttom
  float heightOfBottom = -(Height)/8;

  torso.addChild(uniteLayers(halfEllipsoidLayers(lowWidth, bottomHeight, fatnessLow, heightOfBottom)));//make the shoulder


  return torso;
}


//to save time, i'm using this as both legs and arms
PShape legOrArmShape(float Height, float lowRadius, float middleRadius, float highRadius) {

  fill(random(0, 225), random(0, 225), random(0, 225));
  PShape legOrArm = createShape(GROUP);



  float lowPartHeight = Height/2;
  float HeightOfLowPart = -Height/2;

  legOrArm.addChild(uniteLayers(flatTopCone(lowPartHeight, middleRadius, middleRadius, lowRadius, lowRadius, HeightOfLowPart)));


  float topPartHeight = Height/2;
  float HeightOfTopPart = 0;

  legOrArm.addChild(uniteLayers(flatTopCone(topPartHeight, highRadius, highRadius, middleRadius, middleRadius, HeightOfTopPart)));


  float conectionHeight = -Height/8;
  float heightOfConection = Height;

  legOrArm.addChild(uniteLayers(halfEllipsoidLayers(lowRadius, conectionHeight, lowRadius, heightOfConection)));//make the shoulder

  legOrArm.addChild(uniteLayers(halfEllipsoidLayers(highRadius, -conectionHeight, highRadius, 0)));//make the shoulder

  return legOrArm;
}

PShape armShape(float Height, float lowRadius, float middleRadius, float highRadius) {

  fill(#F5CA8A);
  PShape legOrArm = createShape(GROUP);



  float lowPartHeight = Height/2;
  float HeightOfLowPart = -Height/2;

  legOrArm.addChild(uniteLayers(flatTopCone(lowPartHeight, middleRadius, middleRadius, lowRadius, lowRadius, HeightOfLowPart)));


  float topPartHeight = Height/2;
  float HeightOfTopPart = 0;

  legOrArm.addChild(uniteLayers(flatTopCone(topPartHeight, highRadius, highRadius, middleRadius, middleRadius, HeightOfTopPart)));


  float conectionHeight = -Height/8;
  float heightOfConection = Height;

  legOrArm.addChild(uniteLayers(halfEllipsoidLayers(lowRadius, conectionHeight, lowRadius, heightOfConection)));//make the shoulder

  legOrArm.addChild(uniteLayers(halfEllipsoidLayers(highRadius, -conectionHeight, highRadius, 0)));//make the shoulder

  return legOrArm;
}


PShape fingerShape(float Height, float Length, float Width) {//these are the most simple shapes
  fill(#F5CA8A);
  PShape finger = createShape(GROUP);

  finger.addChild(uniteLayers(flatTopCone(Height, Width, Length, Width, Length, 0)));


  finger.addChild(uniteLayers(halfEllipsoidLayers(Width, -Height/2, Length, Height)));

  return finger;
}

PShape footShape(float Width, float Length, float Height, float legWidth) {
  PShape foot = createShape(GROUP);
  fill(random(0, 225), random(0, 225), random(0, 225));

  foot.addChild(uniteLayers(flatTopCone(Height, legWidth, legWidth, Width, Width, 0)));

  //the footshap is the only shape, that isn't centered on z = 0.
  //it shall be centered on z = Length/2. In all other cases, it is simply

  PShape[] layer;
  layer = new PShape[6];


  for (int i = 0; i < layer.length; i++) {//i goes from 0,  90 degrees

    float thisLayerHeight = sin(radians(i*20+180))*Height/2+Height;//the specific height
    float thisLayerRadiusWidth = cos(radians(i*20+180))*Width;//the specific width
    float thisLayerRadiusLength = cos(radians(i*20+180))*Length;//the specific length

    layer[i] = createShape();
    layer[i].beginShape();

    for (int j = 0; j <= 360; j+=30) {//j goes from 0 to 360 degrees
      layer[i].vertex(thisLayerRadiusWidth*cos(radians(j)), thisLayerHeight, thisLayerRadiusLength*sin(radians(j))-Length/2);
    }  
    layer[i].endShape();
  }

  foot.addChild(uniteLayers(layer));


  return foot;
}

//unite layers into sides made of QUAD's
PShape uniteLayers(PShape[] layers) {
  PShape allSides = createShape(GROUP);//all the sides in one shape

  PShape[] side;//the sides
  side = new PShape[layers.length-1];

  for (int i = 0; i < side.length; i++) {
    side[i] = createShape();

    side[i].beginShape(QUAD_STRIP);

    for (int n = 0; n < layers[0].getVertexCount (); n++) {//all layers has the same number of vertecies

      PVector v_1 = layers[i].getVertex(n);
      PVector v_2 = layers[i+1].getVertex(n);
      PVector v_3 = layers[i].getVertex((n+1)%layers[0].getVertexCount());
      PVector v_4 = layers[i+1].getVertex((n+1)%layers[0].getVertexCount());

      side[i].vertex(v_1.x, v_1.y, v_1.z);
      side[i].vertex(v_2.x, v_2.y, v_2.z);
      side[i].vertex(v_3.x, v_3.y, v_3.z);
      side[i].vertex(v_4.x, v_4.y, v_4.z);
    }
    side[i].endShape();

    allSides.addChild(side[i]);
  }

  return allSides;
}


PShape[] halfEllipsoidLayers(float radiusX, float radiusY, float radiusZ, float Height) {//the layers of a half ellipsoid, such a shape can be used many places on the human body
  PShape[] layer;
  layer = new PShape[6];


  for (int i = 0; i < layer.length; i++) {//i goes from 0,  90 degrees

    float thisLayerHeight = sin(radians(i*20+180))*radiusY+Height;//the specific height
    float thisLayerRadiusWidth = cos(radians(i*20+180))*radiusX;//the specific width
    float thisLayerRadiusLength = cos(radians(i*20+180))*radiusZ;//the specific length

    layer[i] = createShape();
    layer[i].beginShape();

    for (int j = 0; j <= 360; j+=30) {//j goes from 0 to 360 degrees
      layer[i].vertex(thisLayerRadiusWidth*cos(radians(j)), thisLayerHeight, thisLayerRadiusLength*sin(radians(j)));
    }  
    layer[i].endShape();
  }
  return layer;
}

PShape[] halfCyllinderLayers(float radiusX, float radiusY, float radiusZ, float Height) {//the layers of a half cyllinder
  PShape[] layer;
  layer = new PShape[6];


  for (int i = 0; i < layer.length; i++) {//i goes from 0,  90 degrees

    float thisLayerHeight = sin(radians(i*20+180))*radiusY+Height;//the specific height
    float thisLayerRadiusWidth = radiusX;//the specific width
    float thisLayerRadiusLength = cos(radians(i*20+180))*radiusZ;//the specific length

    layer[i] = createShape();
    layer[i].beginShape();

    for (int j = 0; j <= 360; j+=30) {//j goes from 0 to 360 degrees
      layer[i].vertex(thisLayerRadiusWidth*cos(radians(j)), thisLayerHeight, thisLayerRadiusLength*sin(radians(j)));
    }  
    layer[i].endShape();
  }
  return layer;
}

PShape[] flatTopCone(float Height, float topWidth, float topLength, float bottomWidth, float bottomLength, float heightOfCone) {//a cone with a flat top
  PShape[] layer;

  layer = new PShape[2];

  for (int i = 0; i < layer.length; i++) {
    layer[i] = createShape();

    layer[i].beginShape();

    float thisLayerHeight = Height/(layer.length-1)*i-heightOfCone;//each layer has a specific height
    float thisLayerWidthRadius = map(i, 0, layer.length-1, topWidth, bottomWidth );
    float thisLayerLenghtRadius= map(i, 0, layer.length-1, topLength, bottomLength);

    for (float j = 0; j <= 360; j += 30) {
      layer[i].vertex(sin(radians(j))*thisLayerWidthRadius, thisLayerHeight, thisLayerLenghtRadius*cos(radians(j)));
    }
    layer[i].endShape();
  }

  return layer;
}