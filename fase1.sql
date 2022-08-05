---------------------------------------------------------------------
-- 1)Quais são todos os projetos com suas atividades;

select 
    projetos.id "ID Projeto", 
    projetos.nome "Nome do Projeto", 
    count(atividades.id) "Quantidade de Atividades" 
    
from        projetos
left join   atividades on projetos.id = atividades.id_projeto 

group by projetos.id, projetos.nome 
order by projetos.id;

---------------------------------------------------------------------
-- 2)Todas as atividades do usuário “oescolhido@letrus.com” no ano de 2022

select 
    usuarios.id, 
    usuarios.login, 
    count(atividades.id) 

from        usuarios
left join   atividades on atividades.id_usuario = usuarios.id

where date_part('year',data_inicio) = 2022

-- do jeito que foi construido não tem mapeado o e-mail na tabela usuarios
-- acabei pegando a pessoa com mais atividades

group by usuarios.id, usuarios.login
order by count desc
limit 1;

---------------------------------------------------------------------
-- 3)Quantidade de atividades por projeto do ano 2021;

select 
    projetos.id "ID Projeto", 
    projetos.nome "Nome do Projeto", 
    count(atividades.id) "Quantidade de Atividades" 
    
from        projetos
left join   atividades on projetos.id = atividades.id_projeto 

where date_part('year',projetos.data_inicio) = 2021

group by projetos.id, projetos.nome 
order by projetos.id;

---------------------------------------------------------------------
-- 4)Lista de atividades em ordem hierárquica do projeto "LetrusTIC”

select 
    projetos.id "ID Projeto", 
    projetos.nome "Nome do Projeto", 
    count(atividades.id) "Quantidade de Atividades" 
    
from        projetos
left join   atividades on projetos.id = atividades.id_projeto 

where projetos.nome like ('%LetrusTIC%')

group by projetos.id, projetos.nome 
order by projetos.id;

-- no caso não existe nenhum projeto chamado 'LetrusTIC'

---------------------------------------------------------------------
-- 5)Exclua o projeto “LetrusTIC”

delete from projetos 
where projetos.nome like ('%LetrusTIC%');

-- mais uma vez, como não temos nenhum registro com esse nome não resulta em nada. 
-- caso você na verdade só queira ocultar do resultado, você pode usar "not like"

---------------------------------------------------------------------
-- 6)Liste todos as pessoas que estão no projeto “Concurso de Redacao”

select 
    projetos.nome "Nome do Projeto", 
    projetos.id_usuario,
    usuarios.login
    
from        projetos
left join   usuarios on projetos.id_usuario = usuarios.id

where projetos.nome like ('%Um sonho de Liberdade%')

order by projetos.id;

---------------------------------------------------------------------
-- 7)Aumente o prazo final em 15 dias de todas as atividades do projeto
“Concurso de Redacao”

update atividades set atividades.data_fim = atividades.data_fim + interval '15 days' 
where atividades.id in (
select 
	atividades.id
from        projetos
left join   atividades on projetos.id = atividades.id_projeto 
where projetos.nome like ('%Concurso de Redacao%'));

---------------------------------------------------------------------
-- 8)Exclua todos as atividades do usuário “João 33”

delete from atividades 
where atividades.id in (
select 
	atividades.id
from        atividades
left join   usuarios on atividades.id_usuario = usuarios.id
where usuarios.nome like ('%João 33%'));

---------------------------------------------------------------------
-- 9)Crei a tabela "endereco” e relacione com o a tabela usuário

create table endereco (
  id int,
  estado varchar,
  cidade varchar,
  bairro varchar,
  rua varchar,
  cep varchar,
  numero int,
  id_usuario int
);

---------------------------------------------------------------------
-- 10) Popule a tabela “endereco”

-- 

---------------------------------------------------------------------
-- 11) Crie uma view que mostre todos os usuários que estão na cidade São Paulo e a nota final esteja entre 7 e 10 pontos

create view saopaulo7mais as 
select usuarios.*

from 		usuarios
left join	endereco on usuarios.id = endereco.id_usuario 
left join	atividades on usuarios.id = atividades.id_usuario
left join 	nota on atividades.id = nota.id_atividade

where true
and endereco.cidade = 'São Paulo'
and nota.nota_final between 7 and 10;
