import java.util.Random; //<>//

int h = 480;
int w = 480;
int[][] matrix;
Snake snake;
PVector foodLoc;
PVector snakeNextLocation;

void setup() {
  frameRate(5);
  size(480, 480);
  background(255);
  matrix = new int[h/10][w/10];
  foodLoc = getRandomLocation();
  matrix[int(foodLoc.x)][int(foodLoc.y)]=2;
  snake = new Snake(matrix);
  snake.init();
  snakeNextLocation = snake.getNextLocation();
}

void draw() {
  background(175);
  snake.show();
  if (snakeNextLocation!=null && snake.checkCollision(snakeNextLocation)) {
    println("collision occurred");
    noLoop();
    gameOver();
    return;
  }
  if (matrix[int(snakeNextLocation.x)][int(snakeNextLocation.y)]==2) {
    snake.eat(new Food(snakeNextLocation));
    foodLoc = getRandomLocation();

    matrix[int(foodLoc.x)][int(foodLoc.y)]=2;
  }
  new Food(foodLoc).show(5);
  snake.move(snakeNextLocation);
  snakeNextLocation = snake.getNextLocation();
}

void keyPressed() {
  PVector newLoc = new PVector(0, 0);
  if (key==CODED) {
    if (keyCode == UP) {
      newLoc = snake.getNextLocation(new PVector(0, -1));
    } else if ( keyCode == DOWN) {
      newLoc = snake.getNextLocation(new PVector(0, 1));
    } else if (keyCode == LEFT) {
      newLoc = snake.getNextLocation(new PVector(-1, 0));
    } else if (keyCode == RIGHT) {
      newLoc = snake.getNextLocation(new PVector(1, 0));
    } else {
      return;
    }
    if (newLoc !=null) snakeNextLocation = newLoc;
  }
}

PVector getRandomLocation() {
  int x = getRandom(48);
  int y = getRandom(48);
  if (matrix[x][y] == 1) {
    return getRandomLocation();
  }
  return new PVector(x, y);
}

int getRandom(int w) {
  return new Random().nextInt(w);
}


public void gameOver() {
  push();
  textSize(50);
  fill(255, 0, 0);
  text("GAME OVER", 40, 120);
  pop();
}
