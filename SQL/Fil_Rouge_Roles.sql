/*------------------------------------------------------------
-- CREATION LOGIN
------------------------------------------------------------*/
use master

drop login admin01
drop login com01
drop login emp01
drop login com02

create login admin01 with password = 'pwd',
default_database = [Village_Green],
check_expiration = OFF,
check_policy = OFF
go

create login com01 with password = 'pwd',
default_database = [Village_Green],
check_expiration = OFF,
check_policy = OFF
go

create login com02 with password = 'pwd',
default_database = [Village_Green],
check_expiration = OFF,
check_policy = OFF
go

create login emp01 with password = 'pwd',
default_database = [Village_Green],
check_expiration = OFF,
check_policy = OFF
go
/*------------------------------------------------------------
-- CREATION USER
------------------------------------------------------------*/
use Village_Green
go

/*drop user REED
drop user BANNER
drop user admin01
drop user Paul
go*/

create user 	REED 		for login 	com01
create user 	BANNER 		for login 	com02
create user 	admin01 	for login 	admin01
create user 	Paul		for login 	emp01
go
/*------------------------------------------------------------
-- CREATION DES ROLES
------------------------------------------------------------*/
/*drop role Administrateur
drop role Commercial
drop role Employer
drop role Client
go*/
create role Administrateur
create role Commercial
create role Employer
create role Client
go
/*------------------------------------------------------------
-- ATTRIBUTION DES ROLES
------------------------------------------------------------*/
execute sp_addrolemember 'Administrateur', 'admin01'
execute sp_addrolemember 'Commercial', 'REED'
execute sp_addrolemember 'Commercial', 'BANNER'
execute sp_addrolemember 'Employer','Paul'
/*------------------------------------------------------------
-- GESTION DES DROITS
------------------------------------------------------------*/
grant select, update, delete on schema ::svg to Administrateur
go

grant select, update, delete on svg.Produits to Employer
grant select, update, delete on svg.Categories to Employer
grant select, update, delete on svg.Sous_Categories to Employer
go

grant select, update, delete on svg.Composer to Commercial
grant select, update, delete on svg.Commandes to Commercial
grant select on schema ::svg to Commercial
go


grant select on svg.Produits to Client 
grant select on svg.Categories to Client
grant select on svg.Sous_Categories to Client
go