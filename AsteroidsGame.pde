import java.awt.event.KeyEvent;
import java.util.ArrayList;

public class AsteroidsGame extends JPanel implements KeyListener {
    private Spaceship spaceship;
    private ArrayList<Bullet> bullets; // List to store bullets

    public AsteroidsGame() {
        setBackground(Color.BLACK);
        spaceship = new Spaceship(300, 300, 0); // Initialize the spaceship
        bullets = new ArrayList<>(); // Initialize the bullet list

        setFocusable(true);
        addKeyListener(this);
        Timer timer = new Timer(20, e -> updateGame());
        timer.start();
    }

    private void updateGame() {
        spaceship.move();

        // Update bullets
        for (int i = 0; i < bullets.size(); i++) {
            Bullet b = bullets.get(i);
            b.move();
            if (b.offScreen(getWidth(), getHeight())) {
                bullets.remove(i); // Remove bullet if off-screen
                i--;
            }
        }

        repaint();
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        spaceship.draw(g);

        // Draw bullets
        for (Bullet b : bullets) {
            b.draw(g);
        }
    }

    @Override
    public void keyPressed(KeyEvent e) {
        int key = e.getKeyCode();
        if (key == KeyEvent.VK_LEFT) spaceship.rotate(-0.1);
        if (key == KeyEvent.VK_RIGHT) spaceship.rotate(0.1);
        if (key == KeyEvent.VK_UP) spaceship.thrust(0.5);
        if (key == KeyEvent.VK_SPACE) bullets.add(new Bullet(spaceship)); // Shoot bullet
    }

    @Override
    public void keyReleased(KeyEvent e) {}

    @Override
    public void keyTyped(KeyEvent e) {}

    public static void main(String[] args) {
        JFrame frame = new JFrame("Asteroids Game");
        AsteroidsGame game = new AsteroidsGame();
        frame.add(game);
        frame.setSize(600, 600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
