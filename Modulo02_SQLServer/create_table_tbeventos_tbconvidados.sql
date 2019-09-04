USE DB_EVENTOS
GO 

-- TESTE DE COMENTARIO
/* TESTE DE COMENTARIO EM BLOCO */

CREATE TABLE TBEventos
(
	Id int not null identity(1,1),
	Descricao varchar(100) not null,
	Responsavel varchar(50) not null,
	Data datetime not null,
	Preco float not null
	primary key (Id)
)
go

CREATE TABLE TBConvidados
(
	Cpf varchar(11) not null,
	IdEvento int not null,
	Nome varchar(50) not null,
	Telefone varchar(50) not null,
	Email varchar(20) not null,
	primary key (Cpf),
	foreign key (IdEvento) references TBEventos(Id)
)