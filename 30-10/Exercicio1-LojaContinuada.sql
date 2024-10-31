CREATE DATABASE 30-10-Exercicio1-LojaContinuada /** RUN IT ALONE **/ 

/** EXERCICIO 1: 
1) Altere a tabela usuario para adicionar uma coluna chamada email, do tipo
VARCHAR(255), que não permite valores nulos. Altere a tabela produtos para
renomear a coluna preco para money.

2) Remova a coluna quant da tabela pedidos.

3) Crie uma tabela Categoria Em seguida, apague a tabela Categoria do banco de
dados.

4) Limpe todos os registros da tabela pedidos, sem remover a estrutura da tabela.
Faça o mesmo com a tabela usuario.
**/

/** 1. **/
ALTER TABLE cliente ADD email VARCHAR(255) NOT NULL;
ALTER TABLE produto RENAME COLUMN preco TO "money";

/** 2. **/
ALTER TABLE pedido DROP COLUMN qtde;

/** 3. **/
CREATE TABLE categoria (categoria_ID INT PRIMARY KEY NOT NULL)
DROP TABLE categoria

/** 4. **/
TRUNCATE TABLE pedido
TRUNCATE TABLE cliente;

/** EXEMPLOS: **/
INSERT INTO cliente(cliente_ID, cliente_nome, cliente_sobrenome, email) VALUES 
(1, 'Joao', 'Silveira', '1@gmail.com'), 
(2, 'Marcelo', 'Oliveira', '2@gmail.com'), 
(3, 'Isadora', 'Vargas', '3@gmail.com')

INSERT INTO Produto(Produto_ID, Produto_Nome, Descricao, "money", Qtde_Estoque) VALUES 
(1, 'Bola Colorida', 'Uma bola de praia.', 15.00, 13), 
(2, 'Água', 'Água em garrafa de plástico de 1l', 5.00, 52);

/** EXERCICIO 2:
1) Inserir 5 registros na relação pedidos, exibir os registros da relação.

2) Modificar o estoque da relação produtos de acordo com os 5 pedidos, exibir
somente o nome_produto e Qtde_Estoque da relação antes e depois de
fazer a modificação.

3) Deletar os registros 1 e 3 da relação pedidos.
INSERT INTO Pedido(Pedido_ID, Cliente_ID, Produto_ID, Qtde) VALUES
(4, 1, 2, 3), 
(5, 2, 1, 2);
**/

ALTER TABLE pedido ADD Qtde INT DEFAULT 0;
INSERT INTO Pedido(Pedido_ID, Cliente_ID, Produto_ID, Qtde) VALUES
(1, 1, 2, 3), 
(2, 2, 1, 1), 
(3, 3, 2, 2);

SELECT produto_nome, qtde_estoque FROM produto;
UPDATE Produto SET qtde_estoque = 25, descricao = 'tal' WHERE produto_id <= 5;
SELECT produto_nome, qtde_estoque FROM produto;

DELETE FROM pedido WHERE pedido_id = 1 AND pedido_id = 3;

/** EXERCICIO 3:
1) Mostre todos os produtos em que o preço seja maior que 50. Exiba apenas as
colunas nome_produto e preço, ordenando o resultado em ordem crescente de
preco.

2) Mostre todos os usuários com idade entre 18 e 30 anos e também apenas as
colunas nome e idade, e ao final da consulta, conte quantos usuários
correspondem a esse critério.
**/

SELECT produto_nome, "money" FROM produto WHERE "money" < 10 ORDER BY produto_nome ASC;

ALTER TABLE cliente ADD COLUMN idade INT NOT NULL DEFAULT 18;
UPDATE cliente SET idade = 35 WHERE cliente_id = 3;
SELECT cliente_nome, idade FROM cliente WHERE idade > 17 AND idade < 31;


