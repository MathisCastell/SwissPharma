-- Ajout d'utilisateurs
INSERT INTO Utilisateurs (UserID, Nom, Login, MotDePasse, TypeUtilisateur)
VALUES
    (1, 'John Doe', 'john_doe', 'motdepasse1', 'Utilisateur'),
    (2, 'Jane Doe', 'jane_doe', 'motdepasse2', 'Comptable'),
    (3, 'Bob Smith', 'bob_smith', 'motdepasse3', 'Utilisateur');

-- Ajout de fiches de frais
INSERT INTO FichesDeFrais (FicheID, UserID, Mois, Etat)
VALUES
    (1, 1, '202301', 'En attente'),
    (2, 1, '202302', 'Validée'),
    (3, 2, '202303', 'En attente');

-- Ajout de frais forfaitisés
INSERT INTO FraisForfaitises (FraisID, FicheID, TypeFrais, Quantite, MontantUnitaire, MontantTotal)
VALUES
    (1, 1, 'Repas', 2, 15.00, 30.00),
    (2, 1, 'Hébergement', 3, 50.00, 150.00),
    (3, 2, 'Transport', 1, 30.00, 30.00);

-- Ajout de frais hors forfait
INSERT INTO FraisHorsForfait (HorsForfaitID, FicheID, Date, Libelle, Montant)
VALUES
    (1, 1, '2023-01-15', 'Déjeuner d affaires', 25.00),
    (2, 2, '2023-02-10', 'Billet de train', 40.00);

-- Ajout de validations de frais
INSERT INTO ValidationFrais (ValidationID, ComptableID, FicheID, Commentaire, DateValidation)
VALUES
    (1, 2, 1, 'Frais validés', '2023-01-20'),
    (2, 2, 2, 'Frais validés', '2023-02-15');

-- Ajout de paiements de frais
INSERT INTO PaiementFrais (PaiementID, ComptableID, FicheID, DateMiseEnPaiement, DateRemboursement)
VALUES
    (1, 2, 1, '2023-01-25', '2023-02-05'),
    (2, 2, 2, '2023-02-20', '2023-03-01');
