class moverObject
{
  PVector acc;
  PVector loc;
  PVector vel;
  float topSpeed;
  
  
  
  moverObject() //constructor
  {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    topSpeed = 5.5;
  }
  
  void update()
  {
    PVector mouse = new PVector(mouseX, mouseY); //PVecor variable for mouse movement
    acc = PVector.sub(mouse, loc); //Computing a vector that is pointed from object postion to mouse position
    
    acc.setMag(.2); //Set magnitude of the acceleration
    
    vel.add(acc); //Velocity changes with acceleration; v = u + at; v is proportional to a
    
    vel.limit(topSpeed); //Limiting the velocity so that the object does not goes off screen
    
    loc.add(vel); //Location changes as velocity does
    
  }
  
  void show()
  {
    stroke(0);
    strokeWeight(8);
    fill(127);
    //stroke(2);
    ellipse(loc.x, loc.y, 48, 48); //Drawing an ellipse at loc.x and loc.y with radius of 48 unit(arbitrary value)
    
  }
  
  
}