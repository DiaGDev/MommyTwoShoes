//help
//https://stackoverflow.com/questions/17010222/how-do-i-append-text-to-a-csv-txt-file-in-processing

//imports
import java.util.ArrayList;
import java.io.*;
import java.util.Arrays;

//constants
final color red=color(255,0,0); 
final color blue=color (0,0,200);
final color yellow=color(204,204,0);
final color green=color(0,255,0);
final color darkerGreen=color(50,100,0);
final color brown=color(185,122,87);

// initialise
float size,speed;//empty for calling new function for individual
ArrayList<Bug> Bugs=new ArrayList<Bug>();//array of bugs
ArrayList<Integer> testB=new ArrayList<Integer>();
ArrayList<BugSpray> bullets=new ArrayList<BugSpray>();//bullets
ArrayList<Integer> test=new ArrayList<Integer>();//saving the position in array of bullets of what's off the screen
int first=0,second=0,third=-1;
Player player;
BugSpray bullet;
Bug bug;

//images
PImage bg,playerIDLE,bulletArt,playerArt;
PImage[] antArt=new PImage[2];
PImage[] cockroachArt=new PImage[2];
PImage[] spiderArt=new PImage[2];
PImage[] explosionArt=new PImage[4];

//Functions
//checks which isare the first three high scores so they can be added on death screen
void outFile(){
  inFile("scores.txt",Integer.toString(player.score));
  String[] strings=loadStrings(dataPath("scores.txt"));
  for(int i=0; i<strings.length;i++){
    if(Integer.parseInt(strings[i])>first){
      third=second;
      second=first;
      first=Integer.parseInt(strings[i]);
    }
    else if(Integer.parseInt(strings[i])>second){
      third=second;
      second=Integer.parseInt(strings[i]);
    }
    else if(Integer.parseInt(strings[i])>third)
      third=Integer.parseInt(strings[i]);   
  }
  //print("first: "+first+" second: "+second+" third: "+third);
}

//code from source at the top, used for writing and removing from a file
void inFile(String name, String data){
  File file = new File(dataPath(name));
  try {
    PrintWriter output = new PrintWriter(new BufferedWriter(new FileWriter(file, true)));
    output.println(data);
    output.close();
  }catch (IOException e){
      e.printStackTrace();
  }
}

//deathScreen
void deathScreen(){
    background(bg);
    fill(green);
    textSize(50);
    text("You passed out! ",width/3,height/10);
    text("HighScores: ",width/3,height/5.5);
    textSize(40);
    text("1. "+first,width/3,height/3);
    textSize(40);
    text("2. "+second,width/3,height/2);
    textSize(40);
    text("3. "+third,width/3,height/1.5);
}

//adds new bug to list of bugs
Bug addBug(){
  int pick=(int) random(1,4);
  if(pick==1){//ant
      bug=new AntBug(size,speed,brown);
    }
  if(pick==2){//cockroach
      bug=new Cockroach(size,speed,darkerGreen);
    }
  if(pick==3){//spider
      bug=new Spider(size,speed,yellow);
    }
  return bug;
}

//loads images
void loadImages(PImage[] nameArray, String name){
    for(int k=0;k<nameArray.length;k++){
      nameArray[k]=loadImage(name+k+".png");
  }
}

//creates a list of the list of bullets and of bugs that are to be discarded and removes them once killed or off screen
void addRemove(){
  //rendering bugs
    for(Bug bug: Bugs){
      bug.render();
    }
    for(int i=0;i<testB.size();i++){
      int posb=testB.get(i);
      Bugs.remove(posb);
      bug=addBug();
      Bugs.add(bug);
    }
    testB.clear();
    for(BugSpray bullet: bullets){
      bullet.render();
      if(bullet.y>height+bullet.size*2)
        test.add(bullets.indexOf(bullet));
      }
    for(int i=0; i<test.size();i++){
       int pos=test.get(i);
       if(bullets.get(pos)!=null)
         bullets.remove(pos);
    }
    test.clear();
}

//loading images
void initialiseArt(){
  bg = loadImage("bg.jpg");
  bulletArt = loadImage("bugSpray0.png");
  loadImages( antArt,"ant");
  loadImages( cockroachArt,"cockroach");
  loadImages( spiderArt,"spider");
  loadImages( explosionArt,"explosion");
  playerArt = loadImage("player0.png");
}

//player controller
void keyReleased(){
      if((key=='a')&&(player.x>=player.size/2))
        player.x=player.x-player.speed;
      if((key=='d')&&(player.x<=width-player.size/2))
        player.x=player.x+player.speed; 
      //if pressed creates new bullet and adds it to the list of bullets
      if(key==' '){
        bullet=new BugSpray(20,4,red);
        bullets.add(bullet);
       }    
  }
