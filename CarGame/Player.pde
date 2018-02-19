  
  class player
  {
    float px,py, h;
    
    player()
    {
      h = 80;
      px = width/2;
      py = height-h - 10;
    }
    
    void move(float x, float y)
    {
      px += x;
      py += y;
    }
    
    
    void show()
    {
      fill(0);
      
      rect(px, py, 40, h);
      
    }
    
  }