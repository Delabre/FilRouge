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
    }
}
