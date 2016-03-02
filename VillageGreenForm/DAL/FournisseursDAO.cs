using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class FournisseursDAO
    {
        SqlConnection connexion;
        public Fournisseurs Find(int id)
        {
            connexion = new SqlConnection("server =.; database = Village_Green; Integrated Security = True");
            connexion.Open();

            Fournisseurs fou = new Fournisseurs();

            SqlCommand requete = new SqlCommand("SELECT * FROM svg.Fournisseurs where Id_Fournisseur = @id ", connexion);
            requete.Parameters.AddWithValue("@id", id);

            SqlDataReader resultat = requete.ExecuteReader();

            if (resultat.Read())
            {
                fou.Id_Fournisseur = Convert.ToInt32(resultat["Id_Fournisseur"]);
                fou.Nom_Fournisseur = Convert.ToString(resultat["Nom_Fournisseur"]);
            }
            return fou;
        }
    
        public List<Fournisseurs> List()
        {
            List <Fournisseurs> resultat = new List<Fournisseurs>();
            connexion = new SqlConnection("server =.; database = Village_Green; Integrated Security = True");
            connexion.Open();

            SqlCommand requete = new SqlCommand("SELECT * FROM svg.Fournisseurs", connexion);

            SqlDataReader lecture = requete.ExecuteReader();

            Fournisseurs tous = new Fournisseurs();
            tous.Id_Fournisseur = 0;
            tous.Nom_Fournisseur = "Tous";
            resultat.Add(tous);

            while (lecture.Read())
            {
                Fournisseurs fou = new Fournisseurs();
                fou.Id_Fournisseur = Convert.ToInt32(lecture["Id_Fournisseur"]);
                fou.Nom_Fournisseur = Convert.ToString(lecture["Nom_Fournisseur"]);               
                resultat.Add(fou);
            }
            return resultat;
        }

    }
}
