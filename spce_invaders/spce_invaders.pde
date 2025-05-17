ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
ArrayList<Event> eventQueue = new ArrayList<Event>();
Ship player;
int score = 0;
boolean gameOver = false;


void setup() {
  size(600, 800);
  player = new Ship();
  gameObjects.add(player);
}

void draw() {
  background(0);  // Black background

  if (!gameOver) {
    // Update logic
    for (GameObject obj : gameObjects) obj.update();

    checkCollisions();  // Handle any hits

    // Draw all objects
    for (GameObject obj : gameObjects) obj.draw();

    // Process delayed events
    processEvents();

    // Spawn an enemy every second
    if (frameCount % 60 == 0) {
      gameObjects.add(new Enemy());
    }

    // Display Score + Health
    fill(255);
    textSize(18);
    text("Score: " + score, 10, 20);
    text("Health: " + player.health, 10, 40);
  } else {
    // Game Over screen
    fill(255, 0, 0);
    textSize(36);
    textAlign(CENTER);
    text("GAME OVER", width / 2, height / 2);
    text("Final Score: " + score, width / 2, height / 2 + 50);
  }
}

void keyPressed() {
  if (key == ' ') {
    player.shoot();
  }
}
