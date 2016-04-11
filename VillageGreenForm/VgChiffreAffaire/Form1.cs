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

        private void Form1_Load(object sender, EventArgs e)  //==== FORM LOAD ====
        {            
            FournisseursDAO liste = new FournisseursDAO();

            comboBoxFourniseur.DisplayMember = "Nom_Fournisseur";
            comboBoxFourniseur.ValueMember = "Id_Fournisseur";
            comboBoxFourniseur.DataSource = liste.List();

            comboBoxFourniseur.SelectedIndex = -1;
        }

        private void buttonRechercher_Click(object sender, EventArgs e) //==== BOUTON RECHERCHER ====
        {
            if (comboBoxFourniseur.SelectedIndex != -1)
            {
                RechercheDAO search = new RechercheDAO();

                dataGridView1.DataSource = search.CA((int)comboBoxFourniseur.SelectedValue);
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            }
            else
            {
                MessageBox.Show("Veuillez selectionner un fournisseur","Erreur Recherche", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
           
        }

        private void Form1_MouseClick(object sender, MouseEventArgs e)
        {
            comboBoxFourniseur.SelectedIndex = -1;
        }

        private void buttonVider_Click(object sender, EventArgs e) //==== BOUTON VIDER ====
        {
            dataGridView1.DataSource = null;
        }
    }
}
