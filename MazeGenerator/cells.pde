
 class cells
 {
   int i, j;
   boolean[] walls = {true, true, true, true};
   boolean visited = false;
   
   cells(int ii, int jj)
   {
     i = ii;
     j = jj;
   }
   
   cells checkNeighbours()
   {
     ArrayList<cells> neighbour = new ArrayList<cells>();
     
     cells top = grid.get(index(i, j-1));
     cells right = grid.get(index(i+1, j));
     cells bottom = grid.get(index(i, j+1));
     cells left = grid.get(index(i-1, j));
     
     if(top != null && !top.visited)
     neighbour.add(top);
     
     if(right != null && !right.visited)
     neighbour.add(right);
     
     if(bottom != null && !bottom.visited)
     neighbour.add(bottom);
     
     if(left != null && !left.visited)
     neighbour.add(left);
     
     if(neighbour.size() > 0)
     {
      int ran = floor(random(0, neighbour.size()));
      
      return neighbour.get(ran);
     }
     else
       return null;
   }
   
   
   
   void highlight()
   {
     int x = this.i*w;
     int y = this.j*w;
     
     noStroke();
     fill(0, 0, 255, 100);
     
     rect(x,y, w, w);
     
   }
   
   
   void show()
   {
     int x = this.i*w;
     int y = this.j*w;
     
     stroke(255);
     
     
   
   if(this.walls[0])
   {
     line(x, y, x+w, y);
   }
   if(this.walls[1])
   {
     line(x+w, y, x+w, y+w);
   }
   if(this.walls[2])
   {
     line(x+w, y+w, x, y+w);
   }
   if(this.walls[3])
   {
     line(x, y+w, x, y);
   }
   
   if(visited)
   {
    fill(0, 255, 0, 100);
    noStroke();
    rect(x,y, w, w);
   }
   
   
   
 }
 
 }