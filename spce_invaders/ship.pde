
class Ship extends GameObject {
  int health = 100;

  Ship() {
    pos = new PVector(width/2, height - 50);
    vel = new PVector(0, 0);
  }

  void update() {
    vel.set(0, 0);
    if (keyPressed) {
      if (keyCode == LEFT)  vel.x = -5;
      if (keyCode == RIGHT) vel.x =  5;
    }
    pos.add(vel);
    pos.x = constrain(pos.x, 0, width); // Keeps player on screen
  }

  void draw() {
    fill(0, 200, 255);
    triangle(pos.x, pos.y - 20, pos.x - 15, pos.y + 20, pos.x + 15, pos.y + 20);
  }

  void shoot() {
    Bullet b = new Bullet(pos.x, pos.y - 25);
    gameObjects.add(b);
  }
}
