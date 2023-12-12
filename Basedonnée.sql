

-- Création de la table Utilisateurs
CREATE TABLE Utilisateurs (
    UserID INT PRIMARY KEY,
    Nom VARCHAR(255),
    Login VARCHAR(50) UNIQUE,
    MotDePasse VARCHAR(255),
    TypeUtilisateur VARCHAR(20)
);

-- Création de la table FichesDeFrais
CREATE TABLE FichesDeFrais (
    FicheID INT PRIMARY KEY,
    UserID INT,
    Mois VARCHAR(20),
    Etat VARCHAR(20),
    FOREIGN KEY (UserID) REFERENCES Utilisateurs(UserID)
);

-- Création de la table FraisForfaitises
CREATE TABLE FraisForfaitises (
    FraisID INT PRIMARY KEY,
    FicheID INT,
    TypeFrais VARCHAR(50),
    Quantite INT,
    MontantUnitaire DECIMAL(10, 2),
    MontantTotal DECIMAL(10, 2),
    FOREIGN KEY (FicheID) REFERENCES FichesDeFrais(FicheID)
);

-- Création de la table FraisHorsForfait
CREATE TABLE FraisHorsForfait (
    HorsForfaitID INT PRIMARY KEY,
    FicheID INT,
    Date DATE,
    Libelle VARCHAR(255),
    Montant DECIMAL(10, 2),
    FOREIGN KEY (FicheID) REFERENCES FichesDeFrais(FicheID)
);

-- Création de la table ValidationFrais
CREATE TABLE ValidationFrais (
    ValidationID INT PRIMARY KEY,
    ComptableID INT,
    FicheID INT,
    Commentaire TEXT,
    DateValidation DATE,
    FOREIGN KEY (ComptableID) REFERENCES Utilisateurs(UserID),
    FOREIGN KEY (FicheID) REFERENCES FichesDeFrais(FicheID)
);

-- Création de la table PaiementFrais
CREATE TABLE PaiementFrais (
    PaiementID INT PRIMARY KEY,
    ComptableID INT,
    FicheID INT,
    DateMiseEnPaiement DATE,
    DateRemboursement DATE,
    FOREIGN KEY (ComptableID) REFERENCES Utilisateurs(UserID),
    FOREIGN KEY (FicheID) REFERENCES FichesDeFrais(FicheID)
);
