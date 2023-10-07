public class Body{
  int x;
  int y;
  
  public Body(int x, int y){
    this.x = x;
    this.y = y;
  }
  public Body(PVector loc){
    this.x = int(loc.x);
    this.y = int(loc.y);
  }
  
  public String toString(){
    return String.format("(%s,%s)",x,y);
  }
}
