-- Cria e seleciona o banco

CREATE DATABASE cantina;

USE cantina;

-- Cada linha é uma pessoa avaliando a cantina

CREATE TABLE avaliacao (

id INT AUTO_INCREMENT PRIMARY KEY,

apelido VARCHAR(50) NOT NULL,

lanche VARCHAR(20) NOT NULL,

gasto INT NOT NULL,

nota INT NOT NULL,

data_compra DATE NOT NULL,

turno VARCHAR(10) NOT NULL,

sugestao VARCHAR(255)
);

SELECT * FROM avaliacao;

-- sugestao NULL = a pessoa não deixou sugestão
INSERT INTO avaliacao (apelido, lanche, gasto, nota, data_compra, turno, sugestao) VALUES
  ('Maju', 'Salgado', 12, 8, '2026-10-20', 'Manhã', 'Mais opções de suco'),
  ('Léo', 'Sanduíche', 15, 7, '2026-10-19', 'Manhã', NULL),
  ('Bia', 'Fruta', 6, 9, '2026-10-20', 'Manhã', 'Ótima fruta'),
  ('Duda', 'Salgado', 10, 6, '2026-10-18', 'Manhã', 'Fila muito grande'),
  ('Kaique', 'Doce', 8, 5, '2026-10-20', 'Tarde', NULL),
  ('Nina', 'Suco', 7, 8, '2026-10-17', 'Tarde', NULL),
  ('Mateus', 'Salgado', 14, 7, '2026-10-20', 'Tarde', 'Baixar o preço'),
  ('Sol', 'Sanduíche', 18, 9, '2026-10-19', 'Tarde', NULL),
  ('Gabi', 'Doce', 5, 4, '2026-10-16', 'Tarde', 'Mais doces sem açúcar'),
  ('Rafa', 'Salgado', 11, 8, '2026-10-20', 'Noite', NULL),
  ('Mel', 'Sanduíche', 16, 10, '2026-10-20', 'Noite', 'Perfeito'),
  ('Tito', 'Suco', 6, 7, '2026-10-15', 'Noite', NULL),
  ('Lia', 'Fruta', 4, 9, '2026-10-20', 'Noite', NULL),
  ('Caio', 'Salgado', 13, 6, '2026-10-18', 'Noite', 'Abrir mais cedo');
  
  SELECT * FROM avaliacao;
  
  -- Tem que dar 14
SELECT COUNT(*) FROM avaliacao;

-- 1 Só o apelido e o lanche de todo mundo
SELECT apelido, lanche
FROM avaliacao;

-- 2 Quem deu nota 9 ou mais?
SELECT apelido, nota
FROM avaliacao
WHERE nota >= 9;

-- 3 Quem é do turno da noite?
SELECT apelido, turno
FROM avaliacao
WHERE turno = 'Noite';

-- 4 Quem é da noite E gastou mais de 10?
SELECT apelido, gasto
FROM avaliacao
WHERE turno = 'Noite' AND gasto > 10;

-- 4 Quem é da noite E gastou mais de 10?
SELECT apelido, gasto
FROM avaliacao
WHERE turno = 'Noite' OR gasto > 10;

-- 5 Quem pediu Fruta OU Suco?
SELECT apelido, lanche
FROM avaliacao
WHERE lanche = 'Fruta' OR lanche = 'Suco';

-- 6 Do jeito longo, com OR
SELECT apelido FROM avaliacao
WHERE lanche = 'Doce' OR lanche = 'Suco' OR lanche = 'Fruta';
 
-- Do jeito curto, com IN
SELECT apelido FROM avaliacao
WHERE lanche IN ('Doce', 'Suco', 'Fruta');

-- Quantas pessoas avaliaram a cantina?
SELECT COUNT(*) FROM avaliacao;
 
-- 7 E quantas são da tarde?
SELECT COUNT(*) FROM avaliacao
WHERE turno = 'Tarde';

-- 8 Quanto se gastou ao todo?
SELECT SUM(gasto) FROM avaliacao;

-- 9 Qual a nota média da cantina?
SELECT AVG(nota) FROM avaliacao;

-- 10 Maior e menor gasto, na mesma consulta
SELECT MAX(gasto) AS maior, MIN(gasto) AS menor
FROM avaliacao;

-- 11 Nota média só da noite
SELECT AVG(nota) FROM avaliacao
WHERE turno = 'Noite';
 
-- Gasto total de quem pediu Fruta ou Suco
SELECT SUM(gasto) FROM avaliacao
WHERE lanche IN ('Fruta', 'Suco');









