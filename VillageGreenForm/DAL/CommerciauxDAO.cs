using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    class CommerciauxDAO
    {
        SqlConnection connexion;

        public List<Commerciaux> List()
        {
            connexion = new SqlConnection("server =.; database = Village_Green; Integrated Security = True");
            connexion.Open();

            List<Commerciaux> resultat = new List<Commerciaux>();



            SqlCommand requete = new SqlCommand("SELECT * FROM svg.Commerciaux", connexion);

            SqlDataReader lecture = requete.ExecuteReader();

            while (lecture.Read())
            {
                Commerciaux com = new Commerciaux();

                com.Id_Commercial = Convert.ToInt32(lecture["Id_Comemrcial"]);
                com.Nom_Commercial = Convert.ToString(lecture["Nom_Commercial"]);
                com.Prenom_Commercial = Convert.ToString(lecture["Prenom_Commercial"]);

                resultat.Add(com);
            }
            return resultat;
        }

    }
    }
}
