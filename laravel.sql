-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2026 at 07:15 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `emergency_contact_name` varchar(255) DEFAULT NULL,
  `emergency_contact_phone` varchar(20) DEFAULT NULL,
  `enrollment_date` date NOT NULL,
  `fitness_level` enum('Fundamentals','Mid-Level','Advanced') NOT NULL DEFAULT 'Fundamentals',
  `population_class` enum('General','Special') NOT NULL DEFAULT 'General',
  `status` enum('Active','Inactive','Churned') NOT NULL DEFAULT 'Active',
  `assigned_trainer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `full_name`, `email`, `phone`, `birthdate`, `address`, `emergency_contact_name`, `emergency_contact_phone`, `enrollment_date`, `fitness_level`, `population_class`, `status`, `assigned_trainer_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pamela Magcawas', 'magcawspamela@gmail.com', '09278457598', '2005-06-18', 'Bulacnin Lipa City', 'Myra Magcawas', '09123456789', '2026-06-20', 'Fundamentals', 'General', 'Active', NULL, '2026-06-19 22:02:46', '2026-07-01 07:33:00', NULL),
(2, 'Wyne Magcawas', 'wynemagcawas@gmail.com', '09123456771', '2007-06-11', 'Purok 4, Bulacnin Lipa City', 'Edmundo Magcawas', '09123456881', '2026-06-20', 'Fundamentals', 'General', 'Active', NULL, '2026-06-20 00:26:32', '2026-06-29 07:46:22', '2026-06-29 07:46:22'),
(3, 'Kaila Ramos', 'kailaramos@gmail.com', '09123456788', '2005-06-10', 'Marawoy, Lipa City', 'Danilo Ramos', '09123456786', '2026-06-20', 'Fundamentals', 'General', 'Active', NULL, '2026-06-20 07:05:55', '2026-06-20 07:05:55', NULL),
(4, 'Francis Rosario', 'francisrosario@gmail.com', '09278457555', '2005-10-12', 'Sabang Lipa City', 'Myla Rosario', '09278457444', '2026-06-25', 'Advanced', 'General', 'Active', 1, '2026-06-25 05:42:47', '2026-06-25 05:42:47', NULL),
(5, 'Mila Katigbak', 'milakatigbak@gmail.com', '09278457222', '2003-02-05', 'Malvar Batangas', 'Francisco Katigbak', '09278457413', '2026-06-26', 'Fundamentals', 'General', 'Active', 3, '2026-06-26 00:06:52', '2026-06-29 07:46:06', '2026-06-29 07:46:06'),
(6, 'Juan Dela Cruz', 'juandelacruz@gmail.com', '09178553528', '2000-05-25', 'San Jose Batangas', 'Fernando Dela Cruz', '09074751198', '2026-07-01', 'Fundamentals', 'Special', 'Inactive', 1, '2026-07-01 07:38:07', '2026-07-02 19:12:55', NULL),
(7, 'Aria Sanchez', 'ariasanchez@gmail.com', '09179233520', '1999-09-16', 'Lipa City', 'Lucy Sanchez', '09572162198', '2026-07-02', 'Fundamentals', 'Special', 'Active', 2, '2026-07-01 18:26:34', '2026-07-01 18:26:34', NULL),
(8, 'Nala Cortez', 'nalacortez@gmail.com', '09115243610', '1999-08-05', 'Sabang, Lipa City', 'Rudy Cortez', '09133616211', '2026-07-02', 'Fundamentals', 'General', 'Active', 1, '2026-07-01 18:40:34', '2026-07-01 18:40:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member_health_flags`
--

CREATE TABLE `member_health_flags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `condition` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_packages`
--

CREATE TABLE `member_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `package_type` enum('Single Session','Monthly','3-Month','6-Month','Annual','Student Rate','PWD Rate') NOT NULL,
  `purchase_date` date NOT NULL,
  `coverage_start` date NOT NULL,
  `coverage_end` date NOT NULL,
  `session_credits` int(11) NOT NULL,
  `credits_used` int(11) NOT NULL DEFAULT 0,
  `credits_remaining` int(11) GENERATED ALWAYS AS (`session_credits` - `credits_used`) VIRTUAL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_mode` varchar(255) NOT NULL DEFAULT 'Cash',
  `processed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('Active','Expired') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_packages`
--

INSERT INTO `member_packages` (`id`, `member_id`, `package_type`, `purchase_date`, `coverage_start`, `coverage_end`, `session_credits`, `credits_used`, `amount_paid`, `payment_mode`, `processed_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '3-Month', '2026-06-20', '2026-06-20', '2026-06-30', 1, 0, 2500.00, 'Cash', NULL, 'Expired', '2026-06-19 22:02:46', '2026-07-01 07:06:07'),
(2, 2, 'Single Session', '2026-06-20', '2026-06-20', '2026-06-23', 1, 0, 500.00, 'Cash', NULL, 'Expired', '2026-06-20 00:26:32', '2026-06-20 00:26:32'),
(3, 3, '3-Month', '2026-06-20', '2026-06-20', '2026-09-18', 36, 0, 9000.00, 'Cash', NULL, 'Active', '2026-06-20 07:05:55', '2026-06-20 07:05:55'),
(4, 4, '3-Month', '2026-06-25', '2026-06-25', '2026-09-23', 36, 0, 12000.00, 'Cash', NULL, 'Active', '2026-06-25 05:42:47', '2026-06-25 05:42:47'),
(5, 5, 'Single Session', '2026-06-26', '2026-06-26', '2026-06-27', 1, 0, 12000.00, 'GCash', NULL, 'Expired', '2026-06-26 00:06:52', '2026-07-01 07:06:08'),
(6, 2, '3-Month', '2026-06-26', '2026-06-26', '2026-09-24', 24, 0, 18000.00, 'Cash', NULL, 'Active', '2026-06-26 00:17:15', '2026-06-26 00:17:15'),
(7, 1, 'Monthly', '2026-07-01', '2026-07-01', '2026-07-31', 12, 0, 10500.00, 'Cash', NULL, 'Active', '2026-07-01 07:33:00', '2026-07-01 07:33:00'),
(8, 6, 'Single Session', '2026-07-01', '2026-07-01', '2026-07-02', 1, 0, 2500.00, 'Cash', NULL, 'Expired', '2026-07-01 07:38:08', '2026-07-02 19:12:55'),
(9, 7, 'Single Session', '2026-07-02', '2026-07-02', '2026-07-03', 1, 0, 2500.00, 'Cash', NULL, 'Active', '2026-07-01 18:26:34', '2026-07-01 18:26:34'),
(10, 7, '3-Month', '2026-07-02', '2026-07-02', '2026-09-30', 36, 0, 16500.00, 'Cash', NULL, 'Active', '2026-07-01 18:34:30', '2026-07-01 18:34:30'),
(11, 8, 'Single Session', '2026-07-02', '2026-07-02', '2026-07-03', 1, 0, 2500.00, 'Cash', NULL, 'Expired', '2026-07-01 18:40:34', '2026-07-01 18:41:05'),
(12, 8, 'Monthly', '2026-07-02', '2026-07-02', '2026-08-01', 12, 0, 9800.00, 'Cash', NULL, 'Active', '2026-07-01 18:41:05', '2026-07-01 18:41:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_06_20_000001_create_members_table', 1),
(5, '2026_06_20_000002_create_trainers_table', 2),
(6, '2026_06_25_000001_add_expired_to_members_status_enum', 3),
(7, '2026_06_26_000001_add_status_to_member_packages_table', 4),
(8, '2026_06_26_000002_revert_expired_from_members_status', 5),
(9, '2026_06_26_000001_add_status_to_member_packages', 6),
(10, '2026_06_26_000002_remove_expired_from_members_status', 6);

-- --------------------------------------------------------

--
-- Table structure for table `parq_responses`
--

CREATE TABLE `parq_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `assessment_date` date NOT NULL,
  `has_heart_condition` tinyint(1) NOT NULL DEFAULT 0,
  `has_chest_pain` tinyint(1) NOT NULL DEFAULT 0,
  `has_dizziness` tinyint(1) NOT NULL DEFAULT 0,
  `has_bone_joint_problem` tinyint(1) NOT NULL DEFAULT 0,
  `on_medication` tinyint(1) NOT NULL DEFAULT 0,
  `has_other_condition` tinyint(1) NOT NULL DEFAULT 0,
  `other_condition_details` text DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `assessed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('RJyFkYk47qbJnY3IElP8TXBmFl03nDFc5BazU1v8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36 Edg/149.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0RBUkQyUnVYbTdHUjIxaVR2Q1Y1T01DQ1JidElpT0FqVDdDa3IwRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tZW1iZXJzIjtzOjU6InJvdXRlIjtzOjEzOiJtZW1iZXJzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783051826);

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trainers`
--

INSERT INTO `trainers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Ryan M.', '2026-06-20 06:59:01', '2026-06-20 06:59:01'),
(2, 'Mark D.', '2026-06-20 06:59:01', '2026-06-20 06:59:01'),
(3, 'Sarah L.', '2026-06-20 06:59:01', '2026-06-20 06:59:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_email_unique` (`email`),
  ADD KEY `members_assigned_trainer_id_foreign` (`assigned_trainer_id`);

--
-- Indexes for table `member_health_flags`
--
ALTER TABLE `member_health_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_health_flags_member_id_foreign` (`member_id`);

--
-- Indexes for table `member_packages`
--
ALTER TABLE `member_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_packages_member_id_foreign` (`member_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parq_responses`
--
ALTER TABLE `parq_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parq_responses_member_id_foreign` (`member_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `member_health_flags`
--
ALTER TABLE `member_health_flags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member_packages`
--
ALTER TABLE `member_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `parq_responses`
--
ALTER TABLE `parq_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_assigned_trainer_id_foreign` FOREIGN KEY (`assigned_trainer_id`) REFERENCES `trainers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `member_health_flags`
--
ALTER TABLE `member_health_flags`
  ADD CONSTRAINT `member_health_flags_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `member_packages`
--
ALTER TABLE `member_packages`
  ADD CONSTRAINT `member_packages_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parq_responses`
--
ALTER TABLE `parq_responses`
  ADD CONSTRAINT `parq_responses_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
