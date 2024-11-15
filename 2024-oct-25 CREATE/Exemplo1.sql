/* Exemplo de criação de tabelas */

CREATE DATABASE "25-10-Exemplo1"; /* Run it alone!! */

CREATE TABLE Cliente(
Cliente_ID INT PRIMARY KEY,
Cliente_Nome VARCHAR(20) NOT NULL, /* NOT NULL: Não pode ser nulo (Preenchimento Obrigatório) */
Cliente_Sobrenome VARCHAR(40) NOT NULL
);