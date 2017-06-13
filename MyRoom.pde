class MyRoom{
  //Box room;
  PImage roomimg;
  PVector position;
  
  MyRoom(){
   roomimg = loadImage("room.jpeg"); 
  }
  
  void display(){
    image(roomimg,0,0,width,height);
  }
}