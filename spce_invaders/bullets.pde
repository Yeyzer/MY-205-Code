//this controlls the bullets 
class Bullet extends GameObject {
  Bullet(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, -7);
    size = 8;
  }

  void update() {
    pos.add(vel);
  }

  void draw() {
    fill(255, 255, 0);
    ellipse(pos.x, pos.y, size, size);
  }
}
