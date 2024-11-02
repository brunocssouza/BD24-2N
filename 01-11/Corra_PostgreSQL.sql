/** Relação Tratamento **/
INSERT INTO tratamento (tratamento_id, tratamento_nome, descricao) VALUES
(1, 'Manipulacao', 'Atração de afro-americanos para a região.'),
(2, 'Controle', 'Utilização de hipnose para controle do indivíduo em questão.'),
(3, 'Transferencia', 'Processo de troca, a partir de neurocirurgia, em que o controlador é transplantado para que o espectador tome posse parcial do indivíduo.'),
(4, 'Coagulacao', 'Fase final do tratamento onde o controle completo sobre o sujeito é exercido.');
SELECT * FROM tratamento;

/** Relação Familia **/
INSERT INTO familia (familia_id, familia_nome) VALUES
(1, 'Armitage'),
(2, 'Washington'),
(3, 'Dray');
SELECT * FROM familia;

/** Relação Personagem **/
INSERT INTO personagem (personagem_id, personagem_nome, etnia, genero, fk_tratamento_tratamento_id) VALUES
(1, 'Missy Armitage', 'Branco', 'Feminino', NULL),
(2, 'Rose Armitage', 'Branco', 'Feminino', NULL),
(3, 'Dean Armitage', 'Branco', 'Masculino', NULL),
(4, 'Jeremy Armitage', 'Branco', 'Masculino', NULL),
(5, 'Chris Washington', 'Negro', 'Masculino', 2);
SELECT * FROM personagem;

/** Relação Contexto_Sociocultural **/
INSERT INTO contexto_sociocultural (origem, classe_social, crenca, fk_familia_familia_id, fk_personagem_personagem_id) VALUES
('Privilegiada', 'Alta', NULL, 1, 1),
('Privilegiada', 'Alta', NULL, 1, 1),
('Privilegiada', 'Alta', NULL, 1, 1),
('Privilegiada', 'Alta', NULL, 1, 1),
('Bairro pobre', 'Media', 'Cristão', 2, 5);
SELECT * FROM contexto_sociocultural;

/** Relação MembroFamilia **/
INSERT INTO membrofamilia (estado_psicologico, fk_personagem_personagem_id, fk_familia_familia_id) VALUES
('Espectador', 5, 2),
('Controlador', 1, 1),
('Controlador', 2, 1),
('Controlador', 3, 1),
('Controlador', 4, 1);
SELECT * FROM membrofamilia;
