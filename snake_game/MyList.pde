class Node<T>{
  T val;
  Node<T> next;
  Node<T> prev;
  
  public Node(T e){
    this.val = e;
    this.next = null;
    this.prev = null;
  }
  
  public String toString(){
    return val.toString();
  }
}

public class MyList{
  Node<Body> head;
  Node<Body> tail;
  int[][] matrix;
  
  public MyList(int[][] matrix){
    head = null;
    tail = null;
    this.matrix = matrix;
  }
  
  void addFirst(Body e){
    Node node = new Node(e);
    if(head==null){
      head = node;
      tail = node;
      return;
    }
    node.next = head;
    head.prev = node;
    head = node;
    matrix[e.x][e.y] = 1;
  }
  
  void addLast(Body e){
    Node node = new Node(e);
    if(head == null){
      head = node;
      tail = node;
      return;
    }
    tail.next = node;
    node.prev = tail;
    tail = node;
    matrix[e.x][e.y] = 1;
  }
  
  void removeFirst(){
    if(head == null) return;
    matrix[head.val.x][head.val.y] = 0;
    head = head.next;
    head.prev.next = null;
    head.prev = null;
    
  }
  
  void removeLast(){
    if(tail == null) return;
    matrix[tail.val.x][tail.val.y] = 0;
    tail = tail.prev;
    tail.next.prev = null;
    tail.next = null;
  }
  
  Node<Body> getHead(){
    Node<Body> temp = head;
    return temp;
  }
  
  Node<Body> getTail(){
    Node<Body> temp = tail;
    return temp;
  }
  
  public String toString(){
    return String.format("[head: %s, tail: %s]", head, tail);
  }
}
