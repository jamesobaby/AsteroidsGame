import java.awt.Color;

public class Bullet extends Floater {
    // Constructor initializes the Bullet based on the spaceship's state
    public Bullet(Spaceship theShip) {
        // Use Spaceship's current position, direction, and speed
        myCenterX = theShip.getCenterX();
        myCenterY = theShip.getCenterY();
        myPointDirection = theShip.getPointDirection();
        myXspeed = theShip.getXspeed();
        myYspeed = theShip.getYspeed();

        // Give the bullet a "push" in the direction it's facing
        accelerate(6.0);
    }

    // Override the show method to draw a bullet as a circle
    @Override
    public void draw(Graphics g) {
        g.setColor(Color.RED); // Bullet color
        g.fillOval((int) myCenterX - 2, (int) myCenterY - 2, 4, 4); // Bullet size
    }
}
