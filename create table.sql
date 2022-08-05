-- Letrus create table script

create table projetos (
  id int,
  nome varchar,
  data_inicio date,
  data_fim date,
  id_usuario int
);


create table usuarios (
  id int,
  nome varchar,
  login varchar,
  id_ativo varchar,
  id_sexo varchar
);

create table atividades (
  id int,
  nome varchar,
  data_inicio date,
  data_fim date,
  id_projeto int,
  id_usuario int
);

create table sexo (
  id int,
  descricao varchar
);

create table ativo (
  id int,
  descricao varchar
);

create table nota (
  id_nota int,
  id_atividade int,
  nota1 int,
  nota2 int,
  nota3 int,
  nota4 int,
  nota_final int
);