-- Cria o banco de dados loja
CREATE DATABASE loja;

-- Mostra todos os bancos do servidor
SHOW DATABASES;
-- ESCOLHENDO O BANCO QUE IREMOS USAR
USE loja;

CREATE TABLE cliente(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL, 
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE produto(
	id INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    preco DECIMAL(5,2) NOT NULL
);

CREATE TABLE pedido(
	id INT AUTO_INCREMENT PRIMARY KEY,
	data_pedido DATE NOT NULL,
	cliente_id int NOT NULL,
    produto_id INT NOT NULL,
    FOREIGN KEY (cliente_id)
    REFERENCES cliente(id),
	FOREIGN KEY (produto_id)
    REFERENCES produto(id)
 );
 
 -- Acrescenta colunas em tabelas existentes
 ALTER TABLE cliente ADD telefone VARCHAR(20);
 
 -- Alterar o nome de uma coluna incorreta
 ALTER TABLE cliente CHANGE telefone celulares VARCHAR(100);
 
 -- Mostra todas as informaçoes das tabelas
SELECT * FROM cliente;

-- Aumenta ou diminui o tipo de dados colocados anteriormente
ALTER TABLE cliente MODIFY celulares VARCHAR(20) NOT NULL;

-- Remove a coluna celulares
ALTER TABLE cliente DROP COLUMN celulares;

-- Apagar uma tabela
DROP TABLE pedido;

-- Apaga o banco de dados
DROP DATABASE loja;