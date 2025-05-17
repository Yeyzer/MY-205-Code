Player player;
ArrayList<Crate> crates;
int spawnTimer = 0;
int score = 0; // Add a score variable

void setup() {
  size(400, 600);
  player = new Player();
  crates = new ArrayList<Crate>();
}

void draw() {
  background(0, 150, 255); // river blue
  
  // Update and display the player
  player.update();
  player.display();
  
  // Spawn crates
  spawnTimer++;
  if (spawnTimer > 60) {
    crates.add(new Crate());
    spawnTimer = 0;
  }

  // Update and display crates
  for (int i = crates.size()-1; i >= 0; i--) {
    Crate c = crates.get(i);
    c.update();
    c.display();
    
    // If crate goes off-screen, increase score
    if (c.offScreen()) {
      crates.remove(i);
      score++; // Increment score
    } else if (c.hits(player)) {
      println("Game Over!");
      noLoop(); // stops the game
    }
  }
  
  // Display the score
  fill(0);
  textSize(32);
  textAlign(RIGHT);
  text("Score: " + score, width - 20, 40);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      player.move(-1);
    } else if (keyCode == RIGHT) {
      player.move(1);
    }
  }
}

void keyReleased() {
  player.move(0);
}
