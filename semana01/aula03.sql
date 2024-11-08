CREATE TABLE fabricantes (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	pais_origem VARCHAR(50) NOT NULL,
	ano_fundacao INTEGER NOT NULL	
)

CREATE TABLE clientes (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cpf VARCHAR(50) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE,
	telefone VARCHAR (20) NOT NULL ,
	endereco VARCHAR (50) NOT NULL 
)

CREATE TABLE vendedores (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cpf VARCHAR(50) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE,
	telefone VARCHAR (20) NOT NULL ,
	data_contratacao DATE NOT NULL 
)

CREATE TABLE vendas (
	id SERIAL PRIMARY KEY,
	data_vendas DATE NOT NULL,
	valor_total DECIMAL NOT NULL,
	metodo_pagamento VARCHAR(100) NOT NULL,
	vendas_id INTEGER NOT NULL,
	clientes_id INTEGER NOT NULL,
	veiculos_id INTEGER NOT NULL,
	FOREIGN KEY (clientes_id) REFERENCES clientes(id)ON DELETE CASCADE,
	FOREIGN KEY (vendas_id) REFERENCES vendas(id)ON DELETE CASCADE,
	FOREIGN KEY (veiculos_id) REFERENCES veiculos(id)ON DELETE CASCADE
)

CREATE TABLE veiculos (
	id SERIAL PRIMARY KEY,
	chassi INTEGER NOT NULL,
	modelo VARCHAR(50) NOT NULL UNIQUE,
	ano_fabricacao INTEGER NOT NULL UNIQUE,
	cor VARCHAR(20) NOT NULL ,
	quilometragem INTEGER NOT NULL,
	preco DECIMAL NOT NULL,	
	fabricante_id INTEGER NOT NULL,
	FOREIGN KEY (fabricante_id) REFERENCES fabricantes(id)ON DELETE CASCADE
)	

	
CREATE TABLE manutencao (
	id SERIAL PRIMARY KEY,
	data_servico DATE NOT NULL,
	descricao_servico VARCHAR(50) NOT NULL,
	ano_fabricacao INTEGER NOT NULL UNIQUE,
	custo DECIMAL NOT NULL ,
	veiculos_id INTEGER NOT NULL,
	FOREIGN KEY (veiculos_id) REFERENCES veiculos(id)ON DELETE CASCADE
)
 CREATE TYPE metodo_pagamento AS ENUM ('pix','debito','crédito','dinheiro','financiamento')

ALTER TABLE vendas ALTER COLUMN metodo_pagamento SET DATA TYPE metodo_pagamento
 USING metodo_pagamento::metodo_pagamento

	
INSERT INTO fabricantes (nome,pais_origem,ano_fundacao) VALUES ('JOAO','BRASIL','2015');	
INSERT INTO fabricantes (nome,pais_origem,ano_fundacao) VALUES ('MARIA','PORTUGAL','2020');
INSERT INTO fabricantes (nome,pais_origem,ano_fundacao) VALUES ('RAFA','BRAZILIA','2010');
INSERT INTO fabricantes (nome,pais_origem,ano_fundacao) VALUES ('FELLIPE','PORTUGAL','2015');
INSERT INTO fabricantes (nome,pais_origem,ano_fundacao) VALUES ('VALERIO','BRASIL','2005');

INSERT INTO clientes (nome,cpf,email,telefone,endereco) VALUES ('BARBARA','000.000.000-01','BARBARA@HOTMAIL.COM','3263-0011','RUA SEM SAIDA');
INSERT INTO clientes (nome,cpf,email,telefone,endereco) VALUES ('JOICE','000.000.000-02','JOICE@HOTMAIL.COM','32630011','RUA LOGO ALI');	
INSERT INTO clientes (nome,cpf,email,telefone,endereco) VALUES ('BRUNA','000.000.000-03','BRUNA@HOTMAIL.COM','32630011','RUA DO OUTRO LADO');	
INSERT INTO clientes (nome,cpf,email,telefone,endereco) VALUES ('CAMILY','000.000.000-04','CAMILY@HOTMAIL.COM','32630011','RUA DO LADO');	
INSERT INTO clientes (nome,cpf,email,telefone,endereco) VALUES ('ROSANE','000.000.000-05','ROSANE@HOTMAIL.COM','32630011','RUA NOVA');	


INSERT INTO vendedores (nome,cpf,email,telefone,data_contratacao) VALUES ('JOJO','000.000.000-06','JOJO@HOTMAIL.COM','3263-0022','15-12-2020');
INSERT INTO vendedores (nome,cpf,email,telefone,data_contratacao) VALUES ('JUJU','000.000.000-07','JUJU@HOTMAIL.COM','3263-0033','20-10-2010');
INSERT INTO vendedores (nome,cpf,email,telefone,data_contratacao) VALUES ('GIGI','000.000.000-08','GIGI@HOTMAIL.COM','3263-0044','10-10-2008');
INSERT INTO vendedores (nome,cpf,email,telefone,data_contratacao) VALUES ('PAPA','000.000.000-09','PAPA@HOTMAIL.COM','3263-0055','05-12-2000');
INSERT INTO vendedores (nome,cpf,email,telefone,data_contratacao) VALUES ('BOBO','000.000.000-10','BOBO@HOTMAIL.COM','3263-0066','08-12-2011');

INSERT INTO veiculos (chassi, modelo, ano_fabricacao, cor, quilometragem, preco,fabricante_id)
VALUES ('1231233ABC', 'CORSA', 2010, 'BRANCO', 60000, 10500, '1');

INSERT INTO veiculos (chassi, modelo, ano_fabricacao, cor, quilometragem, preco,fabricante_id)
VALUES ('1231233AAA', 'GOL', 2015, 'PRETO', 30000, 18500, '4');

INSERT INTO veiculos (chassi, modelo, ano_fabricacao, cor, quilometragem, preco,fabricante_id)
VALUES ('1231244BBB', 'PUNTO', 2016, 'VERMELHO', 28000, 20000, '3');

INSERT INTO veiculos (chassi, modelo, ano_fabricacao, cor, quilometragem, preco,fabricante_id)
VALUES ('1231233CCC', 'PRISMA', 2011, 'BRANCO', 20000, 10500, '2');

INSERT INTO veiculos (chassi, modelo, ano_fabricacao, cor, quilometragem, preco,fabricante_id)
VALUES ('1231233DDD', 'ONIX', 2017, 'VERMELHO', 42000, 91500, '4');