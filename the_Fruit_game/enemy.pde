class Enemy {
  float x, y;
  float speed;
  color c;

  Enemy(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
    speed = random(1, 3);
  }

  void update() {
    y += speed;
  }

  void draw() {
    fill(c);
    ellipse(x, y, 20, 20);
  }

  boolean isOffScreen() {
    return y > height;
  }

  boolean collidesWith(Bullet b) {
    return dist(x, y, b.x, b.y) < 10;
  }

  boolean collidesWithPlayer(Player p) {
    return dist(x, y, p.x, p.y) < 15;
  }
}
