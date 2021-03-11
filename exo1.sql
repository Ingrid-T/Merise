DROP TABLE IF EXISTS Clients ;
CREATE TABLE Clients (id_client_Clients INT AUTO_INCREMENT NOT NULL,
nom_Clients VARCHAR(20),
prenom_Clients VARCHAR(20),
adresse_Clients VARCHAR(50),
PRIMARY KEY (id_client_Clients)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Compte ;
CREATE TABLE Compte (id_compte_Compte INT AUTO_INCREMENT NOT NULL,
id_client_Compte INT,
solde_Compte FLOAT,
PRIMARY KEY (id_compte_Compte)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Operations ;
CREATE TABLE Operations (id_operation_Operations INT AUTO_INCREMENT NOT NULL,
id_client_Operations INT,
action_Operations VARCHAR(10),
montant_Operations FLOAT,
date/heure_Operations DATETIME,
id_compte_Operations INT,
id_client_Clients INT,
PRIMARY KEY (id_operation_Operations)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Appartenir ;
CREATE TABLE Appartenir (id_client_Clients INT AUTO_INCREMENT NOT NULL,
id_compte_Compte INT NOT NULL,
PRIMARY KEY (id_client_Clients,
 id_compte_Compte)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Effectuer ;
CREATE TABLE Effectuer (id_compte_Compte INT AUTO_INCREMENT NOT NULL,
id_operation_Operations INT NOT NULL,
PRIMARY KEY (id_compte_Compte,
 id_operation_Operations)) ENGINE=InnoDB;

ALTER TABLE Operations ADD CONSTRAINT FK_Operations_id_client_Clients FOREIGN KEY (id_client_Clients) REFERENCES Clients (id_client_Clients);

ALTER TABLE Appartenir ADD CONSTRAINT FK_Appartenir_id_client_Clients FOREIGN KEY (id_client_Clients) REFERENCES Clients (id_client_Clients);
ALTER TABLE Appartenir ADD CONSTRAINT FK_Appartenir_id_compte_Compte FOREIGN KEY (id_compte_Compte) REFERENCES Compte (id_compte_Compte);
ALTER TABLE Effectuer ADD CONSTRAINT FK_Effectuer_id_compte_Compte FOREIGN KEY (id_compte_Compte) REFERENCES Compte (id_compte_Compte);
ALTER TABLE Effectuer ADD CONSTRAINT FK_Effectuer_id_operation_Operations FOREIGN KEY (id_operation_Operations) REFERENCES Operations (id_operation_Operations);
