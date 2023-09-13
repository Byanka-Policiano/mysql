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
create table tbl_quarto_suite(
	id_quarto_suite int primary key,
	capacidade varchar(4),
	preco_noite float(5),
	comodidades varchar(150),
	cama char(1)
);
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
create table tbl_manutenção(
	id_funcionario int,
	id_quarto_suite int,
	foreign key (id_funcionario) references tbl_funcionario(id_funcionario),
	foreign key (id_quarto_suite) references tbl_quarto_suite(id_quarto_suite)
);
create table tbl_organização(
	id_funcionario int,
	id_evento int,
	foreign key (id_funcionario) references tbl_funcionario(id_funcionario),
	foreign key (id_evento) references tbl_evento(id_evento)
);