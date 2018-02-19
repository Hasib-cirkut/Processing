 
  class vehicles
  {
    float x, y, h, Vspeed;
    
    vehicles(float s)
    {
      h = 80;
      Vspeed = s;
      x = random(0, width-h);
      y = random(-200, -100);
      
    }
    
    void update()
    {
      y += Vspeed;
    }
    
    void show()
    {
      
      fill(0);
      rect(x, y, 40, h);
      
    }
    
    
  }