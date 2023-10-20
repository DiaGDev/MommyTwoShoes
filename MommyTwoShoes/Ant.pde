class AntBug extends Bug{
  //constructor
  AntBug(float size,float speed, color colour){
    super(size,speed,colour);
    size=size();
    speed=speed();
  }
  
  //methods
  void drawEntity(){
   image(antArt[1],x,y,size,size);
    if(frameCount%5==0){
      image(antArt[0],x,y,size,size);
    }
 }
 
 //new size
  float size(){
    size=random(25,30);
    return size;
  }
  
  //new speed
  float speed(){
    speed=random(1,2.5);
    return speed;
  }
  
  void damage(){
    player.health=player.health-1;
  }
  void score(){
    player.score=player.score+1;
  }
}
