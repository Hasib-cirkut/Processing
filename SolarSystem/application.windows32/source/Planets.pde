
  class Planets
  {
    float radius, distant;
    float angle;
    Planets[] planet;
    float orbitSpeed;
    PVector v;
    
    Planets(float r, float d, float s)
    {
      radius = r;
      distant = d;
      v = PVector.random3D();
      angle = random(TWO_PI);
      v.mult(distant);
      orbitSpeed = s;
    }
    
    void orbit()
    {
     
      angle += orbitSpeed;
      
      if(planet != null)
      for(int i=0; i<planet.length; i++)
          {
           planet[i].orbit(); 
          }
      
    }
    
    void moons(int total, int level)
    {
      planet = new Planets[total];
      
      for(int i=0; i<planet.length; i++)
      {
        
        float r = radius/(level+1.5);
        float d = random((radius+r), (radius+r)*2);
        float s = random(-.009, .009);
        planet[i] = new Planets(r, d, s); //s = orbitspeed
        if(level < 2)
        {
         int num = int(random(0,3));
         planet[i].moons(num,level+1);
          
        }
      }
      
    }
   
     
    void show()
    {
      pushMatrix();
       noStroke();
      fill(255);
      
      PVector v2 = new PVector(1,0,1);
      PVector p = v.cross(v2);
      rotate(angle, p.x, p.y, p.z);
      
      
      rotate(angle);
      translate(v.x, v.y, v.z);
      
      sphere(radius);
     // ellipse(0,0,radius*2, radius*2);
      
        if(planet != null)
      for(int i=0; i<planet.length; i++)
          {
            planet[i].show();
          }
             popMatrix();
      
    }
 
    
    
  }