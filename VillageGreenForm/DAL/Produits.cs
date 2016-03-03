using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Produits
    {
        public int Id_Produit { get; set; }
        public string Description_Produit { get; set; }
        public string Libelle_Produit { get; set; }
        public string Photo_Produit { get; set; }
        public int PrixHT_Produit { get; set; }
        public int Stock_Produit { get; set; }
        public int Publication_Produit { get; set; }
        public string Nom_Sous_Categorie { get; set; }
        public int Id_Commercial { get; set; }    

    }
}
