using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Clients
    {
        public int id_CLient { get; set; }
        public string Nom_Client { get; set; }
        public string Prenom_Client { get; set; }
        public int Coefficient_CLient { get; set; }
        public string Telephone_Client { get; set; }
        public string Ville_Client { get; set; }
        public string Adresse_Client { get; set; }
        public string Code_Postal { get; set; }
        public bool Professionnel { get; set; }
        public int id_Commercial { get; set; }
    }
}
