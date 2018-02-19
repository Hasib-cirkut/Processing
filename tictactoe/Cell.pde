
 class Cell
 {
   float x, y, wid;
   boolean revealed;
   boolean green, red;
   
   Cell(float x, float y, float wid)
   {
     this.x = x;
     this.y = y;
     this.wid = wid;
     
     revealed = false;
     green = false;
     red = false;
     
   }
   
   void reveal()
   {
     if(!revealed){
    revealed = true;
    
    if(player1) //Player one is red | Player two is green
    {
     red = true;

     player1 = false;
     player2 = true;
    }
    else if(player2)
    {
     green = true;  //Green is player two
     
     player1 = true;
     player2 = false;
    }
   }
   
 }

     
   
   
   boolean contains(int x, int y)
   {
     return (x > this.x && x < this.x+wid && y > this.y && y < this.y+wid);
   }
   
   
   void show()
   {
     stroke(2);
     fill(255);
     rect(x, y, wid, wid);
     
      if(revealed)
      {
       
        if(red)
        {
         fill(255, 0, 0);
         stroke(1);
         rect(x, y, wid, wid);
        }
        else if(green)
        {
         fill(0, 255, 0);
         stroke(1);
         rect(x, y, wid, wid);
        }
        
      }
    
   
   }
 }   
 