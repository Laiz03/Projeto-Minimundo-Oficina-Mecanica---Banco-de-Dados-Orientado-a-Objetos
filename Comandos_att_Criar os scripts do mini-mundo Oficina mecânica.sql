-- Definição dos tipos 

create type tp_endereco as (
   id integer,
   rua varchar (50),
   numero int,
   bairro varchar(30),
   cidade varchar(30),
   estado varchar(30)
);

create type tp_mecanico as  (
   id integer,
   nome varchar (50),
   especialidade varchar(50),
   numero int, 
   endereco tp_endereco
);

create type tp_automovel as (
   placa varchar(6),
   modelo varchar(20),
   ano integer,
   id_automovel integer,
   mecanico tp_mecanico
);

create type tp_cliente as (
  id integer,
  nome varchar(50),
  endereco tp_endereco,
  automovel tp_automovel
);

create type tp_p_fisico as  (
   id_pessoaF integer,
   rg integer,
   cpf integer,
   cliente tp_cliente
);

create type tp_p_juridica as  (
   cnpj integer,
   nome_fantasia varchar(50),
   id_pessoaJ integer, 
   cliente tp_cliente
);

create type rel_aut_mec as (
  id integer,
  comissao float,
  data date,
  descricao varchar(100),
  valor_conserto float,
  automovel tp_automovel,
  mecanico tp_mecanico
);


-- Definição das tabelas 

create table endereco of tp_endereco (
  id  primary key
);

create table mecanico of tp_mecanico (
  id  primary key
);

create table relacao of rel_aut_mec (
  id  primary key
);

create table automovel of tp_automovel (
  id_automovel primary key
);

create table cliente of tp_cliente (
  id primary key
);

create table pessoaF of tp_p_fisico (
  id_pessoaF primary key
);

create table pessoaJ of tp_p_juridica (
  id_pessoaJ primary key
);

-- Inserção de dados

INSERT INTO endereco (id, rua, numero, bairro, cidade, estado)
VALUES (1, 'rua tal', 12, 'bairro', 'cidade', 'estado');

SELECT * FROM endereco;


INSERT INTO mecanico (id, nome, especialidade, numero, endereco)
VALUES (1, 'Laiz', 'Carro 4x4', 900118876, ROW(1, 'rua tal', 12, 'bairro', 'cidade', 'estado'));

SELECT * FROM mecanico;


INSERT INTO automovel (placa, modelo, ano, id_automovel, mecanico)
VALUES ('ABC184', 'Fiat', 2022, 1, ROW(1, 'Laiz', 'Carro 4x4', 900118876, ROW(1, 'rua tal', 12, 'bairro', 'cidade', 'estado')));

SELECT * FROM automovel;


INSERT INTO cliente (id, nome, endereco, automovel)
VALUES (1, 'Laíz', ROW(1, 'rua tal', 12, 'bairro', 'cidade', 'estado'), ROW('ABC184', 'Fiat', 2022, 1, ROW(1, 'Laiz', 'Carro 4x4', 900118876, ROW(1, 'rua tal', 12, 'bairro', 'cidade', 'estado'))));

SELECT * FROM cliente;


INSERT INTO pessoaF (id_pessoaF, rg, cpf, cliente)
VALUES (1, 123456789, 987654321, ROW(1, 'Laíz', ROW(1, 'rua tal', 12, 'bairro', 'cidade', 'estado'), ROW('ABC184', 'Fiat', 2022, 1, ROW(1, 'Laiz', 'Carro 4x4', 900118876, ROW(1, 'rua tal', 12, 'bairro', 'cidade', 'estado')))));

SELECT * FROM pessoaF;


INSERT INTO pessoaJ (cnpj, nome_fantasia, id_pessoaJ, cliente)
VALUES (12345, 'Empresa Laiz', 1, ROW(1, 'Laíz', ROW(1, 'rua tal', 12, 'bairro', 'cidade', 'estado'), ROW('ABC184', 'Fiat', 2022, 1, ROW(1, 'Laiz', 'Carro 4x4', 900118876, ROW(1, 'rua tal', 12, 'bairro', 'cidade', 'estado')))));

SELECT * FROM pessoaJ;

--Exclusão de dados 

DELETE FROM pessoaJ; --deletar todas linhas da tabela pessoaJ
SELECT * FROM pessoaJ;

update pessoaF set rg = null; --tira os valores da coluna rg 
SELECT * FROM pessoaF;
