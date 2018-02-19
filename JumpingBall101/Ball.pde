class ball
{
  PVector location;
  PVector velocity;
  PVector gravity;
  ball()
  {
    location = new PVector(100, 100);
    velocity = new PVector(1.2, 2.1);
    gravity = new PVector(0, .2);
 }
  
  void render()
  {
    stroke(0);
  strokeWeight(2);
  fill(127);
  ellipse(location.x,location.y,48,48);
  }
  
  void update()
  {
    location.add(velocity); // s = vt
    
    velocity.add(gravity); // v = 2gh
    
    if(location.x < 0 || location.x > width)
    {
      velocity.x *= -1;
    }
    
   if(location.y > height)
   {
    velocity.y *= -.95;
    location.y = height;
   }
    
  }
  
}