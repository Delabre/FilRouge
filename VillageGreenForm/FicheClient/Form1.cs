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

namespace FicheClient
{
    public partial class Form1 : Form
    {
        string action = "";
    
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            ClientsDAO liste = new ClientsDAO();

            dataGridView1.DataSource = liste.list();
            dataGridView1.Columns[3].Visible = false;
            dataGridView1.Columns[4].Visible = false;
            dataGridView1.Columns[5].Visible = false;
            dataGridView1.Columns[6].Visible = false;
            dataGridView1.Columns[7].Visible = false;
            dataGridView1.Columns[8].Visible = false;
            dataGridView1.Columns[9].Visible = false;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private void buttonModifier_Click(object sender, EventArgs e)
        {
            action = "modifier";

            buttonConfirmer.Visible = true;
            ButtonAnnuler.Visible = true;
            groupBox1.Visible = true;

            ClientsDAO affiche = new ClientsDAO();

            int id = (int)dataGridView1.CurrentRow.Cells[0].Value;


            Clients cli = affiche.Find(id);

            LabelIdentifiant.Text = cli.id_CLient.ToString(); 
            textBoxNom.Text = cli.Nom_Client;
            textBoxPrenom.Text = cli.Prenom_Client;
            textBoxVille.Text = cli.Ville_Client;
            textBoxTel.Text = cli.Telephone_Client;
            textBoxAdresse.Text = cli.Adresse_Client;
            textBoxCp.Text = cli.Code_Postal;
            textBoxIdCom.Text = cli.id_Commercial.ToString();
            numericUpDown1.Value = cli.Coefficient_CLient;

            if (cli.Professionnel)
            {
                labelProfessionnel.Text = "Professionnel";
            }
            else if (!cli.Professionnel)
            {
                labelProfessionnel.Text = "Particulier";
            }
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (action == "modifier")
            {
                ClientsDAO affiche = new ClientsDAO();

                int id = (int)dataGridView1.CurrentRow.Cells[0].Value;


                Clients cli = affiche.Find(id);

                LabelIdentifiant.Text = cli.id_CLient.ToString();
                textBoxNom.Text = cli.Nom_Client;
                textBoxPrenom.Text = cli.Prenom_Client;
                textBoxVille.Text = cli.Ville_Client;
                textBoxTel.Text = cli.Telephone_Client;
                textBoxAdresse.Text = cli.Adresse_Client;
                textBoxCp.Text = cli.Code_Postal;
                textBoxIdCom.Text = cli.id_Commercial.ToString();
                numericUpDown1.Value = cli.Coefficient_CLient;

                if (cli.Professionnel)
                {
                    labelProfessionnel.Text = "Professionnel";
                }
                else if (!cli.Professionnel)
                {
                    labelProfessionnel.Text = "Particulier";
                }
            }
        }

        private void ButtonAnnuler_Click(object sender, EventArgs e)
        {
            dataGridView1.ClearSelection();

            buttonConfirmer.Visible = false;
            ButtonAnnuler.Visible = false;
            groupBox1.Visible = false;
        }

        private void buttonConfirmer_Click(object sender, EventArgs e)
        {
            if (action == "modifier")
            {
                Clients cli = new Clients();
                cli.id_CLient = Convert.ToInt32(LabelIdentifiant.Text);
                cli.Nom_Client = textBoxNom.Text;
                cli.Prenom_Client = textBoxPrenom.Text;
                cli.Ville_Client = textBoxVille.Text;
                cli.Telephone_Client = textBoxTel.Text;
                cli.Adresse_Client = textBoxAdresse.Text;
                cli.Code_Postal = textBoxCp.Text;
                cli.id_Commercial = Convert.ToInt32(textBoxIdCom.Text);
                cli.Coefficient_CLient = (int)numericUpDown1.Value;

                ClientsDAO data = new ClientsDAO();

                data.Update(cli);
            }
        }
    }
}
