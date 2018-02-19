 
   class Particle {
   
     PVector location, acc, velo;
     
     Particle(float x, float y)     
     {
       location = new PVector(x, y);
       acc = new PVector(0, 0);
       velo = new PVector(0,random(-15,-8));
     }
        
     void update()
     {
       
       velo.add(acc);
       location.add(velo);
       acc.mult(0);
       
     }
     
     boolean explode()
     {
       if(velo.y >= 0)
       return true;
       
       return false;
       
     }
     
     void Force(PVector force)
     {
      
       acc.add(force);
       
     }
     
        void show()
     {
       fill(255);
       ellipse(location.x, location.y, 5, 5);
     }
     
   }
     