
ArrayList<Ball> balls;
int ballWid = 20;

void setup()
{
  size(800, 400);
  
  balls = new ArrayList<Ball>();
  
  balls.add(new Ball(width/2, height/2, ballWid));
  
}

void draw()
{
  
 background(255);
 
 for(int i=balls.size()-1; i >= 0; i--)
 {
   Ball ball = balls.get(i);
   
   ball.update();
   ball.show();
   if(ball.checkLife())
   balls.remove(i);
 }
  
}

void mousePressed()
{
  balls.add(new Ball(mouseX, mouseY, ballWid));
}