
ArrayList<Ball> balls;

float gravity = .1;
float w = 40; // width of each balls
void setup()
{
  size(640, 360);
  
  balls = new ArrayList<Ball>();
  
  addBalls(width/2, height/2);
  
  
  
}

void draw()
{
  background(0);
  
  for(int i=0 ; i<balls.size(); i++)
  {
    Ball ball = balls.get(i);
    
    ball.show();
    ball.update();
    
  }
  
  //collison();
  
}

//void collison()
//{
//  for(int i=0 ; i<balls.size(); i++)
//  {
//    Ball ball = balls.get(i);
    
//      for(int j=0 ; j<balls.size(); j++)
//  {
//    Ball ball2 = balls.get(i);
    
//    if(ball.x >= ball2.x)
//    ball2.x *= .001;
//    else if(ball.x <= ball2.x)
//    ball2.x *= -.001;
//    else if(ball.y <= ball2.y)
//    ball2.speed *= -.001;
    
//  }
//  }
//}

void mousePressed()
{
  addBalls(mouseX, mouseY);
}

void addBalls(int x, int y)
{
 balls.add(new Ball(x, y, 7));
}