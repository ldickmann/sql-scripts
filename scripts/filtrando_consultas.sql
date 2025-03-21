/* 
======================================================
Filtrando Consultas no MySQL
Curso: Consultas SQL: Avançando no SQL com MySQL (Alura)
Aluno/Desenvolvedor: Lucas Elias Dickmann
======================================================
 */
-- ==============================
-- 1. Revisando Consultas Básicas
-- ==============================
-- Consulta todas as colunas da tabela de clientes (listando cada campo individualmente)
SELECT
  CPF,
  NOME,
  ENDERECO_1,
  ENDERECO_2,
  BAIRRO,
  CIDADE,
  ESTADO,
  CEP,
  DATA_DE_NASCIMENTO,
  IDADE,
  SEXO,
  LIMITE_DE_CREDITO,
  VOLUME_DE_COMPRA,
  PRIMEIRA_COMPRA
FROM
  tabela_de_clientes;

-- Consulta todas as colunas da tabela de clientes (usando *)
SELECT
  *
FROM
  tabela_de_clientes;

-- Consulta apenas as colunas CPF e NOME da tabela de clientes
SELECT
  CPF,
  NOME
FROM
  tabela_de_clientes;

-- Retorna um produto específico pelo código
SELECT
  *
FROM
  tabela_de_produtos
WHERE
  CODIGO_DO_PRODUTO = '1000889';

-- Retorna os produtos que possuem o sabor 'Laranja'
SELECT
  *
FROM
  tabela_de_produtos
WHERE
  SABOR = 'Laranja';

-- ==============================
-- 2. Consultas Condicionais (WHERE, AND, OR, IN)
-- ==============================
-- Retorna os produtos com SABOR 'Manga' OU TAMANHO '470 ml'
SELECT
  *
FROM
  tabela_de_produtos
WHERE
  SABOR = 'Manga'
  OR TAMANHO = '470 ml';

-- Retorna os produtos com SABOR 'Manga' E TAMANHO '470 ml'
SELECT
  *
FROM
  tabela_de_produtos
WHERE
  SABOR = 'Manga'
  AND TAMANHO = '470 ml';

-- Retorna todos os produtos que tenham SABOR 'Laranja' OU 'Manga'
SELECT
  *
FROM
  tabela_de_produtos
WHERE
  SABOR IN ('Laranja', 'Manga');

-- ==============================
-- 3. Usando LIKE para buscas textuais
-- ==============================
/* O operador LIKE permite fazer buscas parciais usando '%' como caractere curinga. */
-- Retorna todos os produtos que contenham "Maçã" no sabor
SELECT
  *
FROM
  tabela_de_produtos
WHERE
  SABOR LIKE '%Maçã%';

-- Retorna todos os clientes cujo nome contenha "Mattos"
SELECT
  *
FROM
  tabela_de_clientes
WHERE
  NOME LIKE '%Mattos%';