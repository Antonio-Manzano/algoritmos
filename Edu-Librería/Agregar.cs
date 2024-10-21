using System;
using System.Collections.Generic;
using System.IO;
using System.Windows.Forms;

namespace prueba2
{
    public partial class Agregar : Form
    {
        List<Libro> libros = new List<Libro>(); 

        public Agregar()
        {
            InitializeComponent();
            CargarLibros(); 
            Categoria.Items.Add("Matemáticas");
            Categoria.Items.Add("Física");
            Categoria.Items.Add("Ciencias");
            Categoria.Items.Add("Historia");
            Categoria.Items.Add("Arte");
            Categoria.Items.Add("Tecnología");
            Categoria.Items.Add("Diccionario");
            Categoria.Items.Add("Economía");
            Categoria.Items.Add("Poesía");
            Categoria.Items.Add("Teatro");
            Categoria.Items.Add("Filosofía");
            Categoria.Items.Add("Terror");


            Categoria.DropDownStyle = ComboBoxStyle.DropDownList;
        }
        public class Libro
        {
            public string Nombre { get; set; }
            public string Autor { get; set; }
            public string Editorial { get; set; }
            public string Categoria { get; set; }
            public int Year { get; set; }
            public int Cantidad { get; set; }
            public int Ocupado { get; set; }
        }


        private void CargarLibros()
        {
            string filePath = "libros.dat";
            if (File.Exists(filePath))
            {
                using (BinaryReader reader = new BinaryReader(File.Open(filePath, FileMode.Open)))
                {
                    if (reader.BaseStream.Length > 0)
                    {
                        int totalLibros = reader.ReadInt32();
                        for (int i = 0; i < totalLibros; i++)
                        {
                            Libro libro = new Libro
                            {
                                Nombre = reader.ReadString(),
                                Autor = reader.ReadString(),
                                Editorial = reader.ReadString(),
                                Categoria = reader.ReadString(),
                                Year = reader.ReadInt32(),
                                Ocupado = reader.ReadInt32(),
                                Cantidad = reader.ReadInt32()
                            };
                            libros.Add(libro);
                        }
                    }
                }
            }
        }


        private void GuardarLibros()
        {
            string filePath = "libros.dat";
            using (BinaryWriter writer = new BinaryWriter(File.Open(filePath, FileMode.Create)))
            {
                writer.Write(libros.Count); 
                foreach (Libro libro in libros)
                {
                    writer.Write(libro.Nombre);
                    writer.Write(libro.Autor);
                    writer.Write(libro.Editorial);
                    writer.Write(libro.Categoria);
                    writer.Write(libro.Year);
                    writer.Write(libro.Ocupado);
                    writer.Write(libro.Cantidad);
                }
            }
            MessageBox.Show("Libro guardado exitosamente.");
        }

        
        private int AgregarLibro()
        {
            int validar;

            if (Nombre.Text == null || Categoria.SelectedItem == null || Autor.Text == null || Editorial.Text == null || Year.Text == null)
            {
                MessageBox.Show("Por favor, rellene todos los espacios.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return 0;
            }

            if (!int.TryParse(Year.Text, out validar) || Year.Text.Length != 4)
            {
                
                MessageBox.Show("Por favor, ingrese un año válido.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return 0;
            }

            Libro nuevoLibro = new Libro
            {
                Nombre = Nombre.Text,
                Autor = Autor.Text,
                Editorial = Editorial.Text,
                Categoria = Categoria.SelectedItem.ToString(),
                Year = int.Parse(Year.Text),
                Ocupado = 0,
                Cantidad = 1,
            };

            
            foreach (var libro in libros)
            {
                
                if (libro.Nombre.ToLower() == nuevoLibro.Nombre.ToLower() &&
                    libro.Autor.ToLower() == nuevoLibro.Autor.ToLower() &&
                    libro.Editorial.ToLower() == nuevoLibro.Editorial.ToLower() &&
                    libro.Categoria.ToLower() == nuevoLibro.Categoria.ToLower() &&
                    libro.Year == nuevoLibro.Year)
                {
                    
                    libro.Cantidad += 1;
                    MessageBox.Show($"Cantidad del libro '{libro.Nombre}' aumentada a: {libro.Cantidad}");
                    GuardarLibros(); 
                    return 1;
                }

                
                if (libro.Nombre.ToLower() == nuevoLibro.Nombre.ToLower())
                {
                    var detalles = $"Nombre: {libro.Nombre}\n" +
                                   $"Autor: {libro.Autor}\n" +
                                   $"Editorial: {libro.Editorial}\n" +
                                   $"Categoría: {libro.Categoria}\n" +
                                   $"Año: {libro.Year}\n" +
                                   $"Cantidad: {libro.Cantidad}";

                    var dialogResult = MessageBox.Show($"El libro ya existe:\n{detalles}\n¿Es el mismo libro?", "Libro existente", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (dialogResult == DialogResult.Yes)
                    {
                        
                        libro.Cantidad += 1;
                        MessageBox.Show($"Cantidad del libro '{libro.Nombre}' aumentada a: {libro.Cantidad}");
                        GuardarLibros(); 
                        return 1; 
                    }
                    else
                    {
                        MessageBox.Show("Se añadirá el nuevo libro.");
                    }
                }
            }


            libros.Add(nuevoLibro);


            GuardarLibros();
            return 1; 
        }



        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        
        private void button1_Click(object sender, EventArgs e)
        {
            if (AgregarLibro() == 1)
            {
                this.Hide();
                ListaDisponible frm = new ListaDisponible();
                frm.Show();
            }
        }


        private void button3_Click_1(object sender, EventArgs e)
        {
            this.Hide();
            ListaDisponible frm = new ListaDisponible();
            frm.Show();
        }

        private void Categoria_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void Editorial_TextChanged(object sender, EventArgs e)
        {

        }

        private void Categoria_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Nombre.Clear();
            Autor.Clear();
            Editorial.Clear();
            Categoria.SelectedIndex = -1;
            Year.Clear();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            if (AgregarLibro() == 1)
            {
                this.Hide();
                ListaDisponible frm = new ListaDisponible();
                frm.Show();
            }
        }

        private void Nombre_TextChanged(object sender, EventArgs e)
        {

        }

        private void Agregar_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void Year_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
