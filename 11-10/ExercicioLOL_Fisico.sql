/* ExercicioLOL_Logico: */

CREATE TABLE Player (
    ID_Player INTEGER(3) PRIMARY KEY,
    Level INTEGER(3),
    Score INTEGER(3),
    Region CHARACTER(8),
    User_Name CHARACTER(8)
);

CREATE TABLE Champion (
    ID_Champion INTEGER(3) PRIMARY KEY,
    Name_Champion CHARACTER(8),
    Ability CHARACTER(8),
    Damage_Type CHARACTER(8),
    Function CHARACTER(8)
);

CREATE TABLE Team (
    ID_Team INTEGER(3) PRIMARY KEY,
    Name_Team CHARACTER(8)
);

CREATE TABLE Match (
    ID_Match INTEGER(3) PRIMARY KEY,
    Results CHARACTER(8),
    Duration TIME,
    Date_Time DATE
);

CREATE TABLE Game (
    Player_Points INTEGER(3),
    Team_Points INTEGER(3),
    ID_Player INTEGER(3),
    ID_Match INTEGER(3)
);

CREATE TABLE Item (
    ID_Item INTEGER(3) PRIMARY KEY,
    Name_Item CHARACTER(8),
    Cost INTEGER(3),
    Description CHARACTER(30),
    Effect CHARACTER(8)
);

CREATE TABLE Offensive_Item (
    Physic_Damage INTEGER(3),
    Magic_Damage INTEGER(3),
    ID_Item INTEGER(3)
);

CREATE TABLE Defensive_Item (
    Armor INTEGER(3),
    Res_Magic INTEGER(3),
    ID_Item INTEGER(3)
);

CREATE TABLE Consumable (
    HP_Potion INTEGER(3),
    Damage_Potion INTEGER(3),
    ID_Item INTEGER(3)
);
 
ALTER TABLE Game ADD CONSTRAINT FK_Game_1
    FOREIGN KEY (ID_Player)
    REFERENCES Player (ID_Player);
 
ALTER TABLE Game ADD CONSTRAINT FK_Game_2
    FOREIGN KEY (ID_Match)
    REFERENCES Match (ID_Match);
 
ALTER TABLE Offensive_Item ADD CONSTRAINT FK_Offensive_Item_1
    FOREIGN KEY (ID_Item)
    REFERENCES Item (ID_Item);
 
ALTER TABLE Defensive_Item ADD CONSTRAINT FK_Defensive_Item_1
    FOREIGN KEY (ID_Item)
    REFERENCES Item (ID_Item);
 
ALTER TABLE Consumable ADD CONSTRAINT FK_Consumable_1
    FOREIGN KEY (ID_Item)
    REFERENCES Item (ID_Item);