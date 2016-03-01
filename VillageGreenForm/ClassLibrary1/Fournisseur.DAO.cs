using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ClassLibrary1
{
    class FournisseurDAO
    {
        SqlConnection connexion = new SqlConnection("server=., database=Village_Green, integrated security = true");
        public Find(int id)
        {
            connexion.Open();

            Fournisseur fou = new Fournisseur();

            SqlCommand requete = new SqlCommand(@"SELECT * FROM svg.Fournisseurs where Id_Fournisseur = @id ", connexion);
            requete.Parameters.AddWithValue("@id", id);

            SqlDataReader resultat = requete.ExecuteReader();

            if (resultat.Read())
            {
                fou.Id_Fournisseur = Convert.ToInt32(resultat["Id_Fournisseur"]);
                fou.Nom_Fournisseur = Convert.ToString(resultat["Nom_Fournisseur"]);
            }

            return fou;          
        }
    }
}
