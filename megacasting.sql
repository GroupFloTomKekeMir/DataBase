-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 08 Décembre 2014 à 16:36
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `megacasting`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `adresse`
--

INSERT INTO `adresse` (`id_adr`, `numero`, `code_postal`, `rue`, `ville`, `location`) VALUES
(1, 10, 53970, 'rue de la cannelle', 'lhuisserie', 'Pays de la loire'),
(2, 10, 72000, 'rue des tatata', 'paris', 'france'),
(3, 30, 54123, 'rue des titititi', 'marseille', 'france'),
(4, 60, 35415, 'rue des trotrotro', 'paris', 'france'),
(5, 20, 78541, 'rue des importer', 'lyon', 'france'),
(6, 45, 98765, 'rue des exporter', 'lille', 'france'),
(7, 65, 32165, 'rue des privilèges', 'Brest', 'france');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `annonceur`
--

INSERT INTO `annonceur` (`id_annonceur`, `nom`, `mail`, `telephone`, `id_adresse`, `id_media`) VALUES
(2, 'roger', 0, '0642250412', 1, 2),
(3, 'mael', 0, '070541212', 2, 3),
(4, 'remi', 0, '845145612', 3, 4);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `contrat`
--

INSERT INTO `contrat` (`id_contrat`, `libelle`) VALUES
(1, 'CDI'),
(2, 'CDD');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `diffuseur`
--

INSERT INTO `diffuseur` (`id_diffuseur`, `nom`, `mail`, `telephone`, `id_adresse`, `id_media`) VALUES
(1, 'Igor', 0, '0642259845', 4, 2),
(2, 'Tomi', 0, '0214512541', 5, 3);

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

CREATE TABLE IF NOT EXISTS `domaine` (
  `id_domaine` bigint(20) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(200) NOT NULL,
  PRIMARY KEY (`id_domaine`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `domaine`
--

INSERT INTO `domaine` (`id_domaine`, `libelle`) VALUES
(1, 'Musique'),
(2, 'Danse'),
(3, 'Cinema');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `media`
--

INSERT INTO `media` (`id_media`, `nom`, `taille`, `id_type`) VALUES
(2, 'media 1', 100, 1),
(3, 'media 2', 524, 2),
(4, 'media 3', 3654, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `metier`
--

INSERT INTO `metier` (`id_metier`, `libelle`, `id_domaine`) VALUES
(1, 'musicien', 1),
(2, 'danseur', 2),
(3, 'réalisateur', 3);

-- --------------------------------------------------------

--
-- Structure de la table `musique`
--

CREATE TABLE IF NOT EXISTS `musique` (
  `id_musique` bigint(20) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `date_ajout` date NOT NULL,
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
  `nbr_poste` int(11) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `offre`
--

INSERT INTO `offre` (`id_offre`, `titre`, `reference`, `date_debut_publi`, `fin_publi`, `nbr_poste`, `descr_poste`, `descr_profil`, `duree_contrat`, `id_contrat`, `id_annonceur`, `id_diffuseur`, `id_metier`) VALUES
(1, 'Symphonia du blablabla', 355, '2014-11-01 00:00:00', '2014-11-30 00:00:00', 3, 'pianiste', 'Recherche un pianiste avec +10 expériences', 365, 2, 2, 1, 1),
(2, 'Just Dance', 654, '2015-01-01 00:00:00', '2015-03-18 00:00:00', 10, 'danseur hip-hop', 'Recherche un pianiste avec au moins 1 an de pratique et qui connais le jeux just dance', 50, 2, 3, 2, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `type_media`
--

INSERT INTO `type_media` (`id_type`, `format`) VALUES
(1, 'jpeg'),
(2, 'mp3'),
(3, 'mkv');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_util`, `login`, `password`, `nom`, `prenom`, `nom_artiste`, `age`, `mail`, `telephone`, `id_adresse`, `descr_util`) VALUES
(2, 'admin', 'admin', 'pauchard', 'thomas', 'tpauch', 19, 'admin', '0642250575', 1, 'pas de description');

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
