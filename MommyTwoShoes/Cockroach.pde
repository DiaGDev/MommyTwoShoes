class Cockroach extends Bug{
  //constructor
  Cockroach(float size,float speed, color colour){
    super(size,speed,colour);
    size=size();
    speed=speed();
  }
  
  //methods
  float size(){
    size=random(30,40);
    return size;
  }
  
  //switches between images to make cockroach move
  void drawEntity(){
   image(cockroachArt[0],x,y,size,size);
    if(frameCount%5==0){
      image(cockroachArt[1],x,y,size,size);
    }
 }
 
  //new speed for new cockroach
  float speed(){
    speed=random(2.5,3.5);
    return speed;
  }
  
    void damage(){
    player.health=player.health-2;
  }
  
    void score(){
    player.score=player.score+2;
  }
  
}
