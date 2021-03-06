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
    
    public partial class Commandes
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Commandes()
        {
            this.Colis = new HashSet<Colis>();
            this.Composer = new HashSet<Composer>();
        }
    
        public int Id_commande { get; set; }
        public Nullable<decimal> Prix_Total_HT { get; set; }
        public Nullable<decimal> Prix_Total_TTC { get; set; }
        public Nullable<decimal> Prix_Total_Remise { get; set; }
        public Nullable<decimal> Reduction_Supplementaire { get; set; }
        public Nullable<bool> Type_Paiement { get; set; }
        public string Etat_Commande { get; set; }
        public Nullable<System.DateTime> Date_Commande { get; set; }
        public Nullable<System.DateTime> Date_Facturation { get; set; }
        public string Facture { get; set; }
        public string Adresse_livraison { get; set; }
        public string Adresse_Facturation { get; set; }
        public Nullable<int> Ref_Client_Comm { get; set; }
        public Nullable<int> Ref_Commercial_Comm { get; set; }
    
        public virtual Clients Clients { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Colis> Colis { get; set; }
        public virtual Commerciaux Commerciaux { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Composer> Composer { get; set; }
    }
}
