//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ConsoleApplication2
{
    using System;
    using System.Collections.Generic;
    
    public partial class Colis
    {
        public int Id_Colis { get; set; }
        public string Bon_Livraison { get; set; }
        public Nullable<System.DateTime> Date_Envoi { get; set; }
        public Nullable<int> Ref_Commande_Coli { get; set; }
        public Nullable<int> Ref_Client_Coli { get; set; }
    
        public virtual Clients Clients { get; set; }
        public virtual Commandes Commandes { get; set; }
    }
}
