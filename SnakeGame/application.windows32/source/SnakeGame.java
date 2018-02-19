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

public class SnakeGame extends PApplet {


int scl = 20;

Snake s;


PVector food;

ArrayList <PVector> tail = new ArrayList<PVector>();




public void setup()
{
  
  
  frameRate(16);
  s = new Snake();
  pickLocation();
}


public void draw()
{ 
  background(51);
 
  
  
  s.update();
  s.show();
  s.death();
  
  if(s.eat())
   pickLocation();
  
  
  fill(23);
  rect(food.x, food.y, scl, scl);
 
  
}
public void pickLocation()
{
  int cols = (width / scl);
  int row = (height / scl);
  
  food = new PVector(floor(random(cols)), floor(random(row)));
  
  for(int i=0; i<tail.size(); i++)
  {
   
    PVector pos = tail.get(i);
    
    if(pos.x == food.x && pos.y == food.y)
    {
      food = new PVector(floor(random(cols)), floor(random(row)));
    }
    
  }
  
  food.mult(scl);
  
}



public void keyPressed()
{
  if(keyCode == UP)
  {
    s.updateXY(0, -1);
  }
  else if(keyCode == DOWN)
  {
    s.updateXY(0, 1);
  }
  else if(keyCode == RIGHT)
  {
    s.updateXY(1, 0);
  }
  else if(keyCode == LEFT)
  {
    s.updateXY(-1, 0);
  }
}
class Snake
{
  
  float x, y;
  
  float xspeed, yspeed;
  
  int total = 0;
  
  
   
  Snake()
  {
    x = 0;
    y = 0;
    
    xspeed = 0;
    yspeed = 1;
    
  }
 
  
  public void updateXY(float newX, float newY)
  {
    xspeed = newX;
    yspeed = newY;
  }
  
  public void death()
  {
  
    
    for(int i=0; i < tail.size();  i++)
    {
      
      PVector pos = tail.get(i);
      
      float d = dist(x, y, pos.x, pos.y);
      
      if(d < 1)
      {
        println("Starting over");
        total = 0;
        tail.clear();
      }
    }  
  }
  

  
  public void update()
  {
    if(total > 0)
    {
      if(tail.size() == total && !tail.isEmpty())
      {
       tail.remove(0); 
      }
      
      tail.add(new PVector(x, y));
      
    }
    
    x += xspeed*scl;
    y += yspeed*scl;
    
   // x = constrain(x, 0, width-scl);
   // y = constrain(y, 0, height-scl);
   
    if(x > width)
    {
      x = 0;
    }
    if(y > height)
    {
     y = 0; 
    }
    if(x < 0)
    {
      x = width - scl; 
    }
    if( y < 0 )
    {
     y = height - scl; 
    }
    
   
  }
  
  public boolean eat()
  {
    float d;
    
    d = dist(x, y, food.x, food.y);
    
    if(d < 1){
      total++;
      return true;
    }      else{
      return false;
    }
  }
  
 
  
  public void show()
  {
    fill(255);
    noStroke(); 
    for(PVector v: tail)
    {
       rect(v.x, v.y, scl, scl); 
    }
   
       rect(x, y, scl, scl);
   
  

}
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SnakeGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
