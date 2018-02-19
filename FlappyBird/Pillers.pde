class Pillers{
  
  float x, y, w, top, bottom;
  boolean highlight = false;
  
  Pillers()
  {
    
       x = width;
       top = random(height/2);
       bottom = random(height/2);
       w = 15;
  }
  
  void update()
  {
 
    
    x -= 2;
  }
  
  boolean hit(Bird b)
  {
    if((b.y - b.w/2 < top) || (b.y >(height -bottom) - b.w/2)){
      if((b.x > x) && (b.x < (x + w))){
        highlight = true;
        return true;
    }
  }
  highlight = false;
    return false;
}
  
  void show()
  {
    
    fill(255);
    if(highlight)
    fill(255, 0, 0);    
    rect(x, 0, w, top);
    rect(x, height - bottom, w, bottom);
  }
    
  }