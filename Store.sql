-- Cria o banco de dados da loja
CREATE DATABASE loja;
 
-- Mostra todos os bancos do servidor
SHOW DATABASES;
 
-- Escolhe o banco que vamos usar
USE loja;

-- Tabela de clientes da loja
CREATE TABLE cliente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
);


-- Catálogo de produtos
CREATE TABLE produto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  preco DECIMAL(8,2) NOT NULL
);

-- Cada pedido é de um cliente
CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    cliente_id INT NOT NULL,
    produto_id INT NOT NULL,
    FOREIGN KEY (cliente_id)
	REFERENCES cliente(id),
    FOREIGN KEY (produto_id)
	REFERENCES produto(id)
);
-- Insere um cliente (o id é gerado sozinho)
INSERT INTO cliente (nome, email)
VALUES ('Ana Souza', 'ana@email.com');

-- Mostra todas as linhas da tabela cliente
SELECT * FROM cliente;

-- Três clientes num único INSERT
INSERT INTO cliente (nome, email) VALUES
  ('Bruno Lima', 'bruno@email.com'),
  ('Carla Dias', 'carla@email.com'),
  ('Diego Rocha', 'diego@email.com');

-- Catálogo: preço com PONTO, sem aspas
INSERT INTO produto (nome, preco) VALUES
  ('Camiseta', 49.90),
  ('Boné', 35.00),
  ('Mochila', 129.90),
  ('Caneca', 24.50),
  ('Chaveiro', 3.50);
  
  -- Pedidos: o cliente e o produto precisam existir
INSERT INTO pedido (data_pedido, cliente_id, produto_id) VALUES
  ('2026-10-20', 1, 1),
  ('2026-10-21', 2, 3),
  ('2026-10-22', 1, 4);
 
-- Confere os pedidos
SELECT * FROM pedido;
