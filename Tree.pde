class Tree {
  Ellipsoid tree;
  Tube treeBottom;
  AudioPlayer treecrash;
  PVector position;
  PVector dimensions;
  float x, z;
  float y = -7;
  float w = 1;
  float h = 16;
  float d = 1;
  float distance=0;

  Tree(PApplet parent, float x, float z) {
    treecrash = minim.loadFile("tree.mp3");
    position = new PVector(x, y, z);
    dimensions = new PVector(w, h, d);
    tree = new Ellipsoid(parent, 11, 11);
    tree.setRadius(5);
    tree.setTexture("treel.jpg");
    tree.drawMode(S3D.TEXTURE);       
    treeBottom = new Tube(parent, 4, 40);   
    treeBottom.setSize(w, d, w, d, h);
    treeBottom.setTexture("treeb.png", 2, 1);
    treeBottom.drawMode(S3D.TEXTURE);
    //treeBottom.drawMode(S3D.TEXTURE, S3D.BOTH_CAP); 
    //
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
      treecrash.play();
      if ( abs(treecrash.position() - treecrash.length())<5 )
      {
        treecrash.rewind();
      }
   if (frameCount%20 == 0) {
        yellow();      
      scoreNum-=5;
      }
      status= "나무에 부딪혔습니다!";
       crashed=false;
    }
  }

  void display() { 
    //head.rotateTo(0, radians(90), 0);
    tree.moveTo(position.x, position.y-11, position.z);
    tree.draw();
    treeBottom.moveTo(position.x, position.y, position.z);
    treeBottom.draw();
  }
}