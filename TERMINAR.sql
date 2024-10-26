CREATE TABLE exercicio_exemplo(
	CREATE TABLE Produto (
	Produto_ID INT PRIMARY KEY,
	Produto_Nome VARCHAR(30) PRIMARY KEY,
	Descricao VARCHAR NULL,
	Preco NUMERIC CHECK (Preco > 0) NOT NULL, /* O NUMERIC inserido só é registrado se o mesmo for maior que 0*/ 
	Qtde_Estoque SMALLINT DEFAULT 0);