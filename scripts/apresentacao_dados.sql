/* 
======================================================
 Apresentação dos Dados de uma Consulta - SQL Avançado
 Curso: Consultas SQL: Avançando no SQL com MySQL (Alura)
 Aluno/Desenvolvedor: Lucas Elias Dickmann
======================================================
*/

-- ==============================
-- 1. Usando DISTINCT para evitar repetições
-- ==============================

-- Exibe todas as combinações de EMBALAGEM e TAMANHO
SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

-- Exibe apenas as combinações distintas de EMBALAGEM e TAMANHO
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

-- Exibe os bairros distintos de uma cidade específica
SELECT DISTINCT BAIRRO FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro';


-- ==============================
-- 2. Limitando a quantidade de resultados
-- ==============================

-- Retorna os 5 primeiros registros da tabela de produtos
SELECT * FROM tabela_de_produtos LIMIT 5;

-- Retorna as 10 primeiras vendas do dia 01/01/2017
SELECT * FROM notas_fiscais WHERE DATA_VENDA = '2017-01-01' LIMIT 10;


-- ==============================
-- 3. Ordenando os resultados
-- ==============================

-- Ordena os produtos pelo preço de lista em ordem crescente
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA;

-- Ordena os produtos pelo preço de lista em ordem decrescente
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC;


-- ==============================
-- 4. Usando a condição HAVING
-- ==============================

-- Soma dos limites de crédito por estado
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE 
FROM tabela_de_clientes 
GROUP BY ESTADO;

-- Retorna o maior e o menor preço agrupados por tipo de embalagem
SELECT EMBALAGEM, 
       MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, 
       MIN(PRECO_DE_LISTA) AS MENOR_PRECO 
FROM tabela_de_produtos 
GROUP BY EMBALAGEM;

-- Filtra os produtos onde a soma dos preços de lista é menor ou igual a R$80,00
SELECT EMBALAGEM, 
       MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, 
       MIN(PRECO_DE_LISTA) AS MENOR_PRECO 
FROM tabela_de_produtos 
GROUP BY EMBALAGEM
HAVING SUM(PRECO_DE_LISTA) <= 80;


-- ==============================
-- 5. Classificação de clientes por idade
-- ==============================

SELECT NOME,
       CASE 
           WHEN YEAR(DATA_DE_NASCIMENTO) < 1990 THEN 'Velhos'
           WHEN YEAR(DATA_DE_NASCIMENTO) BETWEEN 1990 AND 1995 THEN 'Jovens'
           ELSE 'Crianças' 
       END AS CLASSIFICACAO_POR_IDADE
FROM tabela_de_clientes;
