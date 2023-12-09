CREATE TABLE Escola (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) not null,
	endereço VARCHAR(100) not null,
	telefone VARCHAR(12) NOT null,
	email VARCHAR(256) not null
);

CREATE TABLE Coperativa (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) not null,
	endereço VARCHAR(100) not null,
	telefone VARCHAR(12) NOT null,
	email VARCHAR(100) not null
);

CREATE TABLE Doador (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) not null,
	telefone VARCHAR(12) NOT null,
	email VARCHAR(100) not null
);

CREATE TABLE Material (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) not null
);

CREATE TABLE Compra (
	id SERIAL PRIMARY KEY,
	escola_id int,
	foreign key (escola_id) references escola (id),
	coperativa_id int,
	foreign key (coperativa_id) references coperativa (id),
	valor decimal not null,
	data time without time zone
);

CREATE TABLE Ordem (
	id SERIAL PRIMARY KEY,
	material_id int,
	compra_id int,
	foreign key (material_id) references material (id),
	foreign key (compra_id) references compra (id),
	kg float not null default(0),
	total float not null default(0)
);

CREATE TABLE Catalogo (
	id SERIAL PRIMARY KEY,
	coperativa_id int,
	material_id int,
	foreign key (coperativa_id) references coperativa (id),
	foreign key (material_id) references material (id),
	preco FLOAT,
	unique(coperativa_id, material_id)
);

CREATE TABLE Doacao (
	id SERIAL PRIMARY KEY,
	doador_id int,
	foreign key (doador_id) references doador (id),
	escola_id int,
	foreign key (escola_id) references escola (id),
	data DATE
);

CREATE TABLE item_doacao (
	id SERIAL PRIMARY KEY,
	material_id int,
	doacao_id int,
	foreign key (material_id) references material (id),
	foreign key (doacao_id) references doacao (id),
	kg FLOAT,
	unique(material_id, doacao_id)
);

INSERT into escola  (nome, endereço,telefone, email) values 
	('EEM Maria do Rosario','rua2 num2', '15 11111111','escola@gmail.com'),
	('EEM Evilazio','rua3 num4', '15 22222222','escola2@gmail.com');

INSERT into coperativa (nome, endereço,telefone, email) values 
	('Coperativa','rua2 num2', '15 11111111','coperativa@gmail.com'),
	('coop1','rua4 num6', '15 33333333','coo1p@gmail.com'),
	('coop2','rua5 num7', '15 44444444','coop2@gmail.com'),
	('coop4','rua4 num6', '15 66666666','coo4p@gmail.com'),
	('coop2','rua5 num7', '15 44444444','coop2@gmail.com'),
	('coop5','rua8 num3', '15 77777777','coo7p@gmail.com');

INSERT into doador (nome, telefone, email) values 
	('doador1', '15 11111111','doador1@gmail.com'),
	('doador2', '15 22222222','doador2@gmail.com'),
	('doador3', '15 33333333','doador3@gmail.com'),
	('doador4', '15 44444444','doador4@gmail.com'),
	('doador5', '15 55555555','doador5@gmail.com'),
	('doador6', '15 66666666','doador6@gmail.com');

INSERT into material  (nome) values 
	('plastico'),
	('isopor'),
	('vidro'),
	('papel'),
	('papelao'),
	('metal');


INSERT INTO public.doacao
	(id, doador_id, escola_id, "data")
values
	(1, 1, 1, '2023-12-09');


INSERT INTO public.item_doacao
(id, material_id, doacao_id, kg)
VALUES(1, 2, 1, 300.0);

INSERT INTO public.compra (escola_id,coperativa_id,valor,"data") VALUES
	 (1,1,100,'00:29:54.003919'),
	 (1,2,120,'00:29:54.003');

INSERT INTO public.ordem (material_id,compra_id,kg,total) VALUES
	 (1,1,100.0,1000.0),
	 (3,2,50.0,1500.0);

	