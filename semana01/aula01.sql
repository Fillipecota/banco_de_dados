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
