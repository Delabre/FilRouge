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
	Nom_Categorie 		varchar(40) references svg.Categories(Nom_Categorie),
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
	Id_Produit				int identity,
	Description_Produit 	varchar(2000),
	Libelle_Produit			varchar(50),
	Photo_Produit			varchar(25),
	PrixHT_Produit			money,
	Stock_Produit			int,
	Publication_Produit		bit,
	Nom_Sous_Categorie 		varchar(40) references svg.sous_categories(Nom_Sous_Categorie),
	Id_Fournisseur			int references svg.Fournisseurs(Id_Fournisseur)
	primary key (Id_Produit)
)
/*------------------------------------------------------------
-- Table: CLIENTS
------------------------------------------------------------*/
create table svg.Clients
(
	Id_Client			int identity,
	Nom_Client			varchar(50),
	Prenom_client		varchar(50),
	Coefficient_Client	int,
	Telephone_Client	varchar(10),
	Ville_Client		varchar(30),
	Adresse_Client 		varchar(50),
	Code_Postal			varchar(5),
	Id_Commercial 		int references svg.Commerciaux(Id_Commercial),
	primary key (Id_Client)
)
/*------------------------------------------------------------
-- Table: COMMANDES
------------------------------------------------------------*/
create table svg.Commandes 
(
	Id_commande					int identity,
	Prix_Total_HT				money,
	Prix_Total_Remise			money,
	Reduction_Supplementaire	money,
	Type_Paiement				bit,
	Etat_Commande				varchar(30),
	Date_Commande				date,
	Facture						int,
	Adresse_livraison			varchar(100),
	Adresse_Facturation			varchar(100),
	Id_Client 					int references svg.Clients(Id_Client),
	Id_Commercial 				int references svg.Commerciaux(Id_Commercial),
	primary key (Id_commande)
)
/*------------------------------------------------------------
-- Table: COMPOSER
------------------------------------------------------------*/
create table svg.Composer
(
	Quantite	int,
	Id_Produit	int references svg.Produits(Id_Produit),
	Id_commande int references svg.Commandes(Id_commande),
	primary key (Id_Produit, Id_commande)
)
/*------------------------------------------------------------
-- Table: COLIS
------------------------------------------------------------*/
create table svg.Colis
(
	Id_Colis			int identity,
	Bon_Livraison		int,
	Date_Envoi			date,
	Id_commande 		int references svg.Commandes(Id_commande),
	Reference_Client 	int references svg.Clients(Id_Client),
	primary key (Id_Colis)
)
go
/*------------------------------------------------------------
-- ALIMENTER LA BASE
------------------------------------------------------------*/
insert into svg.Categories (Nom_Categorie)
values ('Guitares'),
		('Claviers'),
		('Instruments ÃƒÂ  vent')
go

insert into svg.Sous_Categories (Nom_Sous_Categorie, Nom_Categorie)
	values 	('Guitares Electrique', 'Guitares'),
			('Synthetiseur','Claviers'),
			('Flutes ÃƒÂ  bec', 'Instruments ÃƒÂ  vent')
go

insert into svg.Fournisseurs (Nom_Fournisseur)
values	('Prix bas'),
		('Prix Haut')
go

insert into svg.Produits (Description_Produit, Libelle_Produit, Photo_Produit, PrixHT_Produit, Stock_Produit,Publication_Produit, Nom_Sous_Categorie, Id_Fournisseur)
values	('Super guitare de la mort qui tue', 'JACK & DANNY 780 7-String Metallic Black' , NULL, 975, 5, NULL, 'Guitares Electrique',1),
		('Synthe de la mort qui pue', 'Yamaha MX 49', NULL, 519, 10, NULL, 'Synthetiseur',1), 
		('Flute qui tue et qui pue', 'YAMAHA YRS-23 SOPRANO RECORDER', NULL, 8, 25, NULL, 'Flutes ÃƒÂ  bec',2)
go

insert into svg.Commerciaux (Nom_Commercial, Prenom_Commercial)
	values 	('REED', 'Richards'),
			('BANNER', 'Bruce')
go

insert into svg.Clients (Nom_Client, Prenom_client, Coefficient_Client, Id_Commercial, Telephone_Client, Ville_Client, Adresse_Client, Code_Postal)
	values 	('CASTLE','Frank', 2, 1,'0645125878', 'PARIS', '24 rue de la rue','75015'),
			('PARKER', 'Peter', 1, 1,'0678988747', 'LYON', '12 rue du bas', '69012'),
			('MURDOCK', 'Matthew', 2, 2,'0650121224', 'PARIS', '3 rue maison','75008')
go

insert into svg.Commandes (Prix_Total_HT, Prix_Total_Remise, Reduction_Supplementaire, Type_Paiement, Etat_Commande, Date_Commande, Facture, Adresse_livraison, Adresse_Facturation, Id_Client, Id_Commercial)
	values	(975, 993, 30, 1, 'Envoyee', '2015/11/15', '00001', '24 rue de la rue 75015 PARIS', '12 rue du bas 69012 LYON', 2, 1),
			(1047, 1079, 20, 1, 'Envoyee', '2015/12/02', '00002', '24 rue de la rue 75015 PARIS', '24 rue de la rue 75015 PARIS', 1, 1),
			(4017, 4117, 100, 1, 'Envoyee', '2015/12/12', '00003', '24 rue de la rue 75015 PARIS', '3 rue maison 75008 PARIS', 3, 2)
go

insert into svg.Composer (Quantite, Id_Produit, Id_commande)
	values	(1,1,1),
			(2,2,2),
			(1,3,2),
			(6,3,3),
			(2,2,3),
			(3,1,3)
go

insert into svg.Colis (Bon_Livraison, Date_Envoi, Id_commande)
	values	('00001', '2015/11/20', 1),
			('00002', '2015/12/08', 2),
			('00003', '2015/12/08', 2),
			('00004', '2015/12/08', 3),
			('00005', '2015/12/08', 3),
			('00006', '2015/12/08', 3)
go