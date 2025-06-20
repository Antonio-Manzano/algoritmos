import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;
import java.util.List;

public class ZooMapiMenu extends JPanel {

    private final List<ButtonRect> buttons = new ArrayList<>();
    private final Font titleFont = getSystemFont("Minecraftia", Font.BOLD, 64);
    private final Font buttonFont = getSystemFont("Minecraftia", Font.PLAIN, 24);
    private final ImageIcon fondoGif = new ImageIcon("C:\\Users\\PC\\IdeaProjects\\Zoo\\src\\imageszonas\\fondo.gif");

    public ZooMapiMenu() {
        setPreferredSize(new Dimension(900, 600));

        buttons.add(new ButtonRect("CÁMARAS", 350, 240, 200, 50));
        buttons.add(new ButtonRect("MAPA", 350, 310, 200, 50));
        buttons.add(new ButtonRect("GALERÍA", 350, 380, 200, 50));
        buttons.add(new ButtonRect("AÑADIR", 350, 450, 200, 50));
        buttons.add(new ButtonRect("SALIR", 350, 520, 200, 50));

        addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                for (ButtonRect button : buttons) {
                    if (button.contains(e.getPoint())) {
                        System.out.println("Botón presionado: " + button.label);
                        switch (button.label) {
                            case "CÁMARAS":
                                abrirZooMapFromCSV();
                                break;
                            case "MAPA":
                                abrirMapa();
                                break;
                            case "GALERÍA":
                                abrirGaleria();
                                break;
                            case "AÑADIR":
                                abrirAñadir();
                                break;
                            case "SALIR":
                                System.exit(0);
                                break;
                        }
                    }
                }
            }
        });

        new Timer(40, e -> repaint()).start();
    }

    private void abrirGaleria() {
        Window ventanaActual = SwingUtilities.getWindowAncestor(this);
        if (ventanaActual != null) {
            ventanaActual.dispose();
        }

        AnimalCarousel pokedex = new AnimalCarousel();
        pokedex.setLocationRelativeTo(null);
        pokedex.setVisible(true);
    }

    private void abrirAñadir() {
        Window ventanaActual = SwingUtilities.getWindowAncestor(this);
        if (ventanaActual != null) {
            ventanaActual.dispose();
        }

        ZooDataManager manejo = new ZooDataManager();
        manejo.setLocationRelativeTo(null);
        manejo.setVisible(true);
        manejo.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosed(WindowEvent e) {

                SwingUtilities.invokeLater(() -> {
                    JFrame menu = new JFrame("ZooMapiMenu");
                    menu.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                    menu.setContentPane(new ZooMapiMenu());
                    menu.pack();
                    menu.setLocationRelativeTo(null);
                    menu.setVisible(true);
                });
            }
        });

    }

    private void abrirMapa() {

        Window ventanaMenu = SwingUtilities.getWindowAncestor(this);
        if (ventanaMenu != null) {
            ventanaMenu.dispose();
        }

        JFrame frame = new JFrame("Zoológico Mapa");
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        frame.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosed(WindowEvent e) {
                SwingUtilities.invokeLater(() -> {
                    JFrame menu = new JFrame("ZooMapiMenu");
                    menu.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                    menu.setContentPane(new ZooMapiMenu());
                    menu.pack();
                    menu.setLocationRelativeTo(null);
                    menu.setVisible(true);
                });
            }
        });

        frame.setContentPane(new ZooMapRoute());
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }



    private void abrirZooMapFromCSV() {

        Window ventanaMenu = SwingUtilities.getWindowAncestor(this);
        if (ventanaMenu != null) {
            ventanaMenu.dispose();
        }

        JFrame frame = new JFrame("Zoológico desde CSVs");
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        frame.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosed(WindowEvent e) {
                SwingUtilities.invokeLater(() -> {
                    JFrame menu = new JFrame("ZooMapiMenu");
                    menu.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                    menu.setContentPane(new ZooMapiMenu());
                    menu.pack();
                    menu.setLocationRelativeTo(null);
                    menu.setVisible(true);
                });
            }
        });

        frame.setContentPane(new ZooMapFromCSV());
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }


    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D) g;

        g2.drawImage(fondoGif.getImage(), 0, 0, getWidth(), getHeight(), this);

        Color overlay = new Color(0, 0, 0, 100);
        g2.setColor(overlay);
        g2.fillRect(0, 0, getWidth(), getHeight());

        g2.setFont(titleFont);
        int titleX = centerX(g2, "ZOOMAPI", titleFont);
        g2.setColor(Color.BLACK);
        g2.drawString("ZOOMAPI", titleX + 3, 140 + 3);
        g2.setColor(Color.WHITE);
        g2.drawString("ZOOMAPI", titleX, 140);

        for (ButtonRect b : buttons) {
            b.draw(g2, buttonFont);
        }
    }

    private int centerX(Graphics2D g2, String text, Font font) {
        FontMetrics fm = g2.getFontMetrics(font);
        return (getWidth() - fm.stringWidth(text)) / 2;
    }

    private static class ButtonRect {
        String label;
        Rectangle rect;

        public ButtonRect(String label, int x, int y, int w, int h) {
            this.label = label;
            this.rect = new Rectangle(x, y, w, h);
        }

        public void draw(Graphics2D g2, Font font) {
            Color borderColor = Color.BLACK;
            Color baseColor = new Color(160, 160, 160);
            Color highlightTop = new Color(192, 192, 192);
            Color shadowBottom = new Color(80, 80, 80);

            g2.setColor(baseColor);
            g2.fill(rect);
            g2.setColor(highlightTop);
            g2.drawLine(rect.x + 1, rect.y + 1, rect.x + rect.width - 2, rect.y + 1);
            g2.drawLine(rect.x + 1, rect.y + 1, rect.x + 1, rect.y + rect.height - 2);

            g2.setColor(shadowBottom);
            g2.drawLine(rect.x + 1, rect.y + rect.height - 2, rect.x + rect.width - 2, rect.y + rect.height - 2);
            g2.drawLine(rect.x + rect.width - 2, rect.y + 1, rect.x + rect.width - 2, rect.y + rect.height - 2);

            g2.setColor(borderColor);
            g2.setStroke(new BasicStroke(2));
            g2.draw(rect);

            g2.setFont(font);
            FontMetrics fm = g2.getFontMetrics();
            int textWidth = fm.stringWidth(label);
            int textHeight = fm.getAscent();
            int tx = rect.x + (rect.width - textWidth) / 2;
            int ty = rect.y + (rect.height + textHeight) / 2;

            g2.setColor(Color.BLACK);
            g2.drawString(label, tx + 2, ty + 2);
            g2.setColor(Color.WHITE);
            g2.drawString(label, tx, ty);
        }

        public boolean contains(Point p) {
            return rect.contains(p);
        }
    }

    private Font getSystemFont(String name, int style, float size) {
        GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
        for (String fontName : ge.getAvailableFontFamilyNames()) {
            if (fontName.equalsIgnoreCase(name)) {
                return new Font(fontName, style, (int) size);
            }
        }
        System.out.println("⚠️ Fuente '" + name + "' no encontrada, usando por defecto.");
        return new Font("Monospaced", style, (int) size);
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("ZooMapiMenu");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setContentPane(new ZooMapiMenu());
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}
