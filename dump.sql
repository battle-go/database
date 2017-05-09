-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 09 Mai 2017 à 21:44
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `battle-go`
--

-- --------------------------------------------------------

--
-- Structure de la table `attacks`
--

CREATE TABLE `attacks` (
  `id` int(11) NOT NULL,
  `src_pokemon_id` int(11) NOT NULL,
  `dst_pokemon_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pokemons`
--

CREATE TABLE `pokemons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `live` tinyint(3) UNSIGNED NOT NULL,
  `power` tinyint(3) UNSIGNED NOT NULL,
  `speed` tinyint(3) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sprite` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pokemons`
--

INSERT INTO `pokemons` (`id`, `name`, `description`, `live`, `power`, `speed`, `image_url`, `user_id`, `sprite`) VALUES
(83, 'Canarticho', '	Canarticho ne se sépare jamais de son poireau car il lui sert à se défendre. Il le brandit habilement pour frapper, ou trancher. Les gens pensaient que ce poireau possédait des vertus particulières, mais c\'est juste un banal légume. C\'est un Pokémon solitaire.', 33, 33, 33, 'picture\\pokemons\\83.png', 3, ''),
(151, 'Mew', '	On sait très peu de choses sur Mew. Il est dit qu\'autrefois, ils étaient nombreux, mais ils auraient tous disparus sauf 1. Ce Pokémon mythique peut apprendre toutes les capacités, c\'est pour cela que certains pensent qu\'il est l\'ancêtre de tous les Pokémon. Pacifique, il passe son temps à jouer et à s\'amuser.', 1, 98, 1, 'picture\\pokemons\\151.png', 1, 'picture\\possede & non possede\\083 5g.gif');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `token`, `name`) VALUES
(1, 'bob@gmail.com', 'secret', '626827625', 'Bob'),
(2, 'alice@gmail.com', 'secret', 'secret2', 'Alice'),
(3, 'oscar@gmail.com', 'secret', 'secret3', 'Oscar');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `attacks`
--
ALTER TABLE `attacks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `src_pokemon_id_2` (`src_pokemon_id`,`created_at`),
  ADD KEY `src_pokemon_id` (`src_pokemon_id`),
  ADD KEY `dst_pokemon_id` (`dst_pokemon_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Index pour la table `pokemons`
--
ALTER TABLE `pokemons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `image_url` (`image_url`),
  ADD KEY `speed` (`speed`),
  ADD KEY `live` (`live`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `power` (`power`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `token` (`token`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `attacks`
--
ALTER TABLE `attacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pokemons`
--
ALTER TABLE `pokemons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `attacks`
--
ALTER TABLE `attacks`
  ADD CONSTRAINT `attacks_ibfk_1` FOREIGN KEY (`src_pokemon_id`) REFERENCES `pokemons` (`id`),
  ADD CONSTRAINT `attacks_ibfk_2` FOREIGN KEY (`dst_pokemon_id`) REFERENCES `pokemons` (`id`);

--
-- Contraintes pour la table `pokemons`
--
ALTER TABLE `pokemons`
  ADD CONSTRAINT `pokemons_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
