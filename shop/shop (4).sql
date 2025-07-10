-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2025 at 04:43 AM
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
-- Database: `shop`
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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nama_kategori`, `deskripsi`, `created_at`, `updated_at`) VALUES
(2, 'kue', NULL, '2025-06-29 07:55:12', '2025-06-29 07:55:12'),
(3, 'snack', NULL, '2025-06-29 08:05:46', '2025-06-29 08:05:46');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nama_customer` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `nama_customer`, `alamat`, `no_hp`, `foto`, `created_at`, `updated_at`) VALUES
(3, 7, NULL, NULL, NULL, NULL, '2025-06-29 07:36:16', '2025-06-29 07:36:16'),
(4, 11, NULL, NULL, NULL, NULL, '2025-07-02 06:01:25', '2025-07-02 06:01:25');

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
(4, '2025_07_02_135651_add_midtrans_order_id_to_orders_table', 2),
(5, '2025_07_02_180252_add_timestamps_to_payments_table', 3),
(6, '2025_07_02_181244_modify_status_order_column_on_orders_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mitras`
--

CREATE TABLE `mitras` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nama_mitra` varchar(100) DEFAULT NULL,
  `nama_usaha` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mitras`
--

INSERT INTO `mitras` (`id`, `user_id`, `nama_mitra`, `nama_usaha`, `no_hp`, `alamat`, `foto`, `created_at`, `updated_at`) VALUES
(1, 10, NULL, NULL, NULL, NULL, NULL, '2025-06-29 10:32:49', '2025-06-29 10:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `midtrans_order_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tipe_order` varchar(20) DEFAULT NULL,
  `tanggal_order` date DEFAULT NULL,
  `total_order` decimal(15,2) DEFAULT NULL,
  `status_order` varchar(20) NOT NULL,
  `alamat_kirim` text DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `midtrans_order_id`, `user_id`, `tipe_order`, `tanggal_order`, `total_order`, `status_order`, `alamat_kirim`, `catatan`, `created_at`, `updated_at`) VALUES
(30, 'INV-2GT8I-1751478833', 11, 'customer', '2025-07-02', 24000.00, 'pending', NULL, NULL, '2025-07-02 10:53:53', '2025-07-02 10:53:53'),
(31, 'INV-AERPZ-1751478907', 11, 'customer', '2025-07-02', 36000.00, 'pending', NULL, NULL, '2025-07-02 10:55:07', '2025-07-02 10:55:07'),
(32, 'INV-QPZZN-1751478980', 11, 'customer', '2025-07-02', 12000.00, 'pending', NULL, NULL, '2025-07-02 10:56:20', '2025-07-02 10:56:20'),
(33, 'INV-ARKPG-1751479187', 11, 'customer', '2025-07-02', 24000.00, 'pending', NULL, NULL, '2025-07-02 10:59:47', '2025-07-02 10:59:47'),
(34, 'INV-4I5IS-1751479463', 11, 'customer', '2025-07-02', 36000.00, 'dikirim', NULL, NULL, '2025-07-02 11:04:23', '2025-07-02 11:21:31'),
(35, 'INV-PLMLS-1751480059', 11, 'customer', '2025-07-02', 12000.00, 'dibayar', NULL, NULL, '2025-07-02 11:14:19', '2025-07-02 11:14:59'),
(36, 'INV-RHXJK-1751480802', 11, 'customer', '2025-07-02', 12000.00, 'lunas', NULL, NULL, '2025-07-02 11:26:42', '2025-07-02 11:27:14'),
(37, 'INV-CG2FE-1751480934', 10, 'mitra', '2025-07-02', 12000.00, 'lunas', NULL, NULL, '2025-07-02 11:28:54', '2025-07-02 11:29:19'),
(38, 'INV-O9FTE-1751482066', 11, 'customer', '2025-07-02', 12000.00, 'lunas', NULL, NULL, '2025-07-02 11:47:46', '2025-07-02 11:49:03'),
(39, 'INV-TVMTG-1751485401', 7, 'customer', '2025-07-02', 12000.00, 'lunas', NULL, NULL, '2025-07-02 12:43:21', '2025-07-02 12:43:47'),
(40, 'INV-WAHI3-1751485744', 7, 'customer', '2025-07-02', 12000.00, 'lunas', NULL, NULL, '2025-07-02 12:49:04', '2025-07-02 12:49:46'),
(41, 'INV-3G1Y6-1751509525', 7, 'customer', '2025-07-03', 12000.00, 'pending', NULL, NULL, '2025-07-02 19:25:25', '2025-07-02 19:25:25'),
(42, 'INV-DZYJB-1751509621', 7, 'customer', '2025-07-03', 24000.00, 'pending', 'tes', NULL, '2025-07-02 19:27:01', '2025-07-02 19:27:01'),
(43, 'INV-RHPMU-1751509781', 7, 'customer', '2025-07-03', 24000.00, 'pending', NULL, NULL, '2025-07-02 19:29:41', '2025-07-02 19:29:41'),
(44, 'INV-KKT94-1751509835', 7, 'customer', '2025-07-03', 36000.00, 'pending', NULL, NULL, '2025-07-02 19:30:35', '2025-07-02 19:30:35'),
(45, 'INV-OGQK8-1751510014', 7, 'customer', '2025-07-03', 48000.00, 'pending', NULL, NULL, '2025-07-02 19:33:34', '2025-07-02 19:33:34'),
(46, 'INV-YITBO-1751510129', 7, 'customer', '2025-07-03', 60000.00, 'pending', NULL, NULL, '2025-07-02 19:35:29', '2025-07-02 19:35:29'),
(47, 'INV-E1NS5-1751510198', 7, 'customer', '2025-07-03', 12000.00, 'pending', NULL, NULL, '2025-07-02 19:36:38', '2025-07-02 19:36:38'),
(48, 'INV-P4PYN-1751727288', 7, 'customer', '2025-07-05', 24000.00, 'gagal', NULL, NULL, '2025-07-05 07:54:48', '2025-07-05 08:10:56'),
(49, 'INV-XMXCX-1751727571', 7, 'customer', '2025-07-05', 12000.00, 'gagal', NULL, NULL, '2025-07-05 07:59:31', '2025-07-05 08:15:38'),
(50, 'INV-WRMOO-1751727655', 7, 'customer', '2025-07-05', 12000.00, 'gagal', NULL, NULL, '2025-07-05 08:00:55', '2025-07-05 08:17:02'),
(51, 'INV-T8LET-1751728048', 7, 'customer', '2025-07-05', 12000.00, 'lunas', NULL, NULL, '2025-07-05 08:07:28', '2025-07-05 08:07:59'),
(52, 'INV-VBON7-1751821851', 7, 'customer', '2025-07-06', 24000.00, 'pending', NULL, NULL, '2025-07-06 10:10:51', '2025-07-06 10:10:51'),
(53, 'INV-HYTTU-1751821938', 7, 'customer', '2025-07-06', 24000.00, 'lunas', NULL, NULL, '2025-07-06 10:12:18', '2025-07-06 10:15:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga_jual` decimal(15,2) DEFAULT NULL,
  `subtotal` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `harga_jual`, `subtotal`, `created_at`, `updated_at`) VALUES
(10, 10, 2, 79, NULL, 948000.00, '2025-06-29 12:15:28', '2025-06-29 12:15:28'),
(11, 11, 2, 1, NULL, 12000.00, '2025-06-29 12:18:47', '2025-06-29 12:18:47'),
(12, 12, 2, 2, NULL, 24000.00, '2025-06-29 12:22:44', '2025-06-29 12:22:44'),
(13, 13, 2, 1, NULL, 12000.00, '2025-06-29 22:12:35', '2025-06-29 22:12:35'),
(14, 14, 2, 1, NULL, 12000.00, '2025-06-29 22:16:13', '2025-06-29 22:16:13'),
(15, 15, 2, 1, NULL, 12000.00, '2025-07-02 06:02:00', '2025-07-02 06:02:00'),
(16, 16, 2, 1, NULL, 12000.00, '2025-07-02 06:27:37', '2025-07-02 06:27:37'),
(17, 17, 2, 1, NULL, 12000.00, '2025-07-02 07:24:18', '2025-07-02 07:24:18'),
(18, 18, 2, 1, NULL, 12000.00, '2025-07-02 07:25:11', '2025-07-02 07:25:11'),
(19, 19, 2, 1, NULL, 12000.00, '2025-07-02 07:27:29', '2025-07-02 07:27:29'),
(20, 20, 2, 3, NULL, 36000.00, '2025-07-02 07:35:37', '2025-07-02 07:35:37'),
(21, 21, 2, 1, NULL, 12000.00, '2025-07-02 07:48:28', '2025-07-02 07:48:28'),
(22, 22, 2, 1, NULL, 12000.00, '2025-07-02 07:51:20', '2025-07-02 07:51:20'),
(23, 23, 2, 1, NULL, 12000.00, '2025-07-02 09:40:34', '2025-07-02 09:40:34'),
(24, 24, 2, 1, NULL, 12000.00, '2025-07-02 09:53:07', '2025-07-02 09:53:07'),
(25, 25, 2, 1, NULL, 12000.00, '2025-07-02 10:01:56', '2025-07-02 10:01:56'),
(26, 26, 2, 1, NULL, 12000.00, '2025-07-02 10:07:03', '2025-07-02 10:07:03'),
(27, 27, 2, 1, NULL, 12000.00, '2025-07-02 10:16:08', '2025-07-02 10:16:08'),
(28, 28, 2, 2, NULL, 24000.00, '2025-07-02 10:43:26', '2025-07-02 10:43:26'),
(29, 29, 2, 1, NULL, 12000.00, '2025-07-02 10:53:35', '2025-07-02 10:53:35'),
(30, 30, 2, 2, NULL, 24000.00, '2025-07-02 10:53:53', '2025-07-02 10:53:53'),
(31, 31, 2, 3, NULL, 36000.00, '2025-07-02 10:55:07', '2025-07-02 10:55:07'),
(32, 32, 2, 1, NULL, 12000.00, '2025-07-02 10:56:20', '2025-07-02 10:56:20'),
(33, 33, 2, 2, NULL, 24000.00, '2025-07-02 10:59:47', '2025-07-02 10:59:47'),
(34, 34, 2, 3, NULL, 36000.00, '2025-07-02 11:04:23', '2025-07-02 11:04:23'),
(35, 35, 2, 1, NULL, 12000.00, '2025-07-02 11:14:19', '2025-07-02 11:14:19'),
(36, 36, 2, 1, NULL, 12000.00, '2025-07-02 11:26:42', '2025-07-02 11:26:42'),
(37, 37, 2, 1, NULL, 12000.00, '2025-07-02 11:28:54', '2025-07-02 11:28:54'),
(38, 38, 2, 1, NULL, 12000.00, '2025-07-02 11:47:46', '2025-07-02 11:47:46'),
(39, 39, 2, 1, NULL, 12000.00, '2025-07-02 12:43:21', '2025-07-02 12:43:21'),
(40, 40, 2, 1, NULL, 12000.00, '2025-07-02 12:49:04', '2025-07-02 12:49:04'),
(41, 41, 2, 1, NULL, 12000.00, '2025-07-02 19:25:25', '2025-07-02 19:25:25'),
(42, 42, 2, 2, NULL, 24000.00, '2025-07-02 19:27:01', '2025-07-02 19:27:01'),
(43, 43, 2, 2, NULL, 24000.00, '2025-07-02 19:29:41', '2025-07-02 19:29:41'),
(44, 44, 2, 3, NULL, 36000.00, '2025-07-02 19:30:35', '2025-07-02 19:30:35'),
(45, 45, 2, 4, NULL, 48000.00, '2025-07-02 19:33:34', '2025-07-02 19:33:34'),
(46, 46, 2, 5, NULL, 60000.00, '2025-07-02 19:35:29', '2025-07-02 19:35:29'),
(47, 47, 2, 1, NULL, 12000.00, '2025-07-02 19:36:38', '2025-07-02 19:36:38'),
(48, 48, 2, 2, NULL, 24000.00, '2025-07-05 07:54:48', '2025-07-05 07:54:48'),
(49, 49, 2, 1, NULL, 12000.00, '2025-07-05 07:59:31', '2025-07-05 07:59:31'),
(50, 50, 2, 1, NULL, 12000.00, '2025-07-05 08:00:56', '2025-07-05 08:00:56'),
(51, 51, 2, 1, NULL, 12000.00, '2025-07-05 08:07:28', '2025-07-05 08:07:28'),
(52, 52, 13, 2, NULL, 24000.00, '2025-07-06 10:10:51', '2025-07-06 10:10:51'),
(53, 53, 13, 2, NULL, 24000.00, '2025-07-06 10:12:18', '2025-07-06 10:12:18');

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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `midtrans_order_id` varchar(100) DEFAULT NULL,
  `metode_bayar` varchar(50) DEFAULT NULL,
  `jumlah_bayar` decimal(15,2) DEFAULT NULL,
  `status_bayar` enum('pending','success','failed','expired') DEFAULT NULL,
  `waktu_bayar` datetime DEFAULT NULL,
  `payload_midtrans` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `midtrans_order_id`, `metode_bayar`, `jumlah_bayar`, `status_bayar`, `waktu_bayar`, `payload_midtrans`, `created_at`, `updated_at`) VALUES
(1, 34, 'INV-4I5IS-1751479463', 'midtrans', 36000.00, 'success', '2025-07-02 18:16:20', NULL, '2025-07-02 11:04:24', '2025-07-02 11:16:20'),
(2, 35, 'INV-PLMLS-1751480059', 'midtrans', 12000.00, 'success', '2025-07-02 18:14:59', NULL, '2025-07-02 11:14:19', '2025-07-02 11:14:59'),
(3, 36, 'INV-RHXJK-1751480802', 'midtrans', 12000.00, 'success', '2025-07-02 18:27:14', NULL, '2025-07-02 11:26:43', '2025-07-02 11:27:14'),
(4, 37, 'INV-CG2FE-1751480934', 'midtrans', 12000.00, 'success', '2025-07-02 18:29:19', NULL, '2025-07-02 11:28:54', '2025-07-02 11:29:19'),
(5, 38, 'INV-O9FTE-1751482066', 'midtrans', 12000.00, 'success', '2025-07-02 18:49:03', NULL, '2025-07-02 11:47:48', '2025-07-02 11:49:03'),
(6, 39, 'INV-TVMTG-1751485401', 'midtrans', 12000.00, 'success', '2025-07-02 19:43:47', '{\"va_numbers\":[{\"va_number\":\"9887504808669961\",\"bank\":\"bni\"}],\"transaction_time\":\"2025-07-03 02:41:42\",\"transaction_status\":\"settlement\",\"transaction_id\":\"30ec8b87-cc35-4e3b-b593-898d0c1f7c72\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"200\",\"signature_key\":\"a543d63c59aef091a203487936dd5ce1f4399ac204c56e3ee9984cf5c95515fb3f0e45363d87d8e93e5e7b250fb339991f9f24776ff4ae27fb0f003871dd69b1\",\"settlement_time\":\"2025-07-03 02:41:53\",\"payment_type\":\"bank_transfer\",\"payment_amounts\":[{\"paid_at\":\"2025-07-03 02:41:53\",\"amount\":\"12000.00\"}],\"order_id\":\"INV-TVMTG-1751485401\",\"merchant_id\":\"G196875048\",\"gross_amount\":\"12000.00\",\"fraud_status\":\"accept\",\"expiry_time\":\"2025-07-04 02:41:42\",\"currency\":\"IDR\"}', '2025-07-02 12:43:22', '2025-07-02 12:43:47'),
(7, 40, 'INV-WAHI3-1751485744', 'midtrans', 12000.00, 'success', '2025-07-02 19:49:46', '{\"va_numbers\":[{\"va_number\":\"9887504835870830\",\"bank\":\"bni\"}],\"transaction_time\":\"2025-07-03 02:47:24\",\"transaction_status\":\"settlement\",\"transaction_id\":\"249fbb02-44f1-4911-8945-4c55bd922eb5\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"200\",\"signature_key\":\"ac257ef82d396514911248d2eb7bb44f2aad9fa75b2bcc6ba0b48c1dcda95f619295e18ddf5a5d61a59ab51b38ef247e9c259dd2ea5c21e4afbb996faeebf8fa\",\"settlement_time\":\"2025-07-03 02:47:53\",\"payment_type\":\"bank_transfer\",\"payment_amounts\":[{\"paid_at\":\"2025-07-03 02:47:53\",\"amount\":\"12000.00\"}],\"order_id\":\"INV-WAHI3-1751485744\",\"merchant_id\":\"G196875048\",\"gross_amount\":\"12000.00\",\"fraud_status\":\"accept\",\"expiry_time\":\"2025-07-04 02:47:24\",\"currency\":\"IDR\"}', '2025-07-02 12:49:04', '2025-07-02 12:49:46'),
(8, 46, 'INV-YITBO-1751510129', 'midtrans', 60000.00, 'pending', NULL, NULL, '2025-07-02 19:35:29', '2025-07-02 19:35:29'),
(9, 47, 'INV-E1NS5-1751510198', 'midtrans', 12000.00, 'pending', NULL, NULL, '2025-07-02 19:36:39', '2025-07-02 19:36:39'),
(10, 48, 'INV-P4PYN-1751727288', 'midtrans', 24000.00, 'success', '2025-07-05 14:58:25', '{\"transaction_type\":\"off-us\",\"transaction_time\":\"2025-07-05 21:54:56\",\"transaction_status\":\"pending\",\"transaction_id\":\"63b380a8-9f2e-4617-9682-6088e566b4e0\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"201\",\"signature_key\":\"ceeb0011b4066527e632e609037a46e04f7e80432d78d1fed90b62ccd1ee2e7fb57020da01ec5b5c21c6b2d416ffa037dd87e6bb3770e917d63d00fe7aa3d7a0\",\"payment_type\":\"qris\",\"order_id\":\"INV-P4PYN-1751727288\",\"merchant_id\":\"G183340321\",\"gross_amount\":\"24000.00\",\"fraud_status\":\"accept\",\"expiry_time\":\"2025-07-05 22:09:56\",\"currency\":\"IDR\"}', '2025-07-05 07:54:49', '2025-07-05 07:58:25'),
(11, 49, 'INV-XMXCX-1751727571', 'midtrans', 12000.00, 'pending', NULL, '{\"transaction_type\":\"off-us\",\"transaction_time\":\"2025-07-05 21:59:40\",\"transaction_status\":\"pending\",\"transaction_id\":\"bf6d2af0-85ed-4481-95ef-8cd42db0e0f5\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"201\",\"signature_key\":\"593c4bca4e3dc49d8ace959a0230bcacafa7b630cb664fc689027c08c3758025202e2bb011933885a0d4da425bec0146892a6f9f454c94d4c68ac2e6da1f20f2\",\"payment_type\":\"qris\",\"order_id\":\"INV-XMXCX-1751727571\",\"merchant_id\":\"G183340321\",\"gross_amount\":\"12000.00\",\"fraud_status\":\"accept\",\"expiry_time\":\"2025-07-05 22:14:40\",\"currency\":\"IDR\"}', '2025-07-05 07:59:31', '2025-07-05 07:59:38'),
(12, 50, 'INV-WRMOO-1751727655', 'midtrans', 12000.00, 'pending', NULL, '{\"transaction_type\":\"off-us\",\"transaction_time\":\"2025-07-05 22:01:04\",\"transaction_status\":\"pending\",\"transaction_id\":\"84e85e56-a42e-442f-8d58-67a5d4133f28\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"201\",\"signature_key\":\"44b1a810e05bff47f0ed24a4327eb47a4fb18307c3fb2d704b42750ca654bf88270bd6d589381e6c83ec9712e146d433a6ec55926dd8537ed7b9ab37a114c30d\",\"payment_type\":\"qris\",\"order_id\":\"INV-WRMOO-1751727655\",\"merchant_id\":\"G183340321\",\"gross_amount\":\"12000.00\",\"fraud_status\":\"accept\",\"expiry_time\":\"2025-07-05 22:16:04\",\"currency\":\"IDR\"}', '2025-07-05 08:00:56', '2025-07-05 08:01:02'),
(13, 51, 'INV-T8LET-1751728048', 'midtrans', 12000.00, 'success', '2025-07-05 15:07:59', '{\"transaction_time\":\"2025-07-05 22:07:40\",\"transaction_status\":\"settlement\",\"transaction_id\":\"11588395-524b-4aca-b746-11274912d2f4\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"200\",\"signature_key\":\"c9ceef084e0b93c03c017f42ffd5e28871281a13e5500ecb6417fe28d1055d9d4a62f3271113a7bfa2267ea9e44f609170e2e0c6089c4801e81f3c1b6a0c5985\",\"settlement_time\":\"2025-07-05 22:08:01\",\"payment_type\":\"echannel\",\"order_id\":\"INV-T8LET-1751728048\",\"merchant_id\":\"G183340321\",\"gross_amount\":\"12000.00\",\"fraud_status\":\"accept\",\"expiry_time\":\"2025-07-06 22:07:40\",\"currency\":\"IDR\",\"biller_code\":\"70012\",\"bill_key\":\"135501391706\"}', '2025-07-05 08:07:29', '2025-07-05 08:07:59'),
(14, 52, 'INV-VBON7-1751821851', 'midtrans', 24000.00, 'pending', NULL, NULL, '2025-07-06 10:10:52', '2025-07-06 10:10:52'),
(15, 53, 'INV-HYTTU-1751821938', 'midtrans', 24000.00, 'success', '2025-07-06 17:15:16', '{\"va_numbers\":[{\"va_number\":\"40321019619124524853258\",\"bank\":\"bca\"}],\"transaction_time\":\"2025-07-07 00:14:28\",\"transaction_status\":\"settlement\",\"transaction_id\":\"353abbbc-c08a-436e-a399-a7b881a919f5\",\"status_message\":\"midtrans payment notification\",\"status_code\":\"200\",\"signature_key\":\"371154a29b02c8e4f82d26915123904ff686400f4ba1e2e9a77a55bb4bffd784fe678af69b26f6a73356deeeaaa5feb459b6618a50447b4b729104d564991011\",\"settlement_time\":\"2025-07-07 00:15:19\",\"payment_type\":\"bank_transfer\",\"payment_amounts\":[],\"order_id\":\"INV-HYTTU-1751821938\",\"merchant_id\":\"G183340321\",\"gross_amount\":\"24000.00\",\"fraud_status\":\"accept\",\"expiry_time\":\"2025-07-08 00:14:28\",\"currency\":\"IDR\"}', '2025-07-06 10:12:18', '2025-07-06 10:15:16');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `kode_produk` varchar(50) DEFAULT NULL,
  `nama_produk` varchar(100) DEFAULT NULL,
  `harga_beli` decimal(15,2) DEFAULT NULL,
  `harga_jual` decimal(15,2) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `supplier_id`, `category_id`, `kode_produk`, `nama_produk`, `harga_beli`, `harga_jual`, `stok`, `deskripsi`, `created_at`, `updated_at`) VALUES
(13, 8, 3, NULL, 'kripik kentang', NULL, 12000.00, 11, 'tes', '2025-07-05 11:34:48', '2025-07-05 11:35:42'),
(14, 8, 3, NULL, 'sale', NULL, 13000.00, NULL, 'tes', '2025-07-05 11:35:12', '2025-07-05 11:35:12'),
(15, 8, 3, NULL, 'kuping gajah', NULL, 9000.00, NULL, 'tes', '2025-07-05 11:45:37', '2025-07-05 11:45:37'),
(16, 8, 3, NULL, 'makaroni', NULL, 8000.00, NULL, 'tes', '2025-07-05 11:53:08', '2025-07-05 11:53:08');

-- --------------------------------------------------------

--
-- Table structure for table `product_clones`
--

CREATE TABLE `product_clones` (
  `id` int(11) NOT NULL,
  `original_product_id` int(11) DEFAULT NULL,
  `cloned_product_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `urutan` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `file_path`, `is_default`, `urutan`, `created_at`, `updated_at`) VALUES
(3, 16, 'product_images/vTwvO1LRA6fnolQ8t141mMB0sbK6JJhPwRpLofRM.png', 0, 0, '2025-07-05 11:53:09', '2025-07-05 11:53:09'),
(4, 16, 'product_images/Asfwm8prZaWAs4QyCe7gTHhbkFTTj7cIDQ5nMOyr.png', 0, 0, '2025-07-05 11:53:09', '2025-07-05 11:53:09');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `tanggal_beli` date DEFAULT NULL,
  `total_beli` decimal(15,2) DEFAULT NULL,
  `status_bayar` enum('lunas','belum') DEFAULT NULL,
  `bukti_bayar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `supplier_id`, `tanggal_beli`, `total_beli`, `status_bayar`, `bukti_bayar`, `created_at`, `updated_at`) VALUES
(1, 8, NULL, NULL, NULL, NULL, '2025-07-05 10:43:40', '2025-07-05 10:43:40'),
(2, 8, NULL, NULL, NULL, NULL, '2025-07-05 10:46:14', '2025-07-05 10:46:14'),
(3, 8, NULL, NULL, NULL, NULL, '2025-07-05 10:47:56', '2025-07-05 10:47:56'),
(4, 8, NULL, NULL, NULL, NULL, '2025-07-05 10:50:00', '2025-07-05 10:50:00'),
(5, 8, NULL, NULL, NULL, NULL, '2025-07-05 10:54:32', '2025-07-05 10:54:32'),
(6, 8, NULL, NULL, NULL, NULL, '2025-07-05 10:57:10', '2025-07-05 10:57:10'),
(7, 8, NULL, NULL, NULL, NULL, '2025-07-05 10:58:01', '2025-07-05 10:58:01'),
(8, 8, NULL, NULL, NULL, NULL, '2025-07-05 11:06:37', '2025-07-05 11:06:37'),
(9, 8, NULL, NULL, NULL, NULL, '2025-07-05 11:27:04', '2025-07-05 11:27:04'),
(10, 8, NULL, NULL, NULL, NULL, '2025-07-05 11:31:33', '2025-07-05 11:31:33'),
(11, 8, NULL, NULL, NULL, NULL, '2025-07-05 11:33:25', '2025-07-05 11:33:25'),
(12, 8, NULL, NULL, NULL, NULL, '2025-07-05 11:33:41', '2025-07-05 11:33:41'),
(13, 8, NULL, NULL, NULL, NULL, '2025-07-05 11:33:46', '2025-07-05 11:33:46'),
(14, 8, NULL, NULL, NULL, NULL, '2025-07-05 11:35:31', '2025-07-05 11:35:31'),
(15, 8, NULL, NULL, NULL, NULL, '2025-07-05 11:35:42', '2025-07-05 11:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga_satuan` decimal(15,2) DEFAULT NULL,
  `subtotal` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `purchase_id`, `product_id`, `qty`, `harga_satuan`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 1, NULL, 0.00, '2025-07-05 10:46:14', '2025-07-05 10:46:14'),
(2, 3, 3, 1, NULL, 0.00, '2025-07-05 10:47:56', '2025-07-05 10:47:56'),
(3, 4, 3, 1, NULL, 0.00, '2025-07-05 10:50:00', '2025-07-05 10:50:00'),
(4, 5, 3, 1, NULL, 0.00, '2025-07-05 10:54:32', '2025-07-05 10:54:32'),
(5, 6, 3, 1, NULL, 0.00, '2025-07-05 10:57:10', '2025-07-05 10:57:10'),
(6, 7, 3, 12, NULL, 0.00, '2025-07-05 10:58:01', '2025-07-05 10:58:01'),
(7, 8, 3, 1, NULL, 0.00, '2025-07-05 11:06:37', '2025-07-05 11:06:37'),
(8, 9, 3, 1, NULL, 0.00, '2025-07-05 11:27:04', '2025-07-05 11:27:04'),
(9, 10, 3, 1, NULL, 0.00, '2025-07-05 11:31:33', '2025-07-05 11:31:33'),
(10, 11, 12, 1, NULL, 0.00, '2025-07-05 11:33:25', '2025-07-05 11:33:25'),
(11, 12, 3, 1, NULL, 0.00, '2025-07-05 11:33:41', '2025-07-05 11:33:41'),
(12, 13, 3, 10, NULL, 0.00, '2025-07-05 11:33:46', '2025-07-05 11:33:46'),
(13, 14, 13, 1, NULL, 0.00, '2025-07-05 11:35:31', '2025-07-05 11:35:31'),
(14, 15, 13, 10, NULL, 0.00, '2025-07-05 11:35:42', '2025-07-05 11:35:42');

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
('2z2hW38FpiJxBW3dPLnQUKNO3jwHHAtFcKxJCEET', NULL, '127.0.0.1', 'Veritrans', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRzBiS1doVFlOWFNCREtEUmlmTFRDSUNScmZGN1lJcVBMZFVoRERLViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751822066),
('88DnjHo0oigYG9cyZHHIREfoJ5axMvAmqBMsWmxj', 7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoib2hUS2hjOGlJRU5qT05sT3VkZzQ2VkpXbG9DOVVrb2NWV01aeDNPYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly85Y2VhLTExMS05Mi0xNjUtMTAxLm5ncm9rLWZyZWUuYXBwL215b3JkZXJzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Nzt9', 1751822145),
('kLABr0VYJSkIv2rYleefbHAblKkAe7aSLe2LlzLy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFFyV3ZLVjdTbmNuU3NvM2I2clhuVG1iajdkTjJROVREeFhoOTFUVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8/a2F0ZWdvcmk9MyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751854706),
('njBp8H1ZKxXqtqJKmb7yWpNKAEPaJ40gI2YBB5sM', NULL, '127.0.0.1', 'WhatsApp/2.2526.2 W', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakZmRlpPQThyOHdPMHEwNktFdXR5YXNXekZNOXpOS3RVT1BXN2hvTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly85Y2VhLTExMS05Mi0xNjUtMTAxLm5ncm9rLWZyZWUuYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751821792),
('vF2sY6YHsuzBt1tTXkRidaGmCYh3wB0CwHLoSnpX', NULL, '127.0.0.1', 'Veritrans', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVHo2NGU0aDhLbnhRTDZsVnljTU94NXYyaWtjVUFCYlluMEZuYUZseSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751822116),
('wXH4oqySbsVDfHohbnQTs36irAzL9eurd78dHi7s', 7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNEVBT1ZNVEFyYmtxenZiMXhyQm5IS1V5YXcwYjF2RkNOTVhlcFo2ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly85Y2VhLTExMS05Mi0xNjUtMTAxLm5ncm9rLWZyZWUuYXBwL215b3JkZXJzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Nzt9', 1751821858);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nama_supplier` varchar(100) DEFAULT NULL,
  `perusahaan` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `role` enum('admin','supplier','mitra','customer') DEFAULT 'customer',
  `is_active` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `is_active`, `created_at`, `updated_at`) VALUES
(5, 'Admin', 'admin@gmail.com', NULL, '$2y$12$04fFvSWvArfrKBFBqJkns.CoUgn0oRJfw4tQjOK9Me9li3qoS9eb2', NULL, 'admin', 1, '2025-06-29 07:21:16', '2025-06-29 07:21:16'),
(7, 'Customer', 'customer@gmail.com', NULL, '$2y$12$rCWWMIzXpTomlvQBat0A5OKFx.6rXWS.mWVzn3EXlEl.IBewyXBLy', NULL, 'customer', 1, '2025-06-29 07:36:16', '2025-06-29 07:36:16'),
(8, 'Supplier', 'supplier@gmail.com', NULL, '$2y$12$VNBKyLMH/ZcRM9J4FAYvJuLRKxSR/GG8/.Xgwtd2t847uqDx6re1G', NULL, 'supplier', 1, '2025-06-29 07:36:40', '2025-06-29 08:59:28'),
(10, 'Mitra', 'mitra@gmail.com', NULL, '$2y$12$k.qN0a9n5aZr89M6xQ65pu3h1Bq5sGaiacP8x/BuWhrvoAXOTXmwa', NULL, 'mitra', 1, '2025-06-29 10:32:49', '2025-06-29 10:33:27'),
(11, 'Joko Susilo', 'joko@gmail.com', NULL, '$2y$12$zAlgD4/lC8Smxs4ZghU1J.MG4vogrwtgvhEN.foYgbsa32Y6Zztie', NULL, 'customer', 1, '2025-07-02 06:01:24', '2025-07-02 06:01:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mitras`
--
ALTER TABLE `mitras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_clones`
--
ALTER TABLE `product_clones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mitras`
--
ALTER TABLE `mitras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_clones`
--
ALTER TABLE `product_clones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
