class Player {
  float x, y;
  float w = 40;
  float h = 40;
  float speed = 5;

  boolean moveLeft = false;
  boolean moveRight = false;

  Player(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    if (moveLeft) {
      x -= speed;
    }
    if (moveRight) {
      x += speed;
    }

    // Keep player on screen
    x = constrain(x, 0, width - w);
  }

  void display() {
    fill(0, 200, 255);
    rect(x, y, w, h);
  }

  void keyPressed(char key) {
    if (key == 'a' || key == 'A') {
      moveLeft = true;
    } else if (key == 'd' || key == 'D') {
      moveRight = true;
    } else if (key == ' ') {
      shoot();
    }
  }

  void keyReleased(char key) {
    if (key == 'a' || key == 'A') {
      moveLeft = false;
    } else if (key == 'd' || key == 'D') {
      moveRight = false;
    }
  }

  void shoot() {
    float bulletX = x + w / 2;
    float bulletY = y;
    shootBullet(bulletX, bulletY);  // calls global method in Main tab
  }
}
