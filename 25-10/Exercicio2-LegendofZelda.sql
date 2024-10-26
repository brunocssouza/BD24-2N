/*
Criar um banco de dados de Legend of Zelda: utilizar o modelo lógico criado na aula 03/10.
Alterar os tipos do esquema lógico para os tipos compatíveis com o Postgres. 
Gerar o esquema físico do Banco de dados que foi planejado por vocês para criar as tabelas no banco.
*/

CREATE DATABASE "25-10-Exercicio2-LegendofZelda"; /* Run it alone!! */

CREATE TABLE Personagem (
    Personagem_ID INTEGER PRIMARY KEY,
    Personagem_Nome VARCHAR(20),
    Descricao VARCHAR(100),
    Afiliacao VARCHAR(20),
    fk_Local_Local_ID VARCHAR(100)
);

CREATE TABLE Item (
    Item_ID INTEGER PRIMARY KEY,
    Item_Nome VARCHAR(20),
    Tipo VARCHAR(20),
    Efeito VARCHAR(100),
    Raridade VARCHAR(20)
);

CREATE TABLE Local (
    Local_ID VARCHAR(100) PRIMARY KEY,
    Local_Nome VARCHAR(20),
    Descricao VARCHAR(100),
    Tipo VARCHAR(20)
);

CREATE TABLE Hilian (
    Tecnica_Magica VARCHAR(20),
    fk_Personagem_Personagem_ID INTEGER PRIMARY KEY
);

CREATE TABLE Zoro (
    Tecnica_Agua VARCHAR(20),
    fk_Personagem_Personagem_ID INTEGER PRIMARY KEY
);

CREATE TABLE Goron (
    Tecnica_Forca VARCHAR(20),
    fk_Personagem_Personagem_ID INTEGER PRIMARY KEY
);

CREATE TABLE Inventario_Tem (
    fk_Personagem_Personagem_ID INTEGER,
    fk_Item_Item_ID INTEGER,
    Quantidade INTEGER
);

CREATE TABLE Tem (
    fk_Personagem_Personagem_ID INTEGER,
    fk_Personagem_Personagem_ID_ INTEGER,
    Relacionamento VARCHAR(20)
);
 
ALTER TABLE Personagem ADD CONSTRAINT FK_Personagem_2
    FOREIGN KEY (fk_Local_Local_ID)
    REFERENCES Local (Local_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Hilian ADD CONSTRAINT FK_Hilian_2
    FOREIGN KEY (fk_Personagem_Personagem_ID)
    REFERENCES Personagem (Personagem_ID)
    ON DELETE CASCADE;
 
ALTER TABLE Zoro ADD CONSTRAINT FK_Zoro_2
    FOREIGN KEY (fk_Personagem_Personagem_ID)
    REFERENCES Personagem (Personagem_ID)
    ON DELETE CASCADE;
 
ALTER TABLE Goron ADD CONSTRAINT FK_Goron_2
    FOREIGN KEY (fk_Personagem_Personagem_ID)
    REFERENCES Personagem (Personagem_ID)
    ON DELETE CASCADE;
 
ALTER TABLE Inventario_Tem ADD CONSTRAINT FK_Inventario_Tem_1
    FOREIGN KEY (fk_Personagem_Personagem_ID)
    REFERENCES Personagem (Personagem_ID);
 
ALTER TABLE Inventario_Tem ADD CONSTRAINT FK_Inventario_Tem_2
    FOREIGN KEY (fk_Item_Item_ID)
    REFERENCES Item (Item_ID);
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_1
    FOREIGN KEY (fk_Personagem_Personagem_ID)
    REFERENCES Personagem (Personagem_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_2
    FOREIGN KEY (fk_Personagem_Personagem_ID_)
    REFERENCES Personagem (Personagem_ID)
    ON DELETE RESTRICT;

