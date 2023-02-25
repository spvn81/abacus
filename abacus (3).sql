-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2023 at 02:53 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abacus`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Authenticated', '1', 1674730118),
('Master', '1', 1674729642);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('*', 2, 'Allow Everything', NULL, NULL, 1674729634, 1674729634),
('admin/classes/*', 2, 'Route admin/classes/*', NULL, NULL, 1676478604, 1676478604),
('admin/classes/create', 2, 'Route admin/classes/create', NULL, NULL, 1676478608, 1676478608),
('admin/classes/index', 2, 'Route admin/classes/index', NULL, NULL, 1676478604, 1676478604),
('admin/classes/view', 2, 'Route admin/classes/view', NULL, NULL, 1676745854, 1676745854),
('admin/courses/*', 2, 'Route admin/courses/*', NULL, NULL, 1676746004, 1676746004),
('admin/courses/create', 2, 'Route admin/courses/create', NULL, NULL, 1676746010, 1676746010),
('admin/courses/index', 2, 'Route admin/courses/index', NULL, NULL, 1676746004, 1676746004),
('admin/courses/view', 2, 'Route admin/courses/view', NULL, NULL, 1676749241, 1676749241),
('admin/dashboard/*', 2, 'Route admin/dashboard/*', NULL, NULL, 1674729649, 1674729649),
('admin/dashboard/error', 2, 'Route admin/dashboard/error', NULL, NULL, 1674729649, 1674729649),
('admin/dashboard/index', 2, 'Route admin/dashboard/index', NULL, NULL, 1674729649, 1674729649),
('admin/rbac/permissions/*', 2, 'Route admin/rbac/permissions/*', NULL, NULL, 1674729665, 1674729665),
('admin/rbac/permissions/add-relation', 2, 'Route admin/rbac/permissions/add-relation', NULL, NULL, 1674729665, 1674729665),
('admin/rbac/permissions/create', 2, 'Route admin/rbac/permissions/create', NULL, NULL, 1674729665, 1674729665),
('admin/rbac/permissions/delete', 2, 'Route admin/rbac/permissions/delete', NULL, NULL, 1674729665, 1674729665),
('admin/rbac/permissions/index', 2, 'Route admin/rbac/permissions/index', NULL, NULL, 1674729665, 1674729665),
('admin/rbac/permissions/remove-relation', 2, 'Route admin/rbac/permissions/remove-relation', NULL, NULL, 1674729665, 1674729665),
('admin/rbac/permissions/scan', 2, 'Route admin/rbac/permissions/scan', NULL, NULL, 1674729665, 1674729665),
('admin/rbac/permissions/update', 2, 'Route admin/rbac/permissions/update', NULL, NULL, 1674729665, 1674729665),
('admin/rbac/roles/*', 2, 'Route admin/rbac/roles/*', NULL, NULL, 1674729665, 1674729665),
('admin/rbac/roles/create', 2, 'Route admin/rbac/roles/create', NULL, NULL, 1674729665, 1674729665),
('admin/rbac/roles/delete', 2, 'Route admin/rbac/roles/delete', NULL, NULL, 1674729665, 1674729665),
('admin/rbac/roles/update', 2, 'Route admin/rbac/roles/update', NULL, NULL, 1674729665, 1674729665),
('admin/schools/*', 2, 'Route admin/schools/*', NULL, NULL, 1676478249, 1676478249),
('admin/schools/create', 2, 'Route admin/schools/create', NULL, NULL, 1676478255, 1676478255),
('admin/schools/index', 2, 'Route admin/schools/index', NULL, NULL, 1676478249, 1676478249),
('admin/schools/view', 2, 'Route admin/schools/view', NULL, NULL, 1676478491, 1676478491),
('admin/settings/*', 2, 'Route admin/settings/*', NULL, NULL, 1674729649, 1674729649),
('admin/settings/app', 2, 'Route admin/settings/app', NULL, NULL, 1674729649, 1674729649),
('admin/student-details-stac/*', 2, 'Route admin/student-details-stac/*', NULL, NULL, 1676102883, 1676102883),
('admin/student-details-stac/create', 2, 'Route admin/student-details-stac/create', NULL, NULL, 1676137690, 1676137690),
('admin/student-details-stac/index', 2, 'Route admin/student-details-stac/index', NULL, NULL, 1676102883, 1676102883),
('admin/student-details-stac/upload-student-details', 2, 'Route admin/student-details-stac/upload-student-details', NULL, NULL, 1676104660, 1676104660),
('admin/student-details/*', 2, 'Route admin/student-details/*', NULL, NULL, 1676478653, 1676478653),
('admin/student-details/create', 2, 'Route admin/student-details/create', NULL, NULL, 1676478656, 1676478656),
('admin/student-details/download', 2, 'Route admin/student-details/download', NULL, NULL, 1676753352, 1676753352),
('admin/student-details/get-class', 2, 'Route admin/student-details/get-class', NULL, NULL, 1676746782, 1676746782),
('admin/student-details/index', 2, 'Route admin/student-details/index', NULL, NULL, 1676478653, 1676478653),
('admin/student-details/upload-student-details', 2, 'Route admin/student-details/upload-student-details', NULL, NULL, 1676479027, 1676479027),
('admin/student-details/view', 2, 'Route admin/student-details/view', NULL, NULL, 1676750209, 1676750209),
('admin/users/*', 2, 'Route admin/users/*', NULL, NULL, 1674729649, 1674729649),
('admin/users/create', 2, 'Route admin/users/create', NULL, NULL, 1674729649, 1674729649),
('admin/users/delete', 2, 'Route admin/users/delete', NULL, NULL, 1674729649, 1674729649),
('admin/users/index', 2, 'Route admin/users/index', NULL, NULL, 1674729649, 1674729649),
('admin/users/update', 2, 'Route admin/users/update', NULL, NULL, 1674729649, 1674729649),
('administer', 2, 'Access administration panel.', NULL, NULL, 1674729634, 1674729634),
('Administrator', 1, 'Administrator.', NULL, NULL, 1674729634, 1674729634),
('auth/*', 2, 'Route auth/*', NULL, NULL, 1674729649, 1674729649),
('auth/login', 2, 'Route auth/login', NULL, NULL, 1674729649, 1674729649),
('auth/logout', 2, 'Route auth/logout', NULL, NULL, 1674729649, 1674729649),
('auth/password-request', 2, 'Route auth/password-request', NULL, NULL, 1674729649, 1674729649),
('auth/password-update', 2, 'Route auth/password-update', NULL, NULL, 1674729649, 1674729649),
('auth/register', 2, 'Route auth/register', NULL, NULL, 1674729649, 1674729649),
('Authenticated', 1, 'Authenticated user.', NULL, NULL, 1674729634, 1674729634),
('Guest', 1, 'Usual site visitor.', NULL, NULL, 1674729634, 1674729634),
('Master', 1, 'Has full system access.', NULL, NULL, 1674729634, 1674729634),
('site/*', 2, 'Route site/*', NULL, NULL, 1674729649, 1674729649),
('site/about', 2, 'Route site/about', NULL, NULL, 1674729649, 1674729649),
('site/captcha', 2, 'Route site/captcha', NULL, NULL, 1674729649, 1674729649),
('site/contact', 2, 'Route site/contact', NULL, NULL, 1674729649, 1674729649),
('site/error', 2, 'Route site/error', NULL, NULL, 1674729649, 1674729649),
('site/index', 2, 'Route site/index', NULL, NULL, 1674729649, 1674729649);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('*', 'admin/classes/*'),
('*', 'admin/classes/create'),
('*', 'admin/classes/index'),
('*', 'admin/classes/view'),
('*', 'admin/courses/*'),
('*', 'admin/courses/create'),
('*', 'admin/courses/index'),
('*', 'admin/courses/view'),
('*', 'admin/dashboard/*'),
('*', 'admin/dashboard/error'),
('*', 'admin/dashboard/index'),
('*', 'admin/rbac/permissions/*'),
('*', 'admin/rbac/permissions/add-relation'),
('*', 'admin/rbac/permissions/create'),
('*', 'admin/rbac/permissions/delete'),
('*', 'admin/rbac/permissions/index'),
('*', 'admin/rbac/permissions/remove-relation'),
('*', 'admin/rbac/permissions/scan'),
('*', 'admin/rbac/permissions/update'),
('*', 'admin/rbac/roles/*'),
('*', 'admin/rbac/roles/create'),
('*', 'admin/rbac/roles/delete'),
('*', 'admin/rbac/roles/update'),
('*', 'admin/schools/*'),
('*', 'admin/schools/create'),
('*', 'admin/schools/index'),
('*', 'admin/schools/view'),
('*', 'admin/settings/*'),
('*', 'admin/settings/app'),
('*', 'admin/student-details-stac/*'),
('*', 'admin/student-details-stac/create'),
('*', 'admin/student-details-stac/index'),
('*', 'admin/student-details-stac/upload-student-details'),
('*', 'admin/student-details/*'),
('*', 'admin/student-details/create'),
('*', 'admin/student-details/download'),
('*', 'admin/student-details/get-class'),
('*', 'admin/student-details/index'),
('*', 'admin/student-details/upload-student-details'),
('*', 'admin/student-details/view'),
('*', 'admin/users/*'),
('*', 'admin/users/create'),
('*', 'admin/users/delete'),
('*', 'admin/users/index'),
('*', 'admin/users/update'),
('*', 'administer'),
('*', 'auth/*'),
('*', 'auth/login'),
('*', 'auth/logout'),
('*', 'auth/password-request'),
('*', 'auth/password-update'),
('*', 'auth/register'),
('*', 'site/*'),
('*', 'site/about'),
('*', 'site/captcha'),
('*', 'site/contact'),
('*', 'site/error'),
('*', 'site/index'),
('admin/dashboard/*', 'admin/dashboard/error'),
('admin/dashboard/*', 'admin/dashboard/index'),
('admin/rbac/permissions/*', 'admin/rbac/permissions/add-relation'),
('admin/rbac/permissions/*', 'admin/rbac/permissions/create'),
('admin/rbac/permissions/*', 'admin/rbac/permissions/delete'),
('admin/rbac/permissions/*', 'admin/rbac/permissions/index'),
('admin/rbac/permissions/*', 'admin/rbac/permissions/remove-relation'),
('admin/rbac/permissions/*', 'admin/rbac/permissions/scan'),
('admin/rbac/permissions/*', 'admin/rbac/permissions/update'),
('admin/rbac/roles/*', 'admin/rbac/roles/create'),
('admin/rbac/roles/*', 'admin/rbac/roles/delete'),
('admin/rbac/roles/*', 'admin/rbac/roles/update'),
('admin/settings/*', 'admin/settings/app'),
('admin/users/*', 'admin/users/create'),
('admin/users/*', 'admin/users/delete'),
('admin/users/*', 'admin/users/index'),
('admin/users/*', 'admin/users/update'),
('Administrator', 'administer'),
('auth/*', 'auth/login'),
('auth/*', 'auth/logout'),
('auth/*', 'auth/password-request'),
('auth/*', 'auth/password-update'),
('auth/*', 'auth/register'),
('Master', '*'),
('site/*', 'site/about'),
('site/*', 'site/captcha'),
('site/*', 'site/contact'),
('site/*', 'site/error'),
('site/*', 'site/index');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `school_id`, `class_name`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'class one', 1, '2023-02-19 00:14:14', '2023-02-19 00:14:14', 1, 1),
(2, 1, 'class two', 1, '2023-02-19 00:14:34', '2023-02-19 00:14:34', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `courses_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `courses_name`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'course one', 1, '2023-02-19 01:10:41', '2023-02-19 01:10:41', 1, 1),
(2, 'course two', 1, '2023-02-19 01:10:55', '2023-02-19 01:10:55', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1674729564),
('m130524_201442_create_user_table', 1674729581),
('m140506_102106_rbac_init', 1674729581),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1674729581),
('m170913_142352_create_settings_table', 1674729581),
('m180523_151638_rbac_updates_indexes_without_prefix', 1674729581),
('m200409_110543_rbac_update_mssql_trigger', 1674729581);

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `school_name`, `address`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Naga venkata Sai Pavan Manoj Kumar School', 'aaa', NULL, '2023-02-15 21:58:11', '2023-02-15 21:58:11', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `section_name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `academic_year` varchar(20) NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`id`, `school_id`, `class_id`, `course_id`, `student_name`, `academic_year`, `level`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 1, 1, 'Mannam Mahesh', '2023-24', 'II', 1, '2023-02-19 01:17:59', '2023-02-19 01:17:59', 1, 1),
(2, 1, 1, 1, 'sai pavan', '2023-24', 'II', 1, '2023-02-19 01:17:59', '2023-02-19 01:17:59', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_details_stac`
--

CREATE TABLE `student_details_stac` (
  `id` int(11) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `course` varchar(255) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `academic_year` varchar(20) NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `first_name`, `last_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin@domain.com', '1ZodOHS3SZAZkUHmBsVYJLnUThUlYk26', '$2y$13$bWU3rmNi/l7UGWnTEWlHH.3kZN5/WGYkyy4D2aCfpZaeZ7ieGZRuS', NULL, 'admin@domain.com', 'Hattie', 'Jacobi', 10, 1501889814, 1503957470),
(2, 'vsenger@rutherford.com', 'sHnq6_McSMRTtYAEnStxNAW26NMai3ex', '$2y$13$N0loi6KoKHVbyabKs0XEr.jz7uoZJM6Zgu0NGqRNSl1XqYKNWy1Ci', NULL, 'vsenger@rutherford.com', 'Dorothea', 'Rowe', 10, 1503772620, 1504064939),
(3, 'thompson.warren@padberg.biz', 'BnguNkoiCQf4Zn_GWhM4uFMtHFXz8C8u', '$2y$13$FFnFOZo5PqqZG9dqWYFwo.NyPyEsBu9u39hKHXeqTBmk10q1iZ7ue', NULL, 'thompson.warren@padberg.biz', 'Geovanni', 'Dare', 10, 1500700337, 1501322624),
(4, 'jamil.hessel@lowe.com', '2JAvBW1EwLtxS5PG1uv2B8SKvUuvOH3c', '$2y$13$OwiN7UYPLd1bV/UiyHSGXeCm9RcShpNQnFsqA/g0J481HAuNnGuri', NULL, 'jamil.hessel@lowe.com', 'Pascale', 'Nicolas', 10, 1502901456, 1503000727),
(5, 'lucienne48@rogahn.com', 'zqCBb3UVAYP8N0HpQfFh6r0i6EYBZoFS', '$2y$13$Y2.2.X5LxtrM21jac9lajeIVclP2LGW1ZbIOerIPBrpYyRMWqBDge', NULL, 'lucienne48@rogahn.com', 'Alford', 'Strosin', 10, 1502988716, 1503932799),
(6, 'stanton.fleta@hotmail.com', 'hYu8rkeQGCvH-kMyz7ZQvQb5HEZZYQL9', '$2y$13$i7vOm4utj2vxZr1boEYSBO6usgVEQAr2qVeop6CjslNypl5F8TmrO', NULL, 'stanton.fleta@hotmail.com', 'Antoinette', 'Larson', 10, 1501374035, 1503770129),
(7, 'loren66@yost.com', '2IF1vm_laFwbV1qPoeHy4StMU1lL8oh7', '$2y$13$UVi31EsmIccl7UiVO1E7pOLgC6Bzz5YxlkRaInNsB2TGMLyt0QO2m', NULL, 'loren66@yost.com', 'Shane', 'Veum', 10, 1504408663, 1504501176),
(8, 'adolphus.jast@hotmail.com', 'h96n9Sv9bzn1qR0RarWDcm8XEmWttS3g', '$2y$13$1kZkLt82V.5jDed0cy12K.w/S.3gZlbYK.skKP9LmXrnAXHHaiiKG', NULL, 'adolphus.jast@hotmail.com', 'Marjory', 'O\'Reilly', 10, 1499553449, 1503595580),
(9, 'pwunsch@hotmail.com', 'Hms4zBg7eQlOgJ6ZTVZrBWiCOvHDGcnK', '$2y$13$9GLQMyaTEoxVzQTxMUuay.Vg0x5Q8V4t7bu5T1fkhHgyABQ9hunn6', NULL, 'pwunsch@hotmail.com', 'Lamar', 'Smitham', 10, 1502497456, 1503971827),
(10, 'katelin59@schowalter.com', '4bnJTTawE3pUtNA38SbDkw3kCOFmq-MG', '$2y$13$sRH9yAfaB4uhn8kGn2zBnOsEoYr3MQ31iE6jqJ/5IAw.RhzAOGSou', NULL, 'katelin59@schowalter.com', 'Sally', 'Rempel', 10, 1500400339, 1504563576),
(11, 'elouise.wilkinson@ernser.com', 'DxWY0TW1SIpA6bvrOHPmsiickKi7LCEE', '$2y$13$pXKlbV716QVvbGfBKZPtBuUxkB04aIJBlwrhmmf3t.g1rGHUKA3Nm', NULL, 'elouise.wilkinson@ernser.com', 'Alberta', 'Wiza', 10, 1500532174, 1500604115),
(12, 'zechariah58@hotmail.com', 'tmhA6fghJ8ZQwUKp7AMYyQnC-vMyQbt1', '$2y$13$/PxfAlKzMvQJ/zhkCe/SgebzuKPXpY13Uuu7PybWS9pwqipzRu/kS', NULL, 'zechariah58@hotmail.com', 'Hubert', 'Murray', 10, 1504260853, 1504534296),
(13, 'meda91@yahoo.com', '9hdX_IAt8LAEhGcgh37sdHNap1LtP_aC', '$2y$13$y2k8MP8cf5zDLp8rPba5IOqYYerIDtaB91BqeZuorjpW3GTfgddCe', NULL, 'meda91@yahoo.com', 'Myrtle', 'Howell', 10, 1502944641, 1504557667),
(14, 'wrenner@yahoo.com', 'RfFA61a1H3NtITVJp_pecGQNGCfJF7-b', '$2y$13$gaYuJIRap56GHp1Yg9NjBuknyjz0/z8.zFWYZrTbJLHq9nIIlqXbO', NULL, 'wrenner@yahoo.com', 'Jacques', 'Pouros', 10, 1500064424, 1500677368),
(15, 'kilback.kareem@gmail.com', 'qplzwsSMJvZYkmqjB0o7fJEt3o230ujo', '$2y$13$s9l2P/sWTKC1BITMneaj/um9TsLrAH2j8zDzbMDZ55/FOF6rta.im', NULL, 'kilback.kareem@gmail.com', 'Maeve', 'Corkery', 10, 1500861523, 1503641318),
(16, 'gloria.heaney@yahoo.com', '_7QXlJnBT1xGskOMUwbxINg49AZdkYDP', '$2y$13$m1IpRCyq404PgZbozxDPyuPXc399IZFYEBu/UcPaVw1Z7l8Fsglg6', NULL, 'gloria.heaney@yahoo.com', 'Christine', 'Glover', 10, 1504100658, 1504490455),
(17, 'dicki.ellen@ohara.org', 'y5-t9SkZv0EcMfO9V1-WEUvpWZ4psTkj', '$2y$13$gQYQYG4hjEtJG241ooqcb.Lo19t/G1D88x8ifdWkeGx3miuSe1lJK', NULL, 'dicki.ellen@ohara.org', 'Mohamed', 'Cronin', 10, 1502009057, 1503931074),
(18, 'wthompson@hotmail.com', 'el-Y2X4VHu8qcJr1ayIw8BLD_mKzQ4Ij', '$2y$13$NYkNPluOx90Bj4D9yEKwFehLjItmuuMXmzGpkW8QgVgYIV1Cf1wQG', NULL, 'wthompson@hotmail.com', 'Kayleigh', 'Schimmel', 10, 1499913111, 1503395060),
(19, 'harry52@ward.com', 'qWdgqlFQZUzS9me9KFdEBm2lnCE2d4Vs', '$2y$13$wlYbFw6XJ6.B.zCtZnS7deNuAWg2l0pEQaDUQu7NF4KaR.KdTV2U6', NULL, 'harry52@ward.com', 'Christ', 'Ebert', 10, 1504073742, 1504490349),
(20, 'geovanni.carter@dubuque.net', 'lHHGqJYs3WZ1ftQ2LjVLenYi8LSBT6BJ', '$2y$13$7uWYCUszGDzbf/pBEtFoJejphDYCWo8Oc1b2g9gixUikbhw68rZuy', NULL, 'geovanni.carter@dubuque.net', 'Margaretta', 'Brekke', 10, 1503570376, 1504179475),
(21, 'fabian.oconner@hotmail.com', '7soLOJZ_qeCLseWA7DnfgyKJ8I2PGwdW', '$2y$13$cPyW7pU7G3p/XDBE4/6b3OIbwjrB2BPrLRfCDmLukxo..VrfVUQLG', NULL, 'fabian.oconner@hotmail.com', 'Catherine', 'Cartwright', 10, 1501188752, 1501774347),
(22, 'rmccullough@ebert.com', 'uJ9FbxxlgDZEsWVU4qbc7sgLWkNPg7dX', '$2y$13$oRbXw7XvL.o1ak4fxfDl1.Tx6Xh2RsJOaTjhJx0sQudXFPxSLInmW', NULL, 'rmccullough@ebert.com', 'Adela', 'Luettgen', 10, 1501080570, 1502130728),
(23, 'donnie06@kihn.com', 'RWwbnPAA_YQP62TyCw-Oh9fw7rjHOlGQ', '$2y$13$obtmN7jFRrP2jfCnA7tcge7sGkOrLMnNkUjAtOw6QmT4n/A.46QdG', NULL, 'donnie06@kihn.com', 'Isabelle', 'Hilll', 10, 1502569158, 1503265276),
(24, 'mac83@yahoo.com', 'xAUWFc2Au2qt9-6WTFLlfpz1VfkGTxyg', '$2y$13$V5n5JisbkQYqLIa3a2MLduwS2fv7wYkjUOiVCEiFs42uKRGjVzZtu', NULL, 'mac83@yahoo.com', 'Veronica', 'Hackett', 10, 1499925416, 1500837200),
(25, 'carolanne.rohan@ullrich.net', 'Nds07yxQpQ_TQrsclXSniwPw7vYvQpuv', '$2y$13$stMRiTJTyTkB/H4DtLn0m.CEMMeeF7ocnVPZ3djnfz6RO1HXEvGm.', NULL, 'carolanne.rohan@ullrich.net', 'Tommie', 'Jenkins', 10, 1499609262, 1501010933),
(26, 'aernser@hotmail.com', 'ZsxSDI7bUTQ3X46WCje8OPvO2jE0ovJz', '$2y$13$KqXSDU7ZI5yMjc7WcLDXxOTLVG5yCZTBoi3vABQvzedgnDRGdKuWO', NULL, 'aernser@hotmail.com', 'Michel', 'Welch', 10, 1500372626, 1501409756),
(27, 'okuneva.jaydon@gmail.com', '1j7235arvNLf95GUxhsjguUYHXD9TpWX', '$2y$13$A/yr00Da/v8GZ.B/.AHybe.oh2Q0LefqMXEMJjYbebxRrNkDjvBO2', NULL, 'okuneva.jaydon@gmail.com', 'Judy', 'Beatty', 10, 1500978830, 1501381704),
(28, 'rolando.gleason@hotmail.com', 'Ck7_-Eh2L6K0BCiAjHbXYn0rTiwH4-BV', '$2y$13$HV3v6vXrLZpNEeG.yVoM7uOLGLIo22vuLnifWLx3gnPh354KnWx4i', NULL, 'rolando.gleason@hotmail.com', 'Kelley', 'Brakus', 10, 1499443171, 1504485494),
(29, 'dedric83@glover.org', 'YdITMZyiRlQEHegOpVL2qKOMrCSJXRkt', '$2y$13$REk3hA7Epxzeatyo3MQIPuneYo0N/f0eL3URH30sqWK3j4VpXvGhC', NULL, 'dedric83@glover.org', 'Polly', 'Marquardt', 10, 1499812201, 1500398003),
(30, 'breilly@witting.com', 'WEaRKIE0vST37W7db7-kV54pd_3rPS6z', '$2y$13$sQgh.vSap5trjJ.bhNqtIuS4JsV9sIhUnie5Puk4fBV9bAuw88LKK', NULL, 'breilly@witting.com', 'Wanda', 'Schroeder', 10, 1499998535, 1501601708),
(31, 'lexus82@hotmail.com', 'xoRJxR28MjczJsZlQrtQ5FPecLgxC7ux', '$2y$13$3y7rqGMRKNa8u27TSbqof.FM8qsqWQbHFcchmTqyiIs8NOeE6L5vu', NULL, 'lexus82@hotmail.com', 'Jalyn', 'Spencer', 10, 1503901449, 1503906864),
(32, 'jordan.pfeffer@little.com', 'KITuV8sC28qHJ5Eojt7fyWZqOdV40Bdo', '$2y$13$1Ed49ksA1kpT/reRGNGpa.PFmXIeDAjPSjHpd/tMbxiCkmMjYqxna', NULL, 'jordan.pfeffer@little.com', 'Sim', 'Bins', 10, 1499926729, 1501602604),
(33, 'mueller.magdalena@beier.com', '9_OqTdARvFPU91j0RQEKrSq6CZ6pVq5b', '$2y$13$wq01FIszLgY3d2FhlzpMVeEWeY..qGR2R6ezuSjr9vOSAJxToS.9W', NULL, 'mueller.magdalena@beier.com', 'Eleazar', 'Sanford', 10, 1503290132, 1503537722),
(34, 'mitchell.maurice@quigley.net', 'He4nJ5MHP0v7GKZSvJdJN3aLuA8aSldg', '$2y$13$bU7RxrzcpvKvp0eZ.D.5D.1hg.5YCv28hnpVEr5AY/4MJ05PtckHC', NULL, 'mitchell.maurice@quigley.net', 'Angelita', 'Bashirian', 10, 1499937563, 1502922918),
(35, 'ledner.keaton@stark.com', 'j-NW0tpzNeGUl6nvFbTQbc4gGW44SQmM', '$2y$13$2Xgbh8ME..TYVB7pYV.DMOdlXLv1GFiOdVgUWkq74uNBiPEVHIoj.', NULL, 'ledner.keaton@stark.com', 'Julianne', 'Fisher', 10, 1504340068, 1504592075),
(36, 'tlittel@keeling.com', 'uWWDlXeWI_DY1eYAjg2ATgIC_r6vyuK_', '$2y$13$mBU9MXnwNuxASUUjqd3W8euo4f5Gyam7OKVyyujjWJhtsrD2b7AIK', NULL, 'tlittel@keeling.com', 'Alessandro', 'Douglas', 10, 1500559992, 1501710756),
(37, 'ayana13@gmail.com', 'qolu2-tQyPk_LDn4rU4Nj5oMIyng_PbL', '$2y$13$AcruCghcijrZEX9slRcSI.5ao0m/aKU2zaolh2rLka5YK38Wt7qNi', NULL, 'ayana13@gmail.com', 'Rosella', 'Nikolaus', 10, 1499770006, 1502357353),
(38, 'ckunze@feest.org', '0v3R4lG58xx6xpK6Ckrdt-6bBZp0FfZ7', '$2y$13$0gDbqx8PbAC7E7TKxi2Cr.Bdje9Zi8Br4eyAm2lmT5hWmyIleEY.y', NULL, 'ckunze@feest.org', 'Norval', 'Bernier', 10, 1502443891, 1503898956),
(39, 'claudia.deckow@wiza.com', 'Zy14mvceyVPtysm91buTJUi4kSKCasJr', '$2y$13$Ic2V6TbGZtAmSaFnY63buOIFtf8yoGhOlUqMUPQuXvy7wvb3rgAHW', NULL, 'claudia.deckow@wiza.com', 'Mariana', 'Harris', 10, 1503960236, 1504406229),
(40, 'tomasa81@yahoo.com', 'Gu7KRYOLVfBm9bNEG9y0MTDgLL_nlxzr', '$2y$13$fLYzXxXsYqm6RNaMhS8YL.UJXhtfaK8OAIFFtf6v8i2U29yW2tXgm', NULL, 'tomasa81@yahoo.com', 'Everette', 'Wilkinson', 10, 1503907434, 1504554471),
(41, 'wilma11@hotmail.com', '-pm3cH_QqWBIBQazyX9uFYOcPPmeqbrd', '$2y$13$jsvSv693gGrwgP96PJQi8ezCrdA.bNBwV45gFA8tRqyuO/o4xT7XS', NULL, 'wilma11@hotmail.com', 'Oma', 'Stoltenberg', 10, 1504380714, 1504390950),
(42, 'wade.witting@yahoo.com', 'NKVzKrOfmSiW1cnR7edfzkbLrFCBJf03', '$2y$13$J/im7VjE19SE9kufEny2MuD0EK4.AGv3LFhCmlkmB4T2ynvEiBk8q', NULL, 'wade.witting@yahoo.com', 'Russel', 'Feil', 10, 1500212586, 1501317776),
(43, 'eulah64@pagac.com', '2ASD_bfObat4KEFAQXR_uca3u1og-Mnt', '$2y$13$BCko27CqqiJiDPd0vQFMR.ZhQ.sdkZ7uTKotAVD0sRPLv31Lq617G', NULL, 'eulah64@pagac.com', 'Zane', 'Rosenbaum', 10, 1500231187, 1500891445),
(44, 'deckow.shanon@gmail.com', 'HRgwqjqhTMEDksV2wSloXZYpxK1WXKY4', '$2y$13$lTdwABqnnUgYDlHbnCH6V.ZJmE/.ejNi6GWloy3J2PYTek8nzQIsK', NULL, 'deckow.shanon@gmail.com', 'Jessyca', 'Beatty', 10, 1500600665, 1501506068),
(45, 'maxine13@yahoo.com', '3syEQ-gtDwZy4PYtABpEQ7N2EsjnSCc_', '$2y$13$3uRDbo/Y22ZeDZ.XxxOgF.XYZNtoMrlwKwcEMtV2vAqMyUhe4HJB6', NULL, 'maxine13@yahoo.com', 'Alberta', 'Price', 10, 1500849000, 1502103034),
(46, 'guadalupe.hyatt@gmail.com', 'zIBR6dOiu-h0bF_2U4fv0g3nNXO7k01d', '$2y$13$UVLI5HEzkgZo1TbZ1VmW/OLz/0D28yhyBjPp2i6LGAcOmTAWXopXq', NULL, 'guadalupe.hyatt@gmail.com', 'Breanna', 'Kshlerin', 10, 1502402759, 1502698246),
(47, 'kdurgan@durgan.info', 'wvCm3mMQ2Sh2-DbVReEmsVpAzBrxZUB0', '$2y$13$Mh5UeLxCznks0yXrBcZJq.Jo0gh9E5xwVhcurCjaJ8ZPWY31JTh/m', NULL, 'kdurgan@durgan.info', 'Donnell', 'Becker', 10, 1501200035, 1503479607),
(48, 'whansen@grady.com', 'QY40mkjLr3Tm5sXo4yKf9c_f7mh2gLr0', '$2y$13$uQfRaeZFaZ7fObf.oHGkPulnfucfiwikasQ2cYn0SABIeszB1qpgS', NULL, 'whansen@grady.com', 'Randal', 'Klocko', 10, 1501978597, 1502197827),
(49, 'jasmin.nikolaus@wyman.com', 'Wvzofr4bMsFhia6AFm3MdCAWHBrN4g2k', '$2y$13$5NRtoxpR4bMGlioJrIvQmukpwjQn8jZTbvoVNeyFeG0e0vOtY/XtC', NULL, 'jasmin.nikolaus@wyman.com', 'Dante', 'Price', 10, 1503854968, 1504304834),
(50, 'knicolas@rippin.com', 'yGnE6nGJ1izQl9WzSG0uTc_zAtDm0WRS', '$2y$13$imhKCC31fByn52qPOsKOUu7mKlaPLzKc8C1Cl4Q0WG9DD.rEsR8s.', NULL, 'knicolas@rippin.com', 'Rodolfo', 'Koch', 10, 1503171681, 1504328567);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`section_name`,`key`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `student_details_ibfk_6` (`course_id`);

--
-- Indexes for table `student_details_stac`
--
ALTER TABLE `student_details_stac`
  ADD PRIMARY KEY (`id`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_details`
--
ALTER TABLE `student_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_details_stac`
--
ALTER TABLE `student_details_stac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schools`
--
ALTER TABLE `schools`
  ADD CONSTRAINT `schools_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `schools_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sections_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sections_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_details`
--
ALTER TABLE `student_details`
  ADD CONSTRAINT `student_details_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_details_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_details_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_details_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_details_ibfk_6` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_details_stac`
--
ALTER TABLE `student_details_stac`
  ADD CONSTRAINT `student_details_stac_ibfk_1` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_details_stac_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
