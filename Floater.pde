import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

SpaceGame spaceGame; // Declare the main SpaceGame instance

void setup() {
  size(800, 600); // Set up the canvas size
  spaceGame = new SpaceGame();
}

void draw() {
  background(0); // Clear the screen with black
  spaceGame.update();
  spaceGame.display();
}

// SpaceGame class
class SpaceGame {
  private Spaceship ship;

  SpaceGame() {
    ship = new Spaceship();
  }

  void update() {
    ship.move();
  }

  void display() {
    ship.draw();
  }

  void handleInput(int key) {
    if (key == UP) {
      ship.accelerate();
    }
    if (key == LEFT) {
      ship.turn(-5);
    }
    if (key == RIGHT) {
      ship.turn(5);
    }
  }
}

void keyPressed() {
  spaceGame.handleInput(keyCode);
}

// Floater base class
class Floater {
  protected float myCenterX, myCenterY; // Center coordinates
  protected float myXspeed, myYspeed;  // Speed in x and y directions
  protected float myPointDirection;   // Direction the floater is pointing
  protected int corners;              // Number of corners
  protected int[] xCorners, yCorners; // Corner coordinates relative to the center
  protected color myColor;            // Color of the floater

  Floater() {
    myCenterX = width / 2.0;
    myCenterY = height / 2.0;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
    corners = 0;
    xCorners = new int[0];
    yCorners = new int[0];
    myColor = color(255);
  }

  void move() {
    myCenterX += myXspeed;
    myCenterY += myYspeed;

    // Wrap around the edges of the screen
    if (myCenterX < 0) myCenterX += width;
    if (myCenterX > width) myCenterX -= width;
    if (myCenterY < 0) myCenterY += height;
    if (myCenterY > height) myCenterY -= height;
  }

  void turn(float degrees) {
    myPointDirection += degrees;
  }

  void draw() {
    float radians = radians(myPointDirection);
    int[] xPoints = new int[corners];
    int[] yPoints = new int[corners];

    for (int i = 0; i < corners; i++) {
      xPoints[i] = (int) (xCorners[i] * cos(radians) - yCorners[i] * sin(radians) + myCenterX);
      yPoints[i] = (int) (xCorners[i] * sin(radians) + yCorners[i] * cos(radians) + myCenterY);
    }

    fill(myColor);
    stroke(255);
    beginShape();
    for (int i = 0; i < corners; i++) {
      vertex(xPoints[i], yPoints[i]);
    }
    endShape(CLOSE);
  }
}

// Spaceship subclass
class Spaceship extends Floater {
  Spaceship() {
    corners = 3;
    xCorners = new int[] { -8, 16, -8 };
    yCorners = new int[] { -8, 0, 8 };
    myColor = color(255, 0, 0); // Red color
    myCenterX = width / 2.0;   // Start in the middle of the screen
    myCenterY = height / 2.0;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0; // Initially pointing to the right
  }

  void accelerate() {
    float radians = radians(myPointDirection);
    myXspeed += cos(radians) * 0.2; // Adjust the acceleration
    myYspeed += sin(radians) * 0.2;
  }
}
