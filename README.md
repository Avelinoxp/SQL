🛒 MySQL Database Management — Hands-On Guide (loja)📖 Sobre o ProjetoEste repositório contém um roteiro prático e estruturado demonstrando os principais comandos DDL (Data Definition Language) e DML (Data Manipulation Language) no MySQL / MariaDB.O projeto simula a criação do banco de dados de uma loja, incluindo relacionamento entre tabelas, manipulação de colunas e limpeza de estrutura.🛠️ Passo a Passo Executado📍 1. Administração Inicial do ServidorCREATE DATABASE loja; — Cria a instância do banco de dados.SHOW DATABASES; — Lista todos os bancos de dados do servidor para confirmar a criação.USE loja; — Define o banco loja como contexto ativo para os comandos seguintes.📍 2. Criação das Tabelas (CREATE TABLE)Foram criadas três tabelas principais estabelecendo relacionamentos por chave estrangeira (Foreign Key):TabelaColunaTipo de DadoRestriçõesDescriçãoclienteidINTPRIMARY KEY, AUTO_INCREMENTIdentificador úniconomeVARCHAR(100)NOT NULLNome completoemailVARCHAR(100)NOT NULL, UNIQUEE-mail exclusivoprodutoidINTPRIMARY KEY, AUTO_INCREMENTIdentificador úniconomeVARCHAR(100)NOT NULLNome do produtoprecoDECIMAL(5,2)NOT NULLPreço do produtopedidoidINTPRIMARY KEY, AUTO_INCREMENTIdentificador únicodata_pedidoDATENOT NULLData do pedidocliente_idINTFOREIGN KEY $\rightarrow$ cliente(id)Vínculo com a tabela clienteproduto_idINTFOREIGN KEY $\rightarrow$ produto(id)Vínculo com a tabela produto📍 3. Alteração da Estrutura da Tabela (ALTER TABLE)Sequência de alterações demonstradas na tabela cliente:Adicionar Coluna:ALTER TABLE cliente ADD telefone VARCHAR(20);

Renomear Coluna:ALTER TABLE cliente CHANGE telefone celulares VARCHAR(100);

Modificar Tipo e Restrições:ALTER TABLE cliente MODIFY celulares VARCHAR(20) NOT NULL;

Remover Coluna:ALTER TABLE cliente DROP COLUMN celulares;

📍 4. Consultas e Exclusão (SELECT & DROP)SELECT * FROM cliente; — Realiza a consulta de dados da tabela.DROP TABLE pedido; — Remove a tabela mantendo a integridade relacional.DROP DATABASE loja; — Apaga a base de dados completa do servidor.

-- 1. Cria o banco de dados loja
CREATE DATABASE loja;

-- 2. Mostra todos os bancos do servidor
SHOW DATABASES;

-- 3. Escolhendo o banco que iremos usar
USE loja;

-- 4. Criação das tabelas
CREATE TABLE cliente(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL, 
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE produto(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(5,2) NOT NULL
);

CREATE TABLE pedido(
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    cliente_id INT NOT NULL,
    produto_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- 5. Alterações de colunas na tabela cliente
ALTER TABLE cliente ADD telefone VARCHAR(20);
ALTER TABLE cliente CHANGE telefone celulares VARCHAR(100);
ALTER TABLE cliente MODIFY celulares VARCHAR(20) NOT NULL;
ALTER TABLE cliente DROP COLUMN celulares;

-- 6. Consulta de dados
SELECT * FROM cliente;

-- 7. Limpeza de estruturas
DROP TABLE pedido;
DROP DATABASE loja;


