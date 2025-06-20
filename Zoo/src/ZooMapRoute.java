import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.swing.Timer;
import java.io.*;
import java.util.*;

public class ZooMapRoute extends JPanel implements ActionListener {

    private int panelWidth = 800;
    private int panelHeight = 600;
    private int rows = 0, cols = 0;
    private final Timer timer = new Timer(100, this);
    private final Random random = new Random();

    private int selectedRow = -1;
    private int selectedCol = -1;

    private final Map<Point, Zona> zonasPorCelda = new HashMap<>();
    private final Map<String, Point> celdaPorNombre = new HashMap<>();
    private final Map<Point, ArrayList<Animal>> animalesPorZona = new HashMap<>();

    private AnimalPopup animalPopup = null;

    public ZooMapRoute() {
        setPreferredSize(new Dimension(panelWidth, panelHeight));
        cargarZonas("C:\\Users\\PC\\IdeaProjects\\Zoo\\src\\zonas2.csv");
        cargarAnimales("");

        timer.start();

        addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int cellW = getWidth() / cols;
                int cellH = getHeight() / rows;
                int col = e.getX() / cellW;
                int row = e.getY() / cellH;

                if (selectedRow == row && selectedCol == col) {
                    selectedRow = -1;
                    selectedCol = -1;
                    cerrarAnimalPopup();
                } else {
                    selectedRow = row;
                    selectedCol = col;
                }

                repaint();
            }
        });

        addMouseMotionListener(new MouseMotionAdapter() {
            @Override
            public void mouseMoved(MouseEvent e) {
                if (selectedRow == -1) {

                    cerrarAnimalPopup();
                    return;
                }

                Point celda = new Point(selectedRow, selectedCol);
                ArrayList<Animal> lista = animalesPorZona.get(celda);
                if (lista == null || lista.isEmpty()) {
                    cerrarAnimalPopup();
                    return;
                }

                int mx = e.getX();
                int my = e.getY();

                Animal animalEncontrado = null;
                for (Animal a : lista) {
                    Rectangle rect;
                    if (a.imagen != null) {
                        rect = new Rectangle(a.x * 2, a.y * 2, 180, 120);
                    } else {
                        rect = new Rectangle(a.x * 2, a.y * 2, 40, 40);
                    }
                    if (rect.contains(mx, my)) {
                        animalEncontrado = a;
                        break;
                    }
                }

                if (animalEncontrado != null) {
                    if (animalPopup == null || !animalPopup.getAnimal().equals(animalEncontrado)) {
                        abrirAnimalPopup(animalEncontrado, e.getLocationOnScreen());
                    }
                } else {
                    cerrarAnimalPopup();
                }
            }
        });
    }

    private void abrirAnimalPopup(Animal a, Point screenLocation) {
        cerrarAnimalPopup();
        animalPopup = new AnimalPopup(a);
        animalPopup.setLocation(screenLocation.x + 15, screenLocation.y + 15);
        animalPopup.setVisible(true);
    }

    private void cerrarAnimalPopup() {
        if (animalPopup != null) {
            animalPopup.dispose();
            animalPopup = null;
        }
    }

    private void cargarZonas(String archivo) {
        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            boolean primera = true;
            while ((linea = br.readLine()) != null) {
                if (primera) {
                    primera = false;
                    continue;
                }
                String[] partes = linea.split(",");
                if (partes.length != 4) continue;

                String nombre = partes[0].trim();
                int fila = Integer.parseInt(partes[1].trim());
                int columna = Integer.parseInt(partes[2].trim());
                String imagen = partes[3].trim();

                BufferedImage fondo = cargarImagen("C:\\Users\\PC\\IdeaProjects\\Zoo\\src\\imageszonas2\\" + imagen);

                Point celda = new Point(fila, columna);
                Zona zona = new Zona(nombre, fila, columna, fondo);
                zonasPorCelda.put(celda, zona);
                celdaPorNombre.put(nombre, celda);
                animalesPorZona.put(celda, new ArrayList<>());

                rows = Math.max(rows, fila + 1);
                cols = Math.max(cols, columna + 1);
            }
        } catch (IOException e) {
            JOptionPane.showMessageDialog(this, "Error al leer zonas.csv: " + e.getMessage());
        }
    }

    private void cargarAnimales(String archivo) {
        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            boolean primera = true;
            while ((linea = br.readLine()) != null) {
                if (primera) {
                    primera = false;
                    continue;
                }
                String[] partes = linea.split(",");
                if (partes.length != 3) continue;

                String apodo = partes[0].trim();
                String imgPath = partes[1].trim();
                String zona = partes[2].trim();

                Point celda = celdaPorNombre.get(zona);
                if (celda == null) continue;

                BufferedImage img = cargarImagen("C:\\Users\\PC\\IdeaProjects\\Zoo\\src\\images\\" + imgPath);
                int x = random.nextInt(panelWidth / cols - 50);
                int y = random.nextInt(panelHeight / rows - 50);
                Animal a = new Animal(x, y, img, apodo, zona);
                animalesPorZona.get(celda).add(a);
            }
        } catch (IOException e) {
        }
    }

    private BufferedImage cargarImagen(String ruta) {
        try {
            return ImageIO.read(new File(ruta));
        } catch (IOException e) {
            System.err.println("No se pudo cargar imagen: " + ruta);
            return null;
        }
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D) g;

        int cellW = getWidth() / cols;
        int cellH = getHeight() / rows;

        if (selectedRow == -1) {
            for (Map.Entry<Point, Zona> entry : zonasPorCelda.entrySet()) {
                Point p = entry.getKey();
                Zona z = entry.getValue();

                int x = p.y * cellW;
                int y = p.x * cellH;

                if (z.fondo != null) {
                    g2.drawImage(z.fondo, x, y, cellW, cellH, null);
                } else {
                    g2.setColor(new Color(180, 220, 180));
                    g2.fillRect(x, y, cellW, cellH);
                }

                g2.setColor(Color.DARK_GRAY);
                g2.drawRect(x, y, cellW, cellH);
                g2.drawString(z.nombre, x + 10, y + 20);

                dibujarAnimales(g2, p, x, y);
            }
        } else {
            Point p = new Point(selectedRow, selectedCol);
            Zona z = zonasPorCelda.get(p);

            if (z != null && z.fondo != null) {
                g2.drawImage(z.fondo, 0, 0, getWidth(), getHeight(), null);
            } else {
                g2.setColor(new Color(180, 220, 180));
                g2.fillRect(0, 0, getWidth(), getHeight());
            }

            g2.setColor(Color.BLACK);
            g2.setFont(new Font("Arial", Font.BOLD, 24));
            g2.drawString("Zona: " + (z != null ? z.nombre : ""), 30, 40);

            dibujarAnimalesZoom(g2, p);
        }
    }

    private void dibujarAnimales(Graphics2D g2, Point p, int x0, int y0) {
        ArrayList<Animal> lista = animalesPorZona.get(p);
        for (Animal a : lista) {
            if (a.imagen != null) {
                g2.drawImage(a.imagen, x0 + a.x, y0 + a.y, 70, 45, null);
            } else {
                g2.setColor(Color.RED);
                g2.fillOval(x0 + a.x, y0 + a.y, 20, 20);
            }
        }
    }

    private void dibujarAnimalesZoom(Graphics2D g2, Point p) {
        ArrayList<Animal> lista = animalesPorZona.get(p);
        for (Animal a : lista) {
            if (a.imagen != null) {
                g2.drawImage(a.imagen, a.x * 2, a.y * 2, 180, 120, null);
                g2.setColor(Color.BLACK);
            } else {
                g2.setColor(Color.RED);
                g2.fillOval(a.x * 2, a.y * 2, 40, 40);
                g2.setColor(Color.BLACK);
            }
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        for (ArrayList<Animal> lista : animalesPorZona.values()) {
            for (Animal a : lista) {
                a.x += random.nextInt(7) - 3;
                a.y += random.nextInt(7) - 3;
                a.x = Math.max(0, Math.min(a.x, panelWidth / cols - 40));
                a.y = Math.max(0, Math.min(a.y, panelHeight / rows - 40));
            }
        }
        repaint();
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("Zoológico desde CSVs");
            frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
            ZooMapRoute panel = new ZooMapRoute();
            frame.setContentPane(panel);
            frame.pack();
            frame.setLocationRelativeTo(null);

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

            frame.setVisible(true);
        });
    }

    static class Zona {
        String nombre;
        int fila, columna;
        BufferedImage fondo;

        Zona(String nombre, int fila, int columna, BufferedImage fondo) {
            this.nombre = nombre;
            this.fila = fila;
            this.columna = columna;
            this.fondo = fondo;
        }
    }

    static class Animal {
        int x, y;
        BufferedImage imagen;
        String apodo;
        String zona;

        Animal(int x, int y, BufferedImage imagen, String apodo, String zona) {
            this.x = x;
            this.y = y;
            this.imagen = imagen;
            this.apodo = apodo;
            this.zona = zona;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof Animal)) return false;
            Animal animal = (Animal) o;
            return Objects.equals(apodo, animal.apodo) && Objects.equals(zona, animal.zona);
        }

        @Override
        public int hashCode() {
            return Objects.hash(apodo, zona);
        }
    }

    static class AnimalPopup extends JDialog {
        private final Animal animal;

        public AnimalPopup(Animal animal) {
            super((Frame) null, false);
            this.animal = animal;

            setUndecorated(true);
            setSize(300, 180);
            setLayout(new BorderLayout());
            getContentPane().setBackground(new Color(30, 30, 30));

            JLabel lblApodo = new JLabel(animal.apodo, SwingConstants.CENTER);
            lblApodo.setFont(new Font("Monospaced", Font.BOLD, 24));
            lblApodo.setForeground(new Color(255, 215, 0));
            add(lblApodo, BorderLayout.NORTH);

            JPanel panelCenter = new JPanel(new BorderLayout());
            panelCenter.setBackground(new Color(50, 50, 50));

            if (animal.imagen != null) {
                JLabel imgLabel = new JLabel(new ImageIcon(animal.imagen.getScaledInstance(150, 100, Image.SCALE_SMOOTH)));
                imgLabel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
                panelCenter.add(imgLabel, BorderLayout.CENTER);
            }

            JLabel lblZona = new JLabel("Zona: " + animal.zona, SwingConstants.CENTER);
            lblZona.setForeground(Color.WHITE);
            panelCenter.add(lblZona, BorderLayout.SOUTH);

            add(panelCenter, BorderLayout.CENTER);
        }

        public Animal getAnimal() {
            return animal;
        }
    }
}
