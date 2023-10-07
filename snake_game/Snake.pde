public class Snake{
  MyList bodies;
  int[][] matrix;
  
  public Snake(int[][] matrix){
    this.matrix = matrix;
    bodies = new MyList(matrix);
  }
  
  public void init(){
    int h = matrix.length;
    int w = matrix[0].length;
    bodies.addLast(new Body(w/2,h/2));
    bodies.addLast(new Body(w/2-1,h/2));
    println(bodies);
    println(h,w);
  }
  
  
  public void show(){
    Node<Body> head = bodies.getHead();
    while(head!=null){
       int x = head.val.x;
       int y = head.val.y;
       design(x*10,y*10);
       head = head.next;
    }
  }
  
  private void design(int x,int y){
    push();
    //noStroke();
    fill(105);
    rect(x,y,10,10,3);
    pop();
  }
  
  public PVector getNextLocation(){
    Node<Body> head = bodies.getHead();
    int diffX = head.val.x - head.next.val.x;
    int diffY = head.val.y - head.next.val.y;
    int newX = head.val.x + diffX;
    int newY = head.val.y + diffY;
    return new PVector(newX,newY);
  }
  
  public PVector getNextLocation(PVector loc){
    Node<Body> head = bodies.getHead();
    int diffX = head.val.x - head.next.val.x;
    int diffY = head.val.y - head.next.val.y;
    if(Math.abs(diffX)==Math.abs(loc.x) || Math.abs(diffY)==Math.abs(loc.y)){
      return null;
    }
    float newX = head.val.x + loc.x;
    float newY = head.val.y + loc.y;
    return new PVector(newX, newY);
  }
  
  public boolean move(PVector loc){
    if(loc==null) return false; //<>//

    bodies.addFirst(new Body(loc));
    bodies.removeLast();
    return true;
  }
  
  public boolean checkCollision(PVector loc){
     return checkCollisionWithBoundry(loc.x,loc.y) || checkCollisionWithSelf(loc.x,loc.y);

  }
  
  public boolean checkCollision(int x, int y){
    //println(x,y);
    return checkCollisionWithBoundry(x,y) || checkCollisionWithSelf(x,y);
  }
  
  public void eat(Food f){
    Node<Body> tail = bodies.getTail();
    if(matrix[f.getX()][f.getY()]==2) { //<>//
      int diffX = tail.val.x - tail.prev.val.x; //<>//
      int diffY = tail.val.y - tail.prev.val.y;
      int newX = tail.val.x + diffX;
      int newY = tail.val.y + diffY;
      bodies.addLast(new Body(newX, newY));
    }
  }
   //<>//
  private boolean checkCollisionWithSelf(float x, float y){
    return matrix[int(x)][int(y)]==1;
  }
  
  private boolean checkCollisionWithBoundry(float x, float y){
    return x<0 || x>=matrix.length || y<0 || y>=matrix[0].length;
  }
  
  
  
  
}
