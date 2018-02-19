
int scl = 20;

Snake s;


PVector food;

ArrayList <PVector> tail = new ArrayList<PVector>();




void setup()
{
  
  size(600, 600);
  frameRate(16);
  s = new Snake();
  pickLocation();
}


void draw()
{ 
  background(51);
 
  
  
  s.update();
  s.show();
  s.death();
  
  if(s.eat())
   pickLocation();
  
  
  fill(23);
  rect(food.x, food.y, scl, scl);
 
  
}
void pickLocation()
{
  int cols = (width / scl);
  int row = (height / scl);
  
  food = new PVector(floor(random(cols)), floor(random(row)));
  
  for(int i=0; i<tail.size(); i++)
  {
   
    PVector pos = tail.get(i);
    
    if(pos.x == food.x && pos.y == food.y)
    {
      food = new PVector(floor(random(cols)), floor(random(row)));
    }
    
  }
  
  food.mult(scl);
  
}



void keyPressed()
{
  if(keyCode == UP)
  {
    s.updateXY(0, -1);
  }
  else if(keyCode == DOWN)
  {
    s.updateXY(0, 1);
  }
  else if(keyCode == RIGHT)
  {
    s.updateXY(1, 0);
  }
  else if(keyCode == LEFT)
  {
    s.updateXY(-1, 0);
  }
}