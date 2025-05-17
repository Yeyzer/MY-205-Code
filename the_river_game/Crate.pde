class Crate {
  float x, y;
  float speed = 4;
  int size = 40;

  Crate() {
    x = random(width - size);
    y = -size;
  }

  void update() {
    y += speed;
  }

  void display() {
    fill(139, 69, 19); // brown
    rect(x, y, size, size);
  }

  boolean offScreen() {
    return y > height;
  }

  boolean hits(Player p) {
    return !(x + size < p.x || x > p.x + p.size || y + size < p.y || y > p.y + p.size);
  }
}
