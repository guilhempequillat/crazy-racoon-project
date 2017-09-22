-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 22 sep. 2017 à 12:56
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `coursjava`
--

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(84),
(84);

-- --------------------------------------------------------

--
-- Structure de la table `mail`
--

DROP TABLE IF EXISTS `mail`;
CREATE TABLE IF NOT EXISTS `mail` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mail`
--

INSERT INTO `mail` (`id`, `content`, `subject`) VALUES
(78, '<h1>Hi !</h1><h3>Don\'t forget to complete your motm form !</h3><p><p>It&#39;s really important!</p>\r\n</p><br>Regards, your administrator<br><a href=\"http://localhost:8080/crazy-racoon/register\">Go to crazy racoon!</a>', 'Hey , let\'s hear it for your mood of the month!'),
(82, '<h1>Hi !</h1><h3>Don\'t forget to complete your motm form !</h3><p><p>It&#39;s really important!!</p>\r\n</p><br>Regards, your administrator<br><a href=\"http://localhost:8080/crazy-racoon/register\">Go to crazy racoon!</a>', 'Hey , let\'s hear it for your mood of the month!'),
(83, '<h1>Hi !</h1><h3>Don\'t forget to complete your motm form !</h3><p><p>do it</p>\r\n</p><br>Regards, your administrator<br><a href=\"http://localhost:8080/crazy-racoon/register\">Go to crazy racoon!</a>', 'Hey , let\'s hear it for your mood of the month!');

-- --------------------------------------------------------

--
-- Structure de la table `motm`
--

DROP TABLE IF EXISTS `motm`;
CREATE TABLE IF NOT EXISTS `motm` (
  `id` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `motmDate` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5qpdedru75ahyt5or0ntsl1b7` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `motm`
--

INSERT INTO `motm` (`id`, `comment`, `grade`, `motmDate`, `user_id`) VALUES
(32, 'Pas mal', 3, '2017-01-17 13:52:29', 17),
(33, 'Dépression', 1, '2017-02-17 13:52:53', 16),
(34, 'J\'ai passé la moitié du mois en vacances alors TOP!', 5, '2017-03-17 13:53:22', 18),
(35, 'Génial!!!', 5, '2017-04-17 13:53:50', 19),
(36, 'Bof', 2, '2017-05-17 13:54:08', 20),
(38, 'Très mauvaise gestion du projet par les supérieurs rendant le travail plus difficile', 1, '2016-10-19 09:49:05', 16),
(39, 'Nouveau projet, nouveaux collègues du changement ENFIN', 5, '2016-11-19 09:49:36', 17),
(40, 'Divorce, dispute de la garde des enfants bref pas facile', 1, '2016-12-19 09:50:20', 16),
(41, 'J\'adore la nouvelle cafétéria', 5, '2016-09-19 09:50:36', 17),
(42, 'Catastrophique! Trop de travail pas assez de temps!! Les journées ne durent que 24H!!', 1, '2017-06-19 09:51:43', 16),
(43, 'Pas facile', 2, '2017-07-19 09:51:57', 17),
(44, 'Rien à dire', 3, '2017-08-19 09:52:41', 16),
(47, 'Beaucoup de stress', 2, '2017-09-19 10:06:52', 17),
(49, 'Pas trop mal', 3, '2017-03-19 10:06:42', 16),
(50, 'Vacances aux Bahamas le KIFF', 5, '2017-08-19 09:52:41', 17),
(51, 'Mois productif !!', 4, '2017-09-21 23:21:10', 17),
(68, 'Travail intéressant!', 4, '2017-09-22 11:25:20', 16),
(69, 'Not so great', 2, '2017-09-22 12:00:56', 19),
(81, 'Happy!', 4, '2017-09-22 14:49:27', 79);

-- --------------------------------------------------------

--
-- Structure de la table `template`
--

DROP TABLE IF EXISTS `template`;
CREATE TABLE IF NOT EXISTS `template` (
  `id` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `template`
--

INSERT INTO `template` (`id`, `date`, `text`, `title`) VALUES
(71, '2017-09-22 12:02:14', 'Tell me more about your month :)', 'Mood of the month - September');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL,
  `birthdate` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `statut` bit(1) DEFAULT NULL,
  `stringDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `birthdate`, `email`, `firstName`, `lastName`, `password`, `statut`, `stringDate`) VALUES
(10, '2004-12-12 00:00:00', 'teurnier@emilie.fr', 'Emilie', 'Teurnier', 'ok', b'1', '2004-12-12'),
(16, '1994-09-14 00:00:00', 'pequillat@guilhem.fr', 'Guilhem', 'Pequillat', 'ok', b'0', '1994-09-14'),
(17, '1994-04-20 00:00:00', 'lemoine@gwladys.fr', 'gwladys', 'Lemoine', 'ok', b'0', '1994-04-20'),
(18, '1997-07-24 00:00:00', 'teurnier@marion.fr', 'Marion', 'Teurnier', 'ok', b'0', '1997-07-24'),
(19, '1995-02-06 00:00:00', 'teurnier@chantal.fr', 'Chantal', 'Teurnier', 'ok', b'0', '1995-02-06'),
(20, '1995-06-26 00:00:00', 'teurnier@patrick.fr', 'Patrick', 'Teurnier', 'ok', b'0', '1995-06-26'),
(79, '1995-06-21 00:00:00', 'emilie.teurnier@epfedu.fr', 'Emilie', 'Teurnier', 'ok', b'0', '1995-06-21');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
