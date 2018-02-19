
  
  player p;
  
  float mCoordinate = 20;
  ArrayList<vehicles> vehi = new ArrayList<vehicles>();
  
  void setup()
  {
    size(400, 600);
    p = new player();
       
      vehi.add(new vehicles(random(3, 10)));
    
  }
  
   void draw()
   {
     background(255);
     line(width/3, 0, width/3, height);
     line((width/3)*2, 0, (width/3)*2, height);
     
     p.show();
     
       for(int i=0; i<vehi.size(); i++)
        {
          vehicles v = vehi.get(i);
          
          v.update();
          v.show();
        }    
        
        if(frameCount % 60 == 0)
        {
          vehi.add(new vehicles(random(3,10)));
        }
 }
   
   void keyPressed()
   {
     
     if(keyCode == UP)
       p.move(0, -mCoordinate);
       else if(keyCode == DOWN)
       p.move(0, mCoordinate);
       else if(keyCode == LEFT)
       p.move(-mCoordinate, 0);
       else if(keyCode == RIGHT)
       p.move(mCoordinate, 0);
       
   }