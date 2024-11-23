/* 22-11 */

/* VIEWS: Salva o resultado de uma consulta. */
CREATE OR REPLACE VIEW produtos_comprados AS
SELECT Pedido_ID, Cliente_Nome, Produto_Nome, Qtde, Qtde*Preco AS CustoTotal FROM Pedido 
JOIN Produto ON Pedido.Produto_ID = Produto.Produto_ID
JOIN Cliente ON Pedido.Cliente_ID = Cliente.Cliente_ID; 

select * from produtos_comprados

/* Exercicios 1 */
CREATE OR REPLACE VIEW produtos_categorias AS
SELECT Produto_Nome, Categoria_Nome FROM Produto
LEFT JOIN Categoria ON Produto.Categoria_ID = Categoria.Categoria_ID;

SELECT * FROM produtos_categorias;
/**/
CREATE OR REPLACE VIEW pedidos_feitos AS
SELECT Pedido_ID, Cliente.Cliente_Nome FROM Cliente
RIGHT JOIN Pedido ON Cliente.Cliente_ID = Pedido.Cliente_ID;

SELECT * FROM pedidos_feitos;
/**/
CREATE OR REPLACE VIEW usuarios_cliente AS
SELECT Pedido_ID, Cliente_Nome, Produto_Nome, Qtde, Qtde*Preco AS CustoTotal FROM Pedido 
JOIN Produto ON Pedido.Produto_ID = Produto.Produto_ID
FULL OUTER JOIN Cliente ON Pedido.Cliente_ID = Cliente.Cliente_ID; 

SELECT * FROM usuarios_cliente;

/* Index: Otimiza o acesso a uma determinada coluna */
CREATE INDEX ON Cliente(Cliente_ID);

CREATE INDEX ON Produto USING HASH (Produto_ID);

CREATE INDEX ON Pedido(Pedido_ID);
