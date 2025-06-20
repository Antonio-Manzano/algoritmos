import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.util.*;
import javax.swing.border.*;
import java.util.List;
import java.util.stream.Collectors;

public class ZooDataManager extends JFrame {
    private JComboBox<String> operationCombo;
    private JPanel formPanel, rightPanel;
    private CardLayout cardLayout;
    private JTextField nombreField, filaField, columnaField, imagenField, apodoField, animalImgField;
    private JComboBox<String> zonaCombo;
    private JButton submitButton;
    private JLabel statusLabel;

    private JComboBox<String> rightZonaCombo;
    private JTextField animalNameField, animalImageField;
    private JButton addAnimalButton;

    private static final String ZONAS_CSV = "C:\\Users\\PC\\IdeaProjects\\Zoo\\src\\zonas.csv";
    private static final String ANIMALES_CSV = "C:\\Users\\PC\\IdeaProjects\\Zoo\\src\\animales.csv";
    public ZooDataManager() {
        setTitle("Zoo Manager");
        setSize(900, 500);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);
        getContentPane().setBackground(new Color(135, 179, 116));

        JSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT);
        splitPane.setDividerLocation(500);
        splitPane.setBorder(new EmptyBorder(10, 10, 10, 10));

        JPanel leftPanel = new JPanel(new BorderLayout());
        leftPanel.setBorder(new CompoundBorder(
                new LineBorder(new Color(74, 52, 42)),
                new EmptyBorder(10, 10, 10, 10)
        ));
        leftPanel.setBackground(new Color(135, 179, 116));
        leftPanel.setOpaque(true);

        rightPanel = new JPanel(new BorderLayout());
        rightPanel.setBorder(new CompoundBorder(
                new LineBorder(new Color(74, 52, 42)),
                new EmptyBorder(10, 10, 10, 10)
        ));
        rightPanel.setBackground(new Color(135, 179, 116));
        rightPanel.setOpaque(true);
        createRightPanel();

        JLabel titleLabel = new JLabel("ZOO DATA", SwingConstants.CENTER);
        titleLabel.setFont(new Font("Minecraftia", Font.BOLD, 24));
        titleLabel.setForeground(new Color(48, 48, 48));
        titleLabel.setBorder(new EmptyBorder(0, 0, 15, 0));
        leftPanel.add(titleLabel, BorderLayout.NORTH);

        JPanel topPanel = new JPanel();
        topPanel.setOpaque(false);
        topPanel.add(new JLabel("Select Operation: "));
        operationCombo = new JComboBox<>(new String[]{"Add Zone", "Delete Zone", "Add Animal", "Delete Animal"});
        operationCombo.setFont(new Font("Minecraftia", Font.PLAIN, 14));
        operationCombo.addActionListener(this::operationChanged);
        topPanel.add(operationCombo);
        leftPanel.add(topPanel, BorderLayout.CENTER);

        cardLayout = new CardLayout();
        formPanel = new JPanel(cardLayout);
        formPanel.setOpaque(false);

        createAddZoneForm();
        createDeleteZoneForm();
        createAddAnimalForm();
        createDeleteAnimalForm();

        leftPanel.add(formPanel, BorderLayout.CENTER);

        statusLabel = new JLabel(" ", SwingConstants.CENTER);
        statusLabel.setFont(new Font("Minecraftia", Font.PLAIN, 14));
        statusLabel.setForeground(new Color(48, 48, 48));
        leftPanel.add(statusLabel, BorderLayout.SOUTH);

        splitPane.setLeftComponent(leftPanel);
        splitPane.setRightComponent(rightPanel);
        add(splitPane);
    }

    private void createRightPanel() {
        JLabel rightTitle = new JLabel("AÑADIR ANIMAL A ZONA", SwingConstants.CENTER);
        rightTitle.setFont(new Font("Minecraftia", Font.BOLD, 20));
        rightTitle.setForeground(new Color(48, 48, 48));
        rightTitle.setBorder(new EmptyBorder(0, 0, 15, 0));
        rightPanel.add(rightTitle, BorderLayout.NORTH);

        JPanel form = new JPanel(new GridLayout(5, 1, 5, 5));
        form.setOpaque(false);
        form.setBorder(new EmptyBorder(20, 20, 20, 20));

        JPanel zonePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        zonePanel.setOpaque(false);
        zonePanel.add(createMinecraftLabel("Seleccionar Zona:"));
        rightZonaCombo = new JComboBox<>();
        rightZonaCombo.setFont(new Font("Minecraftia", Font.PLAIN, 14));
        updateZoneCombo(rightZonaCombo);
        zonePanel.add(rightZonaCombo);
        form.add(zonePanel);

        JPanel namePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        namePanel.setOpaque(false);
        namePanel.add(createMinecraftLabel("Nombre de Animal:"));
        animalNameField = createMinecraftTextField();
        namePanel.add(animalNameField);
        form.add(namePanel);

        JPanel imagePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        imagePanel.setOpaque(false);
        imagePanel.add(createMinecraftLabel("Nombre de Imagen:"));
        animalImageField = createMinecraftTextField();
        imagePanel.add(animalImageField);
        form.add(imagePanel);

        addAnimalButton = createMinecraftButton("Añadir animal a la Zona");
        addAnimalButton.addActionListener(e -> addAnimalToZone());
        form.add(addAnimalButton);

        rightPanel.add(form, BorderLayout.CENTER);
    }

    private void addAnimalToZone() {
        String zoneName = (String) rightZonaCombo.getSelectedItem();
        String animalName = animalNameField.getText().trim();
        String imageFile = animalImageField.getText().trim();

        if (zoneName == null || zoneName.isEmpty()) {
            statusLabel.setText("Please select a zone");
            return;
        }

        if (animalName.isEmpty() || imageFile.isEmpty()) {
            statusLabel.setText("Animal name and image are required");
            return;
        }

        try {
            if (getAnimalsInZone(zoneName).contains(animalName)) {
                statusLabel.setText("Animal already exists in this zone");
                return;
            }

            try (FileWriter fw = new FileWriter(ANIMALES_CSV, true)) {
                fw.append("\n" + animalName + "," + imageFile + "," + zoneName);
            }

            statusLabel.setText("¡Se añadió al animal de forma correcta!");
            animalNameField.setText("");
            animalImageField.setText("");
        } catch (Exception e) {
            statusLabel.setText("Error: " + e.getMessage());
        }
    }

    private void operationChanged(ActionEvent e) {
        switch (operationCombo.getSelectedIndex()) {
            case 0:
                cardLayout.show(formPanel, "addZone");
                break;
            case 1:
                updateZoneCombo();
                cardLayout.show(formPanel, "deleteZone");
                break;
            case 2:
                updateZoneCombo();
                cardLayout.show(formPanel, "addAnimal");
                break;
            case 3:
                updateZoneCombo();
                cardLayout.show(formPanel, "deleteAnimal");
                break;
        }
    }

    private JPanel createMinecraftPanel() {
        JPanel panel = new JPanel();
        panel.setOpaque(false);
        panel.setBorder(new CompoundBorder(
                new LineBorder(new Color(74, 52, 42), 2),
                new EmptyBorder(10, 10, 10, 10)
        ));
        return panel;
    }

    private JLabel createMinecraftLabel(String text) {
        JLabel label = new JLabel(text);
        label.setFont(new Font("Minecraftia", Font.PLAIN, 14));
        label.setForeground(new Color(48, 48, 48));
        return label;
    }

    private JTextField createMinecraftTextField() {
        JTextField field = new JTextField(15);
        field.setFont(new Font("Minecraftia", Font.PLAIN, 14));
        field.setBackground(new Color(240, 240, 240));
        field.setBorder(new CompoundBorder(
                new LineBorder(new Color(74, 52, 42)),
                new EmptyBorder(2, 5, 2, 5)
        ));
        return field;
    }

    private JButton createMinecraftButton(String text) {
        JButton button = new JButton(text);
        button.setFont(new Font("Minecraftia", Font.PLAIN, 14));
        button.setBackground(new Color(155, 118, 83));
        button.setForeground(Color.WHITE);
        button.setFocusPainted(false);
        button.setBorder(new CompoundBorder(
                new LineBorder(new Color(74, 52, 42)),
                new EmptyBorder(5, 15, 5, 15)
        ));
        return button;
    }

    private void createAddZoneForm() {
        JPanel panel = createMinecraftPanel();
        panel.setLayout(new GridLayout(5, 2, 5, 5));

        panel.add(createMinecraftLabel("Nombre Zona:"));
        nombreField = createMinecraftTextField();
        panel.add(nombreField);

        panel.add(createMinecraftLabel("Fila"));
        filaField = createMinecraftTextField();
        panel.add(filaField);

        panel.add(createMinecraftLabel("Columna:"));
        columnaField = createMinecraftTextField();
        panel.add(columnaField);

        panel.add(createMinecraftLabel("Nombre de Fondo:"));
        imagenField = createMinecraftTextField();
        panel.add(imagenField);

        submitButton = createMinecraftButton("Añadir Zona");
        submitButton.addActionListener(e -> addZone());
        panel.add(submitButton);

        formPanel.add(panel, "Añadir Zona");
    }

    private void createDeleteZoneForm() {
        JPanel panel = createMinecraftPanel();
        panel.setLayout(new GridLayout(2, 1, 5, 5));

        panel.add(createMinecraftLabel("Select Zone to Delete:"));
        zonaCombo = new JComboBox<>();
        zonaCombo.setFont(new Font("Minecraftia", Font.PLAIN, 14));
        panel.add(zonaCombo);

        submitButton = createMinecraftButton("Delete Zone");
        submitButton.addActionListener(e -> deleteZone());
        panel.add(submitButton);

        formPanel.add(panel, "deleteZone");
    }

    private void createAddAnimalForm() {
        JPanel panel = createMinecraftPanel();
        panel.setLayout(new GridLayout(5, 2, 5, 5));

        panel.add(createMinecraftLabel("Animal Nickname:"));
        apodoField = createMinecraftTextField();
        panel.add(apodoField);

        panel.add(createMinecraftLabel("Image File:"));
        animalImgField = createMinecraftTextField();
        panel.add(animalImgField);

        panel.add(createMinecraftLabel("Zone:"));
        zonaCombo = new JComboBox<>();
        zonaCombo.setFont(new Font("Minecraftia", Font.PLAIN, 14));
        panel.add(zonaCombo);

        submitButton = createMinecraftButton("Add Animal");
        submitButton.addActionListener(e -> addAnimal());
        panel.add(submitButton);

        formPanel.add(panel, "addAnimal");
    }

    private void createDeleteAnimalForm() {
        JPanel panel = createMinecraftPanel();
        panel.setLayout(new GridLayout(3, 1, 5, 5));

        panel.add(createMinecraftLabel("Select Zone:"));
        JComboBox<String> zoneCombo = new JComboBox<>();
        zoneCombo.setFont(new Font("Minecraftia", Font.PLAIN, 14));
        panel.add(zoneCombo);

        panel.add(createMinecraftLabel("Select Animal:"));
        JComboBox<String> animalCombo = new JComboBox<>();
        animalCombo.setFont(new Font("Minecraftia", Font.PLAIN, 14));
        panel.add(animalCombo);

        zoneCombo.addActionListener(e -> {
            animalCombo.removeAllItems();
            String selectedZone = (String) zoneCombo.getSelectedItem();
            if (selectedZone != null) {
                for (String animal : getAnimalsInZone(selectedZone)) {
                    animalCombo.addItem(animal);
                }
            }
        });

        submitButton = createMinecraftButton("Delete Animal");
        submitButton.addActionListener(e -> deleteAnimal(
                (String) zoneCombo.getSelectedItem(),
                (String) animalCombo.getSelectedItem()
        ));
        panel.add(submitButton);

        formPanel.add(panel, "deleteAnimal");
    }

    private void updateZoneCombo() {
        updateZoneCombo(zonaCombo);
        updateZoneCombo(rightZonaCombo);
    }

    private void updateZoneCombo(JComboBox<String> combo) {
        if (combo != null) {
            combo.removeAllItems();
            for (String zone : getZoneNames()) {
                combo.addItem(zone);
            }
        }
    }

    private List<String> getZoneNames() {
        try (BufferedReader br = new BufferedReader(new FileReader(ZONAS_CSV))) {
            return br.lines()
                    .skip(1)
                    .map(line -> line.split(",")[0].trim())
                    .filter(name -> !name.isEmpty())
                    .collect(Collectors.toList());
        } catch (IOException e) {
            JOptionPane.showMessageDialog(this, "Error reading zones: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    private List<String> getAnimalsInZone(String zoneName) {
        try (BufferedReader br = new BufferedReader(new FileReader(ANIMALES_CSV))) {
            return br.lines()
                    .skip(1)
                    .filter(line -> line.split(",").length > 2)
                    .filter(line -> line.split(",")[2].trim().equals(zoneName))
                    .map(line -> line.split(",")[0].trim())
                    .filter(name -> !name.isEmpty())
                    .collect(Collectors.toList());
        } catch (IOException e) {
            JOptionPane.showMessageDialog(this, "Error reading animals: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    private void addZone() {
        try {
            String nombre = nombreField.getText().trim();
            int fila = Integer.parseInt(filaField.getText().trim());
            int columna = Integer.parseInt(columnaField.getText().trim());
            String imagen = imagenField.getText().trim();

            if (nombre.isEmpty() || imagen.isEmpty()) {
                statusLabel.setText("Todos los campos son requeridos");
                return;
            }

            if (getZoneNames().contains(nombre)) {
                statusLabel.setText("Esa zona ya existe");
                return;
            }

            try (FileWriter fw = new FileWriter(ZONAS_CSV, true)) {
                fw.append("\n" + nombre + "," + fila + "," + columna + "," + imagen);
            }

            statusLabel.setText("¡Se añadió la zona de forma correcta!");
            clearFields();
        } catch (Exception e) {
            statusLabel.setText("Error: " + e.getMessage());
        }
    }

    private void deleteZone() {
        String zoneName = (String) zonaCombo.getSelectedItem();
        if (zoneName == null) {
            statusLabel.setText("Ninguna zona seleccionada");
            return;
        }

        try {
            File inputFile = new File(ZONAS_CSV);
            File tempFile = new File(ZONAS_CSV + ".temp");

            try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
                 FileWriter writer = new FileWriter(tempFile)) {

                String line;
                boolean firstLine = true;
                while ((line = reader.readLine()) != null) {
                    if (firstLine) {
                        writer.write(line + "\n");
                        firstLine = false;
                        continue;
                    }
                    String[] parts = line.split(",");
                    if (parts.length > 0 && !parts[0].trim().equals(zoneName)) {
                        writer.write(line + "\n");
                    }
                }
            }

            if (!inputFile.delete()) {
                statusLabel.setText("No se pudo eliminar el archivo original");
                return;
            }
            if (!tempFile.renameTo(inputFile)) {
                statusLabel.setText("No se pudo renombrar el archivo temporal");
                return;
            }

            File animalInputFile = new File(ANIMALES_CSV);
            File animalTempFile = new File(ANIMALES_CSV + ".temp");

            try (BufferedReader reader = new BufferedReader(new FileReader(animalInputFile));
                 FileWriter writer = new FileWriter(animalTempFile)) {

                String line;
                boolean firstLine = true;
                while ((line = reader.readLine()) != null) {
                    if (firstLine) {
                        writer.write(line + "\n");
                        firstLine = false;
                        continue;
                    }
                    String[] parts = line.split(",");
                    if (parts.length < 3 || !parts[2].trim().equals(zoneName)) {
                        writer.write(line + "\n");
                    }
                }
            }

            if (!animalInputFile.delete()) {
                statusLabel.setText("No se pudo borrar el archivo original");
                return;
            }
            if (!animalTempFile.renameTo(animalInputFile)) {
                statusLabel.setText("No se pudo renombrar el archivo original");
                return;
            }

            statusLabel.setText("¡Zona y animales añadidos correctamente!");
            updateZoneCombo();
        } catch (Exception e) {
            statusLabel.setText("Error: " + e.getMessage());
        }
    }

    private void addAnimal() {
        try {
            String apodo = apodoField.getText().trim();
            String imgPath = animalImgField.getText().trim();
            String zona = (String) zonaCombo.getSelectedItem();

            if (apodo.isEmpty() || imgPath.isEmpty() || zona == null) {
                statusLabel.setText("Todos los campos son requeridos");
                return;
            }

            if (getAnimalsInZone(zona).contains(apodo)) {
                statusLabel.setText("Ese animal ya existe en esta zona");
                return;
            }

            try (FileWriter fw = new FileWriter(ANIMALES_CSV, true)) {
                fw.append("\n" + apodo + "," + imgPath + "," + zona);
            }

            statusLabel.setText("¡Animal añadido correctamente!");
            clearFields();
        } catch (Exception e) {
            statusLabel.setText("Error: " + e.getMessage());
        }
    }

    private void deleteAnimal(String zoneName, String animalName) {
        if (animalName == null) {
            statusLabel.setText("Ningun animal seleccionado");
            return;
        }

        try {
            File inputFile = new File(ANIMALES_CSV);
            File tempFile = new File(ANIMALES_CSV + ".temp");

            try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
                 FileWriter writer = new FileWriter(tempFile)) {

                String line;
                boolean firstLine = true;
                while ((line = reader.readLine()) != null) {
                    if (firstLine) {
                        writer.write(line + "\n");
                        firstLine = false;
                        continue;
                    }
                    String[] parts = line.split(",");
                    if (parts.length > 0 && !parts[0].trim().equals(animalName)) {
                        writer.write(line + "\n");
                    }
                }
            }

            if (!inputFile.delete()) {
                statusLabel.setText("No se pudo borrar el archivo original");
                return;
            }
            if (!tempFile.renameTo(inputFile)) {
                statusLabel.setText("No se pudo renombrar el archivo temporal");
                return;
            }

            statusLabel.setText("¡Animal borrado exitosamente!");
        } catch (Exception e) {
            statusLabel.setText("Error: " + e.getMessage());
        }
    }

    private void clearFields() {
        nombreField.setText("");
        filaField.setText("");
        columnaField.setText("");
        imagenField.setText("");
        apodoField.setText("");
        animalImgField.setText("");
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            ZooDataManager manager = new ZooDataManager();

            manager.addWindowListener(new WindowAdapter() {
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

            manager.setVisible(true);
        });

    }
}