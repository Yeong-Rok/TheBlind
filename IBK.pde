class IBK {
  Block[][] blocks;
  Block start;
  Block end;
  color c = color(random(150, 200));

  IBK(int size) {
    blocks = new Block[size*3/5*4][size];

    for (int i=0; i<size*3/5*4; i++) {
      for (int j=0; j<size; j++) {
        float x = i * groundBlockSize;
        float y = 0;
        float z = j * groundBlockSize;
        blocks[i][j] = new Block(x, y, z, 10, 10, 10, c, 0);
      }
    }

    int row = 0;
    int col = 2; // at (0, 0) block
    //int row = int(random(1, size-1));
    //int col = int(random(1, size-1));
    start = blocks[row][col]; // where the player starts at

    for (int i=0; i<size*size*size/10; i++) {
      if (!blocks[row][col].visited) blocks[row][col].moveDown();
      blocks[row][col].visited = true;

      //if (random(0, 1) < 0.5){
      //  if (random(0, 1) < 0.5 && row > 1) row -= 1;
      //  else if (row < size-2) row += 1;
      //} else {
      //  if (random(0, 1) < 0.5 && col > 1) col -= 1;
      //  else if (col < size-2) col += 1;
      //}
    }
  }

  void update() {
    for (int i=0; i<blocks.length; i++) {
      for (int j=0; j<blocks[i].length; j++) {
        blocks[i][j].update();
      }
    }
  }

  void display() {
    for (int i=0; i<blocks.length; i++) {
      for (int j=0; j<blocks[i].length; j++) {
        blocks[i][j].display();
      }
    }
  }

  void setPlayerAtStart(Player player) {
    player.position = PVector.add(start.position, new PVector(0, -15, 0)); // falled from the sky. -15 > - 100 : higher
  }
}