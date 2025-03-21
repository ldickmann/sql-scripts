/* 
======================================================
Trabalhando com Funções no MySQL
Curso: Consultas SQL: Avançando no SQL com MySQL (Alura)
Aluno/Desenvolvedor: Lucas Elias Dickmann
======================================================
 */
/* Funções de Texto */
-- CONCAT: Concatena várias strings em uma só
SELECT
  CONCAT ("SQL ", "Tutorial ", "is ", "fun!") AS ConcatenatedString;

-- LTRIM: Remove espaços à esquerda de uma string
SELECT
  LTRIM ("     SQL Tutorial") AS LeftTrimmedString;

-- RTRIM: Remove espaços à direita de uma string
SELECT
  RTRIM ("SQL Tutorial     ") AS RightTrimmedString;

-- TRIM: Remove espaços à esquerda e à direita
SELECT
  TRIM('    SQL Tutorial    ') AS TrimmedString;

-- LCASE/LOWER: Converte a string para minúsculas
SELECT
  LCASE ("SQL Tutorial is FUN!");

SELECT
  LOWER("SQL Tutorial is FUN!");

-- UCASE/UPPER: Converte a string para maiúsculas
SELECT
  UCASE ("SQL Tutorial is FUN!");

SELECT
  UPPER("SQL Tutorial is FUN!");

-- SUBSTRING: Extrai uma parte de uma string a partir de uma posição específica
SELECT
  SUBSTRING("SQL Tutorial", 5, 3) AS ExtractString;

-- LENGTH: Retorna o tamanho de uma string
SELECT
  LENGTH ("SQL Tutorial") AS LengthOfString;

/* Exemplos Práticos no MySQL Workbench */
-- Remover espaços à esquerda da string 'OLÁ'
SELECT
  LTRIM ('    OLÁ') AS RESULTADO;

-- Remover espaços à direita da string 'OLÁ'
SELECT
  RTRIM ('OLÁ     ') AS RESULTADO;

-- Remover espaços de ambos os lados da string 'OLÁ'
SELECT
  TRIM('    OLÁ    ') AS RESULTADO;

-- Concatenar as palavras 'OLÁ' e 'TUDO BEM'
SELECT
  CONCAT ('OLÁ', ' ', 'TUDO BEM', '?') AS RESULTADO;

-- Converter o texto para maiúsculas
SELECT
  UPPER('olá, tudo bem?') AS RESULTADO;

-- Converter o texto para minúsculas
SELECT
  LOWER('OLÁ, TUDO BEM?') AS RESULTADO;

-- Extrair parte da string 'OLÁ, TUDO BEM?'
SELECT
  SUBSTRING('OLÁ, TUDO BEM?', 6) AS RESULTADO;

-- Extrair uma substring de 4 caracteres da string 'OLÁ, TUDO BEM?'
SELECT
  SUBSTRING('OLÁ, TUDO BEM?', 6, 4) AS RESULTADO;

-- Concatenar campos de uma tabela de clientes (nome e CPF)
SELECT
  CONCAT (NOME, ' (', CPF, ') ') AS RESULTADO
FROM
  TABELA_DE_CLIENTES;

-- Exercício 1: Faça uma consulta listando o nome do cliente e o endereço completo (Com rua, bairro, cidade e estado).
SELECT
  NOME,
  CONCAT (ENDERECO_1, ' ', BAIRRO, ' ', CIDADE, ' ', ESTADO) AS COMPLETO
FROM
  tabela_de_clientes;

/* Funções com Data e Funções de Data no MySQL */
/* Exemplo de Subtração de Data */
-- Exibe a data atual e a data subtraída de 5 dias
SELECT
  CURRENT_TIMESTAMP() AS DIA_HOJE,
  DATE_SUB (CURRENT_TIMESTAMP(), INTERVAL 5 DAY) AS RESULTADO;

/* Consultando Vendas e Formatação de Data */
-- Exibe todas as datas distintas de vendas
SELECT DISTINCT
  DATA_VENDA
FROM
  NOTAS_FISCAIS;

-- Exibe a data da venda, o dia da semana, o nome do mês e o ano da venda
SELECT DISTINCT
  DATA_VENDA,
  DAYNAME (DATA_VENDA) AS DIA,
  MONTHNAME (DATA_VENDA) AS MES,
  YEAR (DATA_VENDA) AS ANO
FROM
  NOTAS_FISCAIS;

-- Exercício 2: Crie uma consulta que mostre o nome e a idade atual dos clientes. Dica: Vc pode usar a função "TIMESTAMPDIFF" neste caso
SELECT
  NOME,
  TIMESTAMPDIFF (YEAR, DATA_DE_NASCIMENTO, CURDATE ()) AS IDADE
FROM
  tabela_de_clientes;

/* Conversão de Dados no MySQL */
/* Conversão de Data em String */
-- Exibe a data atual no formato timestamp
SELECT
  CURRENT_TIMESTAMP() AS RESULTADO;

-- Concatena a data atual com um texto
SELECT
  CONCAT ('O dia de hoje é: ', CURRENT_TIMESTAMP()) AS RESULTADO;

-- Formata a data atual para exibir o ano com 4 dígitos
SELECT
  CONCAT (
    'O dia de hoje é: ',
    DATE_FORMAT (CURRENT_TIMESTAMP(), '%Y')
  ) AS RESULTADO;

-- Exibe o ano com 2 dígitos
SELECT
  CONCAT (
    'O dia de hoje é: ',
    DATE_FORMAT (CURRENT_TIMESTAMP(), '%y')
  ) AS RESULTADO;

-- Exibe mês e ano no formato mm/yy
SELECT
  CONCAT (
    'O dia de hoje é: ',
    DATE_FORMAT (CURRENT_TIMESTAMP(), '%m/%y')
  ) AS RESULTADO;

-- Exibe o dia, mês (2 dígitos) e ano (4 dígitos)
SELECT
  CONCAT (
    'O dia de hoje é: ',
    DATE_FORMAT (CURRENT_TIMESTAMP(), '%d/%m/%Y')
  ) AS RESULTADO;

-- Exibe o dia da semana, dia, mês e ano
SELECT
  CONCAT (
    'O dia de hoje é: ',
    DATE_FORMAT (CURRENT_TIMESTAMP(), '%W, %d/%m/%Y')
  ) AS RESULTADO;

-- Exibe o número da semana do ano
SELECT
  CONCAT (
    'O dia de hoje é: ',
    DATE_FORMAT (CURRENT_TIMESTAMP(), '%d/%m/%Y - %U')
  ) AS RESULTADO;

/* Conversão de Tipo com CONVERT */
-- Converte um valor numérico para char
SELECT
  CONVERT(23.3, CHAR) AS RESULTADO;

-- Extrai uma substring de um valor convertido para char
SELECT
  SUBSTRING(CONVERT(23.3, CHAR), 1, 1) AS RESULTADO;