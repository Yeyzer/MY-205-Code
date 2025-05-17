
abstract class GameObject {
  PVector pos;
  PVector vel;
  float size = 20;

  abstract void update();
  abstract void draw();
}
