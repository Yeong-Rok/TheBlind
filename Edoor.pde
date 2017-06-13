class EDoor {
  Box e_door;
  PVector position;
  PVector dimensions;
  float doorWidth = elevator.w/3+0.01;
  float doorHeight = elevator.h*0.8;
  float doorDepth = elevator.e_thickness+0.01;  
  float doorSpeed = elevator.doorSpeed;

  EDoor(PApplet parent, float x, float y, float z) {
    position = new PVector(x, y, z);
    dimensions = new PVector(doorWidth, doorHeight, doorDepth);
    e_door = new Box(parent, doorWidth, doorHeight, doorDepth); 
    e_door.setTexture("rightDoor.jpg", Box.FRONT);
    e_door.setTexture("rightDoor.jpg", Box.BACK);
    e_door.setTexture("rightDoor.jpg", Box.LEFT);
    e_door.setTexture("rightDoor.jpg", Box.RIGHT);
    e_door.visible(false, Box.TOP);
    e_door.drawMode(S3D.TEXTURE);
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
      crashed=false;

      println(scoreNum);
    }
  }

  void display() {
    e_door.moveTo(position.x, position.y, position.z);
    e_door.draw();
  }
}