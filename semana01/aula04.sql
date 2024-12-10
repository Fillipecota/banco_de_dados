-----------crinção de tabale com uuid------
CREATE EXTENSION IF NOT EXIST 'uuid-osp'

CREATE TABLE veiculos(
	id UUID  DEFAULT uuid_generate_v4()PRIMARY KEY
	id UUID PRIMARY KEY
)
----------crianção de tabela com serial-------
CREATE TABLE veiculos (
	id SERIAL PRIMARY KEY,
	ID INTEGER PRIMARY KEY,
)

CREATE TABLE veiculos(
	id SERIAL  PRIMARY KEY,
	modelo VARCHAR(50) NOT NULL,
	marca VARCHAR(50) NOT NULL,
	ano_fabricacao INTEGER NOT NULL,
	quilometragem DECIMAL (10,2)NOT NULL,
	preco_venda DECIMAL (10,2)NOT NULL,
	cor VARCHAR(20) NOT NULL
) 
SELECT * from veiculos

CREATE TABLE clientes(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL,
	email VARCHAR(60 )NOT NULL UNIQUE
)
SELECT * FROM clientes

CREATE TYPE MET_PAG AS ENUM ('PIX','DINHEIRO','CARTAO')

CREATE TABLE vendas (
	id SERIAL PRIMARY KEY,
	valor_total DECIMAL (10,2)NOT NULL,
	data_venda DATE NOT NULL,
	cliente_id INTEGER NOT NULL,
	veiculos_id INTEGER NOT NULL,
	metodo_pagamento MET_PAG NOT NULL
)

SELECT * FROM vendas

ALTER TABLE vendas ADD CONSTRAINT fk_cliente
FOREIGN KEY (cliente_id) REFERENCES clientes (id) ON DELETE CASCADE

ALTER TABLE vendas ADD CONSTRAINT fk_veiculo
FOREIGN KEY (veiculos_id) REFERENCES veiculos(id) ON DELETE CASCADE


INSERT INTO clientes (nome,email)
VALUES ('joao', 'joao_do pe@hotmail.com')

INSERT INTO clientes (nome, email)VALUES
('maria', 'maria_gasolina@hotmail.com'),
('joao', 'joao_e_mairia@hotmail.com'),
('pedrinho', 'pedrinho@hotmail.com')


INSERT INTO veiculos (modelo, marca, ano_fabricacao, quilometragem, preco_venda, cor) VALUES
('Corolla', 'Toyota', 2018, 45000.00, 90000.00, 'BRANCO'),
('Civic', 'Honda', 2020, 30000.00, 120000.00, 'PRETO'),
('Onix', 'Chevrolet', 2015, 80000.00, 55000.00, 'VERMELHO'),
('HB20', 'Hyundai', 2017, 50000.00, 62000.00, 'PRATA'),
('Gol', 'Volkswagen', 2010, 120000.00, 30000.00, 'AZUL');

INSERT INTO vendas (cliente_id, veiculos_id, valor_total, data_venda, metodo_pagamento) VALUES
(1, 1, 90000.00, '2023-05-10', 'CARTAO'),
(2, 2, 120000.00, '2024-06-15', 'PIX'),
(3, 3, 55000.00, '2022-11-20', 'PIX'),
(4, 4, 62000.00, '2021-08-18', 'CARTAO'),
(5, 5, 30000.00, '2020-02-10', 'DINHEIRO');

INSERT INTO clientes (nome, email) VALUES
('Ana Maria', 'ana.maria@outlook.com'),
('Joao Silva', 'joao.silva@gmail.com'),
('Maria Clara', 'maria.clara@hotmail.com'),
('Pedro Rocha', 'pedro.rocha@outlook.com'),
('Luiza Almeida', 'luiza.almeida@yahoo.com');

SELECT * FROM veiculos
SELECT * FROM clientes
SELECT * FROM vendas

------------pega o valor max--------

SELECT MAX(preco_venda) FROM veiculos
SELECT MAX(quilometragem) FROM veiculos

------------pega o valor minimo

SELECT MIN (preco_venda) FROM veiculos
SELECT MIN (quilometragem) FROM veiculos

--------------soma os campos-----------

SELECT SUM (preco_venda) FROM veiculos
SELECT SUM (quilometragem) FROM veiculos

--------------------pegar media e escolher quantos numeros depois da virgula---

SELECT AVG(preco_venda) FROM veiculos
SELECT ROUND(AVG(preco_venda),1) FROM veiculos

----------ordenar em forma decrecente------- 

SELECT * FROM veiculos ORDER BY modelo DESC

------------- CONTA QUANTOS CAMPOS TEM -------

SELECT COUNT (*) FROM veiculos

--------------ordena em forma  crescente-------

SELECT * FROM veiculos ORDER BY modelo ASC

-----------------mostra a quantidade de campo agrupando os iguais-------

SELECT cor, count(id) FROM veiculos GROUP BY cor





