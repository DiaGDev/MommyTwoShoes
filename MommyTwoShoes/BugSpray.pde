//bullets class
class BugSpray extends Entity{
  //initialise
  float y=player.y+player.size;
  float x=player.x;
  
  //constructor
  BugSpray(float size, float speed, color colour){
    super(size,speed,colour);
  }
  
  //methods
  void drawEntity(){
    image(bulletArt,x,y,size*4,size*3);
  }
  
  void move(){
    y+=speed;
    collision();
  }
  
  void render(){
    drawEntity();
    move();
  }
  
  //if the bullet is in bug the score is updated, the list of bugs to remove is updated and the one for the bullets to remove, and then removed from screen at the next cycle
  void collision(){
    for(Bug bug: Bugs){
       if((this.y<bug.y+bug.size)&&(this.y>bug.y)){
         if((this.x<bug.x+bug.size)&&(this.x>bug.x)){
           bug.score();
           testB.add(Bugs.indexOf(bug));
           test.add( bullets.indexOf(this));
           }
        }
      }
   }
}
