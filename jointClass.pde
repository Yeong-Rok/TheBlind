//A joint keeps track of the angle between, the limps, around 1 axis
//a human has a lot of joints.


class joint {
  float ang;//the angle
  float maxAng, minAng;//the maximum and minimum angle
  float targAng; //the angle the joints shall move to
  float angV;//the Angular velocity with which the joint is moving
  float maxV;//the maximum angular velocity
  String name;//the name of this joint
  
  joint(float tempAng, float tempMinAng, float tempMaxAng, float tempMaxV, String tempName) {
    angV = 0;
    ang = tempAng;
    maxAng = tempMaxAng;
    minAng = tempMinAng;
    targAng = tempAng;
    maxV = tempMaxV;
    name = tempName;
  }

  boolean active() {//test whether or not the joint is in motion
    if (angV != 0) {
      return true;
    } else {
      return false;
    }
  }

  void setAng(float newAng) {//a command that forces the angle of the joint, to set to a new one imidiatly

    if (newAng < minAng)  {//if the new angle is less than the minimum angle
      //go to the minimum angle
      ang = minAng;
    } else if (newAng > maxAng)  {//if the new angle is greater than the maximum angle
      //go to the maximum angle
      ang = maxAng;
    } else {//if the new angle, is a posible one, go there
      ang = newAng;
    }

    //stop all movement if there is any
    angV = 0;
  }

  void write(float newAng, float newV) {//a command, that asks the
    if (newAng != ang) {//if the new angle is different from the angle
      if (newAng < minAng) {//if the new angle is less than the minimum angle
        //set it to the minimum angle
        newAng = minAng;
      } else if (newAng > maxAng) {//if the new angle is greater than the maximum angle
        //set it to the maximum angle
        newAng = maxAng;
      }
      
      //the new angle is aproved, and the target angle is set to it
      
      targAng = newAng;
      
      //just make sure the newV is a positive value
      newV = abs(newV);
      
      if (newV > maxV) {//if the new angular velocity is to big
        //make it maxV
        newV = maxV;
      }
      
      //make the angular velocity point towards the target angle
      
      if (targAng < ang) {//if the target angle is less than the current angle
        angV = -newV;//make it negative
      }
      else {//if it is greater (if it is equal to, it is stopped at the very start)
        angV = newV;//make it positive
      }
    }
  }
  
  void update(){//update the angle, meens making it move.
    if (active()) {//if the angle is active
      if (abs(targAng-ang) < abs(angV)) {//if the angle of the joint is as close to the target as it posiply will come
        ang = targAng;//move to the target
        angV = 0;//become inactive
      }
      else {//if there is room to move in
        ang += angV;
      }
    }
  }
  
  void goGrazy(){//move randomly around
    if (!active()) {//if the joint isn't already in motion
      write(random(minAng,maxAng),random(maxV/10,maxV));//find a random target, and a random velocity greater than zero
    }
  }
}//A joint keeps track of the angle between, the limps, around 1 axis
//a human has a lot of joints.