-- ============================================================
-- 1. CRIAÇÃO E ESTRUTURA DO BANCO DE DADOS
-- ============================================================
CREATE DATABASE provedor_left;
USE provedor_left;

-- Planos oferecidos
CREATE TABLE plano (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(30) NOT NULL UNIQUE,
  velocidade_mbps INT NOT NULL,
  mensalidade DECIMAL(6,2) NOT NULL
);

-- Assinantes: plano_id aponta para plano(id)
CREATE TABLE assinante (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  bairro VARCHAR(40) NOT NULL,
  data_instalacao DATE NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES plano(id)
);

-- ============================================================
-- 2. INSERÇÃO DOS DADOS (POVOAMENTO)
-- ============================================================
INSERT INTO plano (nome, velocidade_mbps, mensalidade) VALUES
  ('Básico', 100, 79.90),
  ('Família', 300, 99.90),
  ('Gamer', 600, 129.90),
  ('Empresarial', 1000, 249.90),
  ('Fibra Rural', 50, 89.90);

INSERT INTO assinante (nome, bairro, data_instalacao, plano_id) VALUES
  ('Rita Gomes', 'Centro', '2026-01-15', 2),
  ('Caio Martins', 'Vila Nova', '2026-02-03', 3),
  ('Juliana Reis', 'Centro', '2026-03-20', 1),
  ('Diego Prado', 'Jardim América', '2026-04-08', 3),
  ('Helena Costa', 'Vila Nova', '2026-05-12', 2),
  ('Otávio Lima', 'Centro', '2026-06-30', 2),
  ('Paula Antunes', 'Jardim América', '2026-08-05', 4),
  ('Igor Teixeira', 'Centro', '2026-09-18', 3);

-- ============================================================
-- 3. RESOLUÇÃO DAS TAREFAS
-- ============================================================

-- Tarefa 1: Mostre todos os planos com os seus assinantes, incluindo quem não tem nenhum. (LEFT JOIN)
-- Resultado esperado: 9 linhas saíram.
SELECT 
    p.id AS plano_id,
    p.nome AS plano_nome,
    p.velocidade_mbps,
    p.mensalidade,
    a.id AS assinante_id,
    a.nome AS assinante_nome,
    a.bairro,
    a.data_instalacao
FROM plano p
LEFT JOIN assinante a ON a.plano_id = p.id;


-- Tarefa 2: Rode a mesma consulta trocando LEFT JOIN por INNER JOIN.
-- Resultado esperado: 8 linhas saíram. 
-- Quem sumiu: Sumiu o plano "Fibra Rural", pois o INNER JOIN exige a correspondência exata de registros em ambas as tabelas e esse plano não possui assinantes.
SELECT 
    p.id AS plano_id,
    p.nome AS plano_nome,
    p.velocidade_mbps,
    p.mensalidade,
    a.id AS assinante_id,
    a.nome AS assinante_nome,
    a.bairro,
    a.data_instalacao
FROM plano p
INNER JOIN assinante a ON a.plano_id = p.id;


-- Tarefa 3: Quais planos não têm nenhum assinante? (LEFT JOIN e IS NULL)
SELECT 
    p.id,
    p.nome,
    p.velocidade_mbps,
    p.mensalidade
FROM plano p
LEFT JOIN assinante a ON a.plano_id = p.id
WHERE a.id IS NULL;


-- Tarefa 4: Quantos assinantes cada plano tem, incluindo quem tem zero? (COUNT de uma coluna e GROUP BY)
SELECT 
    p.nome AS plano_nome,
    COUNT(a.id) AS total_assinantes
FROM plano p
LEFT JOIN assinante a ON a.plano_id = p.id
GROUP BY p.id, p.nome;


-- Tarefa 5: Mostre os planos com mensalidade abaixo de 100 reais com os seus assinantes, incluindo plano sem assinante. (WHERE na tabela da esquerda)
SELECT 
    p.nome AS plano_nome,
    p.mensalidade,
    a.nome AS assinante_nome,
    a.bairro
FROM plano p
LEFT JOIN assinante a ON a.plano_id = p.id
WHERE p.mensalidade < 100.00;