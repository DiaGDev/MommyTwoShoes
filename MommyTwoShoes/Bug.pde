abstract class Bug extends Entity{
  //initialise
  float x,wiggle;
  int bool;
  float y=height;
  int follows=0;
  
  //constructor
  Bug( float size,float speed, color colour){
    super(size,speed,colour);
    getRandomX();
    follows=follows();}
    
  //methods
  void drawEntity(){
    fill(colour);
    ellipse(x,y,size,size);
  }
  
  void render(){
    drawEntity();
    move();
  }
  
  //gets a random x position
  float getRandomX(){
    float ran=random(width-size/2);
    x=ran;
    return x;
  }
  
  //makes the bug shake
  float wiggle(){
    float wiggle=random(1,3);
    return wiggle;
  }
  
  //randomises a value to check if this bug will follow the player or not
  int follows(){
    int follows=round(random(0,1));
    return follows;
  }
  
  //if follows the bug will follow the player
  void complexMovements(){
      if(player.x>this.x)
         x+=speed;
      if(player.x<this.x)
        x-=speed;
  }
  
  abstract float size();
  abstract float speed();
  abstract void damage();
  abstract void score();
  
  void move(){
    y-=speed;
    wiggle=wiggle();
    int bool=round(random(0,1));
    if((bool==1)&&(x<width-size/2))
      x+=wiggle;
    if((bool==0)&&(x>0))
      x-=wiggle;
    if(follows==1){
      complexMovements();}
    detect();
    if(this.y<0){
      getRandomX();
      y=height;}
  }
  
  //checks if bug in player to make the player take damage and updates the list of bugs to be removed because that bug will die once it hits the player
  void detect(){
    if((this.y<player.y+player.size)&&(this.y>player.y)){
      if((this.x<player.x+player.size)&&(this.x>player.x)){
        Bugs.get(Bugs.indexOf(this)).damage();
        testB.add(Bugs.indexOf(this));
         
      }
    }
  }
}
