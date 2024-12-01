class Star {
  private float x, y;

  Star() {
    x = random(width);
    y = random(height);
  }

  public void draw() {
    stroke(255);
    point(x, y);
  }
}
