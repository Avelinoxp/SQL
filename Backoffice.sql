-- 1. Criação e seleção do banco de dados
CREATE DATABASE backoffice;
USE backoffice;

-- 2. Criação da tabela matricula
CREATE TABLE matricula (
    id INT PRIMARY KEY AUTO_INCREMENT,
    funcao VARCHAR(10),
    habilitado VARCHAR(7),
    email VARCHAR(100)
);

-- 3. Inserção dos dados da tabela matricula
INSERT INTO matricula (id, funcao, habilitado, email) VALUES
(51006244, 'Manager', 'Inativo', 'mzx.avelino@outlook.com'),
(51004462, 'Operador', 'Ativo', 'Vitoriamaria@outback.com'),
(109102, 'Proprietor', 'Ativo', 'AlyneCastro@OutbackP.com'),
(5054, 'Key', 'Inativo', 'keyAnaju@outlook.com');

-- 4. Criação da tabela ferias
CREATE TABLE ferias (
    id INT,
    periodo_aquisitivo DATE,
    periodo_concessivo DATE,
    CONSTRAINT fk_ferias_matricula FOREIGN KEY (id) REFERENCES matricula(id)
);

-- 5. Inserção das datas de férias e períodos correspondentes
INSERT INTO ferias (id, periodo_aquisitivo, periodo_concessivo) VALUES
(51006244, '2024-06-15', '2026-07-19'),
(51004462, '2023-03-22', '2024-04-26'),
(109102,   '2021-12-06', '2023-04-06'),
(5054,     '2025-01-12', NULL);

-- 6. Consulta para validação e cruzamento dos dados
SELECT 
    m.id AS id_funcionario,
    m.funcao,
    m.habilitado AS status_kairos,
    m.email AS email_corporativo,
    f.periodo_aquisitivo,
    f.periodo_concessivo
FROM matricula m
LEFT JOIN ferias f ON m.id = f.id;