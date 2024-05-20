-- Criação de tabelas (DDL) 
create table cliente (
	idcliente integer not null,
	nome varchar(50) not null,
	cpf char(11),
	rg varchar(15),
	genero char(1),
	profissao varchar(30),
	nacionalidade varchar(20),
	logradouro varchar(40),
	numero varchar(10),
	complemento varchar(20),
	bairro varchar(30),
	municipio varchar(30),
	uf varchar(20),
	observacao text,

	--primary key
	constraint pk_cln_idcliente primary key (idcliente)
)

-- Inserção de Dados
insert into cliente(idcliente, nome, cpf, rg, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (1, 'Ryu', 12345678901, 97531, 'M', 'Developer', 'Japonesa', 'Rua Alcantares Torres', 572, 'Casa', 'Vila Quintino', 'Praia Grande', 'SP');

insert into cliente(idcliente, nome, cpf, rg, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (2, 'Geraldo', 12343299291, 56565, 'M', 'Engenheiro', 'Brasileira', 'Rua das Limas', 200, 'Ap.', 'Centro', 'P. Grande', 'SP');

insert into cliente(idcliente, nome, cpf, rg, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (3, 'Carlos', 87732323227, 55463, 'M', 'Pedreiro', 'Brasileira', 'Rua das Laranjeiras', 300, 'Apart.', 'Cto.', 'Canoinhas', 'SP');

insert into cliente(idcliente, nome, cpf, rg, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (4, 'Adriana', 12321222122, 98777, 'F', 'Jornalista', 'Brasileira', 'Rua das Limas', 240, 'Casa', 'São Pedro', 'Porto Vitória', 'PR');

insert into cliente(idcliente, nome, cpf, rg, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (5, 'Amanda', 99982838828, 56565, 'F', 'Jorn.', 'Italiana', 'Av. Central', 100, null, 'São Pedro', 'General Carneiro', 'PR');

insert into cliente(idcliente, nome, cpf, rg, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (6, 'Anderson', null, null, 'M', 'Prof.', 'Italiano', 'Av. Brasil', 100, 'Apartamento', 'Ctr.', 'Rio de Janeiro', 'RJ');

insert into cliente(idcliente, nome, cpf, rg, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (7, 'Cristiano', null, null, 'M', 'Estudante', 'Alemão', 'Rua do Centro', 877, 'Casa', 'Centro', 'Porto Alegre', 'RS');

insert into cliente(idcliente, nome, cpf, rg, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (8, 'Gilmar', 88881818181, 888, 'M', 'Estud.', null, 'Rua das Laranjeiras', 200, null, 'C. Nova', 'Porto União', 'SC');

insert into cliente(idcliente, nome, cpf, rg, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (9, 'Jessica', null, null, 'F', 'Estudante', null, null, null, null, null, 'PU', 'SC');

-- consultas (DML) // execute cada linha independentemente.
select * from cliente;

select 'CPF: ' || cpf || ' RG: ' || rg as "CPF e RG" from cliente; -- concatena as duas colunas

select * from cliente limit 3;

select nome from cliente where nome like 'A%';

select nome, rg from cliente where rg is null;

update cliente set nome='Cristian' where idcliente=7;

insert into cliente(idcliente, nome, cpf, rg, genero, profissao, municipio, uf)
values (10, 'Maicon', 12349596421, 1234, 'F', 'Empresario', 'Florianópolis', 'PR');

insert into cliente(idcliente, nome, rg, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (11, 'Getúlio', 4631, 'F', 'Estudante', 'Brasileira', 'Rua Central', 343, 'Apartamento', 'Centro', 'Curitiba', 'SC');

insert into cliente(idcliente, nome, genero, profissao, nacionalidade, numero, complemento)
values (12, 'Sandra', 'M', 'Professor', 'Italiana', 12, 'Bloco A');

select * from cliente order by idcliente desc;

update cliente set cpf=45390569432 where idcliente=10;
update cliente set genero='M' where nome='Maicon';
update cliente set nacionalidade='Brasileira' where idcliente=10;
update cliente set uf='SC' where idcliente=10;

update cliente set genero='M' where idcliente=11;

update cliente set genero='F' where idcliente=12;
update cliente set profissao='Professora' where idcliente=12;
update cliente set numero=123 where idcliente=12;

delete from cliente where idcliente=10;
delete from cliente where idcliente=12;

update cliente set idcliente=10 where idcliente=11;

-- Criação de novas tabelas para padronização dos dados
create table profissao (
	idprofissao integer not null,
	nome varchar(30) not null,

	constraint pk_prf_idprofissao primary key (idprofissao),
	constraint un_prf_nome unique (nome)
);

-- Agora vamos visualizar quais profissoes tem na base de dados e inserir na nova tabela
select profissao from cliente;

insert into profissao (idprofissao, nome) values (1, 'Desenvolvedor');
insert into profissao (idprofissao, nome) values (2, 'Engenheiro');
insert into profissao (idprofissao, nome) values (3, 'Pedreiro');
insert into profissao (idprofissao, nome) values (4, 'Jornalista');
insert into profissao (idprofissao, nome) values (5, 'Professor');
insert into profissao (idprofissao, nome) values (6, 'Estudante');

create table nacionalidade (
	idnacionalidade integer not null,
	nome varchar(30) not null,

	constraint pk_ncn_idnacionalidade primary key (idnacionalidade),
	constraint un_ncn_nome unique (nome) 
);

select * from nacionalidade;

insert into nacionalidade (idnacionalidade, nome)
values (1, 'Japonesa');

insert into nacionalidade (idnacionalidade, nome)
values (2, 'Brasileira');

insert into nacionalidade (idnacionalidade, nome)
values (3, 'Italiana');

insert into nacionalidade (idnacionalidade, nome)
values (4, 'Alemã');

create table complemento (
	idcomplemento integer not null,
	nome varchar(20) not null,

	constraint pk_cpl_idcomplemento primary key (idcomplemento),
	constraint un_cpl_nome unique (nome)
);

select complemento from cliente;

insert into complemento (idcomplemento, nome) values (1, 'Casa');
insert into complemento (idcomplemento, nome) values (2, 'Apartamento');


create table bairro (
	idbairro integer not null,
	nome varchar(30) not null,

	constraint pk_brr_idbairro primary key (idbairro),
	constraint un_brr_nome unique (nome)
);

select bairro from cliente;

insert into bairro (idbairro, nome) values (1, 'Vila Quintino');
insert into bairro (idbairro, nome) values (2, 'Centro');
insert into bairro (idbairro, nome) values (3, 'São Pedro');
insert into bairro (idbairro, nome) values (4, 'Cidade Nova');

-- Linkando essas tabelas com a de cliente:
-- Anote e depois apague todos os dados da coluna profissao, para que criemos um novo com o id deles, assim estabelecendo a chave estrangeira.

select * from cliente;
-- Desenvolvedor -> cliente  1
-- Engenheiro -> cliente  2
-- Pedreiro -> cliente  3
-- Jornalista -> cliente  4, 5
-- Professor -> cliente  6
-- Estudante -> cliente 8, 9, 7, 10

alter table cliente drop profissao;
alter table cliente add idprofissao integer;
update cliente set idprofissao=1 where idcliente=1;
update cliente set idprofissao=2 where idcliente=2;
update cliente set idprofissao=3 where idcliente=3;
update cliente set idprofissao=4 where idcliente in (4, 5);
update cliente set idprofissao=5 where idcliente=6;
update cliente set idprofissao=6 where idcliente in (8, 9, 7, 10);

alter table cliente add constraint fk_cln_idprofissao foreign key (idprofissao) references profissao (idprofissao);

select * from cliente;

delete from profissao where idprofissao=1; --Aqui é a prova que o FK foi definido, já que se torna impossivel deletar um dado que steja sendo referenciado em outra tabela.

--deletando outras colunas para definir FK
alter table cliente drop bairro;
alter table cliente add idbairro integer;

select * from bairro;
update cliente set idbairro=1 where idcliente=1;
update cliente set idbairro=2 where idcliente in (2, 3, 6, 7);
update cliente set idbairro=3 where idcliente in (4, 5);
update cliente set idbairro=4 where idcliente=8;

alter table cliente add constraint fk_cln_idbairro foreign key (idbairro) references bairro (idbairro);

select idcliente, nacionalidade from cliente;
-- Brasileira -> cliente 10, 2, 3, 4
-- Japonesa -> cliente 1
-- Italiana -> cliente 6, 5
-- Alemã -> cliente 7

alter table cliente drop nacionalidade;
alter table cliente add idnacionalidade integer;
update cliente set idnacionalidade=1 where idcliente=1;
update cliente set idnacionalidade=2 where idcliente in (10, 2, 3, 4);
update cliente set idnacionalidade=3 where idcliente in (6, 5);
update cliente set idnacionalidade=4 where idcliente=7;
alter table cliente add constraint fk_cln_idnacionalidade foreign key (idnacionalidade) references nacionalidade (idnacionalidade);

select idcliente, complemento from cliente;
-- Casa -> 1, 4, 7
-- Apartamento -> 10, 2, 3, 6

alter table cliente drop complemento;
alter table cliente add idcomplemento integer;
select * from cliente;
update cliente set idcomplemento=1 where idcliente in (1, 4, 7);
update cliente set idcomplemento=2 where idcliente in (10, 2, 3, 6);

alter table cliente add constraint fk_cl_idcomplemento foreign key (idcomplemento) references complemento (idcomplemento);

alter table cliente drop municipio;
create table municipio (
	idmunicipio integer not null,
	nome varchar(30) not null,

	constraint pk_mnc_idmunicipio primary key (idmunicipio),
	constraint ub_mnc_idmunicipio unique (nome)
);

insert into municipio (idmunicipio, nome) values (1, 'Porto União');
insert into municipio (idmunicipio, nome) values (2, 'General Carneiro');
insert into municipio (idmunicipio, nome) values (3, 'Praia Grande');
insert into municipio (idmunicipio, nome) values (4, 'Porto Vitória');
insert into municipio (idmunicipio, nome) values (5, 'Porto Alegre');
insert into municipio (idmunicipio, nome) values (6, 'Curitiba');
insert into municipio (idmunicipio, nome) values (7, 'Canoinhas');
insert into municipio (idmunicipio, nome) values (8, 'Rio de Janeiro');

-- Porto União -> 9, 8
-- General Carneiro -> 5
-- Praia Grande -> 1, 2
-- Porto Vitória -> 4
-- Porto Alegre -> 7
-- Curitiba -> 10
-- Canoinhas -> 3
-- Rio de Janeiro -> 6

update cliente set idmunicipio=1 where idcliente in (9, 8);
update cliente set idmunicipio=2 where idcliente=5;
update cliente set idmunicipio=3 where idcliente in (1, 2);
update cliente set idmunicipio=4 where idcliente=4;
update cliente set idmunicipio=5 where idcliente=7;
update cliente set idmunicipio=6 where idcliente=10;
update cliente set idmunicipio=7 where idcliente=3;
update cliente set idmunicipio=8 where idcliente=6;

alter table cliente add constraint fk_cl_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio);

create table uf (
	iduf integer not null,
	nome varchar(10) not null,

	constraint pk_uf_iduf primary key (iduf),
	constraint un_uf_nome unique (nome)
);

select idcliente, uf from cliente;
-- SC -> 9, 8, 10
-- PR -> 5, 4
-- SP -> 1, 2, 3
-- RS -> 7
-- RJ -> 6

alter table cliente drop uf;
insert into uf (iduf, nome) values (1, 'SC');
insert into uf (iduf, nome) values (2, 'PR');
insert into uf (iduf, nome) values (3, 'SP');
insert into uf (iduf, nome) values (4, 'RS');
insert into uf (iduf, nome) values (5, 'RJ');

alter table cliente add iduf integer;
update cliente set iduf=1 where idcliente in (9, 8, 10);
update cliente set iduf=2 where idcliente in (4, 5);
update cliente set iduf=3 where idcliente in (1, 2, 3);
update cliente set iduf=4 where idcliente=7;
update cliente set iduf=5 where idcliente=6;
alter table cliente add constraint fk_cln_iduf foreign key (iduf) references uf (iduf);

create table fornecedor (
	idfornecedor integer not null,
	nome varchar(50) not null,

	constraint pk_fnc_idfornecedor primary key (idfornecedor),
	constraint un_fnc_nome unique (nome)
);

create table vendedor (
	idvendedor integer not null,
	nome varchar(50) not null,

	constraint pk_vdd_idvendedor primary key (idvendedor),
	constraint un_vdd_nome unique (nome)
);

create table transportadora (
	idtransportadora integer not null,
	idmunicipio integer,
	nome varchar(50) not null,
	logradouro varchar(50),
	numero varchar(10),

	constraint pk_tpt_idtransportadora primary key (idtransportadora),
	constraint fk_tpt_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio),
	constraint un_tpt_nome unique (nome)
);

create table produto (
	idproduto integer not null,
	idfornecedor integer not null,
	nome varchar(30) not null,
	valor numeric(10, 2) not null,

	constraint pk_pdt_idproduto primary key (idproduto),
	constraint fk_pdt_idfornecedor foreign key (idfornecedor) references fornecedor (idfornecedor)
);

insert into vendedor (idvendedor, nome) values (1, 'André');
insert into vendedor (idvendedor, nome) values (2, 'Alisson');
insert into vendedor (idvendedor, nome) values (3, 'José');
insert into vendedor (idvendedor, nome) values (4, 'Ailton');
insert into vendedor (idvendedor, nome) values (5, 'Maria');
insert into vendedor (idvendedor, nome) values (6, 'Suelen');
insert into vendedor (idvendedor, nome) values (7, 'Aline');
insert into vendedor (idvendedor, nome) values (8, 'Silvana');

insert into fornecedor (idfornecedor, nome) values (1, 'Cap. Computadores');
insert into fornecedor (idfornecedor, nome) values (2, 'AA. Computadores');
insert into fornecedor (idfornecedor, nome) values (3, 'BB. Máquinas');

insert into transportadora (idtransportadora, idmunicipio, nome, logradouro, numero) values (1, 3, 'BS Transportes', 'Rua das Limas', 1);
insert into transportadora (idtransportadora, idmunicipio, nome) values (2, 8, 'União Transportes');

insert into produto (idproduto, idfornecedor, nome, valor) values (1, 1, 'Microcomputador', 800);
insert into produto (idproduto, idfornecedor, nome, valor) values (2, 1, 'Monitor', 500);
insert into produto (idproduto, idfornecedor, nome, valor) values (3, 2, 'Placa Mãe', 200);
insert into produto (idproduto, idfornecedor, nome, valor) values (4, 2, 'HD', 150);
insert into produto (idproduto, idfornecedor, nome, valor) values (5, 2, 'Placa de Vídeo', 200);
insert into produto (idproduto, idfornecedor, nome, valor) values (6, 3, 'Memória RAM', 100);
insert into produto (idproduto, idfornecedor, nome, valor) values (7, 1, 'Gabinete', 35);

-- Criação de Tabela de Pedido
create table pedido (
	idpedido integer not null,
	idcliente integer not null,
	idtransportadora integer,
	idvendedor integer not null,
	data_pedido date not null,
	valor float not null,

	constraint pk_pdd_idpedido primary key (idpedido),
	constraint fk_pdd_idcliente foreign key (idcliente) references cliente (idcliente),
	constraint fk_pdd_idtransportadora foreign key (idtransportadora) references transportadora (idtransportadora),
	constraint fk_pdd_idvendedor foreign key (idvendedor) references vendedor (idvendedor)
);

select idcliente, nome from cliente;
select * from transportadora;
select * from vendedor;
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (1, '2008-04-01', 1300, 1, 1, 1);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (2, '2008-04-01', 500, 1, 1, 1);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (3, '2008-04-06', 200, 7, 2, 6);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (4, '2008-04-06', 800, 3, 1, 7);
insert into pedido (idpedido, data_pedido, valor, idcliente, idvendedor)
values (5, '2008-04-06', 175, 3, 7);
insert into pedido (idpedido, data_pedido, valor, idcliente, idvendedor)
values (6, '2008-04-07', 1300, 8, 8);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (7, '2008-04-15', 300, 9, 2, 1);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (8, '2008-04-20', 500, 9, 2, 5);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (9, '2008-04-20', 350, 7, 1, 7);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (10, '2008-04-23', 300, 2, 1, 5);