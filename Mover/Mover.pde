
moverObject mover;

void setup()
{
  size(640, 360);
  background(255);
  
  mover = new moverObject(); //Declaration of moverObject object
}

void draw()
{
  background(255);
  
  mover.update();
  mover.show();
  
}