
  system s;
  Particle p;
  PVector gravity = new PVector(0 , .2);

  void setup()
  {
    size(600, 600);
    
    
    
    
    s = new system();
    
    s.startUp();
    
  }
  
  void draw()
  {
    
    
   background(51);
   
   
   s.update();
 

  }
  
  