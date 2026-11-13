-- ==========================================================
-- CRIAÇÃO E POPULAÇÃO DO BANCO DE DADOS
-- ==========================================================
DROP DATABASE IF EXISTS viagens_delete;
CREATE DATABASE viagens_delete;
USE viagens_delete;

-- Clientes (pai): telefone pode ficar vazio
CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cidade VARCHAR(40) NOT NULL,
    telefone VARCHAR(15)
);

-- Reservas (filho): cliente_id aponta para cliente(id)
CREATE TABLE reserva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    destino VARCHAR(50) NOT NULL,
    data_viagem DATE NOT NULL,
    valor DECIMAL(8,2) NOT NULL,
    status VARCHAR(15) NOT NULL,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

INSERT INTO cliente (nome, cidade, telefone) VALUES
('Fernanda Alves', 'Fortaleza', '(85) 90000-0001'),
('Gustavo Reis', 'Natal', '(84) 90000-0002'),
('Helena Moura', 'Fortaleza', '(85) 90000-0003'),
('Ivo Teixeira', 'João Pessoa', '(83) 90000-0004'),
('Jéssica Lopes', 'Natal', '(84) 90000-0005'),
('Kleber Nunes', 'Fortaleza', NULL);

INSERT INTO reserva (destino, data_viagem, valor, status, cliente_id) VALUES
('Gramado', '2026-07-10', 3200.00, 'Concluída', 1),
('Porto de Galinhas', '2026-07-22', 2100.00, 'Concluída', 2),
('Bonito', '2026-08-05', 4500.00, 'Cancelada', 3),
('Jericoacoara', '2026-08-18', 1800.00, 'Concluída', 4),
('Foz do Iguaçu', '2026-09-02', 2900.00, 'Cancelada', 5),
('Fernando de Noronha', '2026-09-15', 6800.00, 'Concluída', 1),
('Chapada Diamantina', '2026-10-01', 2400.00, 'Concluída', 3),
('RESERVA TESTE', '2026-10-05', 0.00, 'Pendente', 2),
('Lençóis Maranhenses', '2026-11-20', 3100.00, 'Confirmada', 5),
('Lençóis Maranhenses', '2026-11-20', 3100.00, 'Confirmada', 5),
('Maragogi', '2026-12-05', 2600.00, 'Pendente', 4),
('Paraty', '2026-12-12', 1900.00, 'Confirmada', 2);


-- ==========================================================
-- 1. Preparar
-- ==========================================================
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM cliente; -- 6 linhas
SELECT * FROM reserva; -- 12 linhas


-- ==========================================================
-- 2. Uma linha pelo id
-- ==========================================================
SELECT * FROM reserva WHERE id = 10; -- 1 linha vai sumir (Lençóis Maranhenses duplicada)

DELETE FROM reserva
WHERE id = 10;


-- ==========================================================
-- 3. Várias linhas
-- ==========================================================
SELECT * FROM reserva WHERE status = 'Cancelada'; -- 2 linhas vão sumir (ids 3 e 5: Bonito e Foz do Iguaçu)

DELETE FROM reserva
WHERE status = 'Cancelada';


-- ==========================================================
-- 4. WHERE com AND
-- ==========================================================
SELECT * FROM reserva WHERE status = 'Concluída' AND valor < 2500; -- 3 linhas vão sumir (ids 2, 4 e 7: Porto de Galinhas, Jericoacoara e Chapada Diamantina)

DELETE FROM reserva
WHERE status = 'Concluída' AND valor < 2500;
-- Resposta: 3 linhas foram apagadas.


-- ==========================================================
-- 5. WHERE com LIKE
-- ==========================================================
SELECT * FROM reserva WHERE destino LIKE '%TESTE%'; -- 1 linha vai sumir (id 8: RESERVA TESTE)

DELETE FROM reserva
WHERE destino LIKE '%TESTE%';


-- ==========================================================
-- 6. WHERE com BETWEEN
-- ==========================================================
SELECT * FROM reserva WHERE data_viagem BETWEEN '2026-07-01' AND '2026-07-31'; -- 1 linha vai sumir (id 1: Gramado)

DELETE FROM reserva
WHERE data_viagem BETWEEN '2026-07-01' AND '2026-07-31';


-- ==========================================================
-- 7. Apagar com IS NULL
-- ==========================================================
SELECT * FROM cliente WHERE telefone IS NULL; -- 1 linha vai sumir (id 6: Kleber Nunes)

DELETE FROM cliente
WHERE telefone IS NULL;


-- ==========================================================
-- 8. ORDER BY e LIMIT
-- ==========================================================
SELECT * FROM reserva ORDER BY data_viagem LIMIT 1; -- 1 linha vai sumir (id 6: Fernando de Noronha, 2026-09-15)

DELETE FROM reserva
ORDER BY data_viagem
LIMIT 1;


-- ==========================================================
-- 9. DELETE com INNER JOIN
-- ==========================================================
SELECT reserva.*
FROM reserva
INNER JOIN cliente ON reserva.cliente_id = cliente.id
WHERE cliente.cidade = 'João Pessoa'; -- 1