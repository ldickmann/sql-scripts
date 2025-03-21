/* 
======================================================
Script para Criação das Tabelas no Banco de Dados
Curso: Consultas SQL: Avançando no SQL com MySQL (Alura)
Aluno/Desenvolvedor: Lucas Elias Dickmann
======================================================
 */
/* ==============================
Criação da tabela 'tabela_de_produtos'
============================== */
CREATE TABLE
  `tabela_de_produtos` (
    `CODIGO_DO_PRODUTO` varchar(10) NOT NULL,
    `NOME_DO_PRODUTO` varchar(50) DEFAULT NULL,
    `EMBALAGEM` varchar(20) DEFAULT NULL,
    `TAMANHO` varchar(10) DEFAULT NULL,
    `SABOR` varchar(20) DEFAULT NULL,
    `PRECO_DE_LISTA` float NOT NULL,
    PRIMARY KEY (`CODIGO_DO_PRODUTO`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- A tabela 'tabela_de_produtos' contém informações sobre os produtos, incluindo o código do produto,
-- nome, embalagem, sabor, tamanho e o preço de lista. O código do produto é a chave primária.
/* ==============================
Criação da tabela 'tabela_de_vendedores'
============================== */
CREATE TABLE
  `tabela_de_vendedores` (
    `MATRICULA` varchar(5) NOT NULL,
    `NOME` varchar(100) DEFAULT NULL,
    `PERCENTUAL_COMISSAO` float DEFAULT NULL,
    `DATA_ADMISSAO` date DEFAULT NULL,
    `DE_FERIAS` bit (1) DEFAULT NULL,
    `BAIRRO` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`MATRICULA`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- A tabela 'tabela_de_vendedores' armazena informações sobre os vendedores, como matrícula,
-- nome, percentual de comissão, data de admissão, se está de férias e bairro. A matrícula é a chave primária.
/* ==============================
Criação da tabela 'tabela_de_clientes'
============================== */
CREATE TABLE
  `tabela_de_clientes` (
    `CPF` varchar(11) NOT NULL,
    `NOME` varchar(100) DEFAULT NULL,
    `ENDERECO_1` varchar(150) DEFAULT NULL,
    `ENDERECO_2` varchar(150) DEFAULT NULL,
    `BAIRRO` varchar(50) DEFAULT NULL,
    `CIDADE` varchar(50) DEFAULT NULL,
    `ESTADO` varchar(2) DEFAULT NULL,
    `CEP` varchar(8) DEFAULT NULL,
    `DATA_DE_NASCIMENTO` date DEFAULT NULL,
    `IDADE` smallint DEFAULT NULL,
    `SEXO` varchar(1) DEFAULT NULL,
    `LIMITE_DE_CREDITO` float DEFAULT NULL,
    `VOLUME_DE_COMPRA` float DEFAULT NULL,
    `PRIMEIRA_COMPRA` bit (1) DEFAULT NULL,
    PRIMARY KEY (`CPF`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- A tabela 'tabela_de_clientes' armazena informações sobre os clientes, como CPF, nome, endereços, 
-- cidade, estado, CEP, data de nascimento, idade, sexo, limite de crédito, volume de compra e 
-- se o cliente fez a primeira compra. O CPF é a chave primária.
/* ==============================
Criação da tabela 'notas_fiscais'
============================== */
CREATE TABLE
  `notas_fiscais` (
    `CPF` varchar(11) NOT NULL,
    `MATRICULA` varchar(5) NOT NULL,
    `DATA_VENDA` date DEFAULT NULL,
    `NUMERO` int NOT NULL,
    `IMPOSTO` float NOT NULL,
    PRIMARY KEY (`NUMERO`),
    KEY `MATRICULA` (`MATRICULA`),
    KEY `CPF` (`CPF`),
    CONSTRAINT `notas_fiscais_ibfk_1` FOREIGN KEY (`MATRICULA`) REFERENCES `tabela_de_vendedores` (`MATRICULA`),
    CONSTRAINT `notas_fiscais_ibfk_2` FOREIGN KEY (`CPF`) REFERENCES `tabela_de_clientes` (`CPF`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- A tabela 'notas_fiscais' registra informações sobre as vendas, como o CPF do cliente,
-- matrícula do vendedor, data da venda, número da nota fiscal e o imposto aplicado. 
-- A chave primária é o número da nota fiscal e há chaves estrangeiras para a tabela de vendedores 
-- e clientes, relacionando as vendas aos seus respectivos vendedores e clientes.
/* ==============================
Criação da tabela 'itens_notas_fiscais'
============================== */
CREATE TABLE
  `itens_notas_fiscais` (
    `NUMERO` int NOT NULL,
    `CODIGO_DO_PRODUTO` varchar(10) NOT NULL,
    `QUANTIDADE` int NOT NULL,
    `PRECO` float NOT NULL,
    PRIMARY KEY (`NUMERO`, `CODIGO_DO_PRODUTO`),
    KEY `CODIGO_DO_PRODUTO` (`CODIGO_DO_PRODUTO`),
    CONSTRAINT `itens_notas_fiscais_ibfk_1` FOREIGN KEY (`CODIGO_DO_PRODUTO`) REFERENCES `tabela_de_produtos` (`CODIGO_DO_PRODUTO`),
    CONSTRAINT `itens_notas_fiscais_ibfk_2` FOREIGN KEY (`NUMERO`) REFERENCES `notas_fiscais` (`NUMERO`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- A tabela 'itens_notas_fiscais' contém os itens de cada venda, relacionando cada produto 
-- vendido a uma nota fiscal específica. As colunas incluem número da nota fiscal, código do produto, 
-- quantidade vendida e preço do item. A chave primária é composta pelo número da nota fiscal e código do produto.
-- Fim do Script de Criação das Tabelas no Banco de Dados Sucos_Vendas