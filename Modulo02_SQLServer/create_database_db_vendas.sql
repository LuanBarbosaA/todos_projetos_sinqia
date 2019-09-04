use master
go

CREATE DATABASE DB_VENDAS
ON
(
	NAME = DB_EVENTOS_DAT,
	FILENAME = N'C:\Users\sinqia\Documents\Sinqia_AspNet\Data\DbVendas.mdf',
	SIZE = 5000KB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 1000KB
)
LOG ON
(
	NAME = DB_EVENTOS_LOG,
	FILENAME = N'C:\Users\sinqia\Documents\Sinqia_AspNet\Data\DbVendas_log.ldf',
	SIZE = 2000KB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 1000KB
)
go 