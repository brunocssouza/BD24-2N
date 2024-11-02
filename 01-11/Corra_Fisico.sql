/* Corra_Logico: */

CREATE TABLE Personagem (
    Personagem_ID INTEGER PRIMARY KEY,
    Personagem_Nome VARCHAR(30) NOT NULL,
    Etnia VARCHAR(30) NOT NULL,
    Genero VARCHAR(30) NOT NULL,
    fk_Tratamento_Tratamento_ID INTEGER
);

CREATE TABLE Familia (
    Familia_ID INTEGER PRIMARY KEY,
    Familia_Nome VARCHAR(30) NOT NULL
);

CREATE TABLE Contexto_Sociocultural_Possui (
    Origem VARCHAR(30),
    Classe_Social VARCHAR(30),
    Crenca VARCHAR(30),
    fk_Familia_Familia_ID INTEGER,
    fk_Personagem_Personagem_ID INTEGER
);

CREATE TABLE Tratamento (
    Tratamento_ID INTEGER PRIMARY KEY,
    Tratamento_Nome VARCHAR(30) NOT NULL,
    Descricao VARCHAR(200)
);

CREATE TABLE MembroFamilia_Tem (
    Estado_Psicologico VARCHAR(30) NOT NULL,
    fk_Personagem_Personagem_ID INTEGER,
    fk_Familia_Familia_ID INTEGER
);
 
ALTER TABLE Personagem ADD CONSTRAINT FK_Personagem_2
    FOREIGN KEY (fk_Tratamento_Tratamento_ID)
    REFERENCES Tratamento (Tratamento_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Contexto_Sociocultural_Possui ADD CONSTRAINT FK_Contexto_Sociocultural_Possui_1
    FOREIGN KEY (fk_Familia_Familia_ID)
    REFERENCES Familia (Familia_ID);
 
ALTER TABLE Contexto_Sociocultural_Possui ADD CONSTRAINT FK_Contexto_Sociocultural_Possui_2
    FOREIGN KEY (fk_Personagem_Personagem_ID)
    REFERENCES Personagem (Personagem_ID);
 
ALTER TABLE MembroFamilia_Tem ADD CONSTRAINT FK_MembroFamilia_Tem_1
    FOREIGN KEY (fk_Personagem_Personagem_ID)
    REFERENCES Personagem (Personagem_ID);
 
ALTER TABLE MembroFamilia_Tem ADD CONSTRAINT FK_MembroFamilia_Tem_2
    FOREIGN KEY (fk_Familia_Familia_ID)
    REFERENCES Familia (Familia_ID);
