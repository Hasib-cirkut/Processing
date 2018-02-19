  
           ArrayList<Particle> particle;
           
           

  
   class system {
  
     
     void startUp(){
         particle = new ArrayList<Particle>();
         particle.add( new Particle(random(width), random(height+10, height+20) ) );  
     }

     void update()
     {

      this.show(); 
      
      
      
     }
     
     
     
     void show()
     {
       
        if(random(1) < .1)
       {
         particle.add(new Particle(random(width), random(height+10, height+20)));

       }
     
       for(int i=particle.size() -1; i>=0; i--)
        {
       Particle p = particle.get(i);
       
        if(p.explode())
       {
        p = null;
        
        continue;
       }
      
       
       p.Force(gravity);
       p.update();
       p.show();
       
       
      } 
       
     }
     
     
   }
   