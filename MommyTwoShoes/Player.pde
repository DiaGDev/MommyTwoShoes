class Player extends Entity{
  //initialise
  float x=width/2;
  float y=height/5-30;
  boolean crash;
  int count=0;
  int health=10;
  int score=0;
  BugSpray bullet;
  
  //constructor
  Player(float size, float speed, color colour){
    super(size,speed,colour);
    
  }
  
  //methods
  void drawEntity(){
    imageMode(CENTER);
    image(playerArt,x,y-size/2.5);
    playerArt.resize(0,(int) size*2);
  }
  
  void render(){
    drawEntity();
    keyPressed();
  }
  
  void lives(){
    fill(blue);
    textSize(20);
    text("Health: "+player.health,10,30);
    text("Score: "+player.score,10,60); 
  }
  
}
