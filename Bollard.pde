class Bollard {
  Tube bollard2;
  AudioPlayer bollardhit;
  PVector position;
  PVector dimensions;
  float w = 1;
  float h = 7;
  float d = 1;
  float x, z;
  float y = -4;

  Bollard(PApplet parent, float x, float z) {
    bollardhit = minim.loadFile("bollardhit.wav");
    position = new PVector(x, y, z);
    dimensions = new PVector(w, h, d);
    bollard2 = new Tube(parent, 4, 40);
    bollard2.setSize(w, d, w, d, h);
    bollard2.setTexture("bollard.jpeg", 2, 1);
    bollard2.setTexture("bollard.jpeg", S3D.S_CAP);
    bollard2.setTexture("bollard.jpeg", S3D.E_CAP);
    bollard2.drawMode(S3D.TEXTURE);
    bollard2.drawMode(S3D.TEXTURE, S3D.BOTH_CAP);
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
      bollardhit.play();
      if ( abs(bollardhit.position() - bollardhit.length())<5 )
      {
        bollardhit.rewind();
      }
      player.position.x -=1.5;
      player.position.z -=1.5;
      scoreNum-=10;
      yellow();
      crashed=false;
      status= "You are hit by a bollard!";
      println(scoreNum);
    }
  }


  void display() {
    bollard2.moveTo(position.x, position.y, position.z);
    bollard2.draw();
  }
}