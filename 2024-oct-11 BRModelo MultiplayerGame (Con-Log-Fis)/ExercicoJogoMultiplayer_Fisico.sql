/* ExercicoJogoMultiplayerConvertido_Logico: */

CREATE TABLE Character (
    Character_ID INTEGER(3) PRIMARY KEY,
    Character_Name CHARACTER(11),
    Skills CHARACTER(11),
    Hit_Points INTEGER(3),
    Strength INTEGER(3),
    Experience INTEGER(3),
    fk_Player_Player_ID INTEGER(3)
);

CREATE TABLE Archer (
    Precision INTEGER(3),
    Range INTEGER(3),
    fk_Character_Character_ID INTEGER(3) PRIMARY KEY
);

CREATE TABLE Warrior (
    Resistance INTEGER(3),
    Strength INTEGER(3),
    fk_Character_Character_ID INTEGER(3) PRIMARY KEY
);

CREATE TABLE Mage (
    Magic INTEGER(3),
    Mana_Pool INTEGER(3),
    fk_Character_Character_ID INTEGER(3) PRIMARY KEY
);

CREATE TABLE Mission (
    Mission_ID INTEGER(3) PRIMARY KEY,
    Mission_Name CHARACTER(11),
    Description CHARACTER(30),
    MInimum_Level INTEGER(3),
    Reward CHARACTER(11),
    Status CHARACTER(11)
);

CREATE TABLE Inventory_Player (
    Inventory_ID INTEGER(3),
    ID_Item INTEGER(3),
    Inventory_Name CHARACTER(11),
    Amount INTEGER(3),
    Player_ID INTEGER(3),
    Player_Name CHARACTER(11),
    E_mail CHARACTER(30),
    Registration_Date DATE,
    Current_Level INTEGER(3),
    Total_Pontuation INTEGER(3),
    Avatar CHARACTER(11),
    fk_Match_Match_ID INTEGER(3),
    PRIMARY KEY (Inventory_ID, Player_ID)
);

CREATE TABLE Items (
    Item_ID INTEGER(3) PRIMARY KEY,
    Item_Name CHARACTER(11),
    Type CHARACTER(11),
    Effect CHARACTER(30)
);

CREATE TABLE Match (
    Match_ID INTEGER(3) PRIMARY KEY,
    Date DATE,
    Player_Amount INTEGER(3),
    Winner CHARACTER(11),
    Time TIME
);

CREATE TABLE Achievements (
    Achievement_ID INTEGER(3) PRIMARY KEY,
    Achievement_Name CHARACTER(11),
    Description CHARACTER(30),
    Requisites CHARACTER(30),
    fk_Player_Player_ID INTEGER(3)
);

CREATE TABLE E__Assoc__1_Completes (
    Date DATE,
    fk_Character_Character_ID INTEGER(3),
    fk_Mission_Mission_ID INTEGER(3)
);

CREATE TABLE Has (
    fk_Inventory_Player_Inventory_ID INTEGER(3),
    fk_Items_Item_ID INTEGER(3)
);
 
ALTER TABLE Character ADD CONSTRAINT FK_Character_2
    FOREIGN KEY (fk_Player_Player_ID)
    REFERENCES ??? (???);
 
ALTER TABLE Archer ADD CONSTRAINT FK_Archer_2
    FOREIGN KEY (fk_Character_Character_ID)
    REFERENCES Character (Character_ID)
    ON DELETE CASCADE;
 
ALTER TABLE Warrior ADD CONSTRAINT FK_Warrior_2
    FOREIGN KEY (fk_Character_Character_ID)
    REFERENCES Character (Character_ID)
    ON DELETE CASCADE;
 
ALTER TABLE Mage ADD CONSTRAINT FK_Mage_2
    FOREIGN KEY (fk_Character_Character_ID)
    REFERENCES Character (Character_ID)
    ON DELETE CASCADE;
 
ALTER TABLE Inventory_Player ADD CONSTRAINT FK_Inventory_Player_2
    FOREIGN KEY (fk_Match_Match_ID)
    REFERENCES Match (Match_ID);
 
ALTER TABLE Achievements ADD CONSTRAINT FK_Achievements_2
    FOREIGN KEY (fk_Player_Player_ID)
    REFERENCES ??? (???);
 
ALTER TABLE E__Assoc__1_Completes ADD CONSTRAINT FK_E__Assoc__1_Completes_1
    FOREIGN KEY (fk_Character_Character_ID)
    REFERENCES Character (Character_ID);
 
ALTER TABLE E__Assoc__1_Completes ADD CONSTRAINT FK_E__Assoc__1_Completes_2
    FOREIGN KEY (fk_Mission_Mission_ID)
    REFERENCES Mission (Mission_ID);
 
ALTER TABLE Has ADD CONSTRAINT FK_Has_1
    FOREIGN KEY (fk_Inventory_Player_Inventory_ID, ???)
    REFERENCES Inventory_Player (Inventory_ID, ???)
    ON DELETE SET NULL;
 
ALTER TABLE Has ADD CONSTRAINT FK_Has_2
    FOREIGN KEY (fk_Items_Item_ID)
    REFERENCES Items (Item_ID)
    ON DELETE SET NULL;