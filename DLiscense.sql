CREATE DATABASE transportadora_left;
USE transportadora_left;
 
-- Motoristas (cnh = categoria da habilitação)
CREATE TABLE motorista (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  cnh VARCHAR(2) NOT NULL,
  cidade_base VARCHAR(40) NOT NULL
);
 
-- Entregas: motorista_id aponta para motorista(id)
CREATE TABLE entrega (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo VARCHAR(10) NOT NULL UNIQUE,
  destino VARCHAR(40) NOT NULL,
  peso_kg DECIMAL(7,2) NOT NULL,
  status VARCHAR(15) NOT NULL,
  motorista_id INT NOT NULL,
  FOREIGN KEY (motorista_id) REFERENCES motorista(id)
);
 
INSERT INTO motorista (nome, cnh, cidade_base) VALUES
  ('Roberto Nunes', 'C', 'Campinas'),
  ('Luana Ferraz', 'E', 'São Paulo'),
  ('André Batista', 'D', 'Sorocaba'),
  ('Sérgio Mota', 'C', 'São Paulo'),
  ('Kátia Ramos', 'E', 'Campinas');
 
INSERT INTO entrega (codigo, destino, peso_kg, status, motorista_id) VALUES
  ('ENT-001', 'Santos', 1200.00, 'Entregue', 2),
  ('ENT-002', 'Jundiaí', 350.50, 'Entregue', 1),
  ('ENT-003', 'Ribeirão Preto', 8000.00, 'Em rota', 2),
  ('ENT-004', 'Piracicaba', 420.00, 'Entregue', 1),
  ('ENT-005', 'Bauru', 2500.00, 'Em rota', 3),
  ('ENT-006', 'Santos', 980.00, 'Pendente', 2),
  ('ENT-007', 'Sorocaba', 150.00, 'Entregue', 3),
  ('ENT-008', 'Campinas', 600.00, 'Pendente', 1);
  
  SELECT 
    m.id AS motorista_id,
    m.nome,
    m.cnh,
    m.cidade_base,
    e.id AS entrega_id,
    e.codigo,
    e.destino,
    e.peso_kg,
    e.status
FROM motorista m
LEFT JOIN entrega e ON e.motorista_id = m.id;

SELECT 
    m.id AS motorista_id,
    m.nome,
    m.cnh,
    m.cidade_base,
    e.id AS entrega_id,
    e.codigo,
    e.destino,
    e.peso_kg,
    e.status
FROM motorista m
INNER JOIN entrega e ON e.motorista_id = m.id;

SELECT 
    m.id,
    m.nome,
    m.cnh,
    m.cidade_base
FROM motorista m
LEFT JOIN entrega e ON e.motorista_id = m.id
WHERE e.id IS NULL;

SELECT 
    m.nome,
    COUNT(e.id) AS quantidade_entregas
FROM motorista m
LEFT JOIN entrega e ON e.motorista_id = m.id
GROUP BY m.id, m.nome;

SELECT 
    m.nome,
    m.cnh,
    e.codigo,
    e.destino,
    e.status
FROM motorista m
LEFT JOIN entrega e ON e.motorista_id = m.id
WHERE m.cnh = 'E';
