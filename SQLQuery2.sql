
-- Criando o banco de dados
create database reserva_de_hotel;
-- Usando o sistema biblioteca
use reserva_de_hotel;
-- Tabela(n_registro, titulo)
create table tbl_cliente(
	id_cliente int primary key,
	nome varchar(26),
	contato char(13),
);
create table tbl_funcionario(
	id_funcionario int primary key,
	nome varchar(26),
	cargo varchar(30)
);
create table tbl_evento(
	id_evento int primary key,
	nome varchar(20),
	dia date,
	horario time,
	num_participantes varchar(400),
	tipo varchar(15)
);
--Alterar o tipo da coluna
ALTER TABLE tbl_evento 
ALTER COLUMN num_participantes int;

create table tbl_quarto_suite(
	id_quarto_suite int primary key,
	capacidade varchar(4),
	preco_noite float(5),
	comodidades varchar(150),
	cama char(1)
);

ALTER TABLE tbl_quarto_suite
ALTER COLUMN capacidade int;

ALTER TABLE tbl_quarto_suite
ALTER COLUMN cama varchar(15);

create table tbl_endereco(
	id_endereco int primary key,
	rua varchar(10),
	numero varchar(3),
	uf char(2),
	cep char(8),
	bairro varchar(20),
	cidade varchar(20)
);
create table tbl_reserva(
	cod_evento int,
	cod_quarto_suite int,
	constraint cod primary key(cod_evento, cod_quarto_suite),
	id_cliente int,
	id_funcionario int,
	id_quarto_suite int,
	id_evento int,
	foreign key (id_cliente) references tbl_cliente(id_cliente),
	foreign key (id_funcionario) references tbl_funcionario(id_funcionario),
	foreign key (id_quarto_suite) references tbl_quarto_suite(id_quarto_suite),
	foreign key (id_evento) references tbl_evento(id_evento)
);

create table tbl_manutencao(
	id_funcionario int,
	id_quarto_suite int,
	foreign key (id_funcionario) references tbl_funcionario(id_funcionario),
	foreign key (id_quarto_suite) references tbl_quarto_suite(id_quarto_suite)
);
-- Alterar o nome da tabela
EXEC sp_rename 'tbl_manutenção', 'tbl_manutencao';


create table tbl_organizacao(
	id_funcionario int,
	id_evento int,
	foreign key (id_funcionario) references tbl_funcionario(id_funcionario),
	foreign key (id_evento) references tbl_evento(id_evento)
);

EXEC sp_rename 'tbl_organização', 'tbl_organizacao';

-- Inserindo os dados na tabela
insert into tbl_cliente(id_cliente, nome, contato)
values (2, 'José', 5581988838195);
--selecionar os dados de uma tabela
select * from tbl_cliente

insert into tbl_endereco(id_endereco, rua, numero, uf, cep, bairro, cidade)
values (5, 'Jerusalém', '12', 'RN', '59088107', 'Neópolis', 'Natal')
select * from tbl_endereco

insert into tbl_evento(id_evento, nome, dia, horario, num_participantes, tipo)
values(3, 'The Weeknd', '2023-12-15', '20:30:00', 12, 'Show')
select * from tbl_evento

insert into tbl_funcionario(id_funcionario, nome, cargo)
values (2, 'Arlindo', 'zelador')
select * from tbl_funcionario

insert into tbl_quarto_suite(id_quarto_suite, capacidade, preco_noite, comodidades, cama)
values (105, 4, 249.99, 'ar-condicionado, televisão, frigobar', 'Queen')
select * from tbl_quarto_suite

insert into tbl_manutencao(id_funcionario, id_quarto_suite)
values (14, 105)
select * from tbl_manutencao
 
insert into tbl_reserva(cod_evento, cod_quarto_suite, id_cliente, id_evento, id_funcionario, id_quarto_suite)
values (5, 12, 2, 3, 14, 105)
select * from tbl_reserva