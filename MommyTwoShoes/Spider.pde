class Spider extends Bug{
  Spider(float size,float speed, color colour){
    super(size,speed,colour);
    size=size();
    speed=speed(); 
  }
  
  float size(){
    size=random(40,50);
    return size;
  }
  
 //switches between images in array to move spider legs left and spider legs right
  void drawEntity(){
   image(spiderArt[1],x,y,size,size);
    if(frameCount%5==0){
      image(spiderArt[0],x,y,size,size);
    }
 }
 
 //finds random speed for spider between 4.3 and 5.3
  float speed(){
    speed=random(4.3,5.3);
    return speed;
  }
  
    void damage(){
    player.health=player.health-3;
  }
  
    void score(){
    player.score=player.score+3;
  }
}
