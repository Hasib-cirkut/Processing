import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 
import peasy.org.apache.commons.math.*; 
import peasy.org.apache.commons.math.geometry.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SolarSystem extends PApplet {







Planets sun;
PeasyCam cam;
PImage sunTexure;

public void setup()
{
 
 cam = new PeasyCam(this, 500);
 sun = new Planets(40,0, 0);
 sun.moons(5, 1);
}

public void draw()
{
  background(0);
 
  // pointLight(255, 0, 0, 100, 0, 100);
   lights();
  //translate(width/2, height/2);
  
  sun.show();
  sun.orbit();
}

  class Planets
  {
    float radius, distant;
    float angle;
    Planets[] planet;
    float orbitSpeed;
    PVector v;
    
    Planets(float r, float d, float s)
    {
      radius = r;
      distant = d;
      v = PVector.random3D();
      angle = random(TWO_PI);
      v.mult(distant);
      orbitSpeed = s;
    }
    
    public void orbit()
    {
     
      angle += orbitSpeed;
      
      if(planet != null)
      for(int i=0; i<planet.length; i++)
          {
           planet[i].orbit(); 
          }
      
    }
    
    public void moons(int total, int level)
    {
      planet = new Planets[total];
      
      for(int i=0; i<planet.length; i++)
      {
        
        float r = radius/(level+1.5f);
        float d = random((radius+r), (radius+r)*2);
        float s = random(-.009f, .009f);
        planet[i] = new Planets(r, d, s); //s = orbitspeed
        if(level < 2)
        {
         int num = PApplet.parseInt(random(0,3));
         planet[i].moons(num,level+1);
          
        }
      }
      
    }
   
     
    public void show()
    {
      pushMatrix();
       noStroke();
      fill(255);
      
      PVector v2 = new PVector(1,0,1);
      PVector p = v.cross(v2);
      rotate(angle, p.x, p.y, p.z);
      
      
      rotate(angle);
      translate(v.x, v.y, v.z);
      
      sphere(radius);
     // ellipse(0,0,radius*2, radius*2);
      
        if(planet != null)
      for(int i=0; i<planet.length; i++)
          {
            planet[i].show();
          }
             popMatrix();
      
    }
 
    
    
  }
  public void settings() {  size(600, 600, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SolarSystem" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
