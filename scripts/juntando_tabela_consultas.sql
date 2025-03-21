/* 
======================================================
Jusntando Tabelas e Consultas no MySQL
Curso: Consultas SQL: Avançando no SQL com MySQL (Alura)
Aluno/Desenvolvedor: Lucas Elias Dickmann
======================================================
 */
/* ==============================
01. Usando JOINS 
============================== */
/* Aprendemos sobre as estruturas de JOIN, que permitem unir duas ou mais tabelas dentro de uma única consulta SQL. 
Para que isso aconteça, as tabelas devem ter um campo em comum. */
-- Exemplo de INNER JOIN:
SELECT
  A.NOME,
  B.HOBBY
FROM
  TABELA_ESQUERDA A
  INNER JOIN TABELA_DIREITA B ON A.IDENTIFICADOR = B.IDENTIFICADOR;

-- Explicação:
-- 'TABELA_ESQUERDA A' é um alias para a tabela da esquerda e 'TABELA_DIREITA B' é um alias para a tabela da direita.
-- 'SELECT A.NOME, B.HOBBY' seleciona o campo 'NOME' da tabela A e 'HOBBY' da tabela B.
-- 'ON A.IDENTIFICADOR = B.IDENTIFICADOR' é a condição de junção que indica o campo comum entre as duas tabelas.
-- O 'INNER JOIN' retorna apenas os registros que têm correspondência nas duas tabelas.
/* Exercício: Faturamento anual da empresa */
/* O valor financeiro das vendas é calculado multiplicando a quantidade pelo preço. */
SELECT
  YEAR (DATA_VENDA),
  SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM
  notas_fiscais NF
  INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
GROUP BY
  YEAR (DATA_VENDA);

/* ==============================
03. Exemplos de LEFT e RIGHT JOIN 
============================== */
/* O LEFT JOIN retorna todos os registros da tabela à esquerda, enquanto o RIGHT JOIN retorna todos os registros da tabela à direita. */
/* Exemplo de contagem de clientes cadastrados: */
SELECT
  COUNT(*)
FROM
  tabela_de_clientes;

-- Exemplo de contagem de CPFs distintos nas notas fiscais:
SELECT
  CPF,
  COUNT(*)
FROM
  notas_fiscais
GROUP BY
  CPF;

/* ==============================
05. Exemplos de FULL e CROSS JOIN 
============================== */
/* O FULL JOIN retorna todos os registros de ambas as tabelas, enquanto o CROSS JOIN retorna o produto cartesiano entre as tabelas. */
/* Exemplo de INNER JOIN (para verificar bairros comuns entre vendedores e clientes): */
SELECT
  *
FROM
  tabela_de_vendedores
  INNER JOIN tabela_de_clientes ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

/* ==============================
07. Juntando Consultas com UNION 
============================== */
/* O comando UNION junta os resultados de duas ou mais consultas, retornando uma lista única com todos os registros, sem duplicatas. */
/* Exemplo: Consultar bairros de clientes e vendedores */
SELECT DISTINCT
  BAIRRO
FROM
  tabela_de_clientes;

SELECT DISTINCT
  BAIRRO
FROM
  tabela_de_vendedores;

/* Com UNION, duplicatas são removidas. O bairro 'Tijuca' aparecerá apenas uma vez. */
SELECT DISTINCT
  BAIRRO
FROM
  tabela_de_clientes
UNION
SELECT DISTINCT
  BAIRRO
FROM
  tabela_de_vendedores;