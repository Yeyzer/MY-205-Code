//this tab controlls the colisions that allow the game to have a game over
void checkCollisions() {
  for (int i = gameObjects.size() - 1; i >= 0; i--) {
    GameObject a = gameObjects.get(i);

    if (a instanceof Enemy) {
      Enemy enemy = (Enemy) a;

      // Check bullet collision
      for (int j = gameObjects.size() - 1; j >= 0; j--) {
        GameObject b = gameObjects.get(j);
        if (b instanceof Bullet) {
          if (dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y) < (a.size + b.size)/2) {
            eventQueue.add(new Event("ENEMY_HIT", a));
            gameObjects.remove(b);
            break;
          }
        }
      }

      // Check ship collision
      if (dist(enemy.pos.x, enemy.pos.y, player.pos.x, player.pos.y) < (enemy.size + 30)/2) {
        eventQueue.add(new Event("PLAYER_HIT", player));
        gameObjects.remove(enemy);
      }
    }
  }
}
