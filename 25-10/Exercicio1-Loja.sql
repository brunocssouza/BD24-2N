/*
Utilize o exemplo anterior para criar um banco de dados com clientes, produtos e pedidos. Onde a relação Produto tem (Produto_ID, Produto_Nome, Descricao, 
Preco, Qtde_Estoque) e a relação Pedido tem (Pedido_ID, Cliente_ID, Produto_ID, Qtde).
*/

CREATE DATABASE "25-10-Exercicio1-Loja"; /* Run it alone!! */

CREATE TABLE Cliente(
	Cliente_ID INTEGER PRIMARY KEY,
	Cliente_Nome VARCHAR(20) NOT NULL,
	Cliente_Sobrenome VARCHAR(40) NOT NULL
);

CREATE TABLE Produto(
	Produto_ID SMALLINT PRIMARY KEY,
	Produto_Nome VARCHAR(20) NOT NULL,
	Descricao VARCHAR(100),
	Preco NUMERIC NOT NULL CHECK(Preco > 0), /* O NUMERIC inserido é CHECADO para que somente se o mesmo for maior que 0, ele seja registrado. */ 
	Qtde_Estoque SMALLINT DEFAULT 0 /* O valor associado á DEFAULT define um número padrão para aquele atributo, caso não inserido. */
);

CREATE TABLE Pedido(
	Pedido_ID INTEGER PRIMARY KEY,
	Cliente_ID INTEGER NOT NULL REFERENCES Cliente(Cliente_ID),
	Produto_ID SMALLINT NOT NULL REFERENCES Produto(Produto_ID),
	Qtde SMALLINT DEFAULT 1 /* SMALLINT: -32768 a +32767 */
);


