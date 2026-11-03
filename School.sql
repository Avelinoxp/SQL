-- Banco e tabela da escola
CREATE DATABASE escola;
USE escola;
 
CREATE TABLE aluno (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  turma VARCHAR(5) NOT NULL,
  nota DECIMAL(4,1) NOT NULL,
  faltas INT NOT NULL,
  email VARCHAR(80)
);
 
-- 8 alunos (email NULL = não informou)
INSERT INTO aluno (nome, turma, nota, faltas, email) VALUES
  ('Ana', '1A', 8.5, 2, 'ana@escola.com'),
  ('Bruno', '1A', 5.0, 10, NULL),
  ('Carla', '1B', 7.0, 4, 'carla@escola.com'),
  ('Diego', '1B', 4.5, 15, NULL),
  ('Elisa', '1A', 9.0, 0, 'elisa@escola.com'),
  ('Fábio', '1B', 6.0, 6, 'fabio@escola.com'),
  ('Gabi', '1A', 3.5, 20, NULL),
  ('Hugo', '1B', 7.5, 3, 'hugo@escola.com');
 
SELECT * FROM aluno;

-- TAREFA 1
UPDATE aluno SET nota = 7 WHERE id IN(2,3);
SELECT * FROM aluno;

-- TAREFA 2
UPDATE aluno SET email = "diego@escola.com" WHERE id =4;

-- DESBLOQUEIA O ERRO 1175
SET SQL_SAFE_UPDATES = 0;
-- TAREFA 3
UPDATE aluno SET nota = nota + 0.5 WHERE TURMA = "1B";

SELECT * FROM aluno;

-- TAREFA 04
DELETE FROM aluno WHERE id= 7;

-- TAREFA 05
SELECT nome, faltas FROM aluno WHERE faltas > 5;

-- TAREFA 06
SELECT COUNT(*) FROM aluno;
SELECT AVG(NOTA) FROM aluno WHERE turma = "1A";