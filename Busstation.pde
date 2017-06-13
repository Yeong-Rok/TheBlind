class Busstation {
  Box bus2;
  Tube bus1, bus3;
  PVector position;
  PVector dimensions;
  float x, z;
  float y = -7;
  float w = 1;
  float h = 6;
  float d = 4;
  float distance=0;

  Busstation(PApplet parent, float x, float z) {
    position = new PVector(x, y, z);
    dimensions = new PVector(w, h, d);
    bus1 = new Tube(parent, 4, 40);
    bus1.setSize(2, 2, 2, 2, 1);
    bus1.setTexture("greenbus.png", S3D.S_CAP);
    bus1.setTexture("greenbus.png", S3D.E_CAP);
    bus1.drawMode(S3D.TEXTURE, S3D.BOTH_CAP);
    bus1.fill(150);
    bus1.drawMode(S3D.TEXTURE|S3D.SOLID);  
    bus2 = new Box(parent, w, h, d);
    bus2.setTexture("station2.png", Box.FRONT);
    bus2.setTexture("station2.png", Box.BACK);
    bus2.setTexture("station.png", Box.LEFT);
    bus2.setTexture("station.png", Box.RIGHT);
    bus2.drawMode(S3D.TEXTURE);
    bus3 = new Tube(parent, 4, 40);   
    bus3.setSize(0.5, 0.5, 0.5, 0.5, 4);
    bus3.setTexture("station2.png");
    bus3.drawMode(S3D.TEXTURE);
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
      //crashed=true;

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
  }

  void display() { 
    //head.rotateTo(0, radians(90), 0);
    //middle.rotateTo(0, radians(45), 0);
    bus1.moveTo(position.x, position.y-10, position.z);
    bus1.rotateTo(radians(90), 0, radians(90));
    bus1.draw();
    bus2.moveTo(position.x, position.y-5, position.z);
    //middle.rotateTo(radians(90), 0, 0);
    bus2.draw();
    bus3.moveTo(position.x, position.y, position.z);
    ////top.rotateTo();
    bus3.draw();
  }
}