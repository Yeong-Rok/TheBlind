class Streetlamp {
  Box bottom, middle;
  Ellipsoid top;
  PVector position;
  PVector dimensions;
  float x, z;
  float y = -7;
  float w = 1;
  float h = 25;
  float d = 1;
  float distance=0;
  float rad = 0;

  Streetlamp(PApplet parent, float x, float z, float _rad) {
    position = new PVector(x, y, z);
    dimensions = new PVector(w, h, d);
    bottom = new Box(parent, w, h, d);
    bottom.setTexture("silver.jpg");
    bottom.drawMode(S3D.TEXTURE);  
    middle =  new Box(parent, 0.7, 7, 0.7);
    middle.setTexture("silver.jpg");
    middle.drawMode(S3D.TEXTURE);
    top = new Ellipsoid(parent, 5, 5);   
    top.setRadius(1.7, 0.8, 1.7);
    top.setTexture("light.jpg");
    top.drawMode(S3D.TEXTURE);
    rad = _rad;
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
      if (crashed==true) {
        background(0);
        lampcrash.play();
        if ( abs(lampcrash.position() - lampcrash.length())<5 )
        {
          lampcrash.rewind();
        }
        if (frameCount%20 == 0) {
          yellow();      
          scoreNum-=5;
        }
        status= "가로등에 부딪혔습니다!";
        crashed=false;
      }
    }
  }

  void display() { 
    //head.rotateTo(0, radians(90), 0);
    middle.rotateTo(0, radians(45), 0);
    bottom.moveTo(position.x, position.y, position.z);
    bottom.draw();
    middle.moveTo(position.x, position.y-13, position.z+3);
    middle.rotateTo(radians(90), radians(rad), 0);
    middle.draw();
    top.moveTo(position.x, position.y-12.4, position.z+5.5);
    top.rotateTo(0, radians(rad), 0);
    top.draw();
  }
}