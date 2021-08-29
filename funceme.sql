-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Ago-2021 às 22:14
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `funceme`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `new` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `meetings`
--

INSERT INTO `meetings` (`id`, `name`, `email`, `subject`, `date`, `start`, `end`, `new`, `status`, `created_at`, `updated_at`) VALUES
(11, 'VALERIA CARMO', 'valeriaoscarmo@gmail.com', 'PARECE QUE ELE VAI GANHAR', '2021-09-02', '12:00:00', '18:00:00', 1, 0, '2021-08-29 21:06:49', '2021-08-29 21:10:23'),
(12, 'MARCUS', 'marcia.paulla@gmail.com', 'DOIDA DE MAIS', '2021-09-09', '11:00:00', '15:00:00', 0, 1, '2021-08-29 21:12:34', '2021-08-29 21:13:49'),
(13, 'marcus antonio', 'marcusantoniopaulo@gmail.com', 'dsdsdsds', '2021-08-30', '11:00:00', '12:00:00', 1, 0, '2021-08-29 23:10:46', '2021-08-29 23:10:46');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_06_21_225712_create_meetings_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0e79b9df798b59765f15b52c60eafebd1c2ae314b7be5373efaa36c5d46fed7d35fc4d7c4e122067', 5, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 22:45:42', '2021-08-29 22:45:42', '2022-08-29 19:45:42'),
('1623bc3d31e670357dc232a30b2520a2e3774af4a9b1ea7a8e1f5ab1aa6d3750b88b01c813b3780d', 5, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 22:47:35', '2021-08-29 22:47:35', '2022-08-29 19:47:35'),
('2f879db72f185daa358a061510e66b695ef544a3ada28661b82a809e609fe0a71bcb60248a0a9d1e', 1, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 18:05:07', '2021-08-29 18:05:07', '2022-08-29 15:05:07'),
('3a2a7298c8e3f020df9e714d729e1aec9038e4ab0a81a80973fb4385aa454639ae661942986f6450', 1, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 21:05:09', '2021-08-29 21:05:09', '2022-08-29 18:05:09'),
('3a4224ba1abd952d6a1305a5955da56d333270533576c7733eeacd07e288d45fc36612a152b6290a', 8, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 23:09:59', '2021-08-29 23:09:59', '2022-08-29 20:09:59'),
('53fdf4cded45d25141c77d2377ed5679f81a527d8ba34ec825d201dd3b512bef6090e1543f1a103f', 1, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 16:46:06', '2021-08-29 16:46:06', '2022-08-29 13:46:06'),
('5cdb90251a6e9ed8cf560e110906792057b0ada7c65cbb260022bc5df3b12581766ec382b1a47599', 1, 1, 'marcuspaulo@teste.com', '[]', 0, '2021-08-29 07:39:27', '2021-08-29 07:39:27', '2022-08-29 04:39:27'),
('69f111c83e4cb7e0b6d46966e4948c827b1946d6a1a31090f5e05e5950f3166f1779b5983382f806', 1, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 08:22:38', '2021-08-29 08:22:38', '2022-08-29 05:22:38'),
('9677fc93d65747fcd753a7900aaafb537f8922468d8c76fe6e773ac026cbbf425cc4adb7d6600f83', 1, 1, 'jorge@piperun.com', '[]', 0, '2021-08-29 07:07:40', '2021-08-29 07:07:40', '2022-08-29 04:07:40'),
('99835fca8b61296f80c2f802d96c8030b20b92e3de8e27d63b34870c2e58c77533451e3a84b5e8be', 1, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 18:29:17', '2021-08-29 18:29:17', '2022-08-29 15:29:17'),
('a4b5ee4e2a89df70739665d43249ed31fe858db2509b672f3f742d6e6e10612231ad162b838c60d4', 1, 1, 'marcuspaulo@teste.com', '[]', 0, '2021-08-29 07:19:53', '2021-08-29 07:19:53', '2022-08-29 04:19:53'),
('ab90c29fc9fb636fbf3279a28cd4911f26a5c183b7677637ef319fa403427e9344ddeb64f25688e1', 9, 1, 'robson@funceme.br', '[]', 0, '2021-08-29 22:50:46', '2021-08-29 22:50:46', '2022-08-29 19:50:46'),
('b2c683f4402b2bb1311b2ac2460e54d720397ca2558c52e784cda845549697c6bbdf99bf94ccbe47', 1, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 18:08:40', '2021-08-29 18:08:40', '2022-08-29 15:08:40'),
('be5a52636cb8d9d68e08c0ce92dd8e68f9fddc61fcffd46f126ee4b6a24fb149225665b316432023', 1, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 20:58:29', '2021-08-29 20:58:29', '2022-08-29 17:58:29'),
('dbeb3750bbee854426a45ca8244890100b0d85e8127dc815c0fb8c68eb7b8534c411c7398204d602', 1, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 19:09:58', '2021-08-29 19:09:58', '2022-08-29 16:09:58'),
('de0b1cbfb220dccdb1f08a067d9c04ffcb6ce1fbf77d094d60047057c6d7c4d3bd1268950c0bbf21', 1, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 17:56:03', '2021-08-29 17:56:03', '2022-08-29 14:56:03'),
('ea38490042fbf3337ab274a33a5dcc5dd506edd8881192937c5dcdb9fb22d572439fd7e8c449a0ad', 1, 1, 'marcuspaulo@teste.com', '[]', 0, '2021-08-29 07:39:33', '2021-08-29 07:39:33', '2022-08-29 04:39:33'),
('ea833903ffe6cb01c7b4ed9ea3f4253fb10b1d5f220465b00120df4e2bf5e9f545e4c9165b54053f', 1, 1, 'marcuspaulo@funceme.teste', '[]', 0, '2021-08-29 18:26:54', '2021-08-29 18:26:54', '2022-08-29 15:26:54');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Jr36YP7eFL1MMJzX5QC9qcDFNJVRnLBTk8pCddnf', NULL, 'http://localhost', 1, 0, 0, '2021-08-29 06:32:55', '2021-08-29 06:32:55'),
(2, NULL, 'Laravel Password Grant Client', 's4usW3ZBHfnaG3JN45XXQ2VPRFbRvYAxGcsvJCh3', 'users', 'http://localhost', 0, 1, 0, '2021-08-29 06:32:55', '2021-08-29 06:32:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-08-29 06:32:55', '2021-08-29 06:32:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Marcus Paulo', 'marcuspaulo@funceme.teste', NULL, '$2y$10$8lMd9zpJY.H/PMkY3cTM2uis1fQasniBkvdD0ynTEOfPgTwkQEMLO', NULL, NULL, NULL),
(9, 'Robson Franklin', 'robson@funceme.br', NULL, '$2y$10$4WunKmBy4q9pAH2zb6TOkeVWKyUI56YQlc.eJuk2bnn7eSG6JjSDm', NULL, NULL, NULL),
(10, 'Marcelo Rodrigues', 'marcelo@funceme.br', NULL, '$2y$10$ZeDwzT15J5OWWPqPBJIRA.PxhAYeeBSFDklWeWYQul5It.oBhQcpC', NULL, NULL, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Índices para tabela `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Índices para tabela `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Índices para tabela `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
