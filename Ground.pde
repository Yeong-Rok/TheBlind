class Ground {
  Block[][] blocks1, blocks2, blocks3, blocks4, blocks5;
  Block start;
  Block end;
  color c = color(random(150, 200));


  Ground() {
    blocks1 = new Block[30][10];

    for (int i=0; i<30; i++) {
      for (int j=0; j<10; j++) {
        float x = i * 10;
        float y = 0;
        float z = j * 10;
        blocks1[i][j] = new Block(x, y, z, 10, 10, 10, c, 0);
      }
    }


    int row = 0;
    int col = 1; // at (0, 0) block
    //int row = int(random(1, size-1));
    //int col = int(random(1, size-1));
    start = blocks1[row][col]; // where the player starts at

    blocks2 = new Block[30][1];
    for (int i=0; i<30; i++) {
      for (int j=0; j<1; j++) {
        float x = i * 10;
        float y = 0;
        float z = (j-1) * 10;
        blocks2[i][j] = new Block(x, y, z, 10, 20, 10, c, 0);
      }
    }

    blocks3 = new Block[1][12];
    for (int i=0; i<1; i++) {
      for (int j=0; j<12; j++) {
        float x = (i-1) * 10;
        float y = 0;
        float z = (j-1) * 10;
        blocks3[i][j] = new Block(x, y, z, 10, 20, 10, c, 0);
      }
    }
    
        blocks4 = new Block[30][1];
    for (int i=0; i<30; i++) {
      for (int j=0; j<1; j++) {
        float x = i * 10;
        float y = 0;
        float z = (j+10) * 10;
        blocks4[i][j] = new Block(x, y, z, 10, 20, 10, c, 0);
      }
    }
    
            blocks5 = new Block[1][12];
    for (int i=0; i<1; i++) {
      for (int j=0; j<12; j++) {
        float x = (i+30) * 10;
        float y = 0;
        float z = (j-1) * 10;
        blocks5[i][j] = new Block(x, y, z, 10, 20, 10, c, 0);
      }
    }
  }

  void update() {
    for (int i=0; i<blocks1.length; i++) {
      for (int j=0; j<blocks1[i].length; j++) {
        blocks1[i][j].update();
      }
    }

    for (int i=0; i<blocks2.length; i++) {
      for (int j=0; j<blocks2[i].length; j++) {
        blocks2[i][j].update();
      }
    }
    
        for (int i=0; i<blocks3.length; i++) {
      for (int j=0; j<blocks3[i].length; j++) {
        blocks3[i][j].update();
      }
    }
            for (int i=0; i<blocks4.length; i++) {
      for (int j=0; j<blocks4[i].length; j++) {
        blocks4[i][j].update();
      }
    }
                for (int i=0; i<blocks5.length; i++) {
      for (int j=0; j<blocks5[i].length; j++) {
        blocks5[i][j].update();
      }
    }
  }

  void display() {
    for (int i=0; i<blocks1.length; i++) {
      for (int j=0; j<blocks1[i].length; j++) {
        blocks1[i][j].display();
      }
    }

    for (int i=0; i<blocks2.length; i++) {
      for (int j=0; j<blocks2[i].length; j++) {
        blocks2[i][j].display();
      }
    }
    
        for (int i=0; i<blocks3.length; i++) {
      for (int j=0; j<blocks3[i].length; j++) {
        blocks3[i][j].display();
      }
    }
            for (int i=0; i<blocks4.length; i++) {
      for (int j=0; j<blocks4[i].length; j++) {
        blocks4[i][j].display();
      }
    }
     for (int i=0; i<blocks5.length; i++) {
      for (int j=0; j<blocks5[i].length; j++) {
        blocks5[i][j].display();
      }
    }
  }

  void setPlayerAtStart(Player player) {
    player.position = PVector.add(start.position, new PVector(0, -12, 0)); // falled from the sky. -15 > - 100 : higher
  }
}