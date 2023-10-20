abstract class Entity{
  //initialise
  float speed,size;
  color colour;
  
  //constructor
  Entity(float size, float speed, color colour){
    this.speed=speed;
    this.size=size; 
    this.colour=colour;
  }
  
  //methods
  abstract void drawEntity();
  abstract void render();
  
}
