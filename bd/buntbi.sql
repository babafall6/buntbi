-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 04 Juin 2014 à 19:10
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `buntbi`
--
CREATE DATABASE IF NOT EXISTS `buntbi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `buntbi`;

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

CREATE TABLE IF NOT EXISTS `motif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` enum('information','paiement','reclamation','reunion','personnel','inscription') DEFAULT NULL,
  `commentaire` varchar(245) DEFAULT NULL,
  `id_service` int(11) DEFAULT NULL,
  `id_personnel` int(11) DEFAULT NULL,
  `id_visite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_service_idx` (`id_service`),
  KEY `id_personnel_idx` (`id_personnel`),
  KEY `id_visite_idx` (`id_visite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE IF NOT EXISTS `personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(45) NOT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricule_UNIQUE` (`matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libelle_UNIQUE` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `vigile`
--

CREATE TABLE IF NOT EXISTS `vigile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `vigile`
--

INSERT INTO `vigile` (`id`, `prenom`, `nom`, `login`, `password`) VALUES
(1, 'Moussa', 'Diop', 'mdiop', '482f7629a2511d23ef4e958b13a5ba54bdba06f2');

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

CREATE TABLE IF NOT EXISTS `visite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_entree` datetime DEFAULT NULL,
  `date_sortie` datetime DEFAULT NULL,
  `id_visiteur` int(11) NOT NULL,
  `id_vigile` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_visiteur_idx` (`id_visiteur`),
  KEY `id_vigile_idx` (`id_vigile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE IF NOT EXISTS `visiteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iden_doc` enum('ci','passeport','permis_conduire') NOT NULL,
  `num_iden` varchar(45) NOT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `sexe` enum('M','F') DEFAULT NULL,
  `date_naiss` date DEFAULT NULL,
  `adresse` varchar(150) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `num_iden_UNIQUE` (`num_iden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `motif`
--
ALTER TABLE `motif`
  ADD CONSTRAINT `id_personnel` FOREIGN KEY (`id_personnel`) REFERENCES `personnel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_service` FOREIGN KEY (`id_service`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_visite` FOREIGN KEY (`id_visite`) REFERENCES `visite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `id_vigile` FOREIGN KEY (`id_vigile`) REFERENCES `vigile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_visiteur` FOREIGN KEY (`id_visiteur`) REFERENCES `visiteur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
