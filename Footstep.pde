class Footstep {
  AudioPlayer footsteps;
  AudioPlayer grassSteps;


  Footstep() {
    footsteps = minim.loadFile("womanwalking.wav");
    grassSteps = minim.loadFile("walking.wav");
    //out = minim.getLineOut();
    //myDelay = new Delay(0.5);
  }

  void walk() {
    
     //other place not the crosswalks: minus points
     if ((player.position.z < 5) || (player.position.z<65 && player.position.z > 55 && player.position.x<205) || (player.position.z>65 && player.position.z<75 && player.position.x<175) || (player.position.z>75 && player.position.z<85 && player.position.x<145) || (player.position.z>85 && player.position.z<95 && player.position.x<115) || (player.position.z>95 && player.position.x<85)) {
      scoreNum-=0.01;
      status="-1점 잔디를 밟지 말아주세요";
    }

    //if (player.position < blocks[0][1]) {
    if (keyPressed && key == 'w' || key == 'a'  || key == 's' || key == 'd' || key == 'W' || key == 'A' || key == 'S' || key == 'D') {
      if ((player.position.z < 5) || (player.position.z<65 && player.position.z > 55 && player.position.x<205) || (player.position.z>65 && player.position.z<75 && player.position.x<175) || (player.position.z>75 && player.position.z<85 && player.position.x<145) || (player.position.z>85 && player.position.z<95 && player.position.x<115) || (player.position.z>95 && player.position.x<85)) {
       scoreNum-=0.01;
        status="-1점! 잔디를 밟지 말아주세요";
        
        
        grassSteps.play();
        footsteps.pause();
        footsteps.rewind();
        if ( grassSteps.position() == grassSteps.length() )
        {
          grassSteps.rewind();
          //myDelay.setDelTime(0.5);
        }

      } else {
        grassSteps.pause();
        grassSteps.rewind();
        footsteps.play();
        if ( footsteps.position() == footsteps.length() )
        {
          footsteps.rewind();
          footsteps.play();
          //myDelay.setDelTime(0.5);
        }
      }
    } else {

      footsteps.pause();
      grassSteps.pause();
    }
  }
}