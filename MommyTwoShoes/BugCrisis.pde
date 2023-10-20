//GameTitle---BugCrisis[SMASH]--
//main 
void setup(){
  size(800,500);
  frameRate(30);
  initialiseArt();
  player=new Player(50,25,green);
  outFile();//opens rile to be read because it is needed for updating it 
  for(int i=0; i<5;i++){
    bug=addBug();
    Bugs.add(bug);
  }
}

//drawing
void draw(){
  //if player is alive play the game
  if(player.health>0){
    background(bg);
    player.render();
    player.lives();
    addRemove(); 
   }
  //else open the file and put up the death screen
  else{
    if(player.score!=0){
      outFile();
      player.score=0;
    }
    deathScreen();
  }
}
