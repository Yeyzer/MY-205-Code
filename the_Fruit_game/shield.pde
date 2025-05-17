class Fruit {
  String emoji;
  
  Fruit(String emoji){
    this.emoji=emoji;
  }
  
  static Fruit randomFruit() {
    String[] emojis = {"🍓", "🍍", "🍇", "🍉", "🍒"};
    int index =int(random(emojis.length));
    return new Fruit(emojis[index]);
  }
}
