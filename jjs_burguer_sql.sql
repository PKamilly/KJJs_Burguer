drop database if exists jjs_burguer;
create database jjs_burguer;
use jjs_burguer;

create table Cliente (
	cliente_id int(12) primary key not null,
	cliente_nome varchar(50) not null,
	cliente_email varchar(25) null,
	cliente_data_cadastro date
);
create table Produto (
	produto_id int(2) primary key not null auto_increment,
	produto_nome varchar(50) not null,
	produto_categoria varchar(25) not null,
	produto_preco decimal(10,2) not null,
    produto_estoque int(3) not null
);
create table Pedido (
	pedido_id int(2) primary key not null auto_increment,
    cliente_id int(12) not null,
	pedido_data date not null,
	pedido_valor_total decimal(10,2) not null,
    pedido_status varchar(100) null,
    foreign key (cliente_id) references Cliente(cliente_id)
);

select * FROM Cliente;
select cliente_nome as 'Nome', cliente_email as 'Email', cliente_data_cadastro as 'Data Cadastrado'
from Cliente as cli
order by cliente_nome asc;

select * from Produto;
select produto_nome as 'Nome', produto_categoria as 'Categoria', produto_preco as 'Preço', produto_estoque as 'Estoque'
from Produto as prod
order by produto_nome asc;

select * from Pedido;
select ped.pedido_data as 'Data do Pedido', cli.cliente_nome as 'Cliente', ped.pedido_valor_total as 'Valor Total', ped.pedido_status as 'Status'
from Pedido as ped, Cliente as cli
order by ped.pedido_data asc;




select cliente_nome as 'Cliente', COUNT(*)
from Pedido as ped, Cliente as cli
order by cli.cliente_nome asc;