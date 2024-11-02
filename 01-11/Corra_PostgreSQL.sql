SELECT * FROM personagem
INSERT INTO personagem (personagem_id, personagem_nome, etnia, genero, fk_tratamento_tratamento_id) VALUES
(1, 'Missy Armitage', 'Branco', 'Feminino', NULL),
(2, 'Rose Armitage', 'Branco', 'Feminino', NULL),
(3, 'Dean Armitage', 'Branco', 'Masculino', NULL),
(4, 'Jeremy Armitage', 'Branco', 'Masculino', NULL),
(5, 'Chris Washington', 'Negro', 'Masculino', 2);

SELECT * FROM tratamento
INSERT INTO tratamento (tratamento_id, tratamento_nome, descricao) VALUES
(1, 'Manipulacao', 'Atração de afro-americanos para a região.'),
(2, 'Controle', 'Utilização de hipnose para controle do indivíduo em questão.'),
(3, 'Transferencia', 'Processo de troca, a partir de neurocirurgia, em que o controlador é transplantado para que o espectador tome posse parcial do indivíduo.'),
(4, 'Coagulacao', 'Fase final do tratamento onde o controle completo sobre o sujeito é exercido.');

SELECT * FROM familia
INSERT INTO familia (familia_id, familia_nome) VALUES
(1, 'Armitage'),
(2, 'Washington'),
(3, 'Dray');

SELECT * FROM membrofamilia_tem
INSERT INTO membrofamilia_tem VALUES
('Espectador', 5, 2),
('Controlador', 1, 1),
('Controlador', 2, 1),
('Controlador', 3, 1),
('Controlador', 4, 1);

SELECT * FROM contexto_sociocultural_possui
INSERT INTO contexto_sociocultural_possui VALUES
('Supremacista branca', 'Alta', NULL, 1, 1),
('Supremacista branca', 'Alta', NULL, 1, 1),
('Supremacista branca', 'Alta', NULL, 1, 1),
('Supremacista branca', 'Alta', NULL, 1, 1),
('Bairro pobre', 'Media', 'Cristão', 2, 5);