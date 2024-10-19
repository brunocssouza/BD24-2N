/* Spotify_Logico: */

CREATE TABLE Usuario (
    Usuario_ID INTEGER(3) PRIMARY KEY,
    Usuario_Nome CHARACTER(35),
    Data_Nascimento DATE,
    Rua CHARACTER(35),
    Cidade CHARACTER(35),
    fk_Plano_Plano_ID INTEGER(3)
);

CREATE TABLE Conteudo (
    Conteudo_ID INTEGER(3) PRIMARY KEY,
    Conteudo_Duracao TIMESTAMP,
    fk_Artista_Artista_ID INTEGER(3)
);

CREATE TABLE Artista (
    Artista_ID INTEGER(3) PRIMARY KEY,
    Artista_Nome CHARACTER(35)
);

CREATE TABLE Genero_Musica (
    Genero_ID INTEGER(3),
    Pop BOOLEAN,
    Funk BOOLEAN,
    Sertanejo BOOLEAN,
    Rock BOOLEAN,
    Musica_Nome CHARACTER(35),
    fk_Conteudo_Conteudo_ID INTEGER(3),
    PRIMARY KEY (Genero_ID, fk_Conteudo_Conteudo_ID)
);

CREATE TABLE Plano (
    Plano_ID INTEGER(3) PRIMARY KEY,
    Plano_Nome CHARACTER(35),
    Plano_Valor FLOAT
);

CREATE TABLE Podcast (
    Participante CHARACTER(35),
    Podcast_Nome CHARACTER(35),
    fk_Conteudo_Conteudo_ID INTEGER(3) PRIMARY KEY
);

CREATE TABLE Basico (
    Anuncio BOOLEAN,
    fk_Plano_Plano_ID INTEGER(3) PRIMARY KEY
);

CREATE TABLE Premium (
    Multiplas_Telas INTEGER(3),
    fk_Plano_Plano_ID INTEGER(3) PRIMARY KEY
);

CREATE TABLE Playlist_Ouve (
    Conteudo_Escutado CHARACTER(35),
    fk_Usuario_Usuario_ID INTEGER(3),
    fk_Conteudo_Conteudo_ID INTEGER(3)
);

CREATE TABLE Episodio (
    Episodio_ID INTEGER(3) PRIMARY KEY,
    Episodio_Nome CHARACTER(35),
    Episodio_Sinopse CHARACTER(35),
    Episodio_Duracao TIMESTAMP,
    fk_Podcast_fk_Conteudo_Conteudo_ID INTEGER(3)
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Plano_Plano_ID)
    REFERENCES Plano (Plano_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Conteudo ADD CONSTRAINT FK_Conteudo_2
    FOREIGN KEY (fk_Artista_Artista_ID)
    REFERENCES Artista (Artista_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Genero_Musica ADD CONSTRAINT FK_Genero_Musica_2
    FOREIGN KEY (fk_Conteudo_Conteudo_ID)
    REFERENCES Conteudo (Conteudo_ID);
 
ALTER TABLE Podcast ADD CONSTRAINT FK_Podcast_2
    FOREIGN KEY (fk_Conteudo_Conteudo_ID)
    REFERENCES Conteudo (Conteudo_ID)
    ON DELETE CASCADE;
 
ALTER TABLE Basico ADD CONSTRAINT FK_Basico_2
    FOREIGN KEY (fk_Plano_Plano_ID)
    REFERENCES Plano (Plano_ID)
    ON DELETE CASCADE;
 
ALTER TABLE Premium ADD CONSTRAINT FK_Premium_2
    FOREIGN KEY (fk_Plano_Plano_ID)
    REFERENCES Plano (Plano_ID)
    ON DELETE CASCADE;
 
ALTER TABLE Playlist_Ouve ADD CONSTRAINT FK_Playlist_Ouve_1
    FOREIGN KEY (fk_Usuario_Usuario_ID)
    REFERENCES Usuario (Usuario_ID);
 
ALTER TABLE Playlist_Ouve ADD CONSTRAINT FK_Playlist_Ouve_2
    FOREIGN KEY (fk_Conteudo_Conteudo_ID)
    REFERENCES Conteudo (Conteudo_ID);
 
ALTER TABLE Episodio ADD CONSTRAINT FK_Episodio_2
    FOREIGN KEY (fk_Podcast_fk_Conteudo_Conteudo_ID)
    REFERENCES Podcast (fk_Conteudo_Conteudo_ID)
    ON DELETE RESTRICT;