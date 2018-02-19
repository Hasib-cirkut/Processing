import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;



Planets sun;
PeasyCam cam;
PImage sunTexure;

void setup()
{
 size(600, 600, P3D);
 cam = new PeasyCam(this, 500);
 sun = new Planets(40,0, 0);
 sun.moons(5, 1);
}

void draw()
{
  background(0);
 
  // pointLight(255, 0, 0, 100, 0, 100);
   lights();
  //translate(width/2, height/2);
  
  sun.show();
  sun.orbit();
}