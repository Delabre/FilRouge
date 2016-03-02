-- Chiffre d'affaire généré pour l'ensemble et par fournisseur

select sum (Quantite * (Prix_Coefficient - Prix_Achat_Fournisseur))
from svg.Produits
join svg.composer on ref_produit_Comp = id_produit


select sum (Quantite * (Prix_Coefficient - Prix_Achat_Fournisseur)), nom_fournisseur
from svg.Produits
join svg.composer on svg.composer.Ref_Produit_comp = svg.Produits.Id_Produit
join svg.fournisseurs on svg.fournisseurs.Id_fournisseur = svg.produits.ref_fournisseur_Prod
group by nom_fournisseur

--Liste des produits commandés (ref produit, qte commandé)

select ref_Produit_comp as 'Référence Produit', sum(quantite) as 'Quantité commandée'
from svg.composer
group by ref_Produit_comp

--Liste des commandes pour un client (date, ref client, montant)

create proc Commande_Client
	@NomClient varchar(50)
as
select date_commande, ref_client_Comm, prix_total_remise
from svg.Commandes 
join svg.clients on id_client = ref_client_comm
where Nom_Client = @NomClient


exec Commande_Client 'CASTLE'

--Répartition du chiffre d'affaire par type de client

create view CA
as
select sum (Prix_total_remise) as 'Chiffre d''affaire'
from svg.Commandes

create proc Prof
	@prof bit
as
select sum(Prix_Total_Remise)*100/(select * from CA) as '% du chiffre d''affaire'
from svg.Commandes
join svg.clients on id_client = ref_client_Comm
where Professionnel = @prof

exec prof 0

-- Lister les commandes en cours de livraison.

select Id_Commande
from svg.Commandes
where Etat_Commande like 'En cours'


--//////////////////////////////////////////////////////////////////////////////////////////


--Créez une procédure stockée qui sélectionne les commandes non soldées (en cours de livraison) 

create proc Commandes_SS
as
select id_commande
from svg.commandes 
where date_facturation is null and Etat_Commande like 'En cours'

exec Commandes_ss

--puis une autre qui renvoie le délai moyen entre la date de commande et la date de facturation. 

select avg (datediff (day, date_commande, date_Facturation)) as 'délai moyen entre la date de commande et la date de facturation'
from svg.commandes
where date_facturation is not null 


--Créez une vue correspondant à la jointure Produits - Fournisseurs

create view jointure_Pro_Fou
as
select *
from svg.produits
join svg.fournisseurs on id_fournisseur = ref_fournisseur_Prod

select * from jointure_Pro_Fou