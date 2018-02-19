class Stars

{
  float x, y, z, pz;
  
  Stars()
  {
    
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
    pz = z;
  }
  
  void update()
  {
    z = z - speed; 
    if(z < 1)
    {
      z = random(width);
      
      x = random(-width, width);
    y = random(-height, height);
   
        pz = z;
  
}
    
  }
  
  void show()
  {
    fill(255);
    noStroke();
    
    float sx = map(x/z, 0, 1, 0, width);
    float sy = map(y/z, 0, 1, 0, height);
    
    float r = map(z, 0, width, 8, 0);

    
    ellipse(sx, sy, r, r);
    
    float px = map(x/pz, 0, 1, 0, width);
    float py = map(y/pz, 0, 1, 0, height);
    
    pz = z;

    stroke(255);
    line(px, py, sx, sy); 


  }
  
}