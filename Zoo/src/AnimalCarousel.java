
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;
import java.util.List;

public class AnimalCarousel extends JFrame {

    private final ArrayList<Animal> animales;
    private int indiceActual;

    private ImagePanel imagePanel;
    private JLabel labelApodo;
    private JLabel labelZona;
    private JLabel labelPosicion;
    private JButton btnPrev, btnNext;
    private JPanel infoPanel;

    private final Map<String, Point> celdaPorNombre = new HashMap<>();
    private final Map<Point, String> nombrePorCelda = new HashMap<>();
    private int rows = 0, cols = 0;

    private static final Font FONT_PIXEL_BIG = new Font("Monospaced", Font.BOLD, 30);
    private static final Font FONT_PIXEL_MED = new Font("Monospaced", Font.BOLD, 20);
    private static final Font FONT_PIXEL_SMALL = new Font("Monospaced", Font.PLAIN, 16);

    public AnimalCarousel() {
        this.animales = new ArrayList<>();
        cargarZonas("C:\\Users\\PC\\IdeaProjects\\Zoo\\src\\zonas.csv");
        cargarAnimales("C:\\Users\\PC\\IdeaProjects\\Zoo\\src\\animales.csv");
        this.indiceActual = 0;

        inicializarUI();

        if (!animales.isEmpty()) {
            mostrarAnimal(0);
        } else {
            labelApodo.setText("No hay animales cargados");
        }
    }

    private void inicializarUI() {
        setUndecorated(true);
        setSize(720, 500);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout());
        getContentPane().setBackground(new Color(30, 30, 30));


        JPanel topBar = new JPanel(null);
        topBar.setBackground(new Color(40, 40, 40));
        topBar.setPreferredSize(new Dimension(720, 40));

        JButton btnCerrarX = new JButton("X");
        btnCerrarX.setFont(FONT_PIXEL_MED);
        btnCerrarX.setForeground(Color.WHITE);
        btnCerrarX.setBackground(Color.RED);
        btnCerrarX.setFocusPainted(false);
        btnCerrarX.setBorder(BorderFactory.createLineBorder(Color.BLACK, 2));
        btnCerrarX.setBounds(680, 5, 30, 30);
        btnCerrarX.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnCerrarX.addActionListener(e -> cerrarPokedex());
        topBar.add(btnCerrarX);

        add(topBar, BorderLayout.NORTH);

        imagePanel = new ImagePanel();
        imagePanel.setPreferredSize(new Dimension(300, 250));
        add(imagePanel, BorderLayout.WEST);

        infoPanel = new JPanel(null) {
            @Override
            protected void paintComponent(Graphics g) {
                g.setColor(new Color(60, 60, 60));
                g.fillRect(0, 0, getWidth(), getHeight());
                g.setColor(Color.BLACK);
                for (int i = 0; i < 4; i++) {
                    g.drawRect(i, i, getWidth() - 1 - 2*i, getHeight() - 1 - 2*i);
                }
            }
        };
        infoPanel.setPreferredSize(new Dimension(400, 250));
        add(infoPanel, BorderLayout.CENTER);

        labelApodo = new JLabel("", SwingConstants.LEFT);
        labelApodo.setFont(FONT_PIXEL_BIG);
        labelApodo.setForeground(new Color(255, 200, 50));
        labelApodo.setBounds(20, 10, 360, 40);
        infoPanel.add(labelApodo);

        labelZona = new JLabel("", SwingConstants.LEFT);
        labelZona.setFont(FONT_PIXEL_MED);
        labelZona.setForeground(new Color(180, 180, 180));
        labelZona.setBounds(20, 60, 360, 30);
        infoPanel.add(labelZona);

        labelPosicion = new JLabel("", SwingConstants.LEFT);
        labelPosicion.setFont(FONT_PIXEL_MED);
        labelPosicion.setForeground(new Color(180, 180, 180));
        labelPosicion.setBounds(20, 100, 360, 30);
        infoPanel.add(labelPosicion);

        btnPrev = crearBotonPixel("<<");
        btnPrev.setBounds(20, 190, 100, 40);
        btnPrev.addActionListener(e -> mostrarAnimalAnterior());
        infoPanel.add(btnPrev);

        btnNext = crearBotonPixel(">>");
        btnNext.setBounds(140, 190, 100, 40);
        btnNext.addActionListener(e -> mostrarAnimalSiguiente());
        infoPanel.add(btnNext);

        getRootPane().registerKeyboardAction(e -> cerrarPokedex(),
                KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0),
                JComponent.WHEN_IN_FOCUSED_WINDOW);
    }

    private JButton crearBotonPixel(String texto) {
        JButton btn = new JButton(texto);
        btn.setFont(FONT_PIXEL_MED);
        btn.setForeground(Color.WHITE);
        btn.setBackground(new Color(50, 50, 50));
        btn.setFocusPainted(false);
        btn.setBorder(BorderFactory.createLineBorder(Color.BLACK, 4));
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btn.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseEntered(MouseEvent e) {
                btn.setBackground(new Color(80, 80, 80));
            }
            @Override
            public void mouseExited(MouseEvent e) {
                btn.setBackground(new Color(50, 50, 50));
            }
        });
        return btn;
    }

    private void mostrarAnimal(int index) {
        if (index < 0 || index >= animales.size()) return;
        indiceActual = index;

        Animal animal = animales.get(index);
        labelApodo.setText(animal.apodo);

        String nombreZona = "Desconocida";
        Point p = new Point(animal.fila, animal.columna);
        if (nombrePorCelda.containsKey(p)) {
            nombreZona = nombrePorCelda.get(p);
        }
        labelZona.setText("Zona: " + nombreZona);
        labelPosicion.setText("Posición (x, y): " + animal.x + ", " + animal.y);

        imagePanel.setImage(animal.imagen);
    }

    private void mostrarAnimalAnterior() {
        int nuevoIndice = (indiceActual - 1 + animales.size()) % animales.size();
        mostrarAnimal(nuevoIndice);
    }

    private void mostrarAnimalSiguiente() {
        int nuevoIndice = (indiceActual + 1) % animales.size();
        mostrarAnimal(nuevoIndice);
    }

    private void cerrarPokedex() {
        dispose();
        try {
            Thread.sleep(200);
        } catch (InterruptedException ignored) {}
        SwingUtilities.invokeLater(() -> {
            JFrame menu = new JFrame();
            menu.setUndecorated(true);
            menu.setContentPane(new ZooMapiMenu());
            menu.pack();
            menu.setLocationRelativeTo(null);
            menu.setVisible(true);
        });
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

                Point celda = new Point(fila, columna);
                celdaPorNombre.put(nombre, celda);
                nombrePorCelda.put(celda, nombre);

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
            Random random = new Random();
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
                int x = random.nextInt(200);
                int y = random.nextInt(100);

                Animal a = new Animal(x, y, img, apodo, celda.x, celda.y);
                animales.add(a);
            }
        } catch (IOException e) {
            JOptionPane.showMessageDialog(this, "Error al leer animales.csv: " + e.getMessage());
        }
    }

    private BufferedImage cargarImagen(String ruta) {
        try {
            return javax.imageio.ImageIO.read(new File(ruta));
        } catch (IOException e) {
            System.err.println("No se pudo cargar imagen: " + ruta);
            return null;
        }
    }

    private static class ImagePanel extends JPanel {
        private Image image;

        public void setImage(Image img) {
            this.image = img;
            repaint();
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            if (image == null) return;

            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

            int w = getWidth();
            int h = getHeight();

            g2.setColor(new Color(85, 130, 60));
            g2.fillRect(0, 0, w, h);

            int iw = image.getWidth(this);
            int ih = image.getHeight(this);
            float aspect = (float) iw / ih;

            int drawW = w - 40;
            int drawH = (int) (drawW / aspect);

            if (drawH > h - 40) {
                drawH = h - 40;
                drawW = (int) (drawH * aspect);
            }

            int x = (w - drawW) / 2;
            int y = (h - drawH) / 2;

            g2.drawImage(image, x, y, drawW, drawH, this);
            g2.setColor(Color.BLACK);
            for (int i = 0; i < 3; i++) {
                g2.drawRect(x - 2 + i, y - 2 + i, drawW + 3 - 2 * i, drawH + 3 - 2 * i);
            }
            g2.dispose();
        }

        @Override
        public Dimension getPreferredSize() {
            return new Dimension(300, 250);
        }
    }

    static class Animal {
        int x, y;
        BufferedImage imagen;
        String apodo;
        int fila, columna;

        Animal(int x, int y, BufferedImage imagen, String apodo, int fila, int columna) {
            this.x = x;
            this.y = y;
            this.imagen = imagen;
            this.apodo = apodo;
            this.fila = fila;
            this.columna = columna;
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            AnimalCarousel ventana = new AnimalCarousel();
            ventana.setVisible(true);
        });
    }
}
