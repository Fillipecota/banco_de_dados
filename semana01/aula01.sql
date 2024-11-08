-- -- criacao de tabelas

 CREATE TABLE usuarios(
 	id SERIAL PRIMARY KEY, 
 	nome varchar(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
 	data_criacao TIMESTAMP DEFAULT current_timestamp
)

-- -- visualizar tabelas

 SELECT * FROM usuarios
 SELECT * FROM usuarios WHERE id = 1
 SELECT * FROM usuarios WHERE email = ('fellipe_scota@gmail.com')

--  inserir informacoes na tabelas

 INSERT INTO usuarios (nome,email) VALUES ('fellipe','fellipe_scota@gmail.com')
 INSERT INTO usuarios (nome,email) VALUES ('maria','maria_gasolina@gmail.com')
 INSERT INTO usuarios VALUES (DEFAULT,'gustavo','gustavo@gmail.com')

-- --  ATUALIZAR INFORMACOES

 UPDATE usuarios SET nome = 'maria gasolina' WHERE id = 2

-- --  deletar dados

 DELETE FROM usuarios
 DELETE FROM usuarios WHERE id = 2

-- -- deletar tabela inteira

drop table  usuarios

-- -- adicionar coluna

ALTER TABLE usuarios ADD COLUMN ativo BOOLEAN DEFAULT  TRUE 
ALTER TABLE obra_de_arte ADD COLUMN type tipo_de_arte

-- cria type
 
 CREATE TYPE tipo_de_arte AS ENUM ('PINTURAS','ESCULTURAS')

	-- alterar coluna da tabela

ALTER TABLE artista RENAME COLUMN descrição_biográfica to descricao_biografica

------------- visualizar tabelas existentes ----
SELECT * FROM pg_tables WHERE schemaname = 'public'

-------------- ver quantidade que tem na tabela
SELECT COUNT (*) nome_da_tabela FROM obra_de_arte

--------------------------------busca o relacionamento de tabelas -----------
SELECT * FROM obra_de_arte JOIN obra_de_arte_artista ON obra_de_arte.id = obra_de_arte_artista.obra_arte_id   

--------------------------------busca o relacionamento de tabelas usando apelidios -----------
SELECT
 o.titulo AS titulo_da_obra_de_arte,
 o.data_criacao AS data_da_criacao_da_obra_de_arte,
 oa.artista_id AS artista_obra_de_arte
FROM obra_de_arte AS o
JOIN obra_de_arte_artista AS oa ON o.id = oa.obra_arte_id   
JOIN artista AS a ON oa.artista_id = a.id

--------------------------------busca o relacionamento de tabelas apelidos 02-----------
SELECT
 o.titulo,
 o.data_criacao,
 oa.artista_id
FROM obra_de_arte AS o
JOIN obra_de_arte_artista AS oa ON o.id = oa.obra_arte_id   
JOIN artista AS a ON oa.artista_id = a.id

--------------------------------busca o relacionamento de tabelas filtrando por titulo-----------
SELECT
 o.titulo,
 o.data_criacao,
 oa.artista_id
FROM obra_de_arte AS o
JOIN obra_de_arte_artista AS oa ON o.id = oa.obra_arte_id   
JOIN artista AS a ON oa.artista_id = a.id
WHERE o.titulo = 'joao_maria'

--------------------------------busca o relacionamento de tabelas utilizando agrupamento (sem repetiçao)-----------
SELECT
	 o.titulo,
	COUNT(o.id)
FROM obra_de_arte AS o
JOIN obra_de_arte_artista AS oa ON o.id = oa.obra_arte_id   
JOIN artista AS a ON oa.artista_id = a.id
GROUP BY o.titulo
	
-------------------------------ALTERAR TIPO DA COLUNA----------------
ALTER TABLE nome_tabela ALTER COLUMN nom_colula TYPE ......


--------------------------FORÇAR TROCA DE TYPO-----------------
 ALTER TABLE vendas ALTER COLUMN metodo_pagamento SET DATA TYPE metodo_pagamento
 USING metodo_pagamento::metodo_pagamento

 ----------------------ALTERAR TYPO ---------------------
 ALTER TABLE veiculos ALTER COLUMN chassi type VARCHAR (100)

 ----------------------pegar o valor maximo da tabela----------
 ALTER TABLE veiculos ALTER COLUMN chassi type VARCHAR (100)

 -----------------------pegar o valor menor da tabela
 SELECT MIN(nome da coluno) FROM nome da tabela

 ----------------------pegar o valor maior e menor da tabela--------

 SELECT MAX (nome da coluna) MIN (nome da coluna) FROM nome da tabela

 --------------------pegar o opcao por valor-----------------------
 SELECT * FROM nome da tabela WHERE  NOME DA COLUNA  valor

----------------------------PEGAR MEDIA----------------------------

SELECT AVG (quilometragem) FROM veiculos
----------------------PEGAR MEDIA E COLOCA APELIDO-----------
SELECT AVG (quilometragem) AS MEDIA_QUILOMETRAGEM FROM veiculos;
----- AVG 

---------------------------pega media porem só duas casa depois da virgula
SELECT ROUND (AVG(quilometragem),2) FROM veiculos

--------------------------------pega a soma da coluna-------------------
SELECT SUM(preco) FROM veiculos

--------------------pegar media e escolher quantos numeros depois da virgula---
SELECT ROUND(AVG(preco),1) FROM  veiculos
----ROUND siginifcado de "ARRENDONDAR"

------------------ pega a soma usando apenas só  o valor passado-----------
SELECT SUM(preco) FROM veiculos WHERE ano_fabricacao < 2010
SELECT SUM(preco) FROM veiculos WHERE cor = 'branco'
----SUM  significado "somar"

-------------------------------- buscar uma somar entrer datas----------------
SELECT SUM(valor_total) FROM vendas WHERE data_vendas BETWEEN '2020-01-01' AND '2024-11-07'
----- BETWEEN siginificado  "entre"


--------------------- mostra tabela em forma ordernada---------------------------
---CRESCENTE  MAIOR PARA O MENOR
SELECT * FROM vendas ORDER BY  valor_total ASC
---DESCRECENTE  MENOR PARA O MAIOR
SELECT * FROM vendas ORDER BY valor_total DESC
--- ORDER BY  siginificador ""ordernar"


---------------------- AGRUPAR CAMPOS -----------------
SELECT metodo_pagamento, COUNT(id) FROM vendas GROUP by metodo_pagamento
----GROUP BY significado agrupar

------------ PROCURAR ALGO POR UMA PARTE------------ 
SELECT * FROM clientes WHERE nome LIKE 'joao%'
---- % significa "qualquer coisa" 

----------PROCURAR POR QUANTIDADE DE CARACTERES
SELECT * FROM veiculos WHERE modelo LIKE '-----'
---- '-' <<<< numero de caracteres

---------procurar por quantidade de caracteres
SELECT * FROM veiculos WHERE modelo LIKE '--R%'

------------usar alteraçao para tudo minusculos
SELECT * FROM veiculos WHERE lower(modelo) LIKE '--r%'
SELECT * FROM veiculos WHERE modelo ILIKE '--r%'




