class Ball{

  float loc, speed;
  float x, y;
  Ball(float x, float y,float speed)
  {
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  
  void show(){
    fill(0, 120, 8);
    stroke(5);
    ellipse(x, y, w, w);
  }
  
  void update()
  {
    speed += gravity;
    
    y += speed;
    
    if(y > height)
    {
      speed *= -.8;
      
      
      y = height;
      
    }
    
  }
  
}