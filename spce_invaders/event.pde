//this tab is allowing the player to get hit by the enemy and it also allows 
class Event {
  String type;
  GameObject source;

  Event(String t, GameObject s) {
    type = t;
    source = s;
  }
}

void processEvents() {
  for (Event e : eventQueue) {
    if (e.type.equals("ENEMY_HIT")) {
      gameObjects.remove(e.source);
      score += 10;
    }
    if (e.type.equals("PLAYER_HIT")) {
      player.health -= 1;
      if (player.health <= 0) gameOver = true;
    }
  }
  eventQueue.clear();
}
