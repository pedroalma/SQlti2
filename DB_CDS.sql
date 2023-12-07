drop database DB_CDS;

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

create table tbCLINTES(
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
Renda_conj decimal(9,2) not null default 0 check(Renda_conj>=0 ),
Sexo_conj char(1) not null default 'F' check(Sexo_conj in ('F','M')), 
primary key(Cod_conj),
foreign key(Cod_cli)references tbCLINTES(Cod_cli) 
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
primary key(Cod_dep),
foreign key(Cod_func)references tbFuncionarios(Cod_func)
);

create table tbTITULOS(
Cod_tit int not null,
Cod_cat int not null,
Cod_grav int not null,
Nome_cd varchar(50) not null unique,
val_cd decimal(9,2) not null check(val_cd > 0 ),
qtd_estq int not null check(qtd_estq >= 0 ),
primary key(Cod_tit),
foreign key(Cod_cat)references tbCATEGORIAS(Cod_cat),
foreign key(Cod_grav)references tbGRAVADORAS(Cod_grav)
);

create table tbPEDIDOS(
Num_ped int not null,
Cod_cli int not null,
cod_func int not null,
data_ped datetime not null,
val_ped decimal(9,2) not null default 0 check(val_ped >=0 ),
primary key(Num_ped),
foreign key(Cod_cli)references tbCLINTES(Cod_cli),
foreign key(cod_func)references tbFuncionarios(cod_func)  
);

create table tbTITULOS_PEDIDO(
Num_ped int not null,
Cod_tit int not null,
qtd_cd int not null check(qtd_cd >=1 ),
val_cd decimal(9,2) not null check(val_cd > 0 ),
foreign key(Num_ped)references tbPEDIDOS(Num_ped),
foreign key(Cod_tit)references tbTITULOS(Cod_tit)
);

create table tbTITULOS_ARTISTA(
Cod_tit int not null,
Cod_art int not null,
foreign key(Cod_tit)references tbTITULOS(Cod_tit),
foreign key(Cod_art)references tbARTISTAS(Cod_art)
);

desc tbARTISTAS; 

desc tbGRAVADORAS;

desc tbCATEGORIAS;

desc tbESTADOS;

desc tbCIDADES;

desc tbCLINTES;

desc  tbCONJUGE;

desc tbFuncionarios;

desc tbDEPENDENTES;

desc tbTITULOS;

desc  tbPEDIDOS;

desc tbTITULOS_PEDIDO;

desc tbTITULOS_ARTISTA;

insert into tbARTISTAS(Cod_art,Nome_art)values(1,'marisa monte'); 
insert into tbARTISTAS(Cod_art,Nome_art)values(2,'gilberto gil'); 
insert into tbARTISTAS(Cod_art,Nome_art)values(3,'caetano veloso'); 	
insert into tbARTISTAS(Cod_art,Nome_art)values(4,'milton nascimento'); 
insert into tbARTISTAS(Cod_art,Nome_art)values(5,'legiao urbana');
insert into tbARTISTAS(Cod_art,Nome_art)values(6,'the beatles'); 
insert into tbARTISTAS(Cod_art,Nome_art)values(7,'rita lee');

insert into tbGRAVADORAS(Cod_grav,Nome_grav)values(1,'polygram');
insert into tbGRAVADORAS(Cod_grav,Nome_grav)values(2,'emi'); 
insert into tbGRAVADORAS(Cod_grav,Nome_grav)values(3,'som livre'); 
insert into tbGRAVADORAS(Cod_grav,Nome_grav)values(4,'som music');  
