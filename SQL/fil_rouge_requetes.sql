-- Chiffre d'affaire généré pour l'ensemble et par fournisseur

select sum (Quantite * PrixHT_produit)
from svg.Produits
join svg.composer on svg.composer.Id_Produit = svg.Produits.Id_Produit


select sum (Quantite * PrixHT_produit), nom_fournisseur
from svg.Produits
join svg.composer on svg.composer.Id_Produit = svg.Produits.Id_Produit
join svg.fournisseurs on svg.fournisseurs.id_fournisseur = svg.produits.ref_fournisseur
group by nom_fournisseur

--Liste des produits commandés (ref produit, qte commandé)

select Id_Produit, sum(quantite) as 'Quantité commandée'
from svg.composer
group by Id_Produit

--Liste des commandes pour un client (date, ref client, montant)

create proc Commande_Client
	@NomClient varchar(50)
as
select date_commande, svg.commandes.id_client, prix_total_remise
from svg.Commandes 
join svg.clients on svg.clients.id_client = svg.commandes.id_client
where Nom_Client = @NomClient



exec Commande_Client 'CASTLE'

--Répartition du chiffre d'affaire par type de client

create view CA 
as 
select sum (Quantite * PrixHT_produit) as 'Chiffre d''affaire'
from svg.Produits
join svg.composer on svg.composer.Id_Produit = svg.Produits.Id_Produit

create proc Prof
	@prof
as
select sum(quantite*PrixHT_Produit)*100/(select * from ca)
from svg.composer
join svg.produits on svg.composer.Id_Produit = svg.Produits.Id_Produit
join svg.commandes on svg.commandes.id_commande = svg.composer.id_commande
join svg.clients on svg.clients.id_client = svg.commandes.id_client
where Professionnel = @prof

exec prof 1

-- Lister les commandes en cours de livraison.

select svg.commandes.id_commande
from svg.commandes 
join svg.colis on svg.colis.id_commande = svg.commandes.Id_commande
where date_envoi = getdate()


select svg.commandes.id_commande
from svg.commandes 
join svg.colis on svg.colis.id_commande = svg.commandes.Id_commande
where date_envoi is null


--//////////////////////////////////////////////////////////////////////////////////////////


--Créez une procédure stockée qui sélectionne les commandes non soldées (en cours de livraison) 

create proc Commandes_SS
as
select svg.commandes.id_commande
from svg.commandes 
join svg.colis on svg.colis.id_commande = svg.commandes.Id_commande
where Reduction_Supplementaire is null and date_envoi is null 

--puis une autre qui renvoie le délai moyen entre la date de commande et la date de facturation. 

select avg (datediff (day, date_commande, date_envoi))
from svg.commandes
join svg.colis on svg.colis.id_commande = svg.commandes.id_commande


--Créez une vue correspondant à la jointure Produits - Fournisseurs

create view jointure_Pro_Fou
as
select *
from svg.produits
join svg.fournisseurs on svg.fournisseurs.id_fournisseur = svg.produits.ref_fournisseur

select * from jointure_Pro_Fou