/* 
======================================================
Introdução ao Banco de Dados - Conceitos Básicos
Curso: Consultas SQL: Avançando no SQL com MySQL (Alura)
Aluno/Desenvolvedor: Lucas Elias Dickmann
======================================================
 */
/* 
1. Identificando os dados no banco de dados 
-------------------------------------------------------
- Cada tabela armazena um conjunto de informações relacionadas.
- Em projetos grandes, a nomenclatura das tabelas pode não ser intuitiva.
- Para entender a estrutura, podemos visualizar os nomes das tabelas e colunas.

EXEMPLO:
Para listar todas as tabelas de um banco de dados no MySQL:
 */
SHOW TABLES;

/* 
2. Identificando colunas e tipos de dados 
-------------------------------------------------------
- Podemos ver a estrutura das tabelas e verificar quais colunas existem.
- Também conseguimos identificar se uma coluna é chave primária.

EXEMPLO:
Para visualizar as colunas de uma tabela específica:
 */
DESCRIBE tabela_exemplo;

/* 
3. Relacionamentos entre tabelas 
-------------------------------------------------------
- Em bancos de dados relacionais, usamos chaves estrangeiras (Foreign Keys) para conectar tabelas.
- No MySQL, podemos visualizar as chaves estrangeiras através de informações do sistema.

EXEMPLO:
 */
SELECT
  TABLE_NAME,
  COLUMN_NAME,
  CONSTRAINT_NAME,
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  TABLE_SCHEMA = 'nome_do_banco';

/* 
4. Gerando um esquema visual do banco (Reverse Engineering)
-------------------------------------------------------
- Ferramentas como MySQL Workbench permitem criar diagramas do banco de dados automaticamente.
- Esse processo é chamado de “Reverse Engineer Database”.
 */