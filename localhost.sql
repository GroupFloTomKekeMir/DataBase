-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 04 Décembre 2014 à 08:36
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `exercisenotedproject`
--
CREATE DATABASE IF NOT EXISTS `exercisenotedproject` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `exercisenotedproject`;

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUMBER` int(11) NOT NULL,
  `NAMESTREET` varchar(255) NOT NULL,
  `POSTCODE` int(11) NOT NULL,
  `CITY` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `address`
--

INSERT INTO `address` (`ID`, `NUMBER`, `NAMESTREET`, `POSTCODE`, `CITY`) VALUES
(1, 35371, 'Rue de la Belle', 35371, 'Tregent'),
(2, 53000, 'Rue des Pommiers', 53000, 'Laval');

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE IF NOT EXISTS `adresse` (
  `id_adr` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `rue` varchar(250) NOT NULL,
  `codePostal` int(11) NOT NULL,
  `ville` varchar(100) NOT NULL,
  PRIMARY KEY (`id_adr`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Contenu de la table `adresse`
--

INSERT INTO `adresse` (`id_adr`, `numero`, `rue`, `codePostal`, `ville`) VALUES
(39, 4, 'les Landes', 53810, 'Changé'),
(40, 41, 'les Pommiers', 53000, 'Laval');

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LASTNAME` varchar(50) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `AGE` int(11) NOT NULL,
  `ID_ADDRESS` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_ADDRESS` (`ID_ADDRESS`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `person`
--

INSERT INTO `person` (`ID`, `LASTNAME`, `FIRSTNAME`, `AGE`, `ID_ADDRESS`) VALUES
(3, 'Davenel', 'Sylvain', 21, 1),
(4, 'Dupont', 'Pierre', 45, 2);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `id_adr` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ID_ADDRESS` (`id_adr`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`id`, `nom`, `prenom`, `age`, `id_adr`) VALUES
(30, 'Gaulthier', 'Paul', 0, 39),
(31, 'Dupont', 'Pierre', 0, 40);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `FK_ID_ADDRESS` FOREIGN KEY (`ID_ADDRESS`) REFERENCES `address` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de données: `javaweb`
--
CREATE DATABASE IF NOT EXISTS `javaweb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `javaweb`;

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `codePostal` int(11) NOT NULL,
  `ville` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Contenu de la table `adresse`
--

INSERT INTO `adresse` (`id`, `numero`, `rue`, `codePostal`, `ville`) VALUES
(40, 32, 'La Baudronnière', 53150, 'Saint Cénéré'),
(41, 0, 'Les landes', 53150, 'Changé'),
(42, 32, 'La Baudronnière', 53150, 'Saint Cénéré'),
(43, 0, 'Les landes', 53150, 'Changé'),
(44, 32, 'La Baudronnière', 53150, 'Saint Cénéré'),
(45, 0, 'Les landes', 53150, 'Changé'),
(46, 32, 'La Baudronnière', 53150, 'Saint Cénéré'),
(47, 0, 'Les landes', 53150, 'Changé'),
(48, 0, 'Rue de la Belle', 35370, 'Argentre'),
(49, 0, 'Rue de la soif', 53000, 'Laval'),
(50, 0, 'Rue de la Soif', 53500, 'St céré');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `idAdr` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idAdr` (`idAdr`),
  KEY `idAdr_2` (`idAdr`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`id`, `nom`, `prenom`, `age`, `idAdr`) VALUES
(2, 'Davenel', 'Sylvain', 20, 48),
(4, 'Samson', 'Florian', 20, 50);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `fk_personne_adresse` FOREIGN KEY (`idAdr`) REFERENCES `adresse` (`id`);
--
-- Base de données: `jdbcproject`
--
CREATE DATABASE IF NOT EXISTS `jdbcproject` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jdbcproject`;

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LASTNAME` varchar(50) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `ADDRESS` varchar(250) DEFAULT NULL,
  `POST_CODE` int(11) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `LOGIN` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `person`
--

INSERT INTO `person` (`ID`, `LASTNAME`, `FIRSTNAME`, `ADDRESS`, `POST_CODE`, `CITY`, `LOGIN`, `PASSWORD`) VALUES
(1, 'Keloud', 'Yann', 'IIA', 53000, 'LAVAL', 'yann', 'pw'),
(3, 'Davenel', 'Sylvain', 'IIA', 35000, 'ArgentreDuPlessis', 'mirouf', 'not24get'),
(4, 'Maigne0', 'Benjamin0', 'MontGrinder0', 53500, 'Amnesia0', 'skunk0', 'super0'),
(5, 'Maigne1', 'Benjamin1', 'MontGrinder1', 53501, 'Amnesia1', 'skunk1', 'super1'),
(6, 'Maigne2', 'Benjamin2', 'MontGrinder2', 53502, 'Amnesia2', 'skunk2', 'super2'),
(7, 'Maigne3', 'Benjamin3', 'MontGrinder3', 53503, 'Amnesia3', 'skunk3', 'super3'),
(8, 'Maigne4', 'Benjamin4', 'MontGrinder4', 53504, 'Amnesia4', 'skunk4', 'super4'),
(9, 'Maigne5', 'Benjamin5', 'MontGrinder5', 53505, 'Amnesia5', 'skunk5', 'super5'),
(10, 'Maigne6', 'Benjamin6', 'MontGrinder6', 53506, 'Amnesia6', 'skunk6', 'super6'),
(11, 'Maigne7', 'Benjamin7', 'MontGrinder7', 53507, 'Amnesia7', 'skunk7', 'super7'),
(12, 'Maigne8', 'Benjamin8', 'MontGrinder8', 53508, 'Amnesia8', 'skunk8', 'super8'),
(13, 'Maigne9', 'Benjamin9', 'MontGrinder9', 53509, 'Amnesia9', 'skunk9', 'super9');
--
-- Base de données: `megacasting`
--
CREATE DATABASE IF NOT EXISTS `megacasting` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `megacasting`;

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE IF NOT EXISTS `adresse` (
  `id_adr` bigint(20) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `code_postal` int(11) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`id_adr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `annonceur`
--

CREATE TABLE IF NOT EXISTS `annonceur` (
  `id_annonceur` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `mail` int(30) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `id_adresse` bigint(50) NOT NULL,
  `id_media` bigint(20) NOT NULL,
  PRIMARY KEY (`id_annonceur`),
  KEY `id_media` (`id_media`),
  KEY `id_adresse` (`id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE IF NOT EXISTS `compte` (
  `id_compte` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE IF NOT EXISTS `contrat` (
  `id_contrat` bigint(20) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(200) NOT NULL,
  PRIMARY KEY (`id_contrat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `diffuseur`
--

CREATE TABLE IF NOT EXISTS `diffuseur` (
  `id_diffuseur` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `mail` int(30) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `id_adresse` bigint(20) NOT NULL,
  `id_media` bigint(20) NOT NULL,
  PRIMARY KEY (`id_diffuseur`),
  KEY `id_media` (`id_media`),
  KEY `id_adresse` (`id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

CREATE TABLE IF NOT EXISTS `domaine` (
  `id_domaine` bigint(20) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(200) NOT NULL,
  PRIMARY KEY (`id_domaine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE IF NOT EXISTS `employe` (
  `id_employe` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `telephone` tinyint(4) NOT NULL,
  `id_compte` bigint(20) NOT NULL,
  PRIMARY KEY (`id_employe`),
  KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `envisager`
--

CREATE TABLE IF NOT EXISTS `envisager` (
  `id_util` bigint(20) NOT NULL,
  `id_metier` bigint(20) NOT NULL,
  PRIMARY KEY (`id_util`,`id_metier`),
  KEY `id_util` (`id_util`,`id_metier`),
  KEY `id_metier` (`id_metier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `est_interesse`
--

CREATE TABLE IF NOT EXISTS `est_interesse` (
  `id_util` bigint(20) NOT NULL,
  `id_domaine` bigint(20) NOT NULL,
  PRIMARY KEY (`id_util`,`id_domaine`),
  KEY `id_util` (`id_util`,`id_domaine`),
  KEY `est_interesse_domaine` (`id_domaine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE IF NOT EXISTS `evenement` (
  `id_evenement` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `date` datetime NOT NULL,
  `id_adresse` bigint(20) NOT NULL,
  `id_annonceur` bigint(20) NOT NULL,
  PRIMARY KEY (`id_evenement`),
  KEY `adresse` (`id_adresse`,`id_annonceur`),
  KEY `media` (`id_annonceur`),
  KEY `media_2` (`id_annonceur`),
  KEY `annonceur` (`id_annonceur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gerer`
--

CREATE TABLE IF NOT EXISTS `gerer` (
  `id_offre` bigint(20) NOT NULL,
  `id_employe` bigint(20) NOT NULL,
  PRIMARY KEY (`id_offre`,`id_employe`),
  KEY `id_offre` (`id_offre`,`id_employe`),
  KEY `id_employe` (`id_employe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id_media` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `taille` int(11) NOT NULL,
  `id_type` bigint(20) NOT NULL,
  PRIMARY KEY (`id_media`),
  KEY `id_offre` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `media_evenement`
--

CREATE TABLE IF NOT EXISTS `media_evenement` (
  `id_media` bigint(20) NOT NULL,
  `id_evenement` bigint(20) NOT NULL,
  PRIMARY KEY (`id_media`,`id_evenement`),
  KEY `id_media` (`id_media`,`id_evenement`),
  KEY `media_evenement` (`id_evenement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `media_musique`
--

CREATE TABLE IF NOT EXISTS `media_musique` (
  `id_media` bigint(20) NOT NULL,
  `id_musique` bigint(20) NOT NULL,
  PRIMARY KEY (`id_media`,`id_musique`),
  KEY `id_media` (`id_media`,`id_musique`),
  KEY `id_musique` (`id_musique`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `media_offre`
--

CREATE TABLE IF NOT EXISTS `media_offre` (
  `id_media` bigint(20) NOT NULL,
  `id_offre` bigint(20) NOT NULL,
  PRIMARY KEY (`id_media`,`id_offre`),
  KEY `id_media` (`id_media`,`id_offre`),
  KEY `offre_media` (`id_offre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `media_utilisateur`
--

CREATE TABLE IF NOT EXISTS `media_utilisateur` (
  `id_media` bigint(20) NOT NULL,
  `id_util` bigint(20) NOT NULL,
  PRIMARY KEY (`id_media`,`id_util`),
  KEY `id_media` (`id_media`,`id_util`),
  KEY `utilisateur_media` (`id_util`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `metier`
--

CREATE TABLE IF NOT EXISTS `metier` (
  `id_metier` bigint(20) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(200) NOT NULL,
  `id_domaine` bigint(20) NOT NULL,
  PRIMARY KEY (`id_metier`),
  KEY `id_domaine` (`id_domaine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `musique`
--

CREATE TABLE IF NOT EXISTS `musique` (
  `id_musique` bigint(20) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `id_utilisateur` bigint(20) NOT NULL,
  PRIMARY KEY (`id_musique`),
  KEY `media` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

CREATE TABLE IF NOT EXISTS `offre` (
  `id_offre` bigint(20) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `reference` int(11) NOT NULL,
  `date_debut_publi` datetime NOT NULL,
  `fin_publi` datetime NOT NULL,
  `nbr_post` int(11) NOT NULL,
  `descr_poste` varchar(500) NOT NULL,
  `descr_profil` varchar(500) DEFAULT NULL,
  `duree_contrat` int(11) DEFAULT NULL,
  `id_contrat` bigint(20) NOT NULL,
  `id_annonceur` bigint(20) NOT NULL,
  `id_diffuseur` bigint(20) NOT NULL,
  `id_metier` bigint(20) NOT NULL,
  PRIMARY KEY (`id_offre`),
  KEY `id_contrat` (`id_contrat`,`id_annonceur`,`id_diffuseur`,`id_metier`),
  KEY `id_annonceur` (`id_annonceur`),
  KEY `id_diffuseur` (`id_diffuseur`),
  KEY `id_metier` (`id_metier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `params`
--

CREATE TABLE IF NOT EXISTS `params` (
  `id_params` bigint(20) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id_params`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `postuler`
--

CREATE TABLE IF NOT EXISTS `postuler` (
  `id_offre` bigint(20) NOT NULL,
  `id_util` bigint(20) NOT NULL,
  PRIMARY KEY (`id_offre`,`id_util`),
  KEY `id_offre` (`id_offre`,`id_util`),
  KEY `postuler_utilisateur` (`id_util`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `travail`
--

CREATE TABLE IF NOT EXISTS `travail` (
  `id_annonceur` bigint(20) NOT NULL,
  `id_diffuseur` bigint(20) NOT NULL,
  PRIMARY KEY (`id_annonceur`,`id_diffuseur`),
  KEY `id_annonceur` (`id_annonceur`,`id_diffuseur`),
  KEY `travail_diffuseur` (`id_diffuseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_media`
--

CREATE TABLE IF NOT EXISTS `type_media` (
  `id_type` bigint(20) NOT NULL AUTO_INCREMENT,
  `format` varchar(10) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_util` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nom_artiste` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `id_adresse` bigint(20) NOT NULL,
  `descr_util` varchar(500) NOT NULL,
  PRIMARY KEY (`id_util`),
  KEY `adresse` (`id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `visiter`
--

CREATE TABLE IF NOT EXISTS `visiter` (
  `id_visiteur` bigint(20) NOT NULL,
  `id_offre` bigint(20) NOT NULL,
  `nbr_visite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_visiteur`,`id_offre`),
  KEY `id_visiteur` (`id_visiteur`,`id_offre`),
  KEY `visiter_offre` (`id_offre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE IF NOT EXISTS `visiteur` (
  `id_visiteur` bigint(20) NOT NULL AUTO_INCREMENT,
  `adresse_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id_visiteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `annonceur`
--
ALTER TABLE `annonceur`
  ADD CONSTRAINT `annonceur_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adr`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `annonceur_media` FOREIGN KEY (`id_media`) REFERENCES `media` (`id_media`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `diffuseur`
--
ALTER TABLE `diffuseur`
  ADD CONSTRAINT `diffuseur_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adr`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diffuseur_media` FOREIGN KEY (`id_media`) REFERENCES `media` (`id_media`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_compte` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `envisager`
--
ALTER TABLE `envisager`
  ADD CONSTRAINT `envisager_metier` FOREIGN KEY (`id_metier`) REFERENCES `metier` (`id_metier`),
  ADD CONSTRAINT `envisager_utilisateur` FOREIGN KEY (`id_util`) REFERENCES `utilisateur` (`id_util`);

--
-- Contraintes pour la table `est_interesse`
--
ALTER TABLE `est_interesse`
  ADD CONSTRAINT `est_interesse_domaine` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`),
  ADD CONSTRAINT `est_interesse_utilisateur` FOREIGN KEY (`id_util`) REFERENCES `utilisateur` (`id_util`);

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `evenement_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adr`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `evenement_annonceur` FOREIGN KEY (`id_annonceur`) REFERENCES `annonceur` (`id_annonceur`);

--
-- Contraintes pour la table `gerer`
--
ALTER TABLE `gerer`
  ADD CONSTRAINT `gerer_employe` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`),
  ADD CONSTRAINT `gerer_offre` FOREIGN KEY (`id_offre`) REFERENCES `offre` (`id_offre`);

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_type` FOREIGN KEY (`id_type`) REFERENCES `type_media` (`id_type`);

--
-- Contraintes pour la table `media_evenement`
--
ALTER TABLE `media_evenement`
  ADD CONSTRAINT `evenement_media` FOREIGN KEY (`id_media`) REFERENCES `media` (`id_media`),
  ADD CONSTRAINT `media_evenement` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_evenement`);

--
-- Contraintes pour la table `media_musique`
--
ALTER TABLE `media_musique`
  ADD CONSTRAINT `media_musique` FOREIGN KEY (`id_media`) REFERENCES `media` (`id_media`),
  ADD CONSTRAINT `musique_media` FOREIGN KEY (`id_musique`) REFERENCES `musique` (`id_musique`);

--
-- Contraintes pour la table `media_offre`
--
ALTER TABLE `media_offre`
  ADD CONSTRAINT `media_offre` FOREIGN KEY (`id_media`) REFERENCES `media` (`id_media`),
  ADD CONSTRAINT `offre_media` FOREIGN KEY (`id_offre`) REFERENCES `offre` (`id_offre`);

--
-- Contraintes pour la table `media_utilisateur`
--
ALTER TABLE `media_utilisateur`
  ADD CONSTRAINT `media_utilisateur` FOREIGN KEY (`id_media`) REFERENCES `media` (`id_media`),
  ADD CONSTRAINT `utilisateur_media` FOREIGN KEY (`id_util`) REFERENCES `utilisateur` (`id_util`);

--
-- Contraintes pour la table `metier`
--
ALTER TABLE `metier`
  ADD CONSTRAINT `metier_domaine` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`);

--
-- Contraintes pour la table `musique`
--
ALTER TABLE `musique`
  ADD CONSTRAINT `musique_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_util`);

--
-- Contraintes pour la table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `offre_annonceur` FOREIGN KEY (`id_annonceur`) REFERENCES `annonceur` (`id_annonceur`),
  ADD CONSTRAINT `offre_contrat` FOREIGN KEY (`id_contrat`) REFERENCES `contrat` (`id_contrat`),
  ADD CONSTRAINT `offre_diffuseur` FOREIGN KEY (`id_diffuseur`) REFERENCES `diffuseur` (`id_diffuseur`),
  ADD CONSTRAINT `offre_metier` FOREIGN KEY (`id_metier`) REFERENCES `metier` (`id_metier`);

--
-- Contraintes pour la table `postuler`
--
ALTER TABLE `postuler`
  ADD CONSTRAINT `postuler_offre` FOREIGN KEY (`id_offre`) REFERENCES `offre` (`id_offre`),
  ADD CONSTRAINT `postuler_utilisateur` FOREIGN KEY (`id_util`) REFERENCES `utilisateur` (`id_util`);

--
-- Contraintes pour la table `travail`
--
ALTER TABLE `travail`
  ADD CONSTRAINT `travail_annonceur` FOREIGN KEY (`id_annonceur`) REFERENCES `annonceur` (`id_annonceur`),
  ADD CONSTRAINT `travail_diffuseur` FOREIGN KEY (`id_diffuseur`) REFERENCES `diffuseur` (`id_diffuseur`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adr`);

--
-- Contraintes pour la table `visiter`
--
ALTER TABLE `visiter`
  ADD CONSTRAINT `visiter_offre` FOREIGN KEY (`id_offre`) REFERENCES `offre` (`id_offre`),
  ADD CONSTRAINT `visiter_visiteur` FOREIGN KEY (`id_visiteur`) REFERENCES `visiteur` (`id_visiteur`);
--
-- Base de données: `portfolio`
--
CREATE DATABASE IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `portfolio`;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'f24ff876a23ae9bd9357dd42dc0a39c3e229dbc2');

-- --------------------------------------------------------

--
-- Structure de la table `works`
--

CREATE TABLE IF NOT EXISTS `works` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
--
-- Base de données: `swingproject`
--
CREATE DATABASE IF NOT EXISTS `swingproject` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `swingproject`;

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE IF NOT EXISTS `adresse` (
  `id_adr` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `rue` varchar(250) NOT NULL,
  `codePostal` int(11) NOT NULL,
  `ville` varchar(100) NOT NULL,
  PRIMARY KEY (`id_adr`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Contenu de la table `adresse`
--

INSERT INTO `adresse` (`id_adr`, `numero`, `rue`, `codePostal`, `ville`) VALUES
(39, 4, 'les Landes', 53810, 'Changé'),
(40, 41, 'les Pommiers', 53000, 'Laval'),
(41, 4, 'les Pommiers', 53000, 'Laval'),
(42, 41, 'Rue de Brest', 35000, 'Rennes'),
(43, 4, 'les Pommiers', 53000, 'Laval'),
(44, 41, 'Rue de Brest', 35000, 'Rennes'),
(45, 0, 'Rue de la Belle', 35370, 'Argentre'),
(46, 0, 'Rue de la Belle', 35370, 'Argentré'),
(47, 0, 'Rue de la Belle', 35370, 'Argenter'),
(48, 0, 'Rue de la Belle', 35370, 'Argentre');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `idAdr` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ID_ADDRESS` (`idAdr`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`id`, `nom`, `prenom`, `age`, `idAdr`) VALUES
(30, 'Gaulthier', 'Paul', 0, 39),
(31, 'Dupont', 'Pierre', 0, 40);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `FK_ID_ADDRESS` FOREIGN KEY (`idAdr`) REFERENCES `adresse` (`id_adr`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
