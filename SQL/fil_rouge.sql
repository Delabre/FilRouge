use master
go

drop database Village_Green
go

create database Village_Green
go

use Village_Green
go

create schema svg
go
/*------------------------------------------------------------
-- Table: CATEGORIES
------------------------------------------------------------*/
create table svg.Categories
(
	Nom_Categorie	varchar(40),
	primary key (Nom_Categorie)
)
/*------------------------------------------------------------
-- Table: SOUS_CATEGORIES
------------------------------------------------------------*/
create table svg.Sous_Categories
(
	Nom_Sous_Categorie	varchar(40),
	Ref_Categorie		varchar(40) references svg.Categories(Nom_Categorie),
	primary key (Nom_Sous_Categorie)
)
/*------------------------------------------------------------
-- Table: FOURNISSEUR
------------------------------------------------------------*/
create table svg.Fournisseurs
(
	Id_Fournisseur 	int identity,
	Nom_Fournisseur varchar(50)
	primary key (Id_Fournisseur)
)

/*------------------------------------------------------------
-- Table: COMMERCIAUX
------------------------------------------------------------*/
create table svg.Commerciaux
(
	Id_Commercial 		int identity,
	Nom_Commercial 		varchar(50),
	Prenom_Commercial	varchar(50),
	primary key (Id_Commercial)
)
/*------------------------------------------------------------
-- Table: PRODUITS
------------------------------------------------------------*/
create table svg.Produits
(
	Id_Produit					int identity,
	Description_Produit 		varchar(2000),
	Libelle_Produit				varchar(50),
	Photo_Produit				varchar(25),
	Prix_HT_Produit				money,
	Prix_Achat_Fournisseur		money,
	Stock_Produit				int,
	Publication_Produit			bit,
	Ref_Nom_Sous_Categorie_Prod varchar(40) references svg.sous_categories(Nom_Sous_Categorie),
	Ref_Fournisseur_Prod		int references svg.Fournisseurs(Id_Fournisseur)
	primary key (Id_Produit)
)
/*------------------------------------------------------------
-- Table: CLIENTS
------------------------------------------------------------*/
create table svg.Clients
(
	Id_Client			int identity,
	Nom_Client			varchar(50),
	Nom_Societe			Varchar(50),
	Prenom_client		varchar(50),
	Coefficient_Client	int,
	Telephone_Client	varchar(10),
	Ville_Client		varchar(30),
	Adresse_Client 		varchar(50),
	Code_Postal			varchar(5),
	Professionnel		bit,
	Ref_Commercial_clie int references svg.Commerciaux(Id_Commercial),
	primary key (Id_Client)
)
/*------------------------------------------------------------
-- Table: COMMANDES
------------------------------------------------------------*/
create table svg.Commandes 
(
	Id_commande					int identity,
	Prix_Total_HT				money,
	Prix_Total_TTC				money,
	Prix_Total_Remise			money,
	Reduction_Supplementaire	money,
	Type_Paiement				bit,
	Etat_Commande				varchar(30),
	Date_Commande				date,
	Date_Facturation			date,
	Facture						varchar(100),
	Adresse_livraison			varchar(100),
	Adresse_Facturation			varchar(100),
	Ref_Client_Comm 			int references svg.Clients(Id_Client),
	Ref_Commercial_Comm 		int references svg.Commerciaux(Id_Commercial),
	primary key (Id_commande)
)
/*------------------------------------------------------------
-- Table: COMPOSER
------------------------------------------------------------*/
create table svg.Composer
(
	Quantite			int,
	Prix_Coefficient	money,
	Ref_Produit_Comp	int references svg.Produits(Id_Produit),
	Ref_commande_Comp 	int references svg.Commandes(Id_commande),
	primary key (Ref_Produit_Comp, Ref_commande_Comp)
)
/*------------------------------------------------------------
-- Table: COLIS
------------------------------------------------------------*/
create table svg.Colis
(
	Id_Colis			int identity,
	Bon_Livraison		varchar(100),
	Date_Envoi			date,
	Ref_Commande_Coli 	int references svg.Commandes(Id_commande),
	Ref_Client_Coli 	int references svg.Clients(Id_Client),
	primary key (Id_Colis)
)
go
/*------------------------------------------------------------
-- ALIMENTER LA BASE
------------------------------------------------------------*/
insert into svg.Categories (Nom_Categorie)
values 	('Guitares'),
		('Claviers'),
		('Instruments à vent')
go

insert into svg.Sous_Categories (Nom_Sous_Categorie, Ref_Categorie)
	values 	('Guitares Electrique', 'Guitares'),
			('Synthetiseur','Claviers'),
			('Flutes à bec', 'Instruments à vent')
go

insert into svg.Fournisseurs (Nom_Fournisseur)
values	('Prix bas'),
		('Prix Haut')
go

insert into svg.Produits (Description_Produit, Libelle_Produit, Photo_Produit, Prix_HT_Produit, Prix_Achat_Fournisseur, Stock_Produit,Publication_Produit, Ref_Nom_Sous_Categorie_Prod, Ref_Fournisseur_Prod)
values	('Super guitare', 'JACK & DANNY 780 7-String Metallic Black' , NULL, 975, 800, 40, NULL, 'Guitares Electrique', 1),
		('Synthe Super', 'Yamaha MX 49', NULL, 519, 400, 50, NULL, 'Synthetiseur', 1), 
		('Flute cool', 'YAMAHA YRS-23 SOPRANO RECORDER', NULL, 8, 2, 78, NULL, 'Flutes à bec', 2)
go

insert into svg.Commerciaux (Nom_Commercial, Prenom_Commercial)
	values 	('REED', 'Richards'),
			('BANNER', 'Bruce')
go

insert into svg.Clients (Nom_Client, Prenom_client, Nom_Societe, Coefficient_Client, Ref_Commercial_Clie, Telephone_Client, Ville_Client, Adresse_Client, Code_Postal, Professionnel)
	values 	('CASTLE','Frank', NULL, 2, 1,'0645125878', 'PARIS', '24 rue de la rue','75015', 0),
			('PARKER', 'Peter', NULL, 0, 1,'0678988747', 'LYON', '12 rue du bas', '69012', 0),
			('MURDOCK', 'Matthew', 'Los Musicos', 5, 2,'0650121224', 'PARIS', '3 rue maison','75008', 1),
			('ROGERS', 'Steven', NULL, 1, 1, '0644778591', 'AMIENS', '5 rue de la marche', '80000', 0)
go

insert into svg.Commandes (Prix_Total_HT, Prix_Total_TTC, Prix_Total_Remise, Reduction_Supplementaire, Type_Paiement, Facture, Etat_Commande, Date_Commande, Date_Facturation, Adresse_livraison, Adresse_Facturation, Ref_Client_Comm, Ref_Commercial_Comm)
	values	(965.25,1013.51, 1000, 13.51, 1, '00001', 'Envoyee', '2015/11/15','2015/11/15', '12 rue du bas 69012 LYON', '12 rue du bas 69012 LYON', 2, 1),
			(1046,1097.9, 1097.9, 0, 0, '00002', 'Envoyee', '2015/12/02','2015/12/02', '24 rue de la rue 75015 PARIS', '24 rue de la rue 75015 PARIS', 1, 1),
			(3810.45, 4000.97, 3900, 100.97, 1, '00003', 'Envoyee', '2015/12/12','2016/01/01', '3 rue maison 75008 PARIS', '3 rue maison 75008 PARIS', 3, 2),
			(965.25,1013.51, 1000, 13.51, 1, '00004', 'Envoyee', '2015/12/15','2015/12/15', '12 rue du bas 69012 LYON', '12 rue du bas 69012 LYON', 2, 1),
			(23.76, 24.94, 24.94, 0, 1, '00005', 'En cours', '2016/01/06', NULL, '5 rue de la marche 80000 AMIENS','5 rue de la marche 80000 AMIENS', 4, 1)

go

insert into svg.Composer (Quantite, Prix_Coefficient, Ref_Produit_Comp, Ref_commande_Comp)
	values	(1, 955.5, 1, 1),
			(2, 519, 2, 2),
			(1, 8, 3, 2),
			(6, 7.6, 3, 3),
			(2, 493.05, 2, 3),
			(3,926.25, 1, 3),
			(1, 955.5, 1, 4)
go

insert into svg.Colis (Bon_Livraison, Date_Envoi, Ref_commande_Coli)
	values	('00001', '2015/11/20', 1),
			('00002', '2015/12/08', 2),
			('00003', '2015/12/08', 2),
			('00004', '2015/12/20', 3),
			('00005', '2015/12/20', 3),
			('00006', '2015/12/23', 3)
go