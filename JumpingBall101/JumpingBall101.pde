ball ball;
void setup()
{
  size(640, 320);
  ball = new ball();
}

void draw()
{
  background(0);
  
  ball.update();
  ball.render();
  
  
}