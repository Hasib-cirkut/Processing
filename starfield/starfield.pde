


Stars[] stars = new Stars[3000];

float speed;

void setup()
{
  size(600, 600);
  
 // file = new SoundFile(this, "midi1.mp3");
  
  for(int i=0; i<stars.length; i++)
  {
    stars[i] = new Stars();
  }
  
}

void draw()
{
  speed = map(mouseX, 0, width, 0, 16);
  
  background(0);
  translate(width/2, height/2);
  
  for(int i=0; i<stars.length; i++)
  {
    stars[i].update();
    stars[i].show();
  }
  
}