
int col, row;
int w = 20;

ArrayList<cells> grid = new ArrayList<cells>();
ArrayList<cells> stack = new ArrayList<cells>();

cells current;

void setup()
{
  size(600, 600);
  
    
  col = floor(width/w);
  row = floor(height/w);
  
  
  for(int j=0; j<row; ++j)
  {
    for(int i=0; i<col; ++i)
    {
      cells cell = new cells(i, j);
      grid.add(cell);
    }
  }
  
  current = grid.get(0);
}

int index(int i, int j)
{
  if(i<0 || j<0 || i > col -1 || j > row - 1)
    return 0;
  
  return i + j * col;
}

void draw()
{
  background(51);
  
  float mouseCon = map(mouseX, 0, width, 5, 50); 
  
  frameRate(mouseCon);

  
  for(int i=0; i<grid.size(); ++i)
  {
    grid.get(i).show();
  }
 
  
  
  current.visited = true;
  current.highlight();
  
  cells next = current.checkNeighbours();
  
  
  
  if(next != null)
  {
   
    next.visited = true; //Step 1
    
    stack.add(current); //Step 2
    
    removeWalls(current, next); // Step 3
    
      
    current = next; // Step 4
    
  }  else if(stack.size() > 0)
  {
   
    current = stack.remove(stack.size()-1);
    
  }
  
  
  
}

void removeWalls(cells a, cells b)
{
  int x = a.i - b.i;
  
  if(x == 1)
  {
    a.walls[3] = false;
    b.walls[1] = false;
  }else if(x == -1)
  {
    a.walls[1] = false;
    b.walls[3] = false;
  }
  
  int y = a.j - b.j;
  
  if( y == 1)
  {
   a.walls[0] = false;
   b.walls[2] = false;
  }
  else if(y == -1)
  {
   a.walls[2] = false;
   b.walls[0] = false; 
  }
    
}