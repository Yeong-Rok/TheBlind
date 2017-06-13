class Building {
  Block buildBlock1;
  Block buildBlock2;
  Box buildBox;

  Building(int size) {
    buildBlock1 = new Block(284, -5, 81, 18, 30, 30, 150, 30);
    buildBlock2 = new Block(253, -5, 99, 15, 30, 30, 150, 30);

    for (int i=0; i<size*size*size/10; i++) {
      if (!buildBlock1.visited) buildBlock1.moveDown(); 
      if (!buildBlock2.visited) buildBlock2.moveDown();
      buildBlock1.visited = true;
      buildBlock2.visited = true;
    }
  }

  void update() {
    buildBlock1.update();
    buildBlock2.update();
  }

  void display() {
    buildBlock1.display();
    buildBlock2.display();
  }
}