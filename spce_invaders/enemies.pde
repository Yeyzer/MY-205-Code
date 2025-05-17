//this is basically what allows the actual enemys exist in he game
class Enemy extends GameObject {
  Enemy() {
    pos = new PVector(random(width), -20);
    vel = new PVector(0, random(2, 4));
    size = 30;
  }

  void update() {
    pos.add(vel);
  }

  void draw() {
    fill(255, 0, 0);
    rect(pos.x - size/2, pos.y - size/2, size, size);
  }
}
