-- Banco da loja virtual (rode como root)
CREATE DATABASE loja_online_seg;
USE loja_online_seg;
 
CREATE TABLE produto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  preco DECIMAL(7,2) NOT NULL,
  estoque INT NOT NULL
);
 
-- Clientes: e-mail é dado pessoal
CREATE TABLE cliente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  cidade VARCHAR(40) NOT NULL
);
 
-- Pedidos: ligam cliente e produto
CREATE TABLE pedido (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  produto_id INT NOT NULL,
  quantidade INT NOT NULL,
  status VARCHAR(20) NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES cliente(id),
  FOREIGN KEY (produto_id) REFERENCES produto(id)
);
 
INSERT INTO produto (nome, preco, estoque) VALUES
  ('Fone Bluetooth', 149.90, 25),
  ('Mouse sem fio', 79.90, 40),
  ('Teclado mecânico', 289.00, 12),
  ('Webcam HD', 199.00, 9);
 
INSERT INTO cliente (nome, email, cidade) VALUES
  ('Larissa Prado', 'larissa.prado@email.com', 'Recife'),
  ('Otávio Cunha', 'otavio.cunha@email.com', 'Curitiba'),
  ('Sabrina Melo', 'sabrina.melo@email.com', 'Belém');
 
INSERT INTO pedido (cliente_id, produto_id, quantidade, status) VALUES
  (1, 1, 1, 'Entregue'),
  (2, 3, 1, 'Pago'),
  (3, 2, 2, 'Pago'),
  (1, 4, 1, 'Novo');
  
  -- (root) Liste os usuários que já existem no servidor.
  SELECT user, host FROM mysql.user;
  
  DROP USER 'usuario3'@'localhost';
  
  -- (root) Crie os 3 usuários, todos em localhost, com as senhas da tabela.
  CREATE USER 'site_loja'@'localhost'
  IDENTIFIED BY 'user';
  
  CREATE USER 'suporte'@'localhost'
  IDENTIFIED BY 'Suporte@2026';
  
  CREATE USER 'financeiro'@'localhost'
  IDENTIFIED BY 'Financ@2026';
  
  -- (root) Dê a cada um só as permissões do seu perfil. Dica: o site_loja precisa de duas linhas de GRANT, uma para cada tabela. O suporte também.
  GRANT SELECT ON loja_online_seg.*
  TO 'suporte'@'localhost', 'financeiro'@'localhost';
  
-- 1. Revoga permissões anteriores para limpar a estrutura
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'site_loja'@'localhost', 'suporte'@'localhost', 'financeiro'@'localhost';

-- 2. Permissões do site_loja (Ver produtos, cadastrar pedidos)
GRANT SELECT ON loja_online_seg.produto TO 'site_loja'@'localhost';
GRANT INSERT ON loja_online_seg.pedido TO 'site_loja'@'localhost';

-- 3. Permissões do suporte (Ver clientes, ver pedidos e alterar APENAS o status do pedido)
GRANT SELECT ON loja_online_seg.cliente TO 'suporte'@'localhost';
GRANT SELECT ON loja_online_seg.pedido TO 'suporte'@'localhost';
GRANT UPDATE (status) ON loja_online_seg.pedido TO 'suporte'@'localhost';

-- 4. Permissões do financeiro (Apenas consultar em todas as tabelas)
GRANT SELECT ON loja_online_seg.* TO 'financeiro'@'localhost';

-- 5. Atualizar os privilégios do servidor
FLUSH PRIVILEGES;
  
  GRANT UPDATE ON loja_online_seg.*
  TO 'suporte'@'localhost';
  
  GRANT SELECT, INSERT ON loja_online_seg.produto
  TO 'site_loja'@'localhost';
  
  GRANT SELECT, INSERT ON loja_online_seg.pedido
  TO 'site_loja'@'localhost';
  

  
  -- (root) Mostre o SHOW GRANTS de cada usuário e confira com a tabela de perfis.
  SHOW GRANTS FOR 'site_loja'@'localhost';
  SHOW GRANTS FOR 'suporte'@'localhost';
  SHOW GRANTS FOR 'financeiro'@'localhost';
  
  -- (site_loja) Crie a conexão do site_loja e teste
-- Não e permitido o usuario site_loja fazer atualizações das tabelas que não possui autorização, mas cadastrar pedido sim

  -- (suporte) Crie a conexão do suporte e teste
-- Não e permitido o usuario suporte fazer atualizações das tabelas que não possui autorização como deletar mas foi permitido atualizar

  -- (financeiro) Crie a conexão do financeiro e teste
-- Não e permitido o financeiro suporte fazer atualizações das tabelas que não possui autorização.

  -- (root) O site vai entrar em manutenção: tire do site_loja a permissão de cadastrar pedidos e mostre o SHOW GRANTS dele.
  REVOKE UPDATE ON loja_online_seg.pedido
  FROM 'site_loja'@'localhost';
  
  SHOW GRANTS FOR 'site_loja'@'localhost';
  
  -- (root) A equipe financeira saiu de férias: bloqueie o usuário financeiro e tente abrir a conexão dele. Qual erro aparece?
  ALTER USER 'financeiro'@'localhost' ACCOUNT LOCK;
  
  -- (root) Fim do teste: apague os 3 usuários e confirme com a lista de usuários.
  DROP USER 'site_loja'@'localhost';
  DROP USER 'suporte'@'localhost';
  DROP USER 'financeiro'@'localhost';
  
  -- Responda num comentário: por que o site não deve se conectar ao banco como root?
-- Por que o root possui muitas permissões.
