public class Food{
  PVector vec;
  
  public Food(PVector vec){
    this.vec = vec;
  }
  
  public Food(int x, int y){
    this.vec = new PVector(x,y);
  }
  
  public int getX(){
    return int(vec.x);
  }
  
  public int getY(){
    return int(vec.y);
  }
  
  public void show(float radius){
    push();
    noStroke();
    fill(70);
    ellipse(vec.x*(radius*2)+radius,vec.y*(2*radius)+radius, radius*2+2,radius*2+2);
    pop();
  }
}
