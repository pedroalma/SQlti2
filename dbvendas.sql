drop database dbvendas;

create database dbvendas;

use dbvendas;

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
telefone varchar(45) not null,
email varchar(45) not null unique,
primary key(codCli)
);
create table tbVendedor(
codVen int not null auto_increment,
nome varchar(45) not null,
primary key(codVen)
);	
create table tbPagamentos(
codPag int not null auto_increment,
fpagamento varchar(45),
primary key(codPag)
);
create table tbVendas(
codVenda int not null auto_increment,
valor DECIMAL(10,2) default 0 check(valor >=0),
data datetime,
codCli int not null,
codVen int not null,
codPag int not null, 
primary key(codVenda),
foreign key(codCli)references tbClientes(codCli),
foreign key(codVen)references tbVendedor(codVen),
foreign key(codPag)references tbPagamentos(codPag)
);
create table tbCategoria(
codCat int not null auto_increment,
nome varchar(45),
primary key(codCat)
);
create table tbFornecedores(
codFor int not null auto_increment,
cnpj varchar(45),
nome varchar(45),
primary key(codFor)
);
create table tbProdutos(
codPro int not null auto_increment,
nome varchar(45),
preco DECIMAL(10,2) default 0 check(preco >=0),
qtd varchar(45),
codCat int not null,
codFor int not null,
primary key(codPro),
foreign key(codCat)references tbCategoria(codCat),
foreign key(codFor)references tbFornecedores(codFor)
);
create table tbvenda_has_produtos(
codVenda int not null,
codPro int not null,
foreign key(codVenda)references tbVendas(codVenda),
foreign key(codPro)references tbProdutos(Codpro)
);

insert into tbClientes(nome,telefone,email)values('pedro almeida','95623-5142','pedroalmeida@gmail.com');
insert into tbClientes(nome,telefone,email)values('pedro alma','97132-5412','pedroalma@gmail.com');

insert into tbVendedor(nome)values('caio');	
insert into tbVendedor(nome)values('kauan');

insert into tbPagamentos(fpagamento)values('cartao');	
insert into tbPagamentos(fpagamento)values('cartao');	

insert into tbVendas(valor,data)values(10000.00,'2023/11/30');	
insert into tbVendas(valor,data)values(15000.00,'2023/11/30');	



show tables;


desc tbClientes;
desc tbVendedor;
desc tbPagamentos;
desc tbVendas;
desc tbCategoria;
desc tbFornecedores;
desc tbProdutos;
desc tbvenda_has_produtos;

select * from tbClientes;
select * from tbVendedor;
select * from tbPagamentos;
select * from tbVendas;