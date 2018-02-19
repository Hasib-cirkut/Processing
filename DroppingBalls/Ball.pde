class Ball
{
  float x, y;
  float gravity, speed;
  float life, wid;
  
  Ball(float x, float y, float w)
  {
   
    this.x = x;
    this.y = y;
    wid = w;
    
    life = 255;
    gravity = .1;
    speed = 0;
    
  }
  
  void update()
  {
    //Basic physics engine
    
    speed += gravity;
    y += speed;
    
    //If a ball reaches ground
    
    if(y > height)
    {
      speed *= -.8;
      y = height;
    }
  }
  
  void show()
  {
   fill(0,life);
   noStroke();
   ellipse(x, y, wid, wid);
  }
  
  boolean checkLife()
  {
    life -= 1;
    
    if(life < 0)
    return true;
    else
    return false;
  }
}