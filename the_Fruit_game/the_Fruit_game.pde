String gameState = "title";  // "title", "playing"

Player player;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
PFont font;

void setup() {
  size(800, 600);
  font = createFont("Arial", 24);
  textFont(font);
}

void draw() {
  background(30);

  if (gameState.equals("title")) {
    drawTitleScreen();
  } else if (gameState.equals("playing")) {
    runGame();
  }
}

void drawTitleScreen() {
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(36);
  text("🍓 Fruit Crate Blaster 🍍", width/2, height/2 - 60);
  textSize(18);
  text("Press ENTER to Start", width/2, height/2 + 20);
}

void runGame() {
  if (player == null) {
    player = new Player(width/2, height - 50);
    bullets = new ArrayList<Bullet>();
    enemies = new ArrayList<Enemy>();
    spawnEnemies();
  }

  player.update();
  player.display();

  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.update();
    b.display();

    if (b.offScreen()) {
      bullets.remove(i);
    }
  }

  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    e.update();
    e.display();

    for (int j = bullets.size() - 1; j >= 0; j--) {
      Bullet b = bullets.get(j);
      if (e.hitBy(b)) {
        e.takeDamage();
        bullets.remove(j);
        break;
      }
    }

    if (e.isDead()) {
      enemies.remove(i);
    }
  }
}

void keyPressed() {
  if (gameState.equals("title") && keyCode == ENTER) {
    gameState = "playing";
  }

  if (gameState.equals("playing")) {
    player.keyPressed(key);
  }
}

void keyReleased() {
  if (gameState.equals("playing")) {
    player.keyReleased(key);
  }
}

void spawnEnemies() {
  for (int i = 0; i < 5; i++) {
    color c = color(random(100, 255), random(100, 255), random(100, 255));
    enemies.add(new Enemy(100 + i * 120, 100, c));
  }
}

void shootBullet(float x, float y) {
  bullets.add(new Bullet(x, y));
}

// =======================
// Stub classes to make it work
// =======================

class Player {
  float x, y;
  boolean left, right;

  Player(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    if (left) x -= 5;
    if (right) x += 5;
  }

  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, 40, 40);
  }

  void keyPressed(char k) {
    if (k == 'a') left = true;
    if (k == 'd') right = true;
    if (k == ' ') shootBullet(x, y - 20);
  }

  void keyReleased(char k) {
    if (k == 'a') left = false;
    if (k == 'd') right = false;
  }
}

class Bullet {
  float x, y, speed = 8;

  Bullet(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    y -= speed;
  }

  void display() {
    fill(255, 255, 0);
    ellipse(x, y, 8, 8);
  }

  boolean offScreen() {
    return y < 0;
  }
}

class Enemy {
  float x, y;
  color c;
  float speed;
  int lives;

  Enemy(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
    this.speed = random(1, 3);
    this.lives = int(random(1, 4));  // Number of hits needed to destroy
  }

  void update() {
    y += speed;
  }

  void display() {
    fill(c);
    rectMode(CENTER);
    rect(x, y, 30, 30);
    fill(255);
    textAlign(CENTER);
    text(getFruitEmoji(), x, y + 5);
  }

  String getFruitEmoji() {
    if (lives == 3) return "🍎";
    if (lives == 2) return "🍊";
    return "🍇";
  }

  boolean hitBy(Bullet b) {
    return dist(x, y, b.x, b.y) < 20;
  }

  void takeDamage() {
    lives--;
  }

  boolean isDead() {
    return lives <= 0;
  }
}
