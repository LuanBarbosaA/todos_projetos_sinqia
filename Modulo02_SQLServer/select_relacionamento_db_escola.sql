use DB_ESCOLA
go

/*select * from TBEscola, TBCursos 
where TBEscola.Id = TBCursos.IdEscola
go*/

/*declare @Valor float -- variavel em sql
set @Valor = 1500 -- atribuindo valor 
select E.Descricao as Escola, 
C.Descricao as Descrição, 
E.Endereco as Endereço,
C.Preco as Preço 
from TBEscola as E, TBCursos as C 
--where E.Id = C.IdEscola and C.Preco >= 1500
where E.Id = C.IdEscola and C.Preco >= @Valor
go*/

/*select 
	E.Descricao as Escola,
	E.Telefone as Telefone,
	count(C.Descricao) as Curso
from 
	TBEscola E, TBCursos C
where 
	E.Id = C.IdEscola
group by 
	E.Descricao,
	E.Telefone
go
*/

select 
	E.Descricao as Escola,
	E.Telefone as Telefone,
	count(C.Descricao) as QuantCursos,
	sum(C.Preco) as Total
from 
	TBEscola E, TBCursos C
where 
	E.Id = C.IdEscola
group by 
	E.Descricao, E.Telefone