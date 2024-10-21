using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace prueba2
{
    public partial class ListaNoDisponible : Form
    {
        List<Libro> libros = new List<Libro>();
        List<Prestamo> prestamos = new List<Prestamo>();

        public ListaNoDisponible()
        {
            InitializeComponent();
            CargarLibros();
            CargarPrestamos();
            MostrarPrestamosEnGrid();
            dataGridView1.CellContentClick += dataGridView1_CellContentClick;
            textBox1.TextChanged += new EventHandler(cajabuscart);
            label1.Location = new Point(23, 235);
            label3.Location = new Point(60, 199);
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
                    else
                    {
                        MessageBox.Show("El archivo de préstamos está vacío. Se iniciará con una lista vacía.");
                    }
                }
            }
            else
            {
                MessageBox.Show("No se encontró el archivo de préstamos. Se iniciará con una lista vacía.");
            }
        }

        private void MostrarPrestamosEnGrid()
        {
            dataGridView1.DataSource = null;

            var prestamosSinIndice = prestamos.Select(p => new
            {
                p.Matricula,
                p.Fecha,
                p.Nombre,
                p.Autor
            }).ToList();

            dataGridView1.DataSource = prestamosSinIndice;

            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.BackgroundColor = Color.White;

            dataGridView1.DefaultCellStyle.BackColor = Color.FromArgb(208, 231, 249);
            dataGridView1.DefaultCellStyle.ForeColor = Color.FromArgb(58, 58, 58);
            dataGridView1.DefaultCellStyle.Font = new Font("MS Reference Sans Serif", 9);

            dataGridView1.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(0, 63, 99);
            dataGridView1.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dataGridView1.ColumnHeadersDefaultCellStyle.Font = new Font("Agency FB", 10, FontStyle.Bold);
            dataGridView1.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;

            dataGridView1.AlternatingRowsDefaultCellStyle.BackColor = Color.FromArgb(214, 245, 214);
            dataGridView1.EnableHeadersVisualStyles = false;

            dataGridView1.BorderStyle = BorderStyle.None;
            dataGridView1.RowHeadersVisible = false;
            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.RowTemplate.Height = 22;
            dataGridView1.ReadOnly = true;
            dataGridView1.AllowUserToResizeColumns = false;
            dataGridView1.AllowUserToResizeRows = false;
            if (!dataGridView1.Columns.Contains("Devolver"))
            {
                DataGridViewButtonColumn devolverColumn = new DataGridViewButtonColumn();
                devolverColumn.HeaderText = "Devolver";
                devolverColumn.Name = "Devolver";
                devolverColumn.Text = "Devolver";
                devolverColumn.UseColumnTextForButtonValue = true;
                dataGridView1.Columns.Add(devolverColumn);
            }

            dataGridView1.Columns["Matricula"].DisplayIndex = 0;
            dataGridView1.Columns["Fecha"].DisplayIndex = 1;
            dataGridView1.Columns["Nombre"].DisplayIndex = 2;
            dataGridView1.Columns["Autor"].DisplayIndex = 3;
            dataGridView1.Columns["Devolver"].DisplayIndex = 4;
        }


        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            ListaDisponible frm = new ListaDisponible();
            frm.Show();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0 && e.ColumnIndex == dataGridView1.Columns["Devolver"].Index)
            {
                Prestamo prestamoSeleccionado = prestamos[e.RowIndex];

                if (prestamoSeleccionado.IndiceLibro >= 0 && prestamoSeleccionado.IndiceLibro < libros.Count)
                {
                    Libro libroCorrespondiente = libros[prestamoSeleccionado.IndiceLibro];

                    libroCorrespondiente.Cantidad++;
                    libroCorrespondiente.Ocupado--;

                    prestamos.RemoveAt(e.RowIndex);
                    GuardarPrestamos(); 
                    GuardarLibros();
                    MostrarPrestamosEnGrid();
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
        private void mover()
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                int ffila = dataGridView1.SelectedRows[0].Index;
                dataGridView1.FirstDisplayedScrollingRowIndex = ffila;
            }
        }
        private void buscar(string textoBusqueda)
        {
            if (textoBusqueda != "")
            {
                foreach (DataGridViewRow fila in dataGridView1.Rows)
                {
                    fila.Selected = false;
                }
                foreach (DataGridViewRow fila in dataGridView1.Rows)
                {
                    for (int j = 1; j < 5; j++)
                    {
                        DataGridViewCell celda = fila.Cells[j];
                        if (celda.Value != null && celda.Value.ToString().ToLower().Contains(textoBusqueda.ToLower()))
                        {
                            fila.Selected = true;
                            mover();
                            fila.Selected = false;
                            for (int i = 1; i < 5; i++)
                            {
                                celda = fila.Cells[i];
                                celda.Selected = true;
                            }
                        }
                    }
                }
            }
            else
            {
                foreach (DataGridViewRow fila in dataGridView1.Rows)
                {
                    fila.Selected = false;
                }
            }
        }


        private void cajabuscart(object sender, EventArgs e)
        {
            TextBox textBox = sender as TextBox;
            if (textBox != null)
            {
                buscar(textBox.Text);
            }
        }
        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void ListaNoDisponible_Load(object sender, EventArgs e)
        {
            button4.BringToFront();
            button4.Text = button4.Text.ToUpper();
            button4.BackColor = Color.FromArgb(((int)(((byte)(76)))), ((int)(((byte)(175)))), ((int)(((byte)(80)))));
            button4.BackgroundImageLayout = ImageLayout.Stretch;
            button4.Font = new Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold);
            button4.ForeColor = Color.White;
            button4.Location = new Point(40, 354);
            button4.Margin = new Padding(4, 3, 4, 3);
            button4.Name = "button4";
            button4.Size = new Size(158, 29);
            button4.TabIndex = 27;
            button4.Text = "DISPONIBLES";
            button4.TextAlign = ContentAlignment.MiddleLeft;
            button4.UseVisualStyleBackColor = false;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click_1(object sender, EventArgs e)
        {

        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void ListaNoDisponible_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }
    }
}
