/* Netflix_Logico: */

CREATE TABLE Usuario (
    ID_Usuario INTEGER(3) PRIMARY KEY,
    Nome_Usuario CHARACTER(30),
    E_mail CHARACTER(30),
    Senha CHARACTER(30),
    CEP INTEGER(11),
    Cidade CHARACTER(30),
    Rua CHARACTER(30),
    Data_Nascimento DATE
);

CREATE TABLE Conteudo (
    ID_Conteudo INTEGER(3) PRIMARY KEY,
    Titulo CHARACTER(30),
    Duracao TIMESTAMP,
    Sinopse CHARACTER(30)
);

CREATE TABLE Filme (
    Tipo_Filme CHARACTER(30),
    fk_Conteudo_ID_Conteudo INTEGER(3) PRIMARY KEY
);

CREATE TABLE Serie (
    Temporada INTEGER(3),
    fk_Conteudo_ID_Conteudo INTEGER(3) PRIMARY KEY
);

CREATE TABLE Lista_Desejo_Vera (
    fk_Usuario_ID_Usuario INTEGER(3),
    fk_Conteudo_ID_Conteudo INTEGER(3)
);

CREATE TABLE Visualizacao_Assiste (
    Hora_Assistida TIMESTAMP,
    fk_Conteudo_ID_Conteudo INTEGER(3),
    fk_Usuario_ID_Usuario INTEGER(3)
);

CREATE TABLE Genero (
    Horror BOOLEAN,
    Acao BOOLEAN,
    Aventura BOOLEAN,
    Comedia BOOLEAN,
    ID_Genero INTEGER(3) PRIMARY KEY,
    fk_Conteudo_ID_Conteudo INTEGER(3)
);

CREATE TABLE Episodio (
    Nome_Episodio CHARACTER(30),
    Duracao_Episodio TIMESTAMP,
    Sinopse_Episodio CHARACTER(30),
    ID_Episodio INTEGER(3) PRIMARY KEY,
    fk_Serie_fk_Conteudo_ID_Conteudo INTEGER(3)
);

CREATE TABLE Legenda (
    Linguagem CHARACTER(30),
    Tamanho INTEGER(3),
    ID_Legenda INTEGER(3) PRIMARY KEY,
    fk_Conteudo_ID_Conteudo INTEGER(3)
);

CREATE TABLE Plano_Assinatura (
    ID_Plano INTEGER(3) PRIMARY KEY,
    Valor FLOAT(7),
    Tipo_Plano CHARACTER(30),
    fk_Usuario_ID_Usuario INTEGER(3)
);

CREATE TABLE Avaliacao (
    ID_Avaliacao INTEGER(3) PRIMARY KEY,
    Nota INTEGER(3),
    Comentario CHARACTER(30),
    fk_Usuario_ID_Usuario INTEGER(3),
    fk_Conteudo_ID_Conteudo INTEGER(3)
);
 
ALTER TABLE Filme ADD CONSTRAINT FK_Filme_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Serie ADD CONSTRAINT FK_Serie_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Lista_Desejo_Vera ADD CONSTRAINT FK_Lista_Desejo_Vera_1
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Lista_Desejo_Vera ADD CONSTRAINT FK_Lista_Desejo_Vera_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Visualizacao_Assiste ADD CONSTRAINT FK_Visualizacao_Assiste_1
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Visualizacao_Assiste ADD CONSTRAINT FK_Visualizacao_Assiste_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Genero ADD CONSTRAINT FK_Genero_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Episodio ADD CONSTRAINT FK_Episodio_2
    FOREIGN KEY (fk_Serie_fk_Conteudo_ID_Conteudo)
    REFERENCES Serie (fk_Conteudo_ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Legenda ADD CONSTRAINT FK_Legenda_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Plano_Assinatura ADD CONSTRAINT FK_Plano_Assinatura_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_3
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE RESTRICT;