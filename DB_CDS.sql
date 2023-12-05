create database  DB_CDS;

use DB_CDS;

create table tbARTISTAS(
Cod_art int not null,
Nome_art varchar(100) not null unique,
primary key(Cod_art) 
);
create table tbGRAVADORAS(
Cod_grav int not null,
Nome_grav varchar(100) not null unique,
primary key(Cod_grav)  
);
create table tbCATEGORIAS(
Cod_cat int not null,
Nome_cat varchar(50) not null unique,
primary key(Cod_cat) 
);
create table tbESTADOS(
Sigla_est char(2) not null,
Nome_est varchar(50) not null unique,
primary key(Sigla_est) 
);	
create table tbCIDADES(
Cod_cid int not null,
Sigla_est char(2) not null,
Nome_cid varchar(50) not null,
primary key(Cod_cid),
foreign key(Sigla_est)references tbESTADOS(Sigla_est)
);
create table tbCLIANTES(
Cod_cli int not null,
Cod_cid int not null,
Nome_cli varchar(50) not null,
End_cli varchar(100) not null,
Renda_cli decimal(9,2) not null default 0 check(Renda_cli >= 0),
Sexo_cli char(1) not null default 'F' check(Sexo_cli in ('F','M')),
primary key(Cod_cli),
foreign key(Cod_cid)references tbCIDADES(Cod_cid)
);
create table tbCONJUGE(
Cod_conj int not null, 
Cod_cli int not null ,
Nome_conj varchar(50) not null,
Renda_conj decimal(9,2) not null default 0 check(Renda_cli >=0 ),
Sexo_conj char(1) not null default 'F' check(Sexo_conj in ('F','M')), 
primary key(Cod_conj),
foreign key(Cod_cli)references tbCLIANTES(Cod_cli) 
);
create table tbFuncionarios(
Cod_func int not null,
Nome_func varchar(50) not null,
End_func varchar(100) not null,
Sal_func decimal(9,2) not null default 0 check(Sal_func >=0),
Sexo_func char(1) not null default 'F' check(Sexo_func in ('F','M')),
primary key(Cod_Func)
);
create table tbDEPENDENTES(
Cod_dep int not null,
cod_func int not null,
Nome_dep varchar(100) not null,
Sexo_dep char(1) not null default 'F' check(sexo_dep in ('F','M')), 
);
create table tbTITULOS(
Cod_tit int not null,
Cod_cat int not null,
Cod_grav int not null,
Nome_cd varchar(50) not null unique,
val_cd decimal(9,2) not null
);