
int wid = 135;
Cell[][] cells = new Cell[3][3];

boolean player1, player2, gameOver;
boolean playerOneWin, playerTwoWin;

PFont font;

 void setup()
 {
  
   
   size(400,400);
   
   font = createFont("Arial", 16, true);
   
  // translate(width/2, height/2);
   
   player1 = true; // red
   player2 = false; // green
   gameOver = false;
   playerOneWin = playerTwoWin = false;
   
   for(int i=0; i<3; i++)
   {
     for(int j=0; j<3; j++)
     {
       cells[i][j] = new Cell(i*wid, j*wid, wid);
     }
   }
   
 }
 
 void mousePressed()
 {
  
   for(int i=0; i<3; i++)
   {
     for(int j=0; j<3; j++)
     {
       if(cells[i][j].contains(mouseX, mouseY))
         cells[i][j].reveal();
     }
   } 
   
 }
 
 void checkFunc()
 {
   int rCount = 0, gCount = 0;
  
   for(int i=0; i<3; i++)
   {
     for(int j=0; j<3; j++)
     {
       if(cells[i][j].red)
       rCount++;
       if(cells[i][j].green)
       gCount++;
     }
     
     if(rCount == 3){
        playerOneWin = true;
       gameOver();
      
     break;
     }else if(gCount == 3){
       playerTwoWin = true;
       gameOver();
       
     }
     
     else
     {
       rCount = gCount = 0;
     }
   }
   
   for(int i=0; i<3; i++)
   {
     for(int j=0; j<3; j++)
     {
       if(cells[j][i].red)
       rCount++;
       if(cells[j][i].green)
       gCount++;
     }
     
     if(gCount == 3){
       playerTwoWin = true;
       gameOver();
     break;
     }
     else if(rCount == 3){
       playerOneWin = true;
       gameOver();
       
     }
     else
     {
       rCount = gCount = 0;
     }
     
    
   }
   
   if((cells[0][0].red && cells[1][1].red && cells[2][2].red) || (cells[0][2].red && cells[1][1].red && cells[2][0].red))
   {
     playerOneWin = true;
    gameOver(); 
   }
   
   if((cells[0][0].green && cells[1][1].green && cells[2][2].green) || (cells[0][2].green && cells[1][1].green && cells[2][0].green))
   {
     playerTwoWin = true;
    gameOver(); 
   }
   
   
 }
 
 void gameOver()
 {
   
   noLoop();
   fill(0, 0, 255);
   textFont(font, 36);

   if(playerOneWin){
     textAlign(CENTER);
   text("Player One Wins", width/2, height/2);
   }else if(playerTwoWin)
   {
     textAlign(CENTER);
     text("Player Two Wins", width/2, height/2);
   }
   
 }
 
 

 
 void draw()
 {
   background(51);
   for(int i=0; i<3; i++)
   {
     for(int j=0; j<3; j++)
     {
       cells[i][j].show();
     }
   }
   
   checkFunc();
   
 }