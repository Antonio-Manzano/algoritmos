using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace prueba2
{
    internal static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            // Splash Bienvenida 
            Bienvenida splash = new Bienvenida();
            splash.Show();
            Application.DoEvents(); // Procesa todos los eventos actuales
            System.Threading.Thread.Sleep(3000); // Espera 3 segundos
            splash.Close();

            // Formulario principal
            ListaDisponible mainForm = new ListaDisponible();
            mainForm.FormClosed += (s, args) => Application.Exit();
            Application.Run(mainForm);
        }
    }
}
