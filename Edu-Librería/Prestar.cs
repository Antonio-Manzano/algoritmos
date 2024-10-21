using System;
using System.Collections.Generic;
using System.IO;
using System.Windows.Forms;
using System.Drawing;

namespace prueba2
{
    public partial class Prestar : Form
    {
        List<Libro> libros = new List<Libro>();
        List<Prestamo> prestamos = new List<Prestamo>();
        private int libroElegido; 
        public Prestar(int libroelegido)
        {
            InitializeComponent();
            libroElegido = libroelegido; 
            CargarLibros();
            CargarPrestamos();
            Fecha.Value = DateTime.Now;
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


        public class Prestamo
        {
            public string Matricula { get; set; }
            public DateTime Fecha { get; set; }
            public string Nombre { get; set; }
            public string Autor { get; set; }
            public int IndiceLibro { get; set; }
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
        private void CargarPrestamos()
        {
            string filePath = "prestamos.dat";
            if (File.Exists(filePath))
            {
                using (BinaryReader reader = new BinaryReader(File.Open(filePath, FileMode.Open)))
                {
                    if (reader.BaseStream.Length > 0)
                    {
                        int totalPrestamos = reader.ReadInt32();
                        for (int i = 0; i < totalPrestamos; i++)
                        {
                            Prestamo prestamo = new Prestamo
                            {
                                Matricula = reader.ReadString(),
                                Fecha = DateTime.FromBinary(reader.ReadInt64()),
                                Nombre = reader.ReadString(),
                                Autor = reader.ReadString(),
                                IndiceLibro = reader.ReadInt32(),
                            };
                            prestamos.Add(prestamo);
                        }
                    }
                }
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            int validar;
            string matriculaTexto = matricula.Text.Trim();
            DateTime fechaSeleccionada = Fecha.Value;
            if (matriculaTexto.Length == 7)
            {
                if (int.TryParse(matriculaTexto, out validar))
                {
                    Libro libroPrestado = libros[libroElegido];
                    string nombreLibro = libroPrestado.Nombre;
                    string nombreAutor = libroPrestado.Autor;
                    Prestamo nuevoPrestamo = new Prestamo
                    {
                        Matricula = matriculaTexto,
                        Fecha = fechaSeleccionada,
                        Nombre = nombreLibro,
                        Autor = nombreAutor,
                        IndiceLibro = libroElegido
                    };

                    libros[libroElegido].Cantidad--;
                    libros[libroElegido].Ocupado++;

                    prestamos.Add(nuevoPrestamo);

                    GuardarPrestamos();
                    GuardarLibros();
                    MessageBox.Show($"El libro '{libros[libroElegido].Nombre}' ha sido prestado a la matrícula: {matriculaTexto}.");
                    this.Hide();
                    ListaNoDisponible frm = new ListaNoDisponible();
                    frm.Show();
                }
                else
                {
                    MessageBox.Show("Ingresa una matrícula (solo números).", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Ingresa una matrícula correcta.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
        }

        private void GuardarPrestamos()
        {
            string filePath = "prestamos.dat";
            using (BinaryWriter writer = new BinaryWriter(File.Open(filePath, FileMode.Create)))
            {
                writer.Write(prestamos.Count);
                foreach (Prestamo prestamo in prestamos)
                {
                    writer.Write(prestamo.Matricula);
                    writer.Write(prestamo.Fecha.ToBinary());
                    writer.Write(prestamo.Nombre);
                    writer.Write(prestamo.Autor);
                    writer.Write(prestamo.IndiceLibro); 
                }
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            ListaDisponible frm = new ListaDisponible();
            frm.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            matricula.Clear();
        }

        private void matricula_TextChanged(object sender, EventArgs e)
        {

        }

        private void Prestar_Load(object sender, EventArgs e)
        {

        }
        private void label1_Click(object sender, EventArgs e)
        {
        }
        private void label2_Click(object sender, EventArgs e)
        {
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void Prestar_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void Fecha_ValueChanged(object sender, EventArgs e)
        {
        }
    }
}