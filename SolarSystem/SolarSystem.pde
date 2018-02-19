import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;



Planets sun;
PeasyCam cam;
PImage sunTexture;
PImage[] globeTexture = new PImage[8];


void setup()
{
 size(600, 600, P3D);
 
 sunTexture = loadImage("sun.jpg");
 globeTexture[0] = loadImage("earth.jpg");
 globeTexture[1] = loadImage("mercury.jpg");
 globeTexture[2] = loadImage("neptune.jpg");
 globeTexture[3] = loadImage("mars.jpg");
 globeTexture[4] = loadImage("jupiter.jpg");
 globeTexture[5] = loadImage("uranus.jpg");
 globeTexture[6] = loadImage("venus.jpg");
 globeTexture[7] = loadImage("saturn.jpg");
 
 cam = new PeasyCam(this, 500);
 sun = new Planets(40,0, 0, sunTexture);
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