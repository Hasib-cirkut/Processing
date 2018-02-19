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
 
  
  void updateXY(float newX, float newY)
  {
    xspeed = newX;
    yspeed = newY;
  }
  
  void death()
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
  

  
  void update()
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
  
  boolean eat()
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
  
 
  
  void show()
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