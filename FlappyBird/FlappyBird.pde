
Bird b;
ArrayList <Pillers> pillers = new ArrayList<Pillers>();


void setup()
{
  size(400, 600);
  b = new Bird();
  pillers.add(new Pillers());

  
  
}
  
void draw()
{
  background(51);
  
  
   for(int i= pillers.size() -1 ; i >= 0; i--)
  {
    Pillers p = pillers.get(i);
    
      p.show();
      p.update();
      
      if(p.hit(b))
      {
       //gameOver(); 
      }
      
      if(p.x < -p.w)
      {
        pillers.remove(i);
        }
    
    }
    
    
     if(frameCount % 70 == 0)
  {
    pillers.add(new Pillers());
    }
  
  b.update();
  b.show();
  
 
  
 
  
  
}

void gameOver()
{
  noLoop();
}

void keyPressed()
{
 
  if(key == ' ')
   b.jump();
   
  }