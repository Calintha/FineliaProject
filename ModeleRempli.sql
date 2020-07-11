-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Sam 11 Juillet 2020 à 14:58
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `moyenne`
--

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `id_eleve` int(11) UNSIGNED NOT NULL,
  `nom` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `eleve`
--

INSERT INTO `eleve` (`id_eleve`, `nom`) VALUES
(1, 'EleveA'),
(2, 'EleveB'),
(3, 'EleveC');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id_matiere` int(11) UNSIGNED NOT NULL,
  `ref_matiere` int(11) DEFAULT NULL,
  `nom_matiere` varchar(100) DEFAULT NULL,
  `coef` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `matiere`
--

INSERT INTO `matiere` (`id_matiere`, `ref_matiere`, `nom_matiere`, `coef`) VALUES
(1, 1, 'math', '1'),
(2, 1, 'anglais', '1'),
(3, 1, 'francais', '1'),
(4, 1, 'histoire', '1'),
(5, 2, 'math', '1'),
(6, 2, 'anglais', '2'),
(7, 2, 'francais', '3'),
(8, 2, 'histoire', '4'),
(9, 3, 'math', '1.5'),
(10, 3, 'anglais', '2.5'),
(11, 3, 'francais', '3.5'),
(12, 3, 'histoire', '4.5');

-- --------------------------------------------------------

--
-- Structure de la table `notation`
--

CREATE TABLE `notation` (
  `id_note` int(11) UNSIGNED NOT NULL,
  `ref_note` int(11) DEFAULT NULL,
  `note` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `notation`
--

INSERT INTO `notation` (`id_note`, `ref_note`, `note`) VALUES
(1, 1, '0'),
(2, 1, '5'),
(3, 1, '10'),
(4, 1, '20'),
(5, 2, '0'),
(6, 2, '11.0'),
(7, 2, '31.5'),
(8, 2, '80'),
(9, 3, '0.75'),
(10, 3, '13.125'),
(11, 3, '35.0'),
(12, 3, '90.0');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`id_eleve`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id_matiere`);

--
-- Index pour la table `notation`
--
ALTER TABLE `notation`
  ADD PRIMARY KEY (`id_note`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `id_eleve` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id_matiere` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `notation`
--
ALTER TABLE `notation`
  MODIFY `id_note` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
