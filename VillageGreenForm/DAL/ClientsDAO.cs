using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ClientsDAO
    {
        SqlConnection connexion;


        public List<Clients> list()
        {
            connexion = new SqlConnection("server =.; database = Village_Green; Integrated Security = True");
            connexion.Open();

            List<Clients> resultat = new List<Clients>();



            SqlCommand requete = new SqlCommand("SELECT * FROM svg.Clients", connexion);

            SqlDataReader lecture = requete.ExecuteReader();

            while (lecture.Read())
            {
                Clients cli = new Clients();
                cli.id_CLient = Convert.ToInt32(lecture["Id_Client"]);
                cli.Nom_Client = Convert.ToString(lecture["Nom_Client"]);
                cli.Prenom_Client = Convert.ToString(lecture["Prenom_Client"]);
                cli.Coefficient_CLient = Convert.ToInt32(lecture["Coefficient_Client"]);
                cli.Telephone_Client = Convert.ToString(lecture["Telephone_Client"]);
                cli.Ville_Client = Convert.ToString(lecture["Ville_Client"]);
                cli.Adresse_Client = Convert.ToString(lecture["Adresse_Client"]);
                cli.Code_Postal = Convert.ToString(lecture["Code_Postal"]);
                cli.Professionnel = Convert.ToBoolean(lecture["Professionnel"]);
                cli.id_Commercial = Convert.ToInt32(lecture["ref_commercial_clie"]);
                resultat.Add(cli);
            }
            return resultat;
        }

        public Clients Find(int id)
        {
            connexion = new SqlConnection("server =.; database = Village_Green; Integrated Security = True");
            connexion.Open();

            Clients cli = new Clients();

            SqlCommand requete = new SqlCommand("select * from svg.Clients where Id_Client=@id", connexion);
            requete.Parameters.AddWithValue("@id", id);

            SqlDataReader lecture = requete.ExecuteReader();

            if (lecture.Read())
            {
                cli.id_CLient = Convert.ToInt32(lecture["Id_Client"]);
                cli.Nom_Client = Convert.ToString(lecture["Nom_Client"]);
                cli.Prenom_Client = Convert.ToString(lecture["Prenom_Client"]);
                cli.Coefficient_CLient = Convert.ToInt32(lecture["Coefficient_Client"]);
                cli.Telephone_Client = Convert.ToString(lecture["Telephone_Client"]);
                cli.Ville_Client = Convert.ToString(lecture["Ville_Client"]);
                cli.Adresse_Client = Convert.ToString(lecture["Adresse_Client"]);
                cli.Code_Postal = Convert.ToString(lecture["Code_Postal"]);
                cli.Professionnel = Convert.ToBoolean(lecture["Professionnel"]);
                cli.id_Commercial = Convert.ToInt32(lecture["ref_commercial_clie"]);
            }

            return cli;
        }

        public void Insert(Clients cli)
            {

            connexion = new SqlConnection("server =.; database = Village_Green; Integrated Security = True");
            connexion.Open();

            SqlCommand requete = new SqlCommand(@"insert into client (Id_Client, Nom_Client, Prenom_Client, Coefficient_Client, Telephone_Client, Ville_Client, Adresse_Client, Code_Postal, Professionnel, ref_commercial_clie) 
                                                  values (@id, @nom, @prenom, @coeff, @tel, @ville, @adr, @cp, @prof, @idcom)", connexion);
            requete.Parameters.AddWithValue("@id", cli.id_CLient);
            requete.Parameters.AddWithValue("@nom", cli.Nom_Client);
            requete.Parameters.AddWithValue("@prenom", cli.Prenom_Client);
            requete.Parameters.AddWithValue("@coeff", cli.Coefficient_CLient);
            requete.Parameters.AddWithValue("@tel", cli.Telephone_Client);
            requete.Parameters.AddWithValue("@ville", cli.Ville_Client);
            requete.Parameters.AddWithValue("@adr", cli.Adresse_Client);
            requete.Parameters.AddWithValue("@cp", cli.Code_Postal);
            requete.Parameters.AddWithValue("@prof", cli.Professionnel);
            requete.Parameters.AddWithValue("@idcom", cli.id_Commercial);

            requete.ExecuteNonQuery();
            connexion.Close();
            }

        public void Update(Clients cli)
        {
            connexion = new SqlConnection("server =.; database = Village_Green; Integrated Security = True");
            connexion.Open();

            SqlCommand requete = new SqlCommand(@"update svg.Clients 
                                                  set Nom_Client=@nom, Prenom_Client=@prenom, Coefficient_Client=@coeff, Telephone_Client=@tel, Ville_Client=@ville, 
                                                  Adresse_Client=@adr, Code_Postal=@cp, Professionnel=@prof, ref_commercial_clie=@idcom
                                                   Where Id_Client = @Id", connexion);

            requete.Parameters.AddWithValue("@id", cli.id_CLient);
            requete.Parameters.AddWithValue("@nom", cli.Nom_Client);
            requete.Parameters.AddWithValue("@prenom", cli.Prenom_Client);
            requete.Parameters.AddWithValue("@coeff", cli.Coefficient_CLient);
            requete.Parameters.AddWithValue("@tel", cli.Telephone_Client);
            requete.Parameters.AddWithValue("@ville", cli.Ville_Client);
            requete.Parameters.AddWithValue("@adr", cli.Adresse_Client);
            requete.Parameters.AddWithValue("@cp", cli.Code_Postal);
            requete.Parameters.AddWithValue("@prof", cli.Professionnel);
            requete.Parameters.AddWithValue("@idcom", cli.id_Commercial);

            requete.ExecuteNonQuery();
            connexion.Close();
        }
    }
}
