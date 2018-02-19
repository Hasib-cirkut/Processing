class Drop
{
 
  float x = random(width);
  float y = random(-400, -50);
  float z = random(0 , 10);
  float len = map(z, 0, 10, 5, 14);
  float yspeed = map(z, 0, 10, 5, 20);
  void fall ()
  {
    y = y + yspeed; 
    
    float grav = map(z, 0, 10, 0, 0.2);
    
   yspeed += grav;
    
     if(y > height)
     {
       y = random(-200, -100);
       yspeed = map(z, 0, 10, 5, 20);
     }
  }
  
  void show()
  {
    float thickness = map(z, 0, 10, 1, 2);
    
    strokeWeight(thickness);
    
    stroke(138, 43, 226);
    line(x, y, x, y+len);
    
  
  }
  
  
  
}