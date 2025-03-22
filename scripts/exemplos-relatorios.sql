/* 
======================================================
Exemplos de Relatórios
Curso: Consultas SQL: Avançando no SQL com MySQL (Alura)
Aluno/Desenvolvedor: Lucas Elias Dickmann
======================================================
 */
-- ==============================
-- 1. Seleção de Dados
-- ==============================
SELECT
  *
FROM
  itens_notas_fiscais;

SELECT
  *
FROM
  notas_fiscais;

-- Fazemos uma seleção INNER JOIN pois as informações estão em tabelas diferentes
SELECT
  *
FROM
  notas_fiscais NF
  INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO;

-- Ajustamos a consulta para mostrar apenas as colunas com as informações que precisamos
SELECT
  NF.CPF,
  NF.DATA_VENDA,
  INF.QUANTIDADE
FROM
  NOTAS_FISCAIS NF
  INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO;

-- ==============================
-- 2. Agrupamento de Dados
-- ==============================
-- Agrupamos as vendas mensalmente alterando o formato da data
SELECT
  NF.CPF,
  DATE_FORMAT (NF.DATA_VENDA, '%Y-%m') AS MES_ANO,
  INF.QUANTIDADE
FROM
  NOTAS_FISCAIS NF
  INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO;

-- Agrupamos as vendas por cliente e mês
SELECT
  NF.CPF,
  DATE_FORMAT (NF.DATA_VENDA, '%Y-%m') AS MES_ANO,
  SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS
FROM
  NOTAS_FISCAIS NF
  INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
GROUP BY
  NF.CPF,
  DATE_FORMAT (NF.DATA_VENDA, '%Y-%m');

-- ==============================
-- 3. Validação de Vendas
-- ==============================
SELECT
  *
FROM
  TABELA_DE_CLIENTES TC;

/* Esta consulta nos dá a coluna 'status_venda', informando se cada venda é válida ou não */
SELECT
  X.CPF,
  X.NOME,
  X.MES_ANO,
  X.QUANTIDADE_VENDAS,
  X.QUANTIDADE_LIMITE,
  CASE
    WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
    ELSE 'VÁLIDA'
  END AS STATUS_VENDA
FROM
  (
    SELECT
      NF.CPF,
      TC.NOME,
      DATE_FORMAT (NF.DATA_VENDA, '%Y-%m') AS MES_ANO,
      SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS,
      MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE
    FROM
      NOTAS_FISCAIS NF
      INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
      INNER JOIN TABELA_DE_CLIENTES TC ON TC.CPF = NF.CPF
    GROUP BY
      NF.CPF,
      TC.NOME,
      DATE_FORMAT (NF.DATA_VENDA, '%Y-%m')
  ) X;

-- ==============================
-- 4. Ranking de Vendas por Tamanho
-- ==============================
SELECT
  VENDA_TAMANHO.TAMANHO,
  VENDA_TAMANHO.ANO,
  VENDA_TAMANHO.QUANTIDADE,
  ROUND(
    (VENDA_TAMANHO.QUANTIDADE / VENDA_TOTAL.QUANTIDADE) * 100,
    2
  ) AS PARTICIPACAO
FROM
  (
    SELECT
      TP.TAMANHO,
      YEAR (NF.DATA_VENDA) AS ANO,
      SUM(INF.QUANTIDADE) AS QUANTIDADE
    FROM
      TABELA_DE_PRODUTOS TP
      INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
      INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
    WHERE
      YEAR (NF.DATA_VENDA) = 2016
    GROUP BY
      TP.TAMANHO,
      YEAR (NF.DATA_VENDA)
  ) AS VENDA_TAMANHO
  INNER JOIN (
    SELECT
      YEAR (NF.DATA_VENDA) AS ANO,
      SUM(INF.QUANTIDADE) AS QUANTIDADE
    FROM
      TABELA_DE_PRODUTOS TP
      INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
      INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
    WHERE
      YEAR (NF.DATA_VENDA) = 2016
    GROUP BY
      YEAR (NF.DATA_VENDA)
  ) AS VENDA_TOTAL ON VENDA_TAMANHO.ANO = VENDA_TOTAL.ANO
ORDER BY
  VENDA_TAMANHO.QUANTIDADE DESC;