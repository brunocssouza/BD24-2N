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
	Qtde SMALLINT DEFAULT 1
);

ALTER TABLE cliente ADD email VARCHAR(255) NOT NULL;
ALTER TABLE produto RENAME COLUMN preco TO "money";

ALTER TABLE pedido DROP COLUMN qtde;

CREATE TABLE categoria (categoria_ID INT PRIMARY KEY NOT NULL);
DROP TABLE categoria;

TRUNCATE TABLE pedido;
TRUNCATE TABLE cliente CASCADE;

INSERT INTO cliente(cliente_ID, cliente_nome, cliente_sobrenome, email) VALUES 
(1, 'Joao', 'Silveira', '1@gmail.com'), 
(2, 'Marcelo', 'Oliveira', '2@gmail.com'), 
(3, 'Isadora', 'Vargas', '3@gmail.com');

INSERT INTO Produto(Produto_ID, Produto_Nome, Descricao, "money", Qtde_Estoque) VALUES 
(1, 'Bola Colorida', 'Uma bola de praia.', 15.00, 13), 
(2, 'Água', 'Água em garrafa de plástico de 1l', 5.00, 52);

ALTER TABLE pedido ADD Qtde INT DEFAULT 0;
INSERT INTO Pedido(Pedido_ID, Cliente_ID, Produto_ID, Qtde) VALUES
(1, 1, 2, 3), 
(2, 2, 1, 1), 
(3, 3, 2, 2);

SELECT produto_nome, qtde_estoque FROM produto;
UPDATE Produto SET qtde_estoque = 25, descricao = 'tal' WHERE produto_id <= 5;
SELECT produto_nome, qtde_estoque FROM produto;

DELETE FROM pedido WHERE pedido_id = 1 AND pedido_id = 3;

SELECT produto_nome, "money" FROM produto WHERE "money" < 10 ORDER BY produto_nome ASC;

ALTER TABLE cliente ADD COLUMN idade INT NOT NULL DEFAULT 18;
UPDATE cliente SET idade = 35 WHERE cliente_id = 3;
SELECT cliente_nome, idade FROM cliente WHERE idade > 17 AND idade < 31;

/* 06-11 */
/* Exercicio 1 */
ALTER TABLE cliente ADD COLUMN genero VARCHAR(10);
ALTER TABLE cliente ADD COLUMN salario NUMERIC;
ALTER TABLE cliente ADD COLUMN cpf NUMERIC;

INSERT INTO cliente (cliente_id, cliente_nome, cliente_sobrenome, email, idade, genero, salario, cpf) VALUES
(4, 'Bruno', 'César', '4@gmail.com', 22, 'Masculino', 1600, 85021166816),
(5, 'Bruno', 'Silva', '5@gmail.com', 48, 'Masculino', 4100, 93596351898),
(6, 'Bruno', 'Souza', '6@gmail.com', 19, 'Masculino', 1200, 30602566835);

UPDATE cliente SET cpf = 36728484841, salario = 1100, genero = 'Masculino' WHERE cliente_id = 1;
UPDATE cliente SET cpf = 60413100855, salario = 1300, genero = 'Masculino' WHERE cliente_id = 2;
UPDATE cliente SET cpf = 71660303800, salario = 1420, genero = 'Feminino' WHERE cliente_id = 3;



/* Exercicio 2 */
SELECT * FROM cliente;
SELECT DISTINCT cliente_nome FROM cliente;
SELECT cliente_nome, cpf FROM cliente;
SELECT cliente_nome, cpf FROM cliente WHERE genero = 'Feminino';
SELECT cliente_nome, cpf FROM cliente WHERE genero = 'Feminino' ORDER BY cliente_nome DESC;
SELECT cliente_nome, salario FROM cliente WHERE genero = 'Masculino' AND salario::numeric < 3000;