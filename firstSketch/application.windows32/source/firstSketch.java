import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class firstSketch extends PApplet {


//Purple rain

// (138, 43, 226)
// (230, 230, 250) Background

Drop[] drops = new Drop[500];

public void setup()
{
   
  
  for(int i=0; i<drops.length; i++){
   drops[i] = new Drop();
  }
  
}

public void draw()
{
  background(230, 230, 250);
 
for(int i=0; i<drops.length; i++){
   drops[i].fall();
   drops[i].show();
  }
  
}
class Drop
{
 
  float x = random(width);
  float y = random(-400, -50);
  float z = random(0 , 10);
  float len = map(z, 0, 10, 5, 14);
  float yspeed = map(z, 0, 10, 5, 20);
  public void fall ()
  {
    y = y + yspeed; 
    
    float grav = map(z, 0, 10, 0, 0.2f);
    
   yspeed += grav;
    
     if(y > height)
     {
       y = random(-200, -100);
       yspeed = map(z, 0, 10, 5, 20);
     }
  }
  
  public void show()
  {
    float thickness = map(z, 0, 10, 1, 2);
    
    strokeWeight(thickness);
    
    stroke(138, 43, 226);
    line(x, y, x, y+len);
    
  
  }
  
  
  
}
  public void settings() {  size(640, 360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "firstSketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
