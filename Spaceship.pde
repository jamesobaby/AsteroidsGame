class Spaceship extends Floater {
  Spaceship() {
    corners = 3; // A triangular spaceship
    xCorners = new int[] { -8, 16, -8 };
    yCorners = new int[] { -8, 0, 8 };
    myColor = color(255, 0, 0); // Red spaceship
    myCenterX = width / 2.0;
    myCenterY = height / 2.0;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }

  public void accelerate() {
    float radians = radians(myPointDirection);
    myXspeed += cos(radians) * 0.1;
    myYspeed += sin(radians) * 0.1;
  }

  public void hyperspace() {
    myCenterX = random(width);
    myCenterY = random(height);
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = random(360);
  }

  public void draw() {
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

  public void setXSpeed(float x) {
    myXspeed = x;
  }

  public void setYSpeed(float y) {
    myYspeed = y;
  }

  public void setPointDirection(float degrees) {
    myPointDirection = degrees;
  }
}
