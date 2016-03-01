using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DAL;

namespace VgChiffreAffaire
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {            
            FournisseursDAO liste = new FournisseursDAO();

            comboBoxFourniseur.DisplayMember = "Nom_Fournisseur";
            comboBoxFourniseur.ValueMember = "Id_Fournisseur";
            comboBoxFourniseur.DataSource = liste.List();

            comboBoxFourniseur.SelectedIndex = -1;
        }

        private void button7_Click(object sender, EventArgs e)
        {

        }
    }
}
