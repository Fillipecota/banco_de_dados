CREATE TABLE artista (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	data_nascimento DATE NOT NULL,
	nacionalidade VARCHAR(60) NOT NULL,
	descricao_biografia VARCHAR(200) NOT NULL
)

CREATE TABLE exposicoes (
	id SERIAL PRIMARY KEY,
	titulo VARCHAR(100) NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	local VARCHAR(150) NOT NULL
)

CREATE TABLE visita(
	id SERIAL PRIMARY KEY,
	data_visita DATE NOT NULL,
	exposicao_id INTEGER NOT NULL,
	visitante_id INTEGER NOT NULL,
	FOREIGN KEY (exposicao_id) REFERENCES exposicoes(id) ON DELETE CASCADE,
	FOREIGN KEY (visitante_id) REFERENCES visitantes(id) ON DELETE CASCADE
)

 CREATE TABLE visitantes(
 	id SERIAL PRIMARY KEY, 
 	nome varchar(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
)

 CREATE TABLE obra_de_arte(
 	id SERIAL PRIMARY KEY, 
 	titulo varchar(50) NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	 data_criacao INTEGER NOT NULL,
	 tipo_de_obra TIPO_OBRA NOT NULL 
)

CREATE TABLE obra_de_arte_artista(
	id SERIAL PRIMARY KEY,
	obra_arte_id INTEGER NOT NULL,
	artista_id INTEGER NOT NULL,
	FOREIGN KEY (obra_arte_id) REFERENCES obra_de_arte(id)ON DELETE CASCADE,
	FOREIGN KEY (artista_id) REFERENCES artista(id)ON DELETE CASCADE
	)

CREATE TABLE obra_de_arte_exposicoes(
	id SERIAL PRIMARY KEY,
	obra_arte_id INTEGER NOT NULL,
	exposicao_id INTEGER NOT NULL
)

ALTER TABLE obra_de_arte_exposicoes ADD CONSTRAINT fk_obra_de_arte_id 
FOREIGN KEY (obra_arte_id) REFERENCES obra_de_arte(id) ON DELETE CASCADE

ALTER TABLE obra_de_arte_exposicoes ADD CONSTRAINT fk_obra_de_arte_id_02
FOREIGN KEY (exposicao_id) REFERENCES exposicoes(id) ON DELETE CASCADE

SELECT * FROM artista
SELECT * FROM visita
SELECT * FROM visitantes
SELECT * FROM exposicoes
SELECT * FROM obra_de_arte
SELECT * FROM obra_de_arte_artista
SELECT * FROM obra_de_arte_exposicoes

SELECT COUNT (*) nome_da_tabela FROM artista
SELECT COUNT (*) nome_da_tabela FROM visita
SELECT COUNT (*) nome_da_tabela FROM visitantes
SELECT COUNT (*) nome_da_tabela FROM exposicoes
SELECT COUNT (*) nome_da_tabela FROM obra_de_arte
SELECT COUNT (*) nome_da_tabela FROM obra_de_arte_artista
SELECT COUNT (*) nome_da_tabela FROM obra_de_arte_exposicoes

INSERT INTO visita (data_visita,exposicao_id,visitante_id) VALUES ('2024/12/20','1','2');
INSERT INTO visita (data_visita,exposicao_id,visitante_id) VALUES ('2024/12/20','3','1');
INSERT INTO visita (data_visita,exposicao_id,visitante_id) VALUES ('2024/12/23','4','3');
INSERT INTO visita (data_visita,exposicao_id,visitante_id) VALUES ('2024/12/23','1','3');

INSERT INTO exposicoes (titulo,data_inicio,data_fim,local) VALUES('xuxu','2024/12/201','2024/12/21','logo ali')
INSERT INTO exposicoes (titulo,data_inicio,data_fim,local) VALUES('xuxu_02','2024/12/20','2024/12/21','logo ali') 
INSERT INTO exposicoes (titulo,data_inicio,data_fim,local) VALUES('joao_maria','2024/12/22','2024/12/23','logo ali') 
INSERT INTO exposicoes (titulo,data_inicio,data_fim,local) VALUES('joao_do_pe_fejao','2024/12/24','2024/12/25','logo ali') 

INSERT INTO obra_de_arte(titulo,descricao,data_criacao,type) VALUES('xuxu','tanto faz','2020/06/12','PINTURAS')
INSERT INTO obra_de_arte(titulo,descricao,data_criacao,type) VALUES('joao_maria','assim nao da','2015/10/01','PINTURAS')
INSERT INTO obra_de_arte(titulo,descricao,data_criacao,type) VALUES('joao_do_pe_feijao','assim nao','2010/11/09','ESCULTURAS')
INSERT INTO obra_de_arte(titulo,descricao,data_criacao,type) VALUES('xuxu_02','bora bora','2008/07/01','PINTURAS')

INSERT INTO visitantes (nome,email) VALUES ('fellipe','fellipe_scota@gmail.com')
INSERT INTO visitantes (nome,email) VALUES ('joao','joao_maria@gmail.com')
INSERT INTO visitantes (nome,email) VALUES ('maria','maria_joao@gmail.com')

INSERT INTO obra_de_arte_exposicoes (obra_arte_id,exposicao_id) VALUES ('1','2');
INSERT INTO obra_de_arte_exposicoes (obra_arte_id,exposicao_id) VALUES ('2','4');
INSERT INTO obra_de_arte_exposicoes (obra_arte_id,exposicao_id) VALUES ('2','2');
INSERT INTO obra_de_arte_exposicoes (obra_arte_id,exposicao_id) VALUES ('3','3');

INSERT INTO obra_de_arte_artista (obra_arte_id,artista_id) VALUES ('1','2')
INSERT INTO obra_de_arte_artista (obra_arte_id,artista_id) VALUES ('1','4')
INSERT INTO obra_de_arte_artista (obra_arte_id,artista_id) VALUES ('3','4')
INSERT INTO obra_de_arte_artista (obra_arte_id,artista_id) VALUES ('3','3')


INSERT INTO artista(nome,data_nascimento,nascionalidade,descricao_biografica) VALUES ('fellipe','1991-12-30','brasil','abc')
INSERT INTO artista(nome,data_nascimento,nascionalidade,descricao_biografica) VALUES ('joao','2001-10-12','brasil','abc')
INSERT INTO artista(nome,data_nascimento,nascionalidade,descricao_biografica) VALUES ('pedrinho','2005-12-05','brasil','abc')
INSERT INTO artista(nome,data_nascimento,nascionalidade,descricao_biografica) VALUES ('juju','2001-10-10','brasil','abc')





UPDATE exposicoes SET titulo = 'xuxu_02' WHERE id = 2

CREATE TYPE tipo_de_arte AS ENUM ('PINTURAS','ESCULTURAS')