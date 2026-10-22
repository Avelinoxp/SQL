CREATE DATABASE cinema;

USE cinema;

CREATE TABLE filme (
id INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(150) NOT NULL,
duracao_min INT NOT NULL,
classificacao VARCHAR (5)
);

CREATE TABLE sala (
numero INT PRIMARY KEY,
capacidade INT NOT NULL
);


CREATE TABLE ingresso (
    sessao_id INT,
    titulo VARCHAR(150) NOT NULL,  
    poltrona VARCHAR(4),
    preco DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (sessao_id, poltrona),
    FOREIGN KEY (sessao_id) REFERENCES sessao(id) -- Chave estrangeira adicionada
);


CREATE TABLE sessao (
id INT PRIMARY KEY AUTO_INCREMENT,
data_hora DATETIME NOT NULL,
filme_id INT NOT NULL,
FOREIGN KEY (filme_id) REFERENCES filme(id),
sala_numero INT NOT NULL,
FOREIGN KEY (sala_numero) REFERENCES sala(numero)
);

SHOW TABLES;

DESCRIBE filme;
DESCRIBE ingresso;
DESCRIBE sala;
DESCRIBE sessao;