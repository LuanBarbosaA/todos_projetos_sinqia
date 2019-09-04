-- Luan Barbosa
--Perfeito Luan

use DB_CLINICA
go 

create table TBConvenios
(
	Id int not null identity(1,1),
	CpfPaciente varchar(11) not null,
	Nome varchar(60),
	Descricao varchar(200),
	primary key (Id)
)
go

create table TBPacientes
(
	Cpf varchar(11) not null,
	IdConvenio int not null,
	Nome varchar(60) not null,
	Telefone varchar(9) not null,
	Email varchar(20) not null
	primary key(Cpf)
	foreign key (IdConvenio) references TBConvenios(Id),
)
go 

create table TBMedicamentos
(
	Codigo int not null identity(1,1),
	Nome varchar(200) not null,
	Quantidade int not null,
	Descricao varchar(200) not null,
	PrecoUnitario money not null,
	Unidade varchar(15) not null,
	primary key (Codigo)
)
go 

create table TBTratamentos
(
	Codigo int not null identity(1,1),
	CpfPaciente varchar(11) not null,
	Tipo varchar(10) not null check (Tipo in ('Medicamento', 'Material')),
	Descricao varchar(200) not null,
	Preco money not null,
	InicioProcedimento datetime not null, --duração
	FimProcedimento datetime not null, --duração
	primary key (Codigo),
	foreign key (CpfPaciente) references TBPacientes(Cpf)
)
go

create table TBTratamentos_Medicamentos
(
	Id int not null,
	CodMedicamentos int not null,
	CodTratamentos int not null,
	primary key (Id),
	foreign key (CodMedicamentos) references TBMedicamentos(Codigo),
	foreign key (CodTratamentos) references TBTratamentos(Codigo)
)
go

create table TBTratamentos_Pacientes
(
	Id int not null identity(1,1),
	CpfPaciente varchar(11) not null,
	CodTratamento int not null,
	Quantidade int not null,
	primary key (Id),
	foreign key (CpfPaciente) references TBPacientes(Cpf),
	foreign key (CodTratamento) references TBTratamentos(Codigo)
)
go
