import netscape.javascript.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/421*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//
// BRUNO KRUSE
// Megaman Platform Engine
// - Take this code and make something awesome with it!
//
// Declares Megaman as our Hero
// The Hero class is actually used for all characters in the game (enemies too)
/* Enhanced by Jonathan Theodore
lab 6 ITEC 211
Gonzaga University

Updates added:
frames for shooting animation added minus actual bullets
Control Key= shoot right
Shift Key = shoot left
Frames for Jump shooting added
Background changed
Classic Background Music

To be added: 
Enemy AI ( appearance based on clock, track megaman's position
bullets (either by basic shape coding or sprite)
  Possibly charged shots
Hit point system
last unused frames in sketch folder for taking damage
collision coding 
scoring/leveling functions
functions to detect new platforms
*/

String names[] = { //classic stage music
  "17 Wily Stage 1-2.wav"
};
Hero Megaman;
PImage mmBackground;

void setup() {
 soundSetup(); 
  mmBackground = loadImage("Skull_Fortress.png"); //updated background
  image(mmBackground, 0,0);
  size(640, 360); //resized screen
  frameRate(12); 
  // Gatta remember to initialize him
  Megaman = new Hero();
  // Loads all of the images before the game starts so that
  // loading images during run-time doesnt slow the game down
  Megaman.loadImages();
  int n = (int) ( names.length-1); // Enables sound
  mySound[n].play(0); //plays sound
}

void draw(){
  // whatever
  image(mmBackground, 0,0);

  checkKeys();
  Megaman.update();
  Megaman.checkState();
  Megaman.blinkCheck();

  if (Megaman.dirState == "right"){ //calls all running right frames

    image(Megaman.imagesR[Megaman.imageIndexR], Megaman.mmX,Megaman.mmY);

  }  

  else if (Megaman.dirState == "left") //calls all running left frames
  {
    image(Megaman.imagesL[Megaman.imageIndexL], Megaman.mmX,Megaman.mmY);

  }   
  // all the code for standing still PLUS blinking!!!!
  else if  (Megaman.dirState == "chill")
  {
    // faces right if hes chillin' right
    if (Megaman.chillState == "right"){
      image(Megaman.imagesR[Megaman.blinkRate], Megaman.mmX,Megaman.mmY);
    }
    
    // faces left if hes chillin' left
    if (Megaman.chillState == "left"){
      image(Megaman.imagesL[Megaman.blinkRate], Megaman.mmX,Megaman.mmY);
    }
  } 
  if (Megaman.jumpState == "jump" || Megaman.jumpState == "falling")
  {
    if (Megaman.chillState == "right"){
   image(mmBackground, 0,0);
      image(Megaman.imagesR[5], Megaman.mmX,Megaman.mmY);
    }
    if (keyCode == CONTROL){ //Jump shooting animations
      Megaman.shootState = "shoot";
      image(mmBackground,0,0); //refreshes so no image overlapping
      image(Megaman.imagesR[7], Megaman.mmX, Megaman.mmY);
    }
    // faces left if hes chillin' left
    if (Megaman.chillState == "left"){
    image(mmBackground, 0,0);
      image(Megaman.imagesL[5], Megaman.mmX,Megaman.mmY);
    }
    if (keyCode == SHIFT){
      Megaman.shootState = "shoot";
      image(mmBackground, 0,0);
      image(Megaman.imagesL[7], Megaman.mmX, Megaman.mmY);
      }
  }

}

void checkKeys(){
  if (keyPressed) {
    if (keyCode == CONTROL){ //Regular shooting animation 
      Megaman.shootState = "shoot";
      image(Megaman.imagesR[6], Megaman.mmX, Megaman.mmY);
      Megaman.dirState = "Right";
    }
    if (keyCode == SHIFT){
      Megaman.shootState = "shoot";
      image(Megaman.imagesL[6], Megaman.mmX, Megaman.mmY);
      Megaman.dirState = "Left";
    }
    if (keyCode == RIGHT) {
      Megaman.dirState = "right";
    }   

    if (keyCode == LEFT) {
      Megaman.dirState ="left";
    }
    
    if (keyCode == UP && Megaman.jumpState == "none"){
      
      Megaman.jumpState = "jump";
      } 
          }
  else {
    Megaman.dirState = "chill";
  } 

}