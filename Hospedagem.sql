CREATE DATABASE hospedagem;
USE hospedagem;
CREATE TABLE cliente(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE plano_hospedagem(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    espaco_gb INT NOT NULL,
    preco DECIMAL(7,2) NOT NULL
);
CREATE TABLE servidor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    hostname VARCHAR(60) NOT NULL UNIQUE,
    ip VARCHAR(15) NOT NULL UNIQUE,
    localizacao VARCHAR(40)
);
CREATE TABLE site(
	id INT PRIMARY KEY AUTO_INCREMENT,
    dominio VARCHAR(100) NOT NULL UNIQUE,
    data_contratacao DATE NOT NULL,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id)
    REFERENCES cliente(id),
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)
    REFERENCES plano_hospedagem(id),
    servidor_id INT NOT NULL,
    FOREIGN KEY (servidor_id)
    REFERENCES servidor(id)
);
CREATE TABLE certificado_ssl(
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_validade DATE NOT NULL,
    site_id INT NOT NULL,
    FOREIGN KEY (site_id)
    REFERENCES site(id)
);
SHOW TABLES;
DESCRIBE cliente;
DESCRIBE servidor;
ALTER TABLE servidor ADD sistema_operacional VARCHAR(30);
ALTER TABLE servidor MODIFY ip VARCHAR(45) NOT NULL;
ALTER TABLE servidor DROP COLUMN localizacao;
DESCRIBE servidor;