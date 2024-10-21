using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using System.Drawing;

namespace prueba2
{
    public partial class ListaDisponible : Form
    {
        List<Libro> libros = new List<Libro>();
        List<Libro> librosFiltrados = new List<Libro>();

        public ListaDisponible()
        {
            InitializeComponent();
            CargarLibros();
            MostrarLibrosEnGrid();
            dataGridView1.CellContentClick += dataGridView1_CellContentClick;
            dataGridView1.DataError += dataGridView1_DataError;
            textBox1.TextChanged += new EventHandler(cajabuscart);
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
                    else
                    {
                        MessageBox.Show("El archivo está vacío, se iniciará con una lista vacía.");
                    }
                }
            }
            else
            {
                MessageBox.Show("No se encontró el archivo, se iniciará con una lista vacía.");
            }
        }


        private void MostrarLibrosEnGrid()
        {
            librosFiltrados = libros.Where(libro => libro.Cantidad > 0).ToList();

            dataGridView1.DataSource = null;
            dataGridView1.DataSource = librosFiltrados;

            if (dataGridView1.Columns["Ocupado"] != null)
            {
                dataGridView1.Columns["Ocupado"].Visible = false;
            }

            if (dataGridView1.Columns["Prestar"] != null)
            {
                dataGridView1.Columns.Remove("Prestar");
            }

            if (dataGridView1.Columns["Borrar"] != null)
            {
                dataGridView1.Columns.Remove("Borrar");
            }

            DataGridViewButtonColumn buttonColumn = new DataGridViewButtonColumn
            {
                HeaderText = "Prestar",
                Name = "Prestar",
                Text = "«»",
                UseColumnTextForButtonValue = true
            };
            dataGridView1.Columns.Add(buttonColumn); 

            DataGridViewButtonColumn buttonColumn2 = new DataGridViewButtonColumn
            {
                HeaderText = "Borrar",
                Name = "Borrar",
                Text = "«»",
                UseColumnTextForButtonValue = true
            };
            dataGridView1.Columns.Add(buttonColumn2);


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
            // arriba

            /*dataGridView1.EnableHeadersVisualStyles = false;
            dataGridView1.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(40, 40, 40);
            dataGridView1.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;*/



            // libros
            /*dataGridView1.DefaultCellStyle.BackColor = Color.White;
            dataGridView1.DefaultCellStyle.ForeColor = Color.Black;
            dataGridView1.DefaultCellStyle.Font = new Font("Segoe UI", 9);
            dataGridView1.DefaultCellStyle.SelectionBackColor = Color.FromArgb(0, 120, 215);
            dataGridView1.DefaultCellStyle.SelectionForeColor = Color.White;
            dataGridView1.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;

            */

        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            ListaNoDisponible frm = new ListaNoDisponible();
            frm.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Agregar frm = new Agregar();
            frm.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.Columns[e.ColumnIndex].Name == "Prestar" && e.RowIndex >= 0)
            {
                Libro libroSeleccionado = librosFiltrados[e.RowIndex]; 
                MessageBox.Show($"Libro seleccionado: {libroSeleccionado.Nombre} para préstamo.");
                this.Hide();
                int rowindex = libros.IndexOf(libroSeleccionado);
                Prestar frm = new Prestar(rowindex);
                frm.Show();
            }

            if (dataGridView1.Columns[e.ColumnIndex].Name == "Borrar" && e.RowIndex >= 0)
            {
                MessageBox.Show("Botón 'Borrar' presionado.");

                Libro libroSeleccionado = librosFiltrados[e.RowIndex]; 

                if (libroSeleccionado.Cantidad > 0)
                {
                    libroSeleccionado.Cantidad--;

                    if (libroSeleccionado.Cantidad == 0 && libroSeleccionado.Ocupado > 0)
                    {
                        MessageBox.Show($"El libro '{libroSeleccionado.Nombre}' ya no se encuentra disponible, pero aún hay '{libroSeleccionado.Ocupado}' en préstamo");
                    }
                    if (libroSeleccionado.Cantidad == 0 && libroSeleccionado.Ocupado == 0)
                    {
                        libros.Remove(libroSeleccionado); 
                        MessageBox.Show($"El libro '{libroSeleccionado.Nombre}' ha sido eliminado porque su cantidad llegó a 0.");
                    }
                    GuardarLibros();
                    MostrarLibrosEnGrid();
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

        private void dataGridView1_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            // Sin error si un librillo llega a 0
            e.ThrowException = false;
        }

        private void ListaDisponible_Load(object sender, EventArgs e)
        {
            button2.BringToFront();
            button3.BringToFront();
            button4.BringToFront();

        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

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
                    for (int j = 2; j < 7; j++)
                    {
                        DataGridViewCell celda = fila.Cells[j];
                        if (celda.Value != null && celda.Value.ToString().ToLower().Contains(textoBusqueda.ToLower()))
                        {
                            fila.Selected = true;
                            mover();
                            fila.Selected = false;
                            for (int i = 2; i < 7; i++)
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

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void contextMenuStrip1_Opening(object sender, System.ComponentModel.CancelEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void ListaDisponible_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }
    }
}
