class Bird{
  
  
   float x = 25;
   float y = random(width);
   float w = 30;
   
   float velocity = 1;
   float gravity = .8;
   float lift = -20;
   void show()
   {
     fill(255, 0, 0);
     ellipse(x, y, w, w);
     noStroke();
   }
   
   void jump()
   {
     velocity += lift;
     println(velocity);
   }
   
   void update()
   {
     velocity += gravity;
     velocity *= .9;
     y += velocity;
     
     if(y > height)
     {
       y = height;
       velocity = 0;
       
     }
     
   }
   
 }