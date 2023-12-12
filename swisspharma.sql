-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 11 déc. 2023 à 16:29
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `swisspharma`
--

-- --------------------------------------------------------

--
-- Structure de la table `fichesdefrais`
--

CREATE TABLE `fichesdefrais` (
  `FicheID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Mois` varchar(20) DEFAULT NULL,
  `Etat` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fichesdefrais`
--

INSERT INTO `fichesdefrais` (`FicheID`, `UserID`, `Mois`, `Etat`) VALUES
(0, 1, 'November 2023', 'En attente'),
(1, 1, 'November 2023', 'En attente'),
(2, 1, 'November 2023', 'En attente'),
(5, 1, 'November 2023', 'En attente'),
(6, 1, 'November 2023', 'En attente'),
(7, 1, 'December 2023', 'En attente'),
(8, 1, 'December 2023', 'En attente'),
(9, 1, 'December 2023', 'En attente'),
(10, 1, 'December 2023', 'En attente'),
(11, 1, 'December 2023', 'En attente'),
(12, 1, 'December 2023', 'En attente'),
(13, 1, 'December 2023', 'En attente'),
(14, 1, 'December 2023', 'En attente'),
(15, 1, 'December 2023', 'En attente'),
(16, 1, 'December 2023', 'En attente'),
(17, 1, 'December 2023', 'En attente'),
(18, 1, 'December 2023', 'En attente'),
(19, 1, 'December 2023', 'En attente'),
(20, 1, 'December 2023', 'En attente');

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfaitises`
--

CREATE TABLE `fraisforfaitises` (
  `FraisID` int(11) NOT NULL,
  `FicheID` int(11) DEFAULT NULL,
  `TypeFrais` varchar(50) DEFAULT NULL,
  `Quantite` int(11) DEFAULT NULL,
  `MontantUnitaire` decimal(10,2) DEFAULT NULL,
  `MontantTotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fraisforfaitises`
--

INSERT INTO `fraisforfaitises` (`FraisID`, `FicheID`, `TypeFrais`, `Quantite`, `MontantUnitaire`, `MontantTotal`) VALUES
(4, 1, 'test1', 3, '0.05', '0.15'),
(5, 1, 'test1', 3, '0.02', '0.06'),
(6, 1, 'test2', 4, '12.00', '48.00'),
(7, 1, 'test 3', 3, '12.00', '36.00'),
(8, 1, 'test 4', 3, '15.00', '45.00'),
(9, 2, 'test7', 23, '0.05', '1.15'),
(10, 2, 'test7', 23, '0.05', '1.15'),
(11, 2, 'test79', 3, '23.00', '69.00'),
(12, 1, 'test734', 4, '0.03', '0.12'),
(13, 1, 'test133', 3, '0.05', '0.15'),
(14, 1, 'test133', 3, '0.05', '0.15'),
(15, 1, 'test1234', 2, '0.02', '0.04'),
(16, 1, 'test7333', 3, '0.02', '0.06'),
(17, 1, 'test7333', 3, '0.04', '0.12'),
(18, 1, 'test7333', 3, '0.04', '0.12'),
(19, 1, 'test7333', 3, '0.04', '0.12'),
(20, 1, 'test7333', 3, '0.04', '0.12'),
(22, NULL, 'test73332222222', 2, '0.19', '0.38'),
(23, NULL, 'test7333zzzzz', 11, '0.19', '2.09'),
(32, 10, 'test7333qqqqqqqqqqq', 3, '0.04', '0.12'),
(33, 11, 'test9999', 6, '0.26', '1.56'),
(34, 12, 'nouveau test', 2, '0.29', '0.58'),
(35, 13, 'test1é&éééééééééééééé', 7, '0.04', '0.28'),
(36, 14, 'nouveau test', 2, '0.29', '0.58'),
(37, 16, 'test2\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 1, '0.16', '0.16'),
(38, 17, 'test2\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 1, '0.16', '0.16'),
(39, 18, 'test2\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 1, '0.16', '0.16'),
(40, 19, 'test2\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 1, '0.16', '0.16'),
(41, 20, 'test2\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 1, '0.16', '0.16');

-- --------------------------------------------------------

--
-- Structure de la table `fraishorsforfait`
--

CREATE TABLE `fraishorsforfait` (
  `HorsForfaitID` int(11) NOT NULL,
  `FicheID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Libelle` varchar(255) DEFAULT NULL,
  `Montant` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fraishorsforfait`
--

INSERT INTO `fraishorsforfait` (`HorsForfaitID`, `FicheID`, `Date`, `Libelle`, `Montant`) VALUES
(1, 12, '2023-12-09', 'Surtaxe', '0.22');

-- --------------------------------------------------------

--
-- Structure de la table `paiementfrais`
--

CREATE TABLE `paiementfrais` (
  `PaiementID` int(11) NOT NULL,
  `ComptableID` int(11) DEFAULT NULL,
  `FicheID` int(11) DEFAULT NULL,
  `DateMiseEnPaiement` date DEFAULT NULL,
  `DateRemboursement` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `UserID` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Login` varchar(50) DEFAULT NULL,
  `MotDePasse` varchar(255) DEFAULT NULL,
  `TypeUtilisateur` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`UserID`, `Nom`, `Login`, `MotDePasse`, `TypeUtilisateur`) VALUES
(1, 'John Doe', 'john_doe', 'motdepasse1', 'Utilisateur'),
(2, 'Jane Doe', 'jane_doe', 'motdepasse2', 'Comptable'),
(3, 'Bob Smith', 'bob_smith', 'motdepasse3', 'Utilisateur');

-- --------------------------------------------------------

--
-- Structure de la table `validationfrais`
--

CREATE TABLE `validationfrais` (
  `ValidationID` int(11) NOT NULL,
  `ComptableID` int(11) DEFAULT NULL,
  `FicheID` int(11) DEFAULT NULL,
  `Commentaire` text DEFAULT NULL,
  `DateValidation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fichesdefrais`
--
ALTER TABLE `fichesdefrais`
  ADD PRIMARY KEY (`FicheID`),
  ADD KEY `UserID` (`UserID`);

--
-- Index pour la table `fraisforfaitises`
--
ALTER TABLE `fraisforfaitises`
  ADD PRIMARY KEY (`FraisID`),
  ADD KEY `FicheID` (`FicheID`);

--
-- Index pour la table `fraishorsforfait`
--
ALTER TABLE `fraishorsforfait`
  ADD PRIMARY KEY (`HorsForfaitID`),
  ADD KEY `FicheID` (`FicheID`);

--
-- Index pour la table `paiementfrais`
--
ALTER TABLE `paiementfrais`
  ADD PRIMARY KEY (`PaiementID`),
  ADD KEY `ComptableID` (`ComptableID`),
  ADD KEY `FicheID` (`FicheID`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Login` (`Login`);

--
-- Index pour la table `validationfrais`
--
ALTER TABLE `validationfrais`
  ADD PRIMARY KEY (`ValidationID`),
  ADD KEY `ComptableID` (`ComptableID`),
  ADD KEY `FicheID` (`FicheID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `fraisforfaitises`
--
ALTER TABLE `fraisforfaitises`
  MODIFY `FraisID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `fraishorsforfait`
--
ALTER TABLE `fraishorsforfait`
  MODIFY `HorsForfaitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fichesdefrais`
--
ALTER TABLE `fichesdefrais`
  ADD CONSTRAINT `fichesdefrais_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `utilisateurs` (`UserID`);

--
-- Contraintes pour la table `fraisforfaitises`
--
ALTER TABLE `fraisforfaitises`
  ADD CONSTRAINT `fraisforfaitises_ibfk_1` FOREIGN KEY (`FicheID`) REFERENCES `fichesdefrais` (`FicheID`);

--
-- Contraintes pour la table `fraishorsforfait`
--
ALTER TABLE `fraishorsforfait`
  ADD CONSTRAINT `fraishorsforfait_ibfk_1` FOREIGN KEY (`FicheID`) REFERENCES `fichesdefrais` (`FicheID`);

--
-- Contraintes pour la table `paiementfrais`
--
ALTER TABLE `paiementfrais`
  ADD CONSTRAINT `paiementfrais_ibfk_1` FOREIGN KEY (`ComptableID`) REFERENCES `utilisateurs` (`UserID`),
  ADD CONSTRAINT `paiementfrais_ibfk_2` FOREIGN KEY (`FicheID`) REFERENCES `fichesdefrais` (`FicheID`);

--
-- Contraintes pour la table `validationfrais`
--
ALTER TABLE `validationfrais`
  ADD CONSTRAINT `validationfrais_ibfk_1` FOREIGN KEY (`ComptableID`) REFERENCES `utilisateurs` (`UserID`),
  ADD CONSTRAINT `validationfrais_ibfk_2` FOREIGN KEY (`FicheID`) REFERENCES `fichesdefrais` (`FicheID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
