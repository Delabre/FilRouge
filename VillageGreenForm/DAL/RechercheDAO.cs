using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class RechercheDAO
    {
        SqlConnection connexion;
        public List<Fournisseurs> CA(int id)
        {
            SqlCommand requete;
            connexion = new SqlConnection("server =.; database = Village_Green; Integrated Security = True");
            connexion.Open();

            if (id == 0)
            {
                 requete = new SqlCommand(@"select sum (Quantite * (Prix_Coefficient - Prix_Achat_Fournisseur)) as CA, Id_Fournisseur, Nom_Fournisseur
                                                  from svg.Produits
                                                  join svg.composer on svg.composer.Ref_Produit_comp = svg.Produits.Id_Produit
                                                  join svg.fournisseurs on svg.fournisseurs.Id_fournisseur = svg.produits.ref_fournisseur_Prod
                                                  group by Id_Fournisseur, Nom_Fournisseur", connexion);
            }

            else
            {
                 requete = new SqlCommand(@"select sum (Quantite * (Prix_Coefficient - Prix_Achat_Fournisseur)) as CA, Id_Fournisseur, Nom_Fournisseur
                                                  from svg.Produits
                                                  join svg.composer on svg.composer.Ref_Produit_comp = svg.Produits.Id_Produit
                                                  join svg.fournisseurs on svg.fournisseurs.Id_fournisseur = svg.produits.ref_fournisseur_Prod
                                                  where Id_Fournisseur = @id  
                                                  group by Id_Fournisseur, Nom_Fournisseur", connexion);
                requete.Parameters.AddWithValue("@id", id);
            }

            List<Fournisseurs> retour = new List<Fournisseurs>();                                

            SqlDataReader resultat = requete.ExecuteReader();

            while (resultat.Read())
            {
                Fournisseurs Fou = new Fournisseurs();

                Fou.CA = Convert.ToDouble(resultat["CA"]);
                Fou.Id_Fournisseur = Convert.ToInt32(resultat["Id_Fournisseur"]);
                Fou.Nom_Fournisseur = Convert.ToString(resultat["Nom_Fournisseur"]);
                retour.Add(Fou);
            }
             
            return retour;
        }

    }
}
