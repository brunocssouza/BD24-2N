/* Transfomar a atividade escolhida a aulas atrás (Netflix), e transformá-lo em Físico utilizando tipagens suportadas pelo PostGRES. */

CREATE DATABASE "24-10-Exercicio1-Netflix"; /* Run it alone!! */

CREATE TABLE Usuario (
    Nome_Usuario CHAR(20),
    Estado CHAR(20),
    CEP CHAR(11),
    Cidade CHAR(20),
    Rua CHAR(20),
    Data_Nasc DATE,
    Senha CHAR(20),
    Email CHAR(40),
    ID_Usuario INT PRIMARY KEY,
    fk_Avaliacao_ID_Avaliacao INT
);

CREATE TABLE Conteudo (
    ID_Conteudo INT PRIMARY KEY,
    Sinopse CHAR(40),
    Titulo CHAR(20),
    Duracao TIME
);

CREATE TABLE Plano (
    ID_Plano INT PRIMARY KEY,
    Tipo CHAR(11),
    Valor MONEY,
    fk_Usuario_ID_Usuario INT
);

CREATE TABLE Avaliacao (
    ID_Avaliacao INT PRIMARY KEY,
    Nota INT,
    Comentario CHAR(20),
    fk_Conteudo_ID_Conteudo INT
);

CREATE TABLE Genero (
    ID_Genero INT PRIMARY KEY,
    Horror BOOLEAN,
    Comedia BOOLEAN,
    Acao BOOLEAN,
    Ficcao BOOLEAN,
    Aventura BOOLEAN,
    fk_Conteudo_ID_Conteudo INT
);

CREATE TABLE Filme (
    Tipo_Filme CHAR(11),
    fk_Conteudo_ID_Conteudo INT PRIMARY KEY
);

CREATE TABLE Serie (
    Temporada INT,
    fk_Conteudo_ID_Conteudo INT PRIMARY KEY
);

CREATE TABLE Episodio (
    Nome_Episodio CHAR(40),
    Duracao_Episodio TIME,
    Sinopse_Episodio CHAR(40),
    ID_Episodio INT PRIMARY KEY,
    fk_Serie_fk_Conteudo_ID_Conteudo INT
);

CREATE TABLE Legenda (
    ID_Legenda INT PRIMARY KEY,
    Linguagem CHAR(11),
    Tamanho INT,
    fk_Conteudo_ID_Conteudo INT
);

CREATE TABLE Lista_Desejo (
    ID_Usuario INT,
    ID_Conteudo INT,
    fk_Usuario_ID_Usuario INT,
    fk_Conteudo_ID_Conteudo INT
);

CREATE TABLE Visualizacao (
    ID_Usuario INT,
    ID_Conteudo INT,
    Hora_Assistida TIMESTAMP,
    fk_Conteudo_ID_Conteudo INT,
    fk_Usuario_ID_Usuario INT
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Avaliacao_ID_Avaliacao)
    REFERENCES Avaliacao (ID_Avaliacao)
    ON DELETE RESTRICT;
 
ALTER TABLE Plano ADD CONSTRAINT FK_Plano_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Genero ADD CONSTRAINT FK_Genero_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Filme ADD CONSTRAINT FK_Filme_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Serie ADD CONSTRAINT FK_Serie_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Episodio ADD CONSTRAINT FK_Episodio_2
    FOREIGN KEY (fk_Serie_fk_Conteudo_ID_Conteudo)
    REFERENCES Serie (fk_Conteudo_ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Legenda ADD CONSTRAINT FK_Legenda_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Lista_Desejo ADD CONSTRAINT FK_Lista_Desejo_1
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Lista_Desejo ADD CONSTRAINT FK_Lista_Desejo_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Visualizacao ADD CONSTRAINT FK_Visualizacao_1
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Visualizacao ADD CONSTRAINT FK_Visualizacao_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);