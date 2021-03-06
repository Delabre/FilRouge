USE [master]
GO
drop database Village_Green
go
/****** Object:  Database [Village_Green]    Script Date: 23/03/2016 15:31:20 ******/
CREATE DATABASE [Village_Green]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Village_Green', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Village_Green.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Village_Green_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Village_Green_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Village_Green] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Village_Green].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Village_Green] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Village_Green] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Village_Green] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Village_Green] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Village_Green] SET ARITHABORT OFF 
GO
ALTER DATABASE [Village_Green] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Village_Green] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Village_Green] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Village_Green] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Village_Green] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Village_Green] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Village_Green] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Village_Green] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Village_Green] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Village_Green] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Village_Green] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Village_Green] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Village_Green] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Village_Green] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Village_Green] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Village_Green] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Village_Green] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Village_Green] SET RECOVERY FULL 
GO
ALTER DATABASE [Village_Green] SET  MULTI_USER 
GO
ALTER DATABASE [Village_Green] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Village_Green] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Village_Green] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Village_Green] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Village_Green] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Village_Green]
GO
/****** Object:  User [REED]    Script Date: 23/03/2016 15:31:20 ******/
CREATE USER [REED] FOR LOGIN [com01] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Paul]    Script Date: 23/03/2016 15:31:20 ******/
CREATE USER [Paul] FOR LOGIN [emp01] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BANNER]    Script Date: 23/03/2016 15:31:20 ******/
CREATE USER [BANNER] FOR LOGIN [com02] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin01]    Script Date: 23/03/2016 15:31:20 ******/
CREATE USER [admin01] FOR LOGIN [admin01] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [Employer]    Script Date: 23/03/2016 15:31:20 ******/
CREATE ROLE [Employer]
GO
/****** Object:  DatabaseRole [Commercial]    Script Date: 23/03/2016 15:31:20 ******/
CREATE ROLE [Commercial]
GO
/****** Object:  DatabaseRole [Client]    Script Date: 23/03/2016 15:31:20 ******/
CREATE ROLE [Client]
GO
/****** Object:  DatabaseRole [Administrateur]    Script Date: 23/03/2016 15:31:20 ******/
CREATE ROLE [Administrateur]
GO
ALTER ROLE [Commercial] ADD MEMBER [REED]
GO
ALTER ROLE [Employer] ADD MEMBER [Paul]
GO
ALTER ROLE [Commercial] ADD MEMBER [BANNER]
GO
ALTER ROLE [Administrateur] ADD MEMBER [admin01]
GO
/****** Object:  Schema [svg]    Script Date: 23/03/2016 15:31:20 ******/
CREATE SCHEMA [svg]
GO
/****** Object:  Table [svg].[Categories]    Script Date: 23/03/2016 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [svg].[Categories](
	[Nom_Categorie] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nom_Categorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [svg].[Clients]    Script Date: 23/03/2016 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [svg].[Clients](
	[Id_Client] [int] IDENTITY(1,1) NOT NULL,
	[Nom_Client] [varchar](50) NULL,
	[Nom_Societe] [varchar](50) NULL,
	[Prenom_client] [varchar](50) NULL,
	[Coefficient_Client] [int] NULL,
	[Telephone_Client] [varchar](10) NULL,
	[Ville_Client] [varchar](30) NULL,
	[Adresse_Client] [varchar](50) NULL,
	[Code_Postal] [varchar](5) NULL,
	[Professionnel] [bit] NULL,
	[Ref_Commercial_clie] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [svg].[Colis]    Script Date: 23/03/2016 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [svg].[Colis](
	[Id_Colis] [int] IDENTITY(1,1) NOT NULL,
	[Bon_Livraison] [varchar](100) NULL,
	[Date_Envoi] [date] NULL,
	[Ref_Commande_Coli] [int] NULL,
	[Ref_Client_Coli] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Colis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [svg].[Commandes]    Script Date: 23/03/2016 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [svg].[Commandes](
	[Id_commande] [int] IDENTITY(1,1) NOT NULL,
	[Prix_Total_HT] [money] NULL,
	[Prix_Total_TTC] [money] NULL,
	[Prix_Total_Remise] [money] NULL,
	[Reduction_Supplementaire] [money] NULL,
	[Type_Paiement] [bit] NULL,
	[Etat_Commande] [varchar](30) NULL,
	[Date_Commande] [date] NULL,
	[Date_Facturation] [date] NULL,
	[Facture] [varchar](100) NULL,
	[Adresse_livraison] [varchar](100) NULL,
	[Adresse_Facturation] [varchar](100) NULL,
	[Ref_Client_Comm] [int] NULL,
	[Ref_Commercial_Comm] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_commande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [svg].[Commerciaux]    Script Date: 23/03/2016 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [svg].[Commerciaux](
	[Id_Commercial] [int] IDENTITY(1,1) NOT NULL,
	[Nom_Commercial] [varchar](50) NULL,
	[Prenom_Commercial] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Commercial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [svg].[Composer]    Script Date: 23/03/2016 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [svg].[Composer](
	[Quantite] [int] NULL,
	[Prix_Coefficient] [money] NULL,
	[Ref_Produit_Comp] [int] NOT NULL,
	[Ref_commande_Comp] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Ref_Produit_Comp] ASC,
	[Ref_commande_Comp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [svg].[Fournisseurs]    Script Date: 23/03/2016 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [svg].[Fournisseurs](
	[Id_Fournisseur] [int] IDENTITY(1,1) NOT NULL,
	[Nom_Fournisseur] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Fournisseur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [svg].[Produits]    Script Date: 23/03/2016 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [svg].[Produits](
	[Id_Produit] [int] IDENTITY(1,1) NOT NULL,
	[Description_Produit] [varchar](2000) NULL,
	[Libelle_Produit] [varchar](50) NULL,
	[Photo_Produit] [varchar](25) NULL,
	[Prix_HT_Produit] [money] NULL,
	[Prix_Achat_Fournisseur] [money] NULL,
	[Stock_Produit] [int] NULL,
	[Publication_Produit] [bit] NULL,
	[Ref_Nom_Sous_Categorie_Prod] [varchar](40) NULL,
	[Ref_Fournisseur_Prod] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Produit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [svg].[Sous_Categories]    Script Date: 23/03/2016 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [svg].[Sous_Categories](
	[Nom_Sous_Categorie] [varchar](40) NOT NULL,
	[Ref_Categorie] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[Nom_Sous_Categorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[jointure_Pro_Fou]    Script Date: 23/03/2016 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[jointure_Pro_Fou]
as
select *
from svg.produits
join svg.fournisseurs on id_fournisseur = ref_fournisseur_Prod
GO
INSERT [svg].[Categories] ([Nom_Categorie]) VALUES (N'Claviers')
INSERT [svg].[Categories] ([Nom_Categorie]) VALUES (N'Guitares')
INSERT [svg].[Categories] ([Nom_Categorie]) VALUES (N'Instruments ÃƒÂ  vent')
SET IDENTITY_INSERT [svg].[Clients] ON 

INSERT [svg].[Clients] ([Id_Client], [Nom_Client], [Nom_Societe], [Prenom_client], [Coefficient_Client], [Telephone_Client], [Ville_Client], [Adresse_Client], [Code_Postal], [Professionnel], [Ref_Commercial_clie]) VALUES (1, N'CASTLE', NULL, N'Frank', 2, N'0645125878', N'PARIS', N'24 rue de la', N'75015', 0, 1)
INSERT [svg].[Clients] ([Id_Client], [Nom_Client], [Nom_Societe], [Prenom_client], [Coefficient_Client], [Telephone_Client], [Ville_Client], [Adresse_Client], [Code_Postal], [Professionnel], [Ref_Commercial_clie]) VALUES (2, N'PARKER', NULL, N'Peter', 0, N'0678988747', N'LYON', N'12 rue du bas', N'69012', 0, 1)
INSERT [svg].[Clients] ([Id_Client], [Nom_Client], [Nom_Societe], [Prenom_client], [Coefficient_Client], [Telephone_Client], [Ville_Client], [Adresse_Client], [Code_Postal], [Professionnel], [Ref_Commercial_clie]) VALUES (3, N'MURDOCK', N'Los Musicos', N'Matthew', 5, N'0650121224', N'PARIS', N'3 rue ici', N'75008', 0, 2)
INSERT [svg].[Clients] ([Id_Client], [Nom_Client], [Nom_Societe], [Prenom_client], [Coefficient_Client], [Telephone_Client], [Ville_Client], [Adresse_Client], [Code_Postal], [Professionnel], [Ref_Commercial_clie]) VALUES (4, N'ROGERS', NULL, N'Steven', 1, N'0644778591', N'AMIENS', N'5 rue de la marche', N'80000', 0, 1)
INSERT [svg].[Clients] ([Id_Client], [Nom_Client], [Nom_Societe], [Prenom_client], [Coefficient_Client], [Telephone_Client], [Ville_Client], [Adresse_Client], [Code_Postal], [Professionnel], [Ref_Commercial_clie]) VALUES (6, N'FURY', NULL, N'Nick', 0, N'0678988747', N'LYON', N'12 rue du bas', N'69012', 0, 2)
INSERT [svg].[Clients] ([Id_Client], [Nom_Client], [Nom_Societe], [Prenom_client], [Coefficient_Client], [Telephone_Client], [Ville_Client], [Adresse_Client], [Code_Postal], [Professionnel], [Ref_Commercial_clie]) VALUES (7, N'BROCK', NULL, N'Eddie', 2, N'0156987845', N'Paris', N'12 rue des rue', N'75002', 0, 1)
INSERT [svg].[Clients] ([Id_Client], [Nom_Client], [Nom_Societe], [Prenom_client], [Coefficient_Client], [Telephone_Client], [Ville_Client], [Adresse_Client], [Code_Postal], [Professionnel], [Ref_Commercial_clie]) VALUES (8, N'WADE', NULL, N'Wilson', 3, N'0612356897', N'Paris', N'15 av bala', N'75002', 0, 1)
INSERT [svg].[Clients] ([Id_Client], [Nom_Client], [Nom_Societe], [Prenom_client], [Coefficient_Client], [Telephone_Client], [Ville_Client], [Adresse_Client], [Code_Postal], [Professionnel], [Ref_Commercial_clie]) VALUES (9, N'STARK', NULL, N'Tony', 0, N'0877894565', N'Blabla', N'2 rue du rue', N'58945', 1, 2)
SET IDENTITY_INSERT [svg].[Clients] OFF
SET IDENTITY_INSERT [svg].[Colis] ON 

INSERT [svg].[Colis] ([Id_Colis], [Bon_Livraison], [Date_Envoi], [Ref_Commande_Coli], [Ref_Client_Coli]) VALUES (1, N'00001', CAST(N'2015-11-20' AS Date), 1, NULL)
INSERT [svg].[Colis] ([Id_Colis], [Bon_Livraison], [Date_Envoi], [Ref_Commande_Coli], [Ref_Client_Coli]) VALUES (2, N'00002', CAST(N'2015-12-08' AS Date), 2, NULL)
INSERT [svg].[Colis] ([Id_Colis], [Bon_Livraison], [Date_Envoi], [Ref_Commande_Coli], [Ref_Client_Coli]) VALUES (3, N'00003', CAST(N'2015-12-08' AS Date), 2, NULL)
INSERT [svg].[Colis] ([Id_Colis], [Bon_Livraison], [Date_Envoi], [Ref_Commande_Coli], [Ref_Client_Coli]) VALUES (4, N'00004', CAST(N'2015-12-20' AS Date), 3, NULL)
INSERT [svg].[Colis] ([Id_Colis], [Bon_Livraison], [Date_Envoi], [Ref_Commande_Coli], [Ref_Client_Coli]) VALUES (5, N'00005', CAST(N'2015-12-20' AS Date), 3, NULL)
INSERT [svg].[Colis] ([Id_Colis], [Bon_Livraison], [Date_Envoi], [Ref_Commande_Coli], [Ref_Client_Coli]) VALUES (6, N'00006', CAST(N'2015-12-23' AS Date), 3, NULL)
SET IDENTITY_INSERT [svg].[Colis] OFF
SET IDENTITY_INSERT [svg].[Commandes] ON 

INSERT [svg].[Commandes] ([Id_commande], [Prix_Total_HT], [Prix_Total_TTC], [Prix_Total_Remise], [Reduction_Supplementaire], [Type_Paiement], [Etat_Commande], [Date_Commande], [Date_Facturation], [Facture], [Adresse_livraison], [Adresse_Facturation], [Ref_Client_Comm], [Ref_Commercial_Comm]) VALUES (1, 965.2500, 1013.5100, 1000.0000, 13.5100, 1, N'Envoyee', CAST(N'2015-11-15' AS Date), CAST(N'2015-11-15' AS Date), N'00001', N'12 rue du bas 69012 LYON', N'12 rue du bas 69012 LYON', 2, 1)
INSERT [svg].[Commandes] ([Id_commande], [Prix_Total_HT], [Prix_Total_TTC], [Prix_Total_Remise], [Reduction_Supplementaire], [Type_Paiement], [Etat_Commande], [Date_Commande], [Date_Facturation], [Facture], [Adresse_livraison], [Adresse_Facturation], [Ref_Client_Comm], [Ref_Commercial_Comm]) VALUES (2, 1046.0000, 1097.9000, 1097.9000, 0.0000, 0, N'Envoyee', CAST(N'2015-12-02' AS Date), CAST(N'2015-12-02' AS Date), N'00002', N'24 rue de la rue 75015 PARIS', N'24 rue de la rue 75015 PARIS', 1, 1)
INSERT [svg].[Commandes] ([Id_commande], [Prix_Total_HT], [Prix_Total_TTC], [Prix_Total_Remise], [Reduction_Supplementaire], [Type_Paiement], [Etat_Commande], [Date_Commande], [Date_Facturation], [Facture], [Adresse_livraison], [Adresse_Facturation], [Ref_Client_Comm], [Ref_Commercial_Comm]) VALUES (3, 3810.4500, 4000.9700, 3900.0000, 100.9700, 1, N'Envoyee', CAST(N'2015-12-12' AS Date), CAST(N'2016-01-01' AS Date), N'00003', N'3 rue maison 75008 PARIS', N'3 rue maison 75008 PARIS', 3, 2)
INSERT [svg].[Commandes] ([Id_commande], [Prix_Total_HT], [Prix_Total_TTC], [Prix_Total_Remise], [Reduction_Supplementaire], [Type_Paiement], [Etat_Commande], [Date_Commande], [Date_Facturation], [Facture], [Adresse_livraison], [Adresse_Facturation], [Ref_Client_Comm], [Ref_Commercial_Comm]) VALUES (4, 965.2500, 1013.5100, 1000.0000, 13.5100, 1, N'Envoyee', CAST(N'2015-12-15' AS Date), CAST(N'2015-12-15' AS Date), N'00004', N'12 rue du bas 69012 LYON', N'12 rue du bas 69012 LYON', 2, 1)
INSERT [svg].[Commandes] ([Id_commande], [Prix_Total_HT], [Prix_Total_TTC], [Prix_Total_Remise], [Reduction_Supplementaire], [Type_Paiement], [Etat_Commande], [Date_Commande], [Date_Facturation], [Facture], [Adresse_livraison], [Adresse_Facturation], [Ref_Client_Comm], [Ref_Commercial_Comm]) VALUES (5, 23.7600, 24.9400, 24.9400, 0.0000, 1, N'En cours', CAST(N'2016-01-06' AS Date), NULL, N'00005', N'5 rue de la marche 80000 AMIENS', N'5 rue de la marche 80000 AMIENS', 4, 1)
SET IDENTITY_INSERT [svg].[Commandes] OFF
SET IDENTITY_INSERT [svg].[Commerciaux] ON 

INSERT [svg].[Commerciaux] ([Id_Commercial], [Nom_Commercial], [Prenom_Commercial]) VALUES (1, N'REED', N'Richards')
INSERT [svg].[Commerciaux] ([Id_Commercial], [Nom_Commercial], [Prenom_Commercial]) VALUES (2, N'BANNER', N'Bruce')
SET IDENTITY_INSERT [svg].[Commerciaux] OFF
INSERT [svg].[Composer] ([Quantite], [Prix_Coefficient], [Ref_Produit_Comp], [Ref_commande_Comp]) VALUES (1, 955.5000, 1, 1)
INSERT [svg].[Composer] ([Quantite], [Prix_Coefficient], [Ref_Produit_Comp], [Ref_commande_Comp]) VALUES (3, 926.2500, 1, 3)
INSERT [svg].[Composer] ([Quantite], [Prix_Coefficient], [Ref_Produit_Comp], [Ref_commande_Comp]) VALUES (1, 955.5000, 1, 4)
INSERT [svg].[Composer] ([Quantite], [Prix_Coefficient], [Ref_Produit_Comp], [Ref_commande_Comp]) VALUES (2, 519.0000, 2, 2)
INSERT [svg].[Composer] ([Quantite], [Prix_Coefficient], [Ref_Produit_Comp], [Ref_commande_Comp]) VALUES (2, 493.0500, 2, 3)
INSERT [svg].[Composer] ([Quantite], [Prix_Coefficient], [Ref_Produit_Comp], [Ref_commande_Comp]) VALUES (1, 8.0000, 3, 2)
INSERT [svg].[Composer] ([Quantite], [Prix_Coefficient], [Ref_Produit_Comp], [Ref_commande_Comp]) VALUES (6, 7.6000, 3, 3)
SET IDENTITY_INSERT [svg].[Fournisseurs] ON 

INSERT [svg].[Fournisseurs] ([Id_Fournisseur], [Nom_Fournisseur]) VALUES (1, N'Prix bas')
INSERT [svg].[Fournisseurs] ([Id_Fournisseur], [Nom_Fournisseur]) VALUES (2, N'Prix Haut')
SET IDENTITY_INSERT [svg].[Fournisseurs] OFF
SET IDENTITY_INSERT [svg].[Produits] ON 

INSERT [svg].[Produits] ([Id_Produit], [Description_Produit], [Libelle_Produit], [Photo_Produit], [Prix_HT_Produit], [Prix_Achat_Fournisseur], [Stock_Produit], [Publication_Produit], [Ref_Nom_Sous_Categorie_Prod], [Ref_Fournisseur_Prod]) VALUES (1, N'Super guitare de la mort qui tue', N'JACK & DANNY 780 7-String Metallic Black', NULL, 975.0000, 800.0000, 40, NULL, N'Guitares Electrique', 1)
INSERT [svg].[Produits] ([Id_Produit], [Description_Produit], [Libelle_Produit], [Photo_Produit], [Prix_HT_Produit], [Prix_Achat_Fournisseur], [Stock_Produit], [Publication_Produit], [Ref_Nom_Sous_Categorie_Prod], [Ref_Fournisseur_Prod]) VALUES (2, N'Synthe de la mort qui pue', N'Yamaha MX 49', NULL, 519.0000, 400.0000, 50, NULL, N'Synthetiseur', 1)
INSERT [svg].[Produits] ([Id_Produit], [Description_Produit], [Libelle_Produit], [Photo_Produit], [Prix_HT_Produit], [Prix_Achat_Fournisseur], [Stock_Produit], [Publication_Produit], [Ref_Nom_Sous_Categorie_Prod], [Ref_Fournisseur_Prod]) VALUES (3, N'Flute qui tue et qui pue', N'YAMAHA YRS-23 SOPRANO RECORDER', NULL, 8.0000, 2.0000, 78, NULL, N'Flutes ÃƒÂ  bec', 2)
SET IDENTITY_INSERT [svg].[Produits] OFF
INSERT [svg].[Sous_Categories] ([Nom_Sous_Categorie], [Ref_Categorie]) VALUES (N'Flutes ÃƒÂ  bec', N'Instruments ÃƒÂ  vent')
INSERT [svg].[Sous_Categories] ([Nom_Sous_Categorie], [Ref_Categorie]) VALUES (N'Guitares Electrique', N'Guitares')
INSERT [svg].[Sous_Categories] ([Nom_Sous_Categorie], [Ref_Categorie]) VALUES (N'Synthetiseur', N'Claviers')
ALTER TABLE [svg].[Clients]  WITH CHECK ADD FOREIGN KEY([Ref_Commercial_clie])
REFERENCES [svg].[Commerciaux] ([Id_Commercial])
GO
ALTER TABLE [svg].[Colis]  WITH CHECK ADD FOREIGN KEY([Ref_Client_Coli])
REFERENCES [svg].[Clients] ([Id_Client])
GO
ALTER TABLE [svg].[Colis]  WITH CHECK ADD FOREIGN KEY([Ref_Commande_Coli])
REFERENCES [svg].[Commandes] ([Id_commande])
GO
ALTER TABLE [svg].[Commandes]  WITH CHECK ADD FOREIGN KEY([Ref_Client_Comm])
REFERENCES [svg].[Clients] ([Id_Client])
GO
ALTER TABLE [svg].[Commandes]  WITH CHECK ADD FOREIGN KEY([Ref_Commercial_Comm])
REFERENCES [svg].[Commerciaux] ([Id_Commercial])
GO
ALTER TABLE [svg].[Composer]  WITH CHECK ADD FOREIGN KEY([Ref_commande_Comp])
REFERENCES [svg].[Commandes] ([Id_commande])
GO
ALTER TABLE [svg].[Composer]  WITH CHECK ADD FOREIGN KEY([Ref_Produit_Comp])
REFERENCES [svg].[Produits] ([Id_Produit])
GO
ALTER TABLE [svg].[Produits]  WITH CHECK ADD FOREIGN KEY([Ref_Fournisseur_Prod])
REFERENCES [svg].[Fournisseurs] ([Id_Fournisseur])
GO
ALTER TABLE [svg].[Produits]  WITH CHECK ADD FOREIGN KEY([Ref_Nom_Sous_Categorie_Prod])
REFERENCES [svg].[Sous_Categories] ([Nom_Sous_Categorie])
GO
ALTER TABLE [svg].[Sous_Categories]  WITH CHECK ADD FOREIGN KEY([Ref_Categorie])
REFERENCES [svg].[Categories] ([Nom_Categorie])
GO
USE [master]
GO
ALTER DATABASE [Village_Green] SET  READ_WRITE 
GO
