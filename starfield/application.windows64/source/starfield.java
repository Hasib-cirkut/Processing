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

public class starfield extends PApplet {


Stars[] stars = new Stars[3000];

float speed;

public void setup()
{
  
  
 // file = new SoundFile(this, "midi1.mp3");
  
  for(int i=0; i<stars.length; i++)
  {
    stars[i] = new Stars();
  }
  
}

public void draw()
{
  speed = map(mouseX, 0, width, 0, 16);
  
  background(0);
  translate(width/2, height/2);
  
  for(int i=0; i<stars.length; i++)
  {
    stars[i].update();
    stars[i].show();
  }
  
}
class Stars

{
  float x, y, z, pz;
  
  Stars()
  {
    
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
    pz = z;
  }
  
  public void update()
  {
    z = z - speed; 
    if(z < 1)
    {
      z = random(width);
      
      x = random(-width, width);
    y = random(-height, height);
   
        pz = z;
  
}
    
  }
  
  public void show()
  {
    fill(255);
    noStroke();
    
    float sx = map(x/z, 0, 1, 0, width);
    float sy = map(y/z, 0, 1, 0, height);
    
    float r = map(z, 0, width, 8, 0);

    
    ellipse(sx, sy, r, r);
    
    float px = map(x/pz, 0, 1, 0, width);
    float py = map(y/pz, 0, 1, 0, height);
    
    pz = z;

    stroke(255);
    line(px, py, sx, sy); 


  }
  
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "starfield" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
