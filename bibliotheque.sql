-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Lun 10 Avril 2017 à 10:37
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bibliothèque`
--

DELIMITER $$
--
-- Fonctions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `nbEmprunts` (`NomPersonne` VARCHAR(255), `PrenomPersonne` VARCHAR(255)) RETURNS INT(11) NO SQL
BEGIN
	DECLARE nbEmprunts INTEGER;
	SELECT COUNT(*) INTO nbEmprunts FROM emprunt WHERE NoPers = (SELECT NumPers FROM personne WHERE Nom = NomPersonne AND Prenom = PrenomPersonne);
    RETURN nbEmprunts;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE `emprunt` (
  `NoPers` int(2) NOT NULL,
  `NoLiv` int(2) NOT NULL,
  `DateSortie` date NOT NULL,
  `DateRetour` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `emprunt`
--

INSERT INTO `emprunt` (`NoPers`, `NoLiv`, `DateSortie`, `DateRetour`) VALUES
(10, 12, '2017-03-03', NULL),
(10, 15, '2017-03-16', NULL),
(10, 18, '2017-02-06', NULL),
(20, 8, '2017-03-01', '2017-03-04'),
(20, 8, '2017-03-25', NULL),
(30, 19, '2017-03-20', '2017-03-25'),
(40, 1, '2017-03-16', '2017-03-20'),
(40, 7, '2017-01-14', NULL);

--
-- Déclencheurs `emprunt`
--
DELIMITER $$
CREATE TRIGGER `valideEmprunt` BEFORE INSERT ON `emprunt` FOR EACH ROW BEGIN
	IF (DATEDIFF(NEW.DateSortie, NOW()) OR EXISTS (SELECT NoLiv FROM emprunt WHERE DateRetour IS NULL AND NoLiv = NEW.NoLiv))
        THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT="Impossible de reserver";
        END IF;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `NumGenre` int(1) NOT NULL DEFAULT '0',
  `NomGenre` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `genre`
--

INSERT INTO `genre` (`NumGenre`, `NomGenre`) VALUES
(1, 'Roman'),
(2, 'Policier'),
(3, 'Fantastique');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `noLiv` int(2) NOT NULL DEFAULT '0',
  `Titre` varchar(34) DEFAULT NULL,
  `Auteur` varchar(20) DEFAULT NULL,
  `Prix` varchar(10) DEFAULT NULL,
  `NumGenre` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `livre`
--

INSERT INTO `livre` (`noLiv`, `Titre`, `Auteur`, `Prix`, `NumGenre`) VALUES
(1, 'LES CHOUANS', 'BALZAC', '15', 1),
(5, 'LA BETE HUMAINE', 'ZOLA', '17', 1),
(7, 'LA PESTE', 'CAMUS', '7', 1),
(8, 'LES LETTRES PERSANES', 'MONTESQUIEU', '8', 1),
(9, 'BEL AMI', 'MAUPASSANT', '7', 1),
(10, 'LES LETTRES DE MON MOULIN', 'DAUDET', '9', 1),
(11, 'CESAR', 'PAGNOL', '10', 1),
(12, 'MARIUS', 'PAGNOL', '10', 1),
(13, 'FANNY', 'PAGNOL', '9', 1),
(14, 'LES FLEURS DU MAL', 'BAUDELAIRE', '11', 1),
(15, 'PAROLES', 'PREVERT', '7', 1),
(16, 'LE CHIEN DES BASKERVILLE', 'DOYLE', '15', 2),
(17, 'CADAVRE X', 'CORNWELL', '16', 2),
(18, 'UNE HAINE AVEUGLE', 'GRIMES', '12', 2),
(19, 'LES RATS DE MONTSOURIS', 'MALET', '9', 2),
(20, 'toto', 'Albert', '10', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `NumPers` int(3) NOT NULL DEFAULT '0',
  `Nom` varchar(20) DEFAULT NULL,
  `Prenom` varchar(20) DEFAULT NULL,
  `Adresse` varchar(30) DEFAULT NULL,
  `Ville` varchar(20) DEFAULT NULL,
  `CP` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`NumPers`, `Nom`, `Prenom`, `Adresse`, `Ville`, `CP`) VALUES
(10, 'Xation', 'Luc', '77 rue du Neverland', 'DisneyLand', '77777'),
(20, 'Tounet', 'Patrice', '53 rue de Donald', 'normal Valley', '66666'),
(30, 'Touille', 'Sacha', '1 rue des lilas', 'Lille', '59000'),
(40, 'Asonimage', 'Fidel', '32 rue de Lille', 'Douai', '59500'),
(50, 'Ateur', 'Nordine', '12 rue du Jambon', 'Lille', '59000'),
(60, 'Balmasqu', 'Alonzo', '14 r des pins', 'Arras', '62000'),
(70, 'Monblouson', 'Jean-Phil', '4 rue de la fosse', 'Lens', '62100'),
(80, 'Peuplus', 'Jean', '14 rue de la fatigue', 'Bethune', '62400'),
(90, 'Danletas', 'Alphonse', '52 bd de la rose', 'Bethune', '62400'),
(100, 'Duroutard', 'Manuel', '60 impasse de la rose', 'Lille', '59000');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`NoPers`,`NoLiv`,`DateSortie`),
  ADD KEY `NoPers` (`NoPers`),
  ADD KEY `NoLiv` (`NoLiv`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`NumGenre`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`noLiv`),
  ADD KEY `NumGenre` (`NumGenre`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`NumPers`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `emprunt_ibfk_1` FOREIGN KEY (`NoPers`) REFERENCES `personne` (`NumPers`),
  ADD CONSTRAINT `emprunt_ibfk_2` FOREIGN KEY (`NoLiv`) REFERENCES `livre` (`noLiv`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`NumGenre`) REFERENCES `genre` (`NumGenre`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
