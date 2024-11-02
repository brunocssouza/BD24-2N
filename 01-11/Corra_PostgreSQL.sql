/** Relação Tratamento **/
INSERT INTO tratamento (tratamento_id, tratamento_nome, descricao) VALUES
(1, 'Manipulação', 'Escolha e atração de afro-americano alvo para a região.'),
(2, 'Controle', 'Uso de hipnose para controle do indivíduo em questão.'),
(3, 'Transferência', 'A partir de neurocirurgia, é realizado um transplante cerebral em que a mente de um controlador é transferida para o corpo de um espectador, tomando, assim, posse parcial do indivíduo.'),
(4, 'Coagulação', 'Fase final do tratamento em que é exercido e obtido o controle completo sobre o sujeito submetido.') ;
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
('Bairro pobre', 'Media', 'Cristao', 2, 5);
SELECT * FROM contexto_sociocultural;

/** Relação MembroFamilia **/
INSERT INTO membrofamilia (estado_psicologico, fk_personagem_personagem_id, fk_familia_familia_id) VALUES
('Espectador', 5, 2),
('Controlador', 1, 1),
('Controlador', 2, 1),
('Controlador', 3, 1),
('Controlador', 4, 1);
SELECT * FROM membrofamilia;
