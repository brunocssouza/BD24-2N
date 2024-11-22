CREATE TABLE Cliente(
	Cliente_ID INTEGER PRIMARY KEY,
	Cliente_Nome VARCHAR(20) NOT NULL,
	Cliente_Sobrenome VARCHAR(40) NOT NULL
);

CREATE TABLE Produto(
	Produto_ID SMALLINT PRIMARY KEY,
	Produto_Nome VARCHAR(20) NOT NULL,
	Descricao VARCHAR(100),
	Preco MONEY NOT NULL CHECK(Preco::numeric > 0), /* O NUMERIC inserido é CHECADO para que somente se o mesmo for maior que 0, ele seja registrado. */ 
	Qtde_Estoque SMALLINT DEFAULT 0 /* O valor associado á DEFAULT define um número padrão para aquele atributo, caso não inserido. */
);

CREATE TABLE Pedido(
	Pedido_ID INTEGER PRIMARY KEY,
	Cliente_ID INTEGER NOT NULL REFERENCES Cliente(Cliente_ID),
	Produto_ID SMALLINT NOT NULL REFERENCES Produto(Produto_ID),
	Qtde SMALLINT DEFAULT 1
);

ALTER TABLE cliente ADD email VARCHAR(255) NOT NULL;
ALTER TABLE pedido DROP COLUMN qtde;
ALTER TABLE pedido ADD Qtde INT DEFAULT 0;

CREATE TABLE categoria (categoria_ID INT PRIMARY KEY NOT NULL);

DROP TABLE categoria;

TRUNCATE TABLE pedido;
TRUNCATE TABLE cliente CASCADE;

INSERT INTO cliente(cliente_ID, cliente_nome, cliente_sobrenome, email) VALUES 
(1, 'Joao', 'Silveira', '1@gmail.com'), 
(2, 'Marcelo', 'Oliveira', '2@gmail.com'), 
(3, 'Isadora', 'Vargas', '3@gmail.com');

INSERT INTO Produto(Produto_ID, Produto_Nome, Descricao, preco, Qtde_Estoque) VALUES 
(1, 'Bola Colorida', 'Uma bola de praia.', 15, 13), 
(2, 'Água', 'Água em garrafa de plástico de 1l', 5, 52),
(3, 'Refrigerante', 'Latinha 350ml', 7, 80),
(4, 'Feijao', 'Feijao Preto', 3.50, 10);

INSERT INTO Pedido(Pedido_ID, Cliente_ID, Produto_ID, Qtde) VALUES
(1, 1, 2, 3), 
(2, 2, 1, 1), 
(3, 3, 2, 2),
(4, 1, 3, 1),
(5, 1, 1, 2);

SELECT produto_nome, qtde_estoque FROM produto;

UPDATE Produto SET qtde_estoque = 25, descricao = 'tal' WHERE produto_id <= 5;

SELECT produto_nome, qtde_estoque FROM produto;

DELETE FROM pedido WHERE pedido_id = 1 AND pedido_id = 3;

SELECT produto_nome, preco FROM produto WHERE preco::numeric < 10 ORDER BY produto_nome ASC;

ALTER TABLE cliente ADD COLUMN idade INT NOT NULL DEFAULT 18;

UPDATE cliente SET idade = 35 WHERE cliente_id = 3;

SELECT cliente_nome, idade FROM cliente WHERE idade > 17 AND idade < 31;

ALTER TABLE cliente ADD COLUMN genero VARCHAR(20);
ALTER TABLE cliente ADD COLUMN salario MONEY;
ALTER TABLE cliente ADD COLUMN cpf NUMERIC;

INSERT INTO cliente (cliente_id, cliente_nome, cliente_sobrenome, email, idade, genero, salario, cpf) VALUES
(4, 'Bruno', 'César', '4@gmail.com', 22, 'Masculino', 1600, 85021166816),
(5, 'Bruno', 'Silva', '5@gmail.com', 48, 'Masculino', 4100, 93596351898),
(6, 'Bruno', 'Souza', '6@gmail.com', 19, 'Masculino', 1200, 30602566835);

UPDATE cliente SET cpf = 36728484841, salario = 1100, genero = 'Masculino' WHERE cliente_id = 1;
UPDATE cliente SET cpf = 60413100855, salario = 1300, genero = 'Masculino' WHERE cliente_id = 2;
UPDATE cliente SET cpf = 71660303800, salario = 1420, genero = 'Feminino' WHERE cliente_id = 3;

SELECT DISTINCT cliente_nome FROM cliente;
SELECT cliente_nome, cpf FROM cliente;
SELECT cliente_nome, cpf FROM cliente WHERE genero = 'Feminino';
SELECT cliente_nome, cpf FROM cliente WHERE genero = 'Feminino' ORDER BY cliente_nome DESC;
SELECT cliente_nome, salario FROM cliente WHERE genero = 'Masculino' AND salario::numeric < 3000;


SELECT COUNT(*) AS produto_quant FROM produto;
SELECT COUNT(qtde) AS cliente2pedidos_quant FROM pedido WHERE cliente_id = 2;
SELECT COUNT(qtde) AS produto1pedidos_quant FROM pedido WHERE produto_id = 1;
SELECT COUNT(DISTINCT cliente_id) AS clientesUnicos_quant FROM pedido;


SELECT AVG(preco::numeric) AS custo_media FROM produto;
SELECT AVG(qtde) AS qtdeProdPedido_media FROM pedido;
SELECT AVG(num_pedidos) as qtdePedidos_media FROM (
SELECT cliente_id, COUNT(cliente_id) AS num_pedidos FROM pedido GROUP BY cliente_id
) as foo;
SELECT AVG(salario::numeric) AS salario_media FROM cliente;
SELECT AVG(salario::numeric) as salario_media from cliente group by genero;

SELECT 
    (SELECT COUNT(*) FROM cliente WHERE genero = 'Masculino') AS usuarios_masculinos,
    (SELECT COUNT(*) FROM cliente WHERE genero = 'Feminino') AS usuarios_femininos;

SELECT SUM(preco*.9) AS "10%descontoProdutos_sum" FROM Produto;

SELECT cliente_nome, pedido_id FROM cliente, pedido;

SELECT produto_nome, qtde FROM produto, pedido;

SELECT cliente_nome, pedido_id, qtde FROM cliente, pedido
WHERE cliente.cliente_id = pedido.cliente_id AND qtde > 2;

SELECT cliente_nome, qtde, produto_nome, preco*qtde AS soma_valor FROM cliente, pedido, produto 
WHERE pedido.cliente_id = cliente.cliente_id AND pedido.produto_id = produto.produto_id;

UPDATE Cliente SET cliente_nome = 'Lucas' WHERE cliente_id = 4;
UPDATE Cliente SET cliente_nome = 'José' WHERE cliente_id = 5;

/* 14-11 */
/* Exemplos */
SELECT pedido_id, produto_nome, qtde FROM pedido
JOIN produto ON pedido.pedido_id = produto.produto_id
WHERE pedido_id = 2;

SELECT pedido_id, produto_nome, Cliente.cliente_nome, Pedido.qtde FROM Pedido
JOIN Produto ON Produto.produto_id = Pedido.produto_id
JOIN Cliente ON Pedido.cliente_id = Cliente.cliente_id;

/* Exercicio 1: Selecione todos os produtos que foram comprados por um determinado usuario */
SELECT produto_nome FROM Produto
JOIN Pedido ON Pedido.produto_id = Produto.produto_id
WHERE Pedido.cliente_id = 1;

/* Exercicio 2: Selecione todos os produtos em uma determinada categoria */
CREATE TABLE Categoria (categoria_id INT PRIMARY KEY, Categoria_nome VARCHAR);

ALTER TABLE Produto ADD COLUMN categoria_id INT REFERENCES Categoria(categoria_id);

INSERT INTO Categoria(categoria_id, categoria_nome) VALUES
(1, 'Lazer'),
(2, 'Bebida')
(3, 'Comida');

UPDATE Produto SET categoria_id = 1 WHERE produto_id = 1;
UPDATE Produto SET categoria_id = 2 WHERE produto_id = 2;
UPDATE Produto SET categoria_id = 2 WHERE produto_id = 3;

SELECT produto_nome FROM Produto WHERE categoria_id = 2;

/* Exercicio 3: Selecione todos os pedidos feitos por um detrminado cliente em uma determinada categoria */
SELECT pedido_id, Produto.produto_nome, Categoria.categoria_nome FROM Pedido
JOIN Cliente ON Cliente.cliente_id = Pedido.cliente_id
JOIN Produto ON Produto.produto_Id = Pedido.produto_id
JOIN Categoria ON Categoria.categoria_id = Produto.categoria_id
WHERE Cliente.cliente_id = 1 AND Categoria.categoria_id = 2;

/* Exercicio 4: Selecione os pedidos com os nomes dos produtos de um usuario*/
SELECT pedido_id, Produto.produto_nome FROM Pedido
JOIN Cliente ON Cliente.cliente_id = Pedido.cliente_id
JOIN Produto ON Produto.produto_Id = Pedido.produto_id
WHERE Cliente.cliente_id = 1;
