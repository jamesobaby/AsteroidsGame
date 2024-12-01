abstract class Floater {
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

  public void move() {
    myCenterX += myXspeed;
    myCenterY += myYspeed;

    // Wrap around screen edges
    if (myCenterX < 0) myCenterX += width;
    if (myCenterX > width) myCenterX -= width;
    if (myCenterY < 0) myCenterY += height;
    if (myCenterY > height) myCenterY -= height;
  }

  public void turn(float degrees) {
    myPointDirection += degrees;
  }

  abstract void setXSpeed(float x);

  abstract void setYSpeed(float y);

  abstract void setPointDirection(float degrees);

  abstract void draw();
}
