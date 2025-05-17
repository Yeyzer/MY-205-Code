class Player {
  float x, y;
  float speed = 5;
  int dir = 0;
  int size = 40;

  Player() {
    x = width / 2;
    y = height - 50;
  }

  void move(int direction) {
    dir = direction;
  }

  void update() {
    x += dir * speed;
    x = constrain(x, 0, width - size);
  }

  void display() {
    fill(255);
    rect(x, y, size, size);
  }
}
