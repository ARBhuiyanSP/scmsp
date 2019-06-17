-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2019 at 10:51 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `complain_asigned`
--

CREATE TABLE `complain_asigned` (
  `id` int(11) NOT NULL,
  `complian_id` int(11) NOT NULL,
  `eng_id` int(11) NOT NULL,
  `asign_date` datetime NOT NULL,
  `current_status` text COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complain_details`
--

CREATE TABLE `complain_details` (
  `id` int(11) NOT NULL,
  `complain_type_id` int(11) NOT NULL,
  `complainer` varchar(100) NOT NULL,
  `complain_details` longtext NOT NULL,
  `issued_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `complain_status` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `complain_details`
--

INSERT INTO `complain_details` (`id`, `complain_type_id`, `complainer`, `complain_details`, `issued_date`, `user_id`, `complain_status`, `created_at`, `updated_at`) VALUES
(1, 7, '01515672889', 'Panel Not Working', '2019-04-15 00:00:00', 1, '2', '2019-05-15 02:05:46', '2019-05-15 23:37:17'),
(2, 6, '01729714503', 'Some LED Not Shine', '2019-05-15 00:00:00', 1, '2', '2019-05-15 23:25:36', '2019-05-19 02:38:22'),
(3, 7, '01515672889', 'Solar Panel Does Not Work', '2019-05-15 00:00:00', 1, '1', '2019-05-27 22:20:03', '2019-05-27 22:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `complain_feedbacks`
--

CREATE TABLE `complain_feedbacks` (
  `id` int(11) NOT NULL,
  `complain_id` int(11) NOT NULL,
  `eng_feedback` longtext NOT NULL,
  `customer_feedback` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `complain_feedbacks`
--

INSERT INTO `complain_feedbacks` (`id`, `complain_id`, `eng_feedback`, `customer_feedback`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 2, 'Solved', 'Well Done', 1, '2019-05-18 23:49:18', '2019-05-19 02:38:06'),
(3, 1, 'Problem Solved', 'Nice Job', 1, '2019-05-19 02:00:32', '2019-05-19 02:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `complain_statuses`
--

CREATE TABLE `complain_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(70) COLLATE utf32_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `complain_statuses`
--

INSERT INTO `complain_statuses` (`id`, `name`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 1, 1, '2019-05-05 04:28:15', '2019-05-14 23:06:41'),
(2, 'Solved', 1, 1, '2019-05-05 04:59:33', '2019-05-05 04:59:49');

-- --------------------------------------------------------

--
-- Table structure for table `complain_types`
--

CREATE TABLE `complain_types` (
  `id` int(11) NOT NULL,
  `name` varchar(70) COLLATE utf32_unicode_ci NOT NULL,
  `dept_id` int(11) NOT NULL,
  `div_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `complain_types`
--

INSERT INTO `complain_types` (`id`, `name`, `dept_id`, `div_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(6, 'LED Problem', 7, 4, 1, 1, '2019-05-24 22:27:51', '2019-05-25 22:03:54'),
(7, 'Service Related Problems', 5, 2, 1, 1, '2019-05-24 22:27:51', '2019-05-24 23:07:07');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Solar', 1, 1, '2019-04-27 00:05:52', '2019-04-27 00:05:52'),
(6, 'Battery', 1, 1, '2019-04-27 00:05:58', '2019-05-04 23:54:49'),
(7, 'LED', 1, 1, '2019-04-27 00:22:29', '2019-04-27 00:22:29');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `dept_id`, `name`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 5, 'Sales', 1, 1, '2019-04-27 23:23:49', '2019-04-27 23:23:49'),
(4, 6, 'Sales', 1, 1, '2019-04-28 00:32:30', '2019-04-28 00:32:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Department', 1, 1, '2019-06-10 22:49:35', '2019-06-10 22:59:52'),
(3, 'Division', 1, 1, '2019-06-11 00:14:01', '2019-06-11 00:14:01'),
(4, 'Complain Type', 1, 1, '2019-06-11 01:57:48', '2019-06-11 01:57:48'),
(5, 'Complain Status', 1, 1, '2019-06-11 01:58:01', '2019-06-11 01:58:01'),
(6, 'Complain details', 1, 1, '2019-06-11 01:58:11', '2019-06-11 01:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `user_type` varchar(100) NOT NULL,
  `isallpermission` tinyint(1) NOT NULL DEFAULT '1',
  `module` varchar(100) NOT NULL,
  `isallmodulepermission` tinyint(1) NOT NULL DEFAULT '1',
  `addaccess` tinyint(1) NOT NULL DEFAULT '1',
  `editaccess` tinyint(1) NOT NULL DEFAULT '1',
  `listaccess` tinyint(1) NOT NULL DEFAULT '1',
  `deleteaccess` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `user_type`, `isallpermission`, `module`, `isallmodulepermission`, `addaccess`, `editaccess`, `listaccess`, `deleteaccess`, `user_id`, `created_at`, `updated_at`) VALUES
(14, 'Admin', 1, 'all', 1, 1, 1, 1, 1, 1, '2019-06-17 02:42:24', '2019-06-17 02:42:24'),
(15, 'Moderator', 0, 'Department', 1, 0, 0, 0, 0, 1, '2019-06-17 02:43:08', '2019-06-17 02:43:08'),
(16, 'Moderator', 0, 'Division', 1, 0, 0, 0, 0, 1, '2019-06-17 02:43:09', '2019-06-17 02:43:09'),
(17, 'Moderator', 0, 'Complain Type', 1, 0, 0, 0, 0, 1, '2019-06-17 02:43:09', '2019-06-17 02:43:09'),
(18, 'Moderator', 0, 'Complain Status', 1, 0, 0, 0, 0, 1, '2019-06-17 02:43:09', '2019-06-17 02:43:09'),
(19, 'Moderator', 0, 'Complain details', 0, 1, 0, 1, 0, 1, '2019-06-17 02:43:09', '2019-06-17 02:43:09');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(70) COLLATE utf32_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, 1, '2019-05-20 22:52:33', '2019-06-10 21:23:34'),
(3, 'Moderator', 1, 1, '2019-06-10 21:23:57', '2019-06-10 21:23:57'),
(4, 'Engineer', 1, 1, '2019-06-10 21:24:11', '2019-06-10 21:24:11');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_type` varchar(100) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` varchar(100) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tanveer Qureshee', 'tanveerqureshee@hotmail.com', NULL, '$2y$10$yzdRh.HNr8RukRLgiuVfoe37Ckjmr1wFdlQi0XHoTrCSLeBjLLYMS', NULL, '2019-03-26 16:36:21', '2019-03-26 16:36:21');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '2019-06-16 22:56:26', '2019-06-16 23:33:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complain_details`
--
ALTER TABLE `complain_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complain_feedbacks`
--
ALTER TABLE `complain_feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complain_statuses`
--
ALTER TABLE `complain_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complain_types`
--
ALTER TABLE `complain_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complain_details`
--
ALTER TABLE `complain_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complain_feedbacks`
--
ALTER TABLE `complain_feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complain_statuses`
--
ALTER TABLE `complain_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complain_types`
--
ALTER TABLE `complain_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
