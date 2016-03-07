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
using System.Text.RegularExpressions;

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

            dataGridView1.ClearSelection();
        }

        private void buttonModifier_Click(object sender, EventArgs e)  // BOUTON MOFIFIER ================================
        {

            if (dataGridView1.SelectedRows.Count == 0 )
            {
                return;
            }

            nettoyage(); // Méthode de nettoyage !

            action = "modifier";

            buttonConfirmer.Visible = true;
            ButtonAnnuler.Visible = true;
            groupBox1.Visible = true;
            checkBoxProf.Visible = true;
            buttonAjouter.Enabled = false;

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
            }
            else if (action == "consulter")
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
            nettoyage(); // Méthode de nettoyage !
        }

        private void buttonConfirmer_Click(object sender, EventArgs e)
        {
            if (action == "modifier")
            {
                if (!Regex.IsMatch(textBoxNom.Text, @"^[A-Z]{1,}[A-Z]*[a-z]*([ ][A-Z]{1,}[A-Z]*[a-z]*)*$") ||
               !Regex.IsMatch(textBoxPrenom.Text, @"^[A-Z]{1,}[a-z]+([ ][A-Z]{1,}[a-z]+)*$") ||
               !Regex.IsMatch(textBoxAdresse.Text, @"^\d{0,5}([ ][A-Z]*[a-z]+)*$") ||
               !Regex.IsMatch(textBoxVille.Text, @"^[A-Z]{1,}[A-Z]*[a-z]*([ ][A-Z]{1,}[A-Z]*[a-z]*)?$") ||
               !Regex.IsMatch(textBoxCp.Text, @"^\d{5,}$") ||
               !Regex.IsMatch(textBoxTel.Text, @"^(0|\+33)[1-9]([-. ]?[0-9]{2}){4}$"))
                {
                    MessageBox.Show("Erreur dans le formulaire", "ERREUR");
                }
                else
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

                    actualiser();
                }
                
            }
            if (action == "ajouter")
            {
                if (!Regex.IsMatch(textBoxNom.Text, @"^[A-Z]{1,}[A-Z]*[a-z]*([ ][A-Z]{1,}[A-Z]*[a-z]*)*$") ||
               !Regex.IsMatch(textBoxPrenom.Text, @"^[A-Z]{1,}[a-z]+([ ][A-Z]{1,}[a-z]+)*$") ||
               !Regex.IsMatch(textBoxAdresse.Text, @"^\d{0,5}([ ][A-Z]*[a-z]+)*$") ||
               !Regex.IsMatch(textBoxVille.Text, @"^[A-Z]{1,}[A-Z]*[a-z]*([ ][A-Z]{1,}[A-Z]*[a-z]*)?$") ||
               !Regex.IsMatch(textBoxCp.Text, @"^\d{5,}$") ||
               !Regex.IsMatch(textBoxTel.Text, @"^(0|\+33)[1-9]([-. ]?[0-9]{2}){4}$"))
                {
                    MessageBox.Show("Erreur dans le formulaire", "ERREUR");
                }
                else
                {
                    Clients cli = new Clients();

                    cli.Nom_Client = textBoxNom.Text;
                    cli.Prenom_Client = textBoxPrenom.Text;
                    cli.Ville_Client = textBoxVille.Text;
                    cli.Telephone_Client = textBoxTel.Text;
                    cli.Adresse_Client = textBoxAdresse.Text;
                    cli.Code_Postal = textBoxCp.Text;
                    cli.Coefficient_CLient = (int)numericUpDown1.Value;
                    if (checkBoxProf.Checked == true)
                    {
                        cli.Professionnel = true;
                        cli.id_Commercial = 2;
                    }
                    else
                    {
                        cli.Professionnel = false;
                        cli.id_Commercial = 1;
                    }

                    ClientsDAO ajout = new ClientsDAO();

                    ajout.Insert(cli);

                    actualiser();
                }
            }         

            //ClientsDAO liste = new ClientsDAO();

            //dataGridView1.DataSource = liste.list();
            //dataGridView1.Columns[3].Visible = false;
            //dataGridView1.Columns[4].Visible = false;
            //dataGridView1.Columns[5].Visible = false;
            //dataGridView1.Columns[6].Visible = false;
            //dataGridView1.Columns[7].Visible = false;
            //dataGridView1.Columns[8].Visible = false;
            //dataGridView1.Columns[9].Visible = false;
            //dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

            //nettoyage(); // Méthode de nettoyage !
        }

        private void buttonAjouter_Click(object sender, EventArgs e)
        {
            action = "ajouter";

            nettoyage(); // Méthode de nettoyage !

            dataGridView1.ClearSelection();
            buttonConfirmer.Visible = true;
            ButtonAnnuler.Visible = true;
            groupBox1.Visible = true;
            dataGridView1.Enabled = false;
            checkBoxProf.Visible = true;
            buttonModifier.Enabled = false;
            buttonModifier.Enabled = false;
        }


        // Méthode de nettoyage !
        //========================================================================================
        public void nettoyage()
        {
            buttonConfirmer.Visible = false;
            ButtonAnnuler.Visible = false;
            groupBox1.Visible = false;
            dataGridView1.Enabled = false;
            dataGridView1.Enabled = true;
            buttonModifier.Enabled = true;
            checkBoxProf.Visible = false;
            buttonModifier.Visible = false;
            buttonAjouter.Enabled = true;

            dataGridView1.ClearSelection();

            textBoxNom.Clear();
            textBoxPrenom.Clear();
            textBoxVille.Clear();
            textBoxTel.Clear();
            textBoxAdresse.Clear();
            textBoxCp.Clear();
            textBoxIdCom.Clear();
            LabelIdentifiant.Text = "";
            numericUpDown1.Value = 0;

            textBoxNom.Enabled = true;
            textBoxPrenom.Enabled = true;
            textBoxVille.Enabled = true;
            textBoxTel.Enabled = true;
            textBoxAdresse.Enabled = true;
            textBoxCp.Enabled = true;
            textBoxIdCom.Enabled = true;
            numericUpDown1.Enabled = true;
        }
        //=====================================================================================================
        //                  ********************* REGEX POWA !!!!!!!!!!!!! *********************
        //=====================================================================================================
        private void textBoxNom_TextChanged(object sender, EventArgs e)
        {
            if (!Regex.IsMatch(textBoxNom.Text, @"^[A-Z]{1,}[A-Z]*[a-z]*([ ][A-Z]{1,}[A-Z]*[a-z]*)*$"))  // REGEX NOM !!!!!!!!!!!!!!!!!!!!!!!!!
            {
                textBoxNom.ForeColor = Color.Red;
            }
            else
            {
                textBoxNom.ForeColor = Color.Black;
            }
        }

        private void textBoxPrenom_TextChanged(object sender, EventArgs e)
        {
            if (!Regex.IsMatch(textBoxPrenom.Text, @"^[A-Z]{1,}[a-z]+([ ][A-Z]{1,}[a-z]+)*$"))  // REGEX PRENOM !!!!!!!!!!!!!!!!!!!!!!!!!
            {
                textBoxPrenom.ForeColor = Color.Red;
            }
            else
            {
                textBoxPrenom.ForeColor = Color.Black;
            }
        }

        private void textBoxAdresse_TextChanged(object sender, EventArgs e)
        {
            if (!Regex.IsMatch(textBoxAdresse.Text, @"^\d{0,5}([ ][A-Z]*[a-z]+)*$"))  // REGEX ADRESSE !!!!!!!!!!!!!!!!!!!!!!!!!
            {
                textBoxAdresse.ForeColor = Color.Red;
            }
            else
            {
                textBoxAdresse.ForeColor = Color.Black;
            }
        }
        private void textBoxVille_TextChanged(object sender, EventArgs e)
        {
            if (!Regex.IsMatch(textBoxVille.Text, @"^[A-Z]{1,}[A-Z]*[a-z]*([ ][A-Z]{1,}[A-Z]*[a-z]*)?$"))  // REGEX VILLE !!!!!!!!!!!!!!!!!!!!!!!!!
            {
                textBoxVille.ForeColor = Color.Red;
            }
            else
            {
                textBoxVille.ForeColor = Color.Black;
            }
        }
        private void textBoxCp_TextChanged(object sender, EventArgs e)
        {
            if (!Regex.IsMatch(textBoxCp.Text, @"^\d{5,}$"))  // REGEX CP !!!!!!!!!!!!!!!!!!!!!!!!!
            {
                textBoxCp.ForeColor = Color.Red;
            }
            else
            {
                textBoxCp.ForeColor = Color.Black;
            }
        }
        private void textBoxTel_TextChanged(object sender, EventArgs e)
        {
            if (!Regex.IsMatch(textBoxTel.Text, @"^(0|\+33)[1-9]([-. ]?[0-9]{2}){4}$"))  // REGEX TELEPHONE !!!!!!!!!!!!!!!!!!!!!!!!!
            {
                textBoxTel.ForeColor = Color.Red;
            }
            else
            {
                textBoxTel.ForeColor = Color.Black;
            }
        }
        //=====================================================================================================
        //                  ********************* FIN REGEX POWA !!!!!!!!!!!!! *********************
        //=====================================================================================================
        private void buttonConsulter_Click(object sender, EventArgs e)
        {

            if (dataGridView1.SelectedRows.Count == 0)
            {
                return;
            }

            buttonModifier.Visible = true;
            action = "consulter";

            checkBoxProf.Visible = false;

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

            textBoxNom.Enabled = false;
            textBoxPrenom.Enabled = false;
            textBoxVille.Enabled = false;
            textBoxTel.Enabled = false;
            textBoxAdresse.Enabled = false;
            textBoxCp.Enabled = false;
            textBoxIdCom.Enabled = false;
            numericUpDown1.Enabled = false;
        }  
        
        public void actualiser()
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

            nettoyage(); // Méthode de nettoyage !
        }     
    }
}
