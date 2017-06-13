class Buscar {
  Box bus;
  AudioPlayer carsound;
  float w = 25;
  float h =12;
  float d = 10; //changed
  //color c = #D3131A;
  float carspeed = 0.3; //changed
  float distance=0;
  PVector position;
  PVector dimensions;
  boolean goFront = true;
  AudioPlayer ouch;

  Buscar(PApplet parent, float x, float y, float z, float speed) {
    carsound = minim.loadFile("carsound.mp3");
    ouch = minim.loadFile("ouch.mp3");
    position = new PVector(x, y, z);
    dimensions = new PVector(w, h, d);
    bus = new Box(parent, w, h, d); 
    bus.setTexture("bus2.png", Box.FRONT);
    bus.setTexture("bus2.png", Box.BACK);
    bus.setTexture("bus.png", Box.RIGHT);
    bus.setTexture("bus3.png", Box.LEFT);
    carspeed = speed;
    //car.setTexture(".jpg", Box.TOP);
    bus.visible(false, Box.TOP);
    bus.drawMode(S3D.TEXTURE);
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
      ouch.play();
      if ( abs(ouch.position() - ouch.length())<5 )
      {
        ouch.rewind();
      }
      scoreNum-=100;
    }
  }

  void display() {
    //position.x = 10;
    //position.y = -10 ;
    //position.z = 5;
    bus.moveTo(position.x, position.y, position.z);
    bus.draw();
    float d = player.position.dist(position);
    distance = d;
    //println(d);
    if (distance<30) {
      if (player.position.z - position.z > 10) carsound.setPan(-1.0);
      else if (player.position.z - position.z < -10) carsound.setPan(1.0);
      else  carsound.setPan(0);
      carsound.play();

      if ( carsound.position() == carsound.length() )
      {
        carsound.rewind();
      }
    }
  }
  void move() {
    if (goFront) {
      position.x = position.x + carspeed;
    } else {
      position.x=0;
    }
    if (position.x==290 || position.x==0) {
      goFront = !goFront;
    }
  }
}