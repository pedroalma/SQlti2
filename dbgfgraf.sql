drop database dbgfgraf;

create database dbgfgraf;

use dbgfgraf;

--criar as tabelas com integridade e consistência

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
cpf char(14) not null unique,
salario decimal(9,2) default 0 check(salario >=0),
sexo char(1) default 'F' check(sexo in('F','M')),
primary key(codFunc) 
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar (100) not null,
cpf char(14) not null unique,
primary key(codCli)
);

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar (50) not null,
senha varchar (30) not null,
codFunc int not null,
primary key (codUsu),
foreign key (codFunc)references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100) not null, 
valor decimal (9,2) default 0 check (valor >=0),
qtde int default 0 check(qtde >=0),
dataEnt date,
horaEnt time,
codCli int not null,
primary key(codProd),
foreign key(codCli)references tbClientes(codCli)
);
create table tbVendas(
codVendas int not null auto_increment,
dataVenda date,
horaVenda time,
qtde int default 0 check(qtde >= 0),
codUsu int not null,
codProd int not null,
codCli int not null,
primary key (codVendas),
foreign key (codUsu)references tbUsuarios(codUsu),
foreign key (codProd)references tbProdutos(codProd),
foreign key (codCli)references tbClientes(codcli) 
);

show tables;

desc tbFuncionarios;
desc tbUsuarios;
desc tbClientes;
desc tbProdutos;
desc tbVendas;

--inserindo registros nas tabelas 

--alterado registros nas tabelas

--excluindo 