class Bullet {
  float x, y;
  float speed = 8;
  float size = 8;

  Bullet(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    y -= speed;
  }

  void display() {
    fill(255, 255, 0);
    noStroke();
    ellipse(x, y, size, size);
  }

  boolean offScreen() {
    return y < 0;
  }
}
