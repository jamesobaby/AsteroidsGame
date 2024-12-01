Spaceship ship;
Star[] stars;

void setup() {
  size(800, 600);
  ship = new Spaceship();

  // Create stars for the background
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);

  // Draw stars
  for (Star star : stars) {
    star.draw();
  }

  // Move and draw spaceship
  ship.move();
  ship.draw();
}

void keyPressed() {
  if (keyCode == UP) {
    ship.accelerate();
  }
  if (keyCode == LEFT) {
    ship.turn(-5);
  }
  if (keyCode == RIGHT) {
    ship.turn(5);
  }
  if (key == ' ') {
    ship.hyperspace();
  }
}
