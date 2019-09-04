-- Luan Barbosa
--OK Luan
use DB_VENDAS
go 

create table TBClientes 
(
	Documento varchar(14) not null,
	Nome varchar(60) not null,
	Telefone varchar(20) not null,
	Email varchar(20) not null
	primary key (Documento)
)
go

create table TBPedidos 
(
	Id int not null identity(1,1),
	DocCliente varchar(14) not null,
	Data datetime not null,
	NumeroPedido varchar(20) not null,
	primary key (Id),
	foreign key (DocCliente) references TBClientes(Documento)
)
go

create table TBCategorias
(
	Id int not null identity(1,1),
	Descricao varchar(20) not null
	primary key (Id)
)
go

create table TBProdutos
(
	Id int not null identity(1,1),
	IdCategoria int not null,
	Descricao varchar(50) not null,
	Unidade varchar(10) not null,
	Foto varbinary(MAX) not null,
	MimeType varchar(20) not null,
	primary key (Id),
	foreign key(IdCategoria) references TBCategorias(Id)
)
go


create table TBItens
(
	Id int not null identity(1,1),
	IdPedido int not null,
	IdProduto int not null,
	primary key (Id),
	foreign key (IdPedido) references TBPedidos(Id),
	foreign key (IdProduto) references TBProdutos(Id),
)
go