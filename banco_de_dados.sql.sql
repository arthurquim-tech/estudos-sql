CREATE DATABASE escola_sql;

CREATE TABLE escola_sql;

USE escola_sql;

CREATE TABLE aluno (
rgm INT NOT NULL auto_increment,
nome VARCHAR(100) NOT NULL,
cpf CHAR(11) NOT NULL,
email VARCHAR(120),
CONSTRAINT pk_aluno PRIMARY KEY (rgm),
CONSTRAINT uq_aluno_cpf PRIMARY KEY (cpf),
CONSTRAINT uq_aluno_email UNIQUE (email) 
);

CREATE TABLE disciplina (
id_disciplina INT NOT NULL,
nome_disciplina VARCHAR(100) NOT NULL,
carga_horaria INT NOT NULL,
CONSTRAINT pk_disciplina PRIMARY KEY (id_disciplina),
CONSTRAINT ck_carga_horaria CHECK (carga_horaria > 0)
);
CREATE TABLE matricula (
rgm INT NOT NULL auto_increment,
id_disciplina INT NOT NULL,
data_matricula DATE NOT NULL, 
periodo CHAR(06) NOT NULL,
situacao VARCHAR(20) NOT NULL DEFAULT 'ATIVA',
CONSTRAINT pk_matricula PRIMARY KEY (rgm, id_disciplina, periodo),
CONSTRAINT fk_matricula_aluno FOREIGN KEY (rgm)REFERENCES aluno(rgm),
CONSTRAINT fk_matricula_disciplina FOREIGN KEY(id_disciplina)REFERENCES disciplina(id_disciplina),
CONSTRAINT ck_situacao CHECK (situacao IN ('ATIVA', 'TRANCADA', 'CONCLUIDA'))
); 
INSERT INTO aluno (rgm, nome, cpf, email) VALUES
(1001, 'Ana Souza', '12345678901', 'ana@exemplo.com'), 
(1002, 'Bruno Lima', '23456789012', 'bruno@exemplo.com'), 
(1003, 'Carla Mendes', '34567890123', 'carla@exemplo.com'), 
(1004, 'Diego Oliveira', '45678901234', 'diego@exemplo.com'), 
(1005, 'Elisa Ferreira', '56789012345', 'elisa@exemplo.com'), 
(1006, 'Felipe Costa', '67890123456', 'felipe@exemplo.com');

INSERT INTO aluno (rgm, nome, cpf, email) VALUES
('1007', 'JOAO APARECIDO', '67676767676', 'joao@aparecido.com');

INSERT INTO aluno (rgm, nome, cpf) VALUES 
(1008,'Arthur Quim','89012345678');

INSERT INTO disciplina (id_disciplina, nome_disciplina, carga_horaria) VALUES 
(10, 'Banco de Dados', 80), 
(20, 'Logica de Programacao', 80), 
(30, 'Sistemas Operacionais', 60), 
(40, 'Engenharia de Software', 80), 
(50, 'Estatistica', 40);

INSERT INTO matricula (rgm, id_disciplina, data_matricula, periodo, situacao) VALUES 
(1001, 10, '2026-08-01', '202601', 'ATIVA'), 
(1001, 20, '2026-08-01', '202601', 'ATIVA'), 
(1001, 50, '2026-08-02', '202601', 'ATIVA'), 
(1002, 10, '2026-08-01', '202601', 'ATIVA'), 
(1002, 30, '2026-08-03', '202601', 'ATIVA'), 
(1003, 10, '2026-08-02', '202601', 'ATIVA'), 
(1003, 40, '2026-08-02', '202601', 'ATIVA'), 
(1004, 20, '2026-08-03', '202601', 'ATIVA'), 
(1004, 50, '2026-08-03', '202601', 'ATIVA'), 
(1005, 30, '2026-08-04', '202601', 'ATIVA'), 
(1006, 40, '2026-08-04', '202601', 'ATIVA');

INSERT INTO disciplina (id_disciplina, nome_disciplina, carga_horaria) VALUES
(60, 'MODELAGEM DE DADOS', 80);

SELECT * FROM aluno;
SELECT * FROM disciplina;
SELECT * FROM matricula;

SELECT a.rgm, a.nome, d.nome_disciplina, m.data_matricula, m.situacao FROM matricula m
INNER JOIN aluno a ON m.rgm = a.rgm INNER JOIN disciplina d ON m.id_disciplina = d.id_disciplina ORDER BY a.nome, d.nome_disciplina;

SHOW CREATE TABLE aluno;

SHOW INDEX FROM aluno;
