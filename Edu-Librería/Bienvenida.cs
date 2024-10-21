using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace prueba2
{
    public partial class Bienvenida : Form
    {
        public Bienvenida()
        {
            InitializeComponent();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Bienvenida_Load(object sender, EventArgs e)
        {
            Timer timer1 = new Timer();
            timer1.Interval = 3000; // 1000 ms = 1 segundo
            timer1.Tick += new EventHandler(timer1_Tick);
            timer1.Start();
        }

        private void Bienvenida_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }
    }
}
