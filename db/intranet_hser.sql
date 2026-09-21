-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2026 at 10:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intranet_hser`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `module` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`id`, `user_email`, `user_name`, `role`, `action`, `module`, `description`, `ip_address`, `created_at`) VALUES
(1, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Admin kepada: mary_annie@moh.gov.my (modul: borang, berita, slideshow, bilik)', '10.168.90.215', '2026-08-14 07:38:30'),
(2, 'mary_annie@moh.gov.my', 'PUAN MARY ANNIE ANAK BANGAU (HSERIAN)', 'admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.211', '2026-08-14 07:39:26'),
(3, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-08-14 07:57:30'),
(4, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-08-14 08:35:32'),
(5, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-08-14 08:35:45'),
(6, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan diluluskan: TEST AJAK', '10.168.90.215', '2026-08-14 08:42:09'),
(7, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan diluluskan: TEST AJAK', '10.168.90.215', '2026-08-14 08:42:12'),
(8, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan diluluskan: TEST AJAK', '10.168.90.215', '2026-08-14 08:42:16'),
(9, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan diluluskan: TEST AJAK', '10.168.90.215', '2026-08-14 08:42:19'),
(10, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan diluluskan: TEST AJAK', '10.168.90.215', '2026-08-14 08:42:22'),
(11, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan diluluskan: TEST AJAK', '10.168.90.215', '2026-08-14 08:42:25'),
(12, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan diluluskan: TEST AJAK', '10.168.90.215', '2026-08-14 08:42:28'),
(13, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan diluluskan: TEST AJAK', '10.168.90.215', '2026-08-14 08:42:32'),
(14, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.215', '2026-08-14 08:43:46'),
(15, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'notifikasi', 'Menghantar notifikasi emel \"🎉 Portal Intranet Hospital Serian Akan Dilancarkan Tidak Lama Lagi!\" kepada 151 staf', '::1', '2026-08-14 08:58:46'),
(16, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.119', '2026-08-17 00:33:26'),
(17, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.119', '2026-08-17 02:03:52'),
(18, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-08-17 06:25:03'),
(19, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'create', 'staff', 'Menambah staf: UJIAN AUTO BIL', '::1', '2026-08-17 06:25:04'),
(20, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-08-17 06:25:14'),
(21, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'delete', 'staff', 'Memadam staf: UJIAN AUTO BIL', '::1', '2026-08-17 06:25:14'),
(22, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'staff', 'Menambah staf: THZEN YEN YEN', '10.168.89.119', '2026-08-17 06:39:11'),
(23, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'staff', 'Menambah staf: MAC ALLISTER ANAK PHILIP', '10.168.89.119', '2026-08-17 06:41:25'),
(24, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'staff', 'Menambah staf: GERTRUDE ANAK JURAM', '10.168.89.119', '2026-08-17 06:44:30'),
(25, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'staff', 'Menambah staf: SILVIA ANAK TOKOP', '10.168.89.119', '2026-08-17 06:48:55'),
(26, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'staff', 'Menambah staf: HELLY ROZANE ANAK MICKA', '10.168.89.119', '2026-08-17 06:51:59'),
(27, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'staff', 'Menambah staf: JUZIMAH BINTI JUBLEE', '10.168.89.119', '2026-08-17 06:55:30'),
(28, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.119', '2026-08-17 07:45:42'),
(29, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan ditolak: ME CME', '10.168.89.119', '2026-08-17 07:48:58'),
(30, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan ditolak: ME CME', '10.168.89.119', '2026-08-17 07:49:02'),
(31, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan ditolak: ME CME', '10.168.89.119', '2026-08-17 07:49:06'),
(32, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan ditolak: ME CME', '10.168.89.119', '2026-08-17 07:49:09'),
(33, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan ditolak: ME CME', '10.168.89.119', '2026-08-17 07:49:13'),
(34, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan ditolak: ME CME', '10.168.89.119', '2026-08-17 07:49:18'),
(35, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan ditolak: ME CME', '10.168.89.119', '2026-08-17 07:49:22'),
(36, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan diluluskan: ME CME', '10.168.89.119', '2026-08-17 07:54:42'),
(37, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan ditolak: ME CME', '10.168.89.119', '2026-08-17 07:55:04'),
(38, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'tempahan', 'Memadam tempahan: ME CME', '10.168.89.119', '2026-08-17 07:55:29'),
(39, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'tempahan', 'Memadam tempahan: ME CME', '10.168.89.119', '2026-08-17 07:55:31'),
(40, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-08-17 07:58:06'),
(41, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.119', '2026-08-17 08:01:39'),
(42, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.119', '2026-08-17 08:04:18'),
(43, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan ditolak: ELSIE', '10.168.89.119', '2026-08-17 08:04:42'),
(44, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan diluluskan: ELSIE', '10.168.89.119', '2026-08-17 08:05:28'),
(45, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'tempahan', 'Memadam tempahan: ELSIE', '10.168.89.119', '2026-08-17 08:05:53'),
(46, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-08-17 08:08:05'),
(47, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.119', '2026-08-19 01:16:17'),
(48, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.202', '2026-08-19 01:17:43'),
(49, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-08-19 07:00:13'),
(50, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'create', 'notifikasi', 'Menghantar notifikasi emel \"Ujian Pemilihan Penerima\" kepada 1 staf', '::1', '2026-08-19 07:00:17'),
(51, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-08-19 07:05:21'),
(52, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'create', 'staff', 'Menambah staf: ELVIN HARRIZON BIN M BENLY RYXLER', '::1', '2026-08-19 07:05:21'),
(53, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-08-19 07:14:21'),
(54, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'create', 'staff', 'Menambah staf: PRESCILIA ELSIE ANAK HONCHIN', '::1', '2026-08-19 07:14:21'),
(55, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'notifikasi', 'Menghantar notifikasi emel \"Tahniah\" kepada 1 staf', '10.168.89.119', '2026-08-19 07:16:07'),
(56, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'notifikasi', 'Menghantar notifikasi emel \"test\" kepada 1 staf', '10.168.89.119', '2026-08-19 07:17:54'),
(57, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.215', '2026-08-19 07:24:21'),
(58, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'notifikasi', 'Menghantar notifikasi emel \"TEST\" kepada 1 staf', '10.168.90.215', '2026-08-19 07:25:29'),
(59, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.215', '2026-08-20 04:28:30'),
(60, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-08-20 13:12:29'),
(61, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.91.23', '2026-09-01 08:09:49'),
(62, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.91.112', '2026-09-01 08:14:04'),
(63, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.91.112', '2026-09-01 08:46:26'),
(64, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-01 08:52:35'),
(65, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-01 08:53:21'),
(66, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-01 08:54:20'),
(67, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-02 03:13:17'),
(68, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-02 03:13:31'),
(69, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-02 03:13:58'),
(70, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'create', 'galeri', 'Menambah gambar galeri: Ujian Galeri', '::1', '2026-09-02 03:13:58'),
(71, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-02 03:14:13'),
(72, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'update', 'galeri', 'Mengemaskini gambar galeri ID 1', '::1', '2026-09-02 03:14:13'),
(73, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-02 03:14:24'),
(74, 'elvinharrizon@moh.gov.my', '', 'super_admin', 'delete', 'galeri', 'Memadam gambar galeri: Ujian Galeri (Dikemaskini)', '::1', '2026-09-02 03:14:24'),
(75, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-02 04:32:20'),
(76, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'galeri', 'Menambah gambar galeri: test', '::1', '2026-09-02 04:32:42'),
(77, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'galeri', 'Menyembunyikan gambar galeri ID 2', '::1', '2026-09-02 05:13:51'),
(78, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'galeri', 'Memaparkan gambar galeri ID 2', '::1', '2026-09-02 05:13:52'),
(79, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'galeri', 'Memadam gambar galeri: test', '::1', '2026-09-02 05:14:17'),
(80, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'galeri', 'Menambah gambar galeri: test', '::1', '2026-09-02 05:14:31'),
(81, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'galeri', 'Menambah gambar galeri: test', '::1', '2026-09-02 05:14:47'),
(82, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'galeri', 'Mengemaskini gambar galeri ID 3', '::1', '2026-09-02 06:22:03'),
(83, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'galeri', 'Menyembunyikan gambar galeri ID 4', '::1', '2026-09-02 06:22:04'),
(84, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'galeri', 'Memaparkan gambar galeri ID 4', '::1', '2026-09-02 06:22:05'),
(85, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'galeri', 'Mengemaskini gambar galeri ID 4', '::1', '2026-09-02 06:22:07'),
(86, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'galeri', 'Mengemaskini gambar galeri ID 4', '::1', '2026-09-02 06:22:35'),
(87, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'galeri', 'Memadam gambar galeri: test', '::1', '2026-09-02 06:33:08'),
(88, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'galeri', 'Memadam gambar galeri: test', '::1', '2026-09-02 06:33:10'),
(89, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'galeri', 'Menambah gambar galeri: Perhimpunan Bulanan July', '::1', '2026-09-02 06:53:18'),
(90, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'galeri', 'Menambah gambar galeri: Sesi Senamrobik Staf Hospital Serian', '::1', '2026-09-02 06:54:39'),
(91, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'galeri', 'Menambah gambar galeri: Sambutan Hari Kebangsaan Ke 69 Hospital Serian', '::1', '2026-09-02 06:56:40'),
(92, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-03 06:49:33'),
(93, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Perhimpunan Bulanan Bil. 8/26', '::1', '2026-09-03 07:10:50'),
(94, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Klinik Katarak', '::1', '2026-09-03 07:10:53'),
(95, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Klinik Katarak', '::1', '2026-09-03 07:10:53'),
(96, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Orientasi Staf Baharu & Pelatih MA', '::1', '2026-09-03 07:10:54'),
(97, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Kursus IR', '::1', '2026-09-03 07:10:54'),
(98, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Kursus IR', '::1', '2026-09-03 07:10:55'),
(99, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Kursus Medication Safety', '::1', '2026-09-03 07:10:55'),
(100, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Kursus Medication Safety', '::1', '2026-09-03 07:10:55'),
(101, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Mesyuarat PPK Bil. 3/26 & Mesyuarat AJK Sambutan Hari PPK (Sukaneka)', '::1', '2026-09-03 07:10:59'),
(102, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: User Training', '::1', '2026-09-03 07:10:59'),
(103, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'galeri', 'Mengemaskini gambar galeri ID 5', '::1', '2026-09-03 07:11:22'),
(104, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-03 07:46:06'),
(105, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'pautan', 'Menyembunyikan pautan ID 5', '::1', '2026-09-03 08:25:19'),
(106, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'pautan', 'Memaparkan pautan ID 5', '::1', '2026-09-03 08:25:21'),
(107, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Mesyuarat AJK Nursing Dinner — Bilik Persidangan (2026-09-01)', '', '2026-09-03 08:38:54'),
(108, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): ECG Course — Dewan Alamanda/Bilik Operasi (2026-09-01)', '', '2026-09-03 08:38:54'),
(109, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Taklimat BLS 2026 — Bilik Persidangan (2026-09-03)', '', '2026-09-03 08:38:54'),
(110, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): CME (PPP & PPK) — Bilik Mesyuarat Utama (2026-09-03)', '', '2026-09-03 08:38:54'),
(111, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Kursus pengurusan risiko bunuh diri Hospital Serian — Bilik Persidangan (2026-09-04)', '', '2026-09-03 08:38:54'),
(112, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): CME — Bilik Persidangan (2026-09-04)', '', '2026-09-03 08:38:54'),
(113, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Mesyuarat Pegawai Penyiasatan Kes Aduan — Bilik Mesyuarat Utama (2026-09-04)', '', '2026-09-03 08:38:54'),
(114, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Lawatan Dietetik Klinikal — Bilik Persidangan (2026-09-07)', '', '2026-09-03 08:38:54'),
(115, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Kursus Dokumentasi — Bilik Persidangan (2026-09-08)', '', '2026-09-03 08:38:54'),
(116, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Kursus Dokumentasi — Bilik Persidangan (2026-09-09)', '', '2026-09-03 08:38:54'),
(117, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Jemaah Dokter Perkeso — Bilik Mesyuarat Utama (2026-09-09)', '', '2026-09-03 08:38:54'),
(118, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Bengkel Asas Keselamatan Kebakaran Bil.2/2026 — Dewan Alamanda/Bilik Operasi (2026-09-09)', '', '2026-09-03 08:38:54'),
(119, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Mesy. VCM & PSH — Bilik Persidangan (2026-09-10)', '', '2026-09-03 08:38:54'),
(120, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Mesy. Morbility Review — Bilik Persidangan (2026-09-10)', '', '2026-09-03 08:38:54'),
(121, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Kelas Agama Muslimah - Doa-Doa Mustajab Wanita Dan Zikir-Zikir Harian — Bilik Mesyuarat Utama (2026-09-10)', '', '2026-09-03 08:38:54'),
(122, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Kursus BLS Bil.1/2026 — Dewan Alamanda/Bilik Operasi (2026-09-10)', '', '2026-09-03 08:38:55'),
(123, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Persiapan Majlis Perpisahan — Bilik Persidangan (2026-09-11)', '', '2026-09-03 08:38:55'),
(124, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Perhimpunan Bulanan Bil.9/2026 — Bilik Persidangan (2026-09-11)', '', '2026-09-03 08:38:55'),
(125, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): CME (PPP & PPK) — Bilik Mesyuarat Utama (2026-09-11)', '', '2026-09-03 08:38:55'),
(126, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Kursus Woundcare — Bilik Persidangan (2026-09-14)', '', '2026-09-03 08:38:55'),
(127, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Kursus Woundcare — Bilik Persidangan (2026-09-15)', '', '2026-09-03 08:38:55'),
(128, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Patient Safety Day — Bilik Persidangan (2026-09-17)', '', '2026-09-03 08:38:55'),
(129, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): CME — Bilik Persidangan (2026-09-18)', '', '2026-09-03 08:38:55'),
(130, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): CME (PPP & PPK) — Bilik Mesyuarat Utama (2026-09-18)', '', '2026-09-03 08:38:55'),
(131, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Klinik Katarak — Dewan Alamanda/Bilik Operasi (2026-09-21)', '', '2026-09-03 08:38:55'),
(132, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Kursus Orientasi — Bilik Persidangan (2026-09-22)', '', '2026-09-03 08:38:55'),
(133, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Klinik Katarak — Dewan Alamanda/Bilik Operasi (2026-09-22)', '', '2026-09-03 08:38:55'),
(134, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Kursus Kawalan Infeksi Utk Staf Klinikal — Bilik Persidangan (2026-09-23)', '', '2026-09-03 08:38:55'),
(135, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Kursus Kawalan Infeksi Utk Staf Bukan Klinikal — Bilik Persidangan (2026-09-24)', '', '2026-09-03 08:38:55'),
(136, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): CME (PPP & PPK) — Bilik Persidangan (2026-09-25)', '', '2026-09-03 08:38:55'),
(137, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Medical Department Meeting Bil.3 — Bilik Mesyuarat Utama (2026-09-25)', '', '2026-09-03 08:38:55'),
(138, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): Mesyuarat AJK Nursing Dinner — Bilik Mesyuarat Utama (2026-09-28)', '', '2026-09-03 08:38:55'),
(139, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): HPIA Cheking File — Bilik Mesyuarat Utama (2026-09-29)', '', '2026-09-03 08:38:55'),
(140, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (September 2026): HPIA Cheking File — Bilik Mesyuarat Utama (2026-09-30)', '', '2026-09-03 08:38:55'),
(141, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Mengemaskini berita: Perhimpunan Bulanan Bil. 8/26', '::1', '2026-09-03 08:41:59'),
(142, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Kelas Agama Muslimah - Doa-Doa Mustajab Wanita Dan Zikir-Zikir Harian', '::1', '2026-09-03 08:42:34'),
(143, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Bengkel Asas Keselamatan Kebakaran Bil.2/2026', '::1', '2026-09-03 08:42:42'),
(144, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Kursus pengurusan risiko bunuh diri Hospital Serian', '::1', '2026-09-03 08:42:53'),
(145, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Jemaah Dokter Perkeso', '::1', '2026-09-03 08:43:00'),
(146, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Patient Safety Day', '::1', '2026-09-03 08:43:29'),
(147, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Perhimpunan Bulanan Bil.9/2026', '::1', '2026-09-03 08:43:34'),
(148, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Persiapan Majlis Perpisahan', '::1', '2026-09-03 08:43:38'),
(149, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Mengemaskini berita: Perhimpunan Bulanan Bil.9/2026', '::1', '2026-09-03 08:43:57'),
(150, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Mengemaskini berita: Persiapan Majlis Perpisahan', '::1', '2026-09-03 08:44:04'),
(151, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Mengemaskini berita: Persiapan Majlis Perpisahan', '::1', '2026-09-03 08:44:24'),
(152, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'slideshow', 'Menambah slaid: Hospital Serian', '::1', '2026-09-03 08:46:03'),
(153, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 14', '::1', '2026-09-03 08:46:13'),
(154, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 13', '::1', '2026-09-03 08:46:13'),
(155, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 14', '::1', '2026-09-03 08:46:15'),
(156, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 12', '::1', '2026-09-03 08:46:15'),
(157, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 14', '::1', '2026-09-03 08:46:16'),
(158, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 11', '::1', '2026-09-03 08:46:16'),
(159, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 14', '::1', '2026-09-03 08:46:19'),
(160, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 10', '::1', '2026-09-03 08:46:19'),
(161, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-10 04:05:39'),
(162, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-10 15:17:30'),
(163, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'borang', 'Memadam borang: Borang Permohonan Dewan Serbaguna & Bilik Gerakan', '::1', '2026-09-10 15:22:40'),
(164, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'borang', 'Memadam borang: Borang Pertukaran Dalaman (B-BKP-PK-SM-07/01)', '::1', '2026-09-10 15:22:46'),
(165, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'telefon', 'Mengemaskini nombor telefon: AA Amirah - Pengurusan (103)', '::1', '2026-09-10 15:23:33'),
(166, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'telefon', 'Mengemaskini nombor telefon: Ketua Unit - SMA Mat Pozan (145)', '::1', '2026-09-10 15:25:39'),
(167, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'telefon', 'Mengemaskini nombor telefon: SMA Specialist Clinic - En Wilson (221)', '::1', '2026-09-10 15:27:14'),
(168, 'system-import@hospitalserian.moh.gov.my', 'Restructure Direktori (CLI)', 'super_admin', 'update', 'telefon', 'Struktur semula direktori telefon: 14 kumpulan -> 3 (Pentadbiran & Pengurusan, Bilik Penyelia Jururawat, Lain-lain)', '', '2026-09-10 15:44:51'),
(169, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'update', 'tempahan', 'Pembetulan bilik: Mesyuarat AJK Nursing Dinner (1 Sept) — Bilik Persidangan -> Bilik Mesyuarat Utama', '', '2026-09-10 15:47:05'),
(170, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (kemaskini Sept 2026): Taklimat PPK Modul 2 — Bilik Mesyuarat Utama (2026-09-07)', '', '2026-09-10 15:47:05'),
(171, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (kemaskini Sept 2026): Audit Klinikal PPP — Bilik Mesyuarat Utama (2026-09-07)', '', '2026-09-10 15:47:05'),
(172, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (kemaskini Sept 2026): Audit Klinikal PPP — Bilik Mesyuarat Utama (2026-09-08)', '', '2026-09-10 15:47:05'),
(173, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (kemaskini Sept 2026): Taklimat ETD — Bilik Mesyuarat Utama (2026-09-11)', '', '2026-09-10 15:47:05'),
(174, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (kemaskini Sept 2026): Taklimat PPK Modul 2 — Bilik Mesyuarat Utama (2026-09-14)', '', '2026-09-10 15:47:05'),
(175, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (kemaskini Sept 2026): Taklimat PPK Modul 2 — Bilik Mesyuarat Utama (2026-09-21)', '', '2026-09-10 15:47:05'),
(176, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (kemaskini Sept 2026): Kursus Dokumentasi — Dewan Alamanda/Bilik Operasi (2026-09-23)', '', '2026-09-10 15:47:05'),
(177, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (kemaskini Sept 2026): Kursus Dokumentasi — Dewan Alamanda/Bilik Operasi (2026-09-24)', '', '2026-09-10 15:47:05'),
(178, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'telefon', 'Mengemaskini nombor telefon: Admin - PH (Dr Maria) (102)', '::1', '2026-09-10 15:59:48'),
(179, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'telefon', 'Mengemaskini nombor telefon: Timbalan TPH (Dr Carlos) (151)', '::1', '2026-09-10 16:00:04'),
(180, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-10 16:53:48'),
(181, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'bilik', 'Mengemaskini bilik: Bilik Mesyuarat Utama', '::1', '2026-09-10 18:24:55'),
(182, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'bilik', 'Mengemaskini bilik: Bilik Persidangan', '::1', '2026-09-10 18:25:12'),
(183, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'bilik', 'Mengemaskini bilik: Bilik Persidangan', '::1', '2026-09-10 18:25:18'),
(184, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'bilik', 'Mengemaskini bilik: Dewan Alamanda/Bilik Operasi', '::1', '2026-09-10 18:25:31'),
(185, 'system-import@hospitalserian.moh.gov.my', 'Penyelarasan Excel (CLI)', 'super_admin', 'delete', 'tempahan', 'Selaras dgn Excel Sept: buang Kursus Dokumentasi (2026-09-08, Matron Lesminawati)', '', '2026-09-10 18:33:14'),
(186, 'system-import@hospitalserian.moh.gov.my', 'Penyelarasan Excel (CLI)', 'super_admin', 'delete', 'tempahan', 'Selaras dgn Excel Sept: buang Kursus Dokumentasi (2026-09-09, Matron Lesminawati)', '', '2026-09-10 18:33:14'),
(187, 'system-import@hospitalserian.moh.gov.my', 'Penyelarasan Excel (CLI)', 'super_admin', 'update', 'tempahan', 'Penyelarasan penuh tempahan September 2026 dengan jadual Excel rasmi', '', '2026-09-10 18:33:14'),
(188, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-10 18:43:28'),
(189, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan diluluskan: test', '::1', '2026-09-10 18:45:09'),
(190, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan ditolak: test', '::1', '2026-09-10 18:45:38'),
(191, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'tempahan', 'Memadam tempahan: test', '::1', '2026-09-10 18:46:10'),
(192, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-11 00:43:00'),
(193, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Super Admin kepada: prescilia.elsie@moh.gov.my', '::1', '2026-09-11 00:45:02'),
(194, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Super Admin kepada: carlos.j@moh.gov.my', '::1', '2026-09-11 00:45:13'),
(195, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'akses', 'Menarik balik akses admin: mary_annie@moh.gov.my', '::1', '2026-09-11 00:45:16'),
(196, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Admin kepada: abdazim@moh.gov.my (modul: borang)', '::1', '2026-09-11 01:22:54'),
(197, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Admin kepada: lidya.kadir@moh.gov.my (modul: slideshow, galeri)', '::1', '2026-09-11 01:23:14'),
(198, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Admin kepada: liza.bali@moh.gov.my (modul: dokumen)', '::1', '2026-09-11 01:27:32'),
(199, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Admin kepada: norzarina.sapawe@moh.gov.my (modul: slideshow, galeri, pautan)', '::1', '2026-09-11 01:27:56'),
(200, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Admin kepada: nurul.amirahbongsu@moh.gov.my (modul: staff, telefon, dokumen, borang, slideshow, galeri, pautan)', '::1', '2026-09-11 01:29:22'),
(201, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Admin kepada: zadora@moh.gov.my (modul: berita, bilik, tempahan)', '::1', '2026-09-11 01:29:39'),
(202, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Super Admin kepada: lidya.kadir@moh.gov.my', '::1', '2026-09-11 01:29:51'),
(203, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '::1', '2026-09-11 02:10:45'),
(204, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'galeri', 'Mengemaskini gambar galeri ID 6', '10.168.89.19', '2026-09-11 02:27:15'),
(205, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.174', '2026-09-11 02:41:53'),
(206, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan diluluskan: ict', '10.168.89.19', '2026-09-11 05:43:05'),
(207, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'tempahan', 'Tempahan ditolak: ict', '10.168.89.19', '2026-09-11 05:43:58'),
(208, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'tempahan', 'Memadam tempahan: ict', '10.168.89.19', '2026-09-11 05:50:58'),
(209, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.31', '2026-09-11 06:55:58'),
(210, 'chaishiawfung@moh.gov.my', 'CHAI SHIAW FUNG (MOH-SARAWAK)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.252', '2026-09-11 07:15:43'),
(211, 'erni.s@moh.gov.my', 'ERNI BINTI SUHAILI (HSERIAN)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.220', '2026-09-11 07:17:43'),
(212, 'erni.s@moh.gov.my', 'ERNI BINTI SUHAILI (HSERIAN)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.220', '2026-09-11 07:27:15'),
(213, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.124', '2026-09-11 07:36:33'),
(214, 'norlidadaud@moh.gov.my', 'NORLIDA BINTI DAUD (MOH-SARAWAK)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.96', '2026-09-11 07:36:35'),
(215, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.174', '2026-09-11 08:23:13'),
(216, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'create', 'slideshow', 'Menambah slaid: Poster Hebahan Sistem Intranet', '10.168.89.174', '2026-09-11 08:26:08'),
(217, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 15', '10.168.89.19', '2026-09-11 08:27:08'),
(218, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 13', '10.168.89.19', '2026-09-11 08:27:09'),
(219, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 15', '10.168.89.19', '2026-09-11 08:27:10'),
(220, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 13', '10.168.89.19', '2026-09-11 08:27:10'),
(221, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 15', '10.168.89.19', '2026-09-11 08:27:12'),
(222, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 13', '10.168.89.19', '2026-09-11 08:27:12'),
(223, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 8', '10.168.89.19', '2026-09-11 08:36:30'),
(224, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Mengaktifkan slaid ID 8', '10.168.89.19', '2026-09-11 08:36:32'),
(225, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:35'),
(226, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Mengaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:35'),
(227, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:36'),
(228, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Mengaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:36'),
(229, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:36'),
(230, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Mengaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:36'),
(231, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:36'),
(232, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Mengaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:36'),
(233, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:37'),
(234, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Mengaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:37'),
(235, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:38'),
(236, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Mengaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:38'),
(237, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:38'),
(238, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Mengaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:38'),
(239, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:39'),
(240, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Mengaktifkan slaid ID 15', '10.168.89.19', '2026-09-11 08:36:39'),
(241, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.88.198', '2026-09-11 08:45:39'),
(242, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.88.245', '2026-09-13 23:54:05'),
(243, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.28', '2026-09-14 01:25:39'),
(244, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.88.245', '2026-09-14 01:55:50'),
(245, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.28', '2026-09-14 01:58:53'),
(246, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'update', 'berita', 'Mengemaskini berita: Bengkel Asas Keselamatan Kebakaran Bil.2/2026', '10.168.89.28', '2026-09-14 03:20:47'),
(247, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Bengkel Asas Keselamatan Kebakaran Bil.2/2026', '10.168.88.245', '2026-09-14 03:21:10'),
(248, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Bengkel Asas Keselamatan Kebakaran Bil.2/2026', '10.168.88.245', '2026-09-14 03:21:12'),
(249, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Bengkel Asas Keselamatan Kebakaran Bil.2/2026', '10.168.88.245', '2026-09-14 03:21:14'),
(250, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Bengkel Asas Keselamatan Kebakaran Bil.2/2026', '10.168.88.245', '2026-09-14 03:21:15'),
(251, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Bengkel Asas Keselamatan Kebakaran Bil.2/2026', '10.168.88.245', '2026-09-14 03:21:17'),
(252, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Bengkel Asas Keselamatan Kebakaran Bil.2/2026', '10.168.88.245', '2026-09-14 03:21:17'),
(253, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'staff', 'Mengemaskini staf: PRESCILIA ELSIE ANAK HONCHIN', '10.168.88.245', '2026-09-14 03:43:36'),
(254, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'staff', 'Mengemaskini staf: PRESCILIA ELSIE ANAK HONCHIN', '10.168.88.245', '2026-09-14 03:43:59'),
(255, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'notifikasi', 'Import rekod notifikasi emel 11 Sept 2026 sebagai penghantaran #1: 39 dihantar, 11 emel tidak wujud (ditanda dalam direktori), 103 disekat Gmail', '', '2026-09-14 03:47:17'),
(261, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.10', '2026-09-14 04:07:16'),
(262, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'notifikasi', 'Menyediakan penghantaran individu #2 \"Hebahan: Pelancaran Sistem Intranet Hospital Serian\" kepada 103 staf (hantar semula dari #1), 1 imej 285 KB', '10.168.89.142', '2026-09-14 04:13:30'),
(263, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'notifikasi', 'Mula menghantar penghantaran individu #2 \"Hebahan: Pelancaran Sistem Intranet Hospital Serian\" kepada 103 staf', '10.168.89.142', '2026-09-14 04:13:42'),
(264, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'notifikasi', 'Penghantaran individu #2 dihentikan secara automatik: Gmail menyekat emel', '10.168.89.142', '2026-09-14 04:15:36'),
(265, 'ngyuanxun@moh.gov.my', 'NG YUAN XUN (HSERIAN)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.72', '2026-09-14 04:32:04');
INSERT INTO `audit_log` (`id`, `user_email`, `user_name`, `role`, `action`, `module`, `description`, `ip_address`, `created_at`) VALUES
(266, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.88.192', '2026-09-14 05:59:45'),
(267, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'create', 'slideshow', 'Menambah slaid: HEBAHAN POSTMASTER: MESEJ INTEGRITI SIRI 9/2026- \"SUDAHKAH ANDA MENGISYTIHARKAN HARTA?\"', '10.168.88.192', '2026-09-14 06:05:11'),
(268, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 16', '10.168.88.192', '2026-09-14 06:05:16'),
(269, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:05:26'),
(270, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 13', '10.168.88.192', '2026-09-14 06:05:26'),
(271, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 13', '10.168.88.192', '2026-09-14 06:05:37'),
(272, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:05:37'),
(273, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Mengaktifkan slaid ID 16', '10.168.88.192', '2026-09-14 06:05:41'),
(274, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:05:44'),
(275, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 13', '10.168.88.192', '2026-09-14 06:05:44'),
(276, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 16', '10.168.88.192', '2026-09-14 06:05:48'),
(277, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Mengaktifkan slaid ID 16', '10.168.88.192', '2026-09-14 06:05:49'),
(278, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:05:57'),
(279, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 15', '10.168.88.192', '2026-09-14 06:05:57'),
(280, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 15', '10.168.88.192', '2026-09-14 06:05:57'),
(281, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:05:57'),
(282, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:05:58'),
(283, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 15', '10.168.88.192', '2026-09-14 06:05:58'),
(284, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 15', '10.168.88.192', '2026-09-14 06:05:58'),
(285, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:05:58'),
(286, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:05:59'),
(287, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 15', '10.168.88.192', '2026-09-14 06:05:59'),
(288, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:06:00'),
(289, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 12', '10.168.88.192', '2026-09-14 06:06:00'),
(290, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:06:02'),
(291, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 11', '10.168.88.192', '2026-09-14 06:06:02'),
(292, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:06:03'),
(293, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 10', '10.168.88.192', '2026-09-14 06:06:03'),
(294, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:06:04'),
(295, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 14', '10.168.88.192', '2026-09-14 06:06:04'),
(296, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:06:05'),
(297, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 9', '10.168.88.192', '2026-09-14 06:06:05'),
(298, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:06:06'),
(299, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 8', '10.168.88.192', '2026-09-14 06:06:06'),
(300, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:06:07'),
(301, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 5', '10.168.88.192', '2026-09-14 06:06:07'),
(302, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:06:08'),
(303, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 4', '10.168.88.192', '2026-09-14 06:06:08'),
(304, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:06:09'),
(305, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 3', '10.168.88.192', '2026-09-14 06:06:09'),
(306, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:06:10'),
(307, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 2', '10.168.88.192', '2026-09-14 06:06:10'),
(308, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 16', '10.168.88.192', '2026-09-14 06:06:11'),
(309, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'slideshow', 'Menyusun semula slaid ID 1', '10.168.88.192', '2026-09-14 06:06:11'),
(310, 'mahani_ahmat@moh.gov.my', 'MAHANI AHMAT (MOH-SARAWAK)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.43', '2026-09-14 06:08:49'),
(311, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.88.245', '2026-09-14 06:10:49'),
(312, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 16', '10.168.88.245', '2026-09-14 06:12:09'),
(313, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Mengaktifkan slaid ID 16', '10.168.88.245', '2026-09-14 06:12:10'),
(314, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'staff', 'Mengemaskini staf: DAVID ANAK PANIT', '10.168.88.192', '2026-09-14 06:20:50'),
(315, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'staff', 'Mengemaskini staf: DAYANG IZZA AZZAILA BINTI ABANG MOHD ARIFFIN', '10.168.88.192', '2026-09-14 06:21:26'),
(316, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'staff', 'Mengemaskini staf: ASAN ANAK NYUMONG', '10.168.88.192', '2026-09-14 06:21:41'),
(317, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'staff', 'Mengemaskini staf: BUCKLEE SAEN ANAK BROWN', '10.168.88.192', '2026-09-14 06:21:45'),
(318, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'staff', 'Mengemaskini staf: CASSANDRA ANAK JINPAT', '10.168.88.192', '2026-09-14 06:21:49'),
(319, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'staff', 'Mengemaskini staf: DOPICA MANGGEN', '10.168.88.192', '2026-09-14 06:21:52'),
(320, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'staff', 'Mengemaskini staf: ED DESMOND ANAK SLIN', '10.168.88.192', '2026-09-14 06:21:56'),
(321, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'staff', 'Mengemaskini staf: MAT BIN POZAN', '10.168.88.192', '2026-09-14 06:21:59'),
(322, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'update', 'staff', 'Mengemaskini staf: MOURINA ANAK DOMMOK', '10.168.88.192', '2026-09-14 06:22:03'),
(323, 'mary_annie@moh.gov.my', 'PUAN MARY ANNIE ANAK BANGAU (HSERIAN)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.88.143', '2026-09-14 08:11:28'),
(324, 'harissonkueh@moh.gov.my', 'ENCIK HARISSON ANAK KUEH (MOH-SARAWAK)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.191.144.4', '2026-09-15 00:05:17'),
(325, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.9', '2026-09-15 00:13:06'),
(326, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.124', '2026-09-15 00:20:53'),
(327, 'harissonkueh@moh.gov.my', 'ENCIK HARISSON ANAK KUEH (MOH-SARAWAK)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.191.144.4', '2026-09-15 00:21:00'),
(328, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Admin kepada: nurul.amirahbongsu@moh.gov.my (modul: staff, telefon, dokumen, borang, slideshow, galeri, pautan, bilik, tempahan)', '10.168.89.9', '2026-09-15 00:30:15'),
(329, 'mahani_ahmat@moh.gov.my', 'MAHANI AHMAT (MOH-SARAWAK)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.54', '2026-09-15 02:35:39'),
(330, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.124', '2026-09-15 03:04:15'),
(331, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'dokumen', 'Menambah dokumen: POLISI JABATAN FARMASI', '10.168.89.124', '2026-09-15 03:05:18'),
(332, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.191.144.8', '2026-09-15 03:10:23'),
(333, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.9', '2026-09-15 07:09:25'),
(334, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'jadual', 'Import jadual perancangan dari Excel: JADUAL PERANCANGAN CME HOSPITAL SERIAN BAGI TAHUN 2026 (24 sesi)', '', '2026-09-15 07:15:09'),
(335, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'jadual', 'Import jadual perancangan dari Excel: JADUAL PERANCANGAN PERHIMPUNAN BULANAN HOSPITAL SERIAN BAGI TAHUN 2026 (12 sesi)', '', '2026-09-15 07:15:09'),
(336, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.9', '2026-09-15 07:25:31'),
(340, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.112', '2026-09-15 08:14:44'),
(341, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'create', 'slideshow', 'Menambah slaid: Infografik Intranet', '10.168.89.112', '2026-09-15 08:16:33'),
(342, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 17', '10.168.89.112', '2026-09-15 08:16:41'),
(343, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyusun semula slaid ID 13', '10.168.89.112', '2026-09-15 08:16:41'),
(344, 'mahani_ahmat@moh.gov.my', 'MAHANI AHMAT (MOH-SARAWAK)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.54', '2026-09-15 08:36:18'),
(355, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'view', 'memo', 'Membuka memo #1: Program Hari Kualiti Hospital Serian 2026', '10.168.89.9', '2026-09-15 08:47:16'),
(356, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'view', 'memo', 'Membuka memo #2: Makluman Latihan Kebakaran Bil. 2/2026', '10.168.89.9', '2026-09-15 08:47:21'),
(357, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'memo', 'Memadam memo #1: Program Hari Kualiti Hospital Serian 2026', '10.168.89.9', '2026-09-15 08:50:11'),
(358, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'delete', 'memo', 'Memadam memo #2: Makluman Latihan Kebakaran Bil. 2/2026', '10.168.89.9', '2026-09-15 08:50:13'),
(359, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.124', '2026-09-15 08:50:41'),
(360, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'memo', 'Menambah memo #3: JADUAL PERANCANGAN CME & PERHIMPUNAN BULANAN BAGI TAHUN 2026-1', '10.168.89.124', '2026-09-15 08:52:56'),
(361, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'view', 'memo', 'Membuka memo #3: JADUAL PERANCANGAN CME & PERHIMPUNAN BULANAN BAGI TAHUN 2026-1', '10.168.89.9', '2026-09-15 08:53:06'),
(362, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Admin kepada: nurul.amirahbongsu@moh.gov.my (modul: staff, telefon, dokumen, memo, borang, slideshow, galeri, pautan, bilik, tempahan)', '10.168.89.9', '2026-09-15 08:54:53'),
(363, 'norzarina.sapawe@moh.gov.my', 'NORZARINA BINTI SAPAWE (HSERIAN)', 'admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.170', '2026-09-15 09:05:35'),
(364, 'norzarina.sapawe@moh.gov.my', 'NORZARINA BINTI SAPAWE (HSERIAN)', 'admin', 'view', 'memo', 'Membuka memo #3: JADUAL PERANCANGAN CME & PERHIMPUNAN BULANAN BAGI TAHUN 2026-1', '10.168.90.170', '2026-09-16 23:49:23'),
(365, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.191.144.8', '2026-09-17 00:17:21'),
(366, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'view', 'memo', 'Membuka memo #3: JADUAL PERANCANGAN CME & PERHIMPUNAN BULANAN BAGI TAHUN 2026-1', '10.191.144.8', '2026-09-17 00:17:43'),
(367, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): MAC meeting — Bilik Mesyuarat Utama (2026-10-01)', '', '2026-09-17 00:30:28'),
(368, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): CME (PPP & PPK) — Bilik Mesyuarat Utama (2026-10-02)', '', '2026-09-17 00:30:28'),
(369, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Mesy. MMR ETD Bersama Pengarah — Bilik Persidangan (2026-10-05)', '', '2026-09-17 00:30:28'),
(370, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Kursus BLS Bil.2/2026 — Dewan Alamanda/Bilik Operasi (2026-10-06)', '', '2026-09-17 00:30:28'),
(371, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Mesy. HIACC Bil.3/2026 — Bilik Persidangan (2026-10-07)', '', '2026-09-17 00:30:28'),
(372, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Meeting Qrimat Bil.4/2026 — Bilik Persidangan (2026-10-08)', '', '2026-09-17 00:30:28'),
(373, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): CME (PPP & PPK) — Bilik Persidangan (2026-10-08)', '', '2026-09-17 00:30:28'),
(374, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Kelas Agama Muslimah - Mengurus Cabaran Hidup Dengan Tawakal — Bilik Mesyuarat Utama (2026-10-08)', '', '2026-09-17 00:30:28'),
(375, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): CME — Bilik Persidangan (2026-10-09)', '', '2026-09-17 00:30:28'),
(376, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Jemaah Dokter Perkeso — Bilik Mesyuarat Utama (2026-10-09)', '', '2026-09-17 00:30:28'),
(377, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Pelancaran Projek Perincis MyPhIS 3.0 — Bilik Persidangan (2026-10-12)', '', '2026-09-17 00:30:28'),
(378, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Pelancaran Projek Perincis MyPhIS 3.0 — Bilik Mesyuarat Utama (2026-10-12)', '', '2026-09-17 00:30:28'),
(379, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Meeting P&A Bil.4/2026 — Bilik Persidangan (2026-10-15)', '', '2026-09-17 00:30:28'),
(380, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Perhimpunan Bulanan Bil.10/2026 — Bilik Persidangan (2026-10-16)', '', '2026-09-17 00:30:28'),
(381, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): CME (PPP & PPK) — Bilik Mesyuarat Utama (2026-10-16)', '', '2026-09-17 00:30:28'),
(382, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Lawatan Dietetik Klinikal — Bilik Persidangan (2026-10-19)', '', '2026-09-17 00:30:28'),
(383, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Pain Kursus — Bilik Persidangan (2026-10-20)', '', '2026-09-17 00:30:28'),
(384, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Pain Kursus — Bilik Persidangan (2026-10-21)', '', '2026-09-17 00:30:28'),
(385, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): CME — Bilik Persidangan (2026-10-23)', '', '2026-09-17 00:30:28'),
(386, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): CME (PPP & PPK) — Bilik Mesyuarat Utama (2026-10-23)', '', '2026-09-17 00:30:28'),
(387, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): CME — Bilik Persidangan (2026-11-06)', '', '2026-09-17 00:30:28'),
(388, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Jemaah Dokter Perkeso — Bilik Mesyuarat Utama (2026-11-06)', '', '2026-09-17 00:30:28'),
(389, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Lawatan Dietetik Klinikal — Bilik Persidangan (2026-11-09)', '', '2026-09-17 00:30:28'),
(390, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Kelas Agama Muslimah - Musahabah Akhir Tahun Dan Perancangan 2027 — Bilik Mesyuarat Utama (2026-11-12)', '', '2026-09-17 00:30:28'),
(391, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Perhimpunan Bulanan Bil.11/2026 — Bilik Persidangan (2026-11-13)', '', '2026-09-17 00:30:28'),
(392, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): CME — Bilik Persidangan (2026-11-20)', '', '2026-09-17 00:30:28'),
(393, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Klinikal Audit — Bilik Mesyuarat Utama (2026-11-27)', '', '2026-09-17 00:30:28'),
(394, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): CME — Bilik Persidangan (2026-12-04)', '', '2026-09-17 00:30:28'),
(395, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Jemaah Dokter Perkeso — Bilik Mesyuarat Utama (2026-12-04)', '', '2026-09-17 00:30:28'),
(396, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Lawatan Dietetik Klinikal — Bilik Persidangan (2026-12-07)', '', '2026-09-17 00:30:28'),
(397, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Perhimpunan Bulanan Bil.12/2026 — Bilik Persidangan (2026-12-11)', '', '2026-09-17 00:30:28'),
(398, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): Meeting MPSG Bil.3/2026 — Bilik Persidangan (2026-12-17)', '', '2026-09-17 00:30:28'),
(399, 'system-import@hospitalserian.moh.gov.my', 'Import Pukal (CLI)', 'super_admin', 'create', 'tempahan', 'Import pukal (Oktober-Disember 2026): CME — Bilik Persidangan (2026-12-18)', '', '2026-09-17 00:30:28'),
(400, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.116', '2026-09-17 02:41:00'),
(401, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.9', '2026-09-17 04:36:49'),
(402, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Perhimpunan Bulanan Bil.9/2026', '10.168.89.9', '2026-09-17 04:37:21'),
(403, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Persiapan Majlis Perpisahan', '10.168.89.9', '2026-09-17 04:37:31'),
(404, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Bengkel Asas Keselamatan Kebakaran Bil.2/2026', '10.168.89.9', '2026-09-17 04:37:44'),
(405, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Jemaah Dokter Perkeso', '10.168.89.9', '2026-09-17 04:37:45'),
(406, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Kursus pengurusan risiko bunuh diri Hospital Serian', '10.168.89.9', '2026-09-17 04:37:48'),
(407, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menyahterbitkan berita: Kelas Agama Muslimah - Doa-Doa Mustajab Wanita Dan Zikir-Zikir Harian', '10.168.89.9', '2026-09-17 04:37:52'),
(408, 'mahani_ahmat@moh.gov.my', 'MAHANI AHMAT (MOH-SARAWAK)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.54', '2026-09-17 04:54:03'),
(409, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Penyegerakan automatik dengan Tempahan Bilik: 33 berita draf dicipta, 6 berita draf dibuang (tempahan dipadam/ditolak)', '10.168.89.9', '2026-09-17 04:54:03'),
(410, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Mengemaskini berita: Perhimpunan Bulanan Bil.9/2026', '10.168.89.9', '2026-09-17 05:55:12'),
(411, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Mengemaskini berita: Persiapan Majlis Perpisahan', '10.168.89.9', '2026-09-17 05:55:32'),
(412, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Kursus Orientasi', '10.168.89.9', '2026-09-17 05:56:15'),
(413, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Mengemaskini berita: Kursus Orientasi', '10.168.89.9', '2026-09-17 05:56:27'),
(414, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Kursus Dokumentasi', '10.168.89.9', '2026-09-17 05:56:42'),
(415, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Kursus Dokumentasi', '10.168.89.9', '2026-09-17 05:56:42'),
(416, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Mesyuarat AJK Nursing Dinner', '10.168.89.9', '2026-09-17 05:56:52'),
(417, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Pelancaran Projek Perincis MyPhIS 3.0', '10.168.89.9', '2026-09-17 05:57:09'),
(418, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Mengemaskini berita: Pelancaran Projek Perincis MyPhIS 3.0', '10.168.89.9', '2026-09-17 05:57:18'),
(419, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Perhimpunan Bulanan Bil.10/2026', '10.168.89.9', '2026-09-17 05:57:22'),
(420, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Mengemaskini berita: Perhimpunan Bulanan Bil.10/2026', '10.168.89.9', '2026-09-17 05:57:27'),
(421, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Perhimpunan Bulanan Bil.11/2026', '10.168.89.9', '2026-09-17 05:57:38'),
(422, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Mengemaskini berita: Perhimpunan Bulanan Bil.11/2026', '10.168.89.9', '2026-09-17 05:57:43'),
(423, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Meeting MPSG Bil.3/2026', '10.168.89.9', '2026-09-17 05:57:52'),
(424, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Menerbitkan berita: Perhimpunan Bulanan Bil.12/2026', '10.168.89.9', '2026-09-17 05:57:56'),
(425, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'berita', 'Mengemaskini berita: Perhimpunan Bulanan Bil.12/2026', '10.168.89.9', '2026-09-17 05:58:00'),
(426, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.112', '2026-09-17 07:16:02'),
(427, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.9', '2026-09-18 00:18:48'),
(428, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'view', 'memo', 'Membuka memo #3: JADUAL PERANCANGAN CME & PERHIMPUNAN BULANAN BAGI TAHUN 2026-1', '10.168.89.9', '2026-09-18 00:19:20'),
(429, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'telefon', 'Mengemaskini nombor telefon: SMA Pengurusan - En Azuwan (109)', '10.168.89.9', '2026-09-18 00:21:50'),
(430, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.124', '2026-09-18 00:25:53'),
(431, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'tempahan', 'Tempahan diluluskan: MPSG Meeting', '10.168.89.124', '2026-09-18 00:35:24'),
(432, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Admin kepada: zadora@moh.gov.my (modul: berita, bilik, tempahan, jadual)', '10.168.89.9', '2026-09-18 00:39:18'),
(433, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.124', '2026-09-18 00:42:54'),
(434, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.116', '2026-09-18 00:45:01'),
(435, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'slideshow', 'Menambah slaid: WAR ON SUGAR', '10.168.90.237', '2026-09-18 01:10:23'),
(436, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.213', '2026-09-18 01:25:17'),
(437, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.91.6', '2026-09-18 01:26:19'),
(438, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.237', '2026-09-18 01:27:45'),
(439, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'slideshow', 'Menambah slaid: Facebook', '10.168.90.237', '2026-09-18 01:28:38'),
(440, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.91.6', '2026-09-18 01:29:09'),
(441, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'slideshow', 'Menyahaktifkan slaid ID 8', '10.168.90.237', '2026-09-18 01:37:36'),
(442, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.237', '2026-09-18 02:05:23'),
(443, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: Mesyuarat AJK Nursing Dinner', '10.168.89.124', '2026-09-18 02:18:34'),
(444, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'view', 'memo', 'Membuka memo #3: JADUAL PERANCANGAN CME & PERHIMPUNAN BULANAN BAGI TAHUN 2026-1', '10.168.89.124', '2026-09-18 02:20:17'),
(445, 'noorazuwan@moh.gov.my', 'NOOR AZUWAN BIN BAIEE (HSIMUNJAN)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.57', '2026-09-18 04:13:32'),
(446, 'noorazuwan@moh.gov.my', 'NOOR AZUWAN BIN BAIEE (HSIMUNJAN)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.212', '2026-09-18 04:15:16'),
(447, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.237', '2026-09-18 06:26:05'),
(448, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.91.6', '2026-09-18 06:26:35'),
(449, 'mahani_ahmat@moh.gov.my', 'MAHANI AHMAT (MOH-SARAWAK)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.54', '2026-09-18 06:45:04'),
(450, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.9', '2026-09-18 08:39:06'),
(451, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'akses', 'Memberi akses Admin kepada: zadora@moh.gov.my (modul: memo, berita, bilik, tempahan, jadual)', '10.168.89.9', '2026-09-18 08:39:43'),
(452, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'view', 'memo', 'Membuka memo #3: JADUAL PERANCANGAN CME & PERHIMPUNAN BULANAN BAGI TAHUN 2026-1', '10.168.89.9', '2026-09-18 08:39:58'),
(453, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.43', '2026-09-21 00:29:51'),
(454, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.243', '2026-09-21 01:34:24'),
(455, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.169', '2026-09-21 01:48:54'),
(456, 'syafiq_sabri@moh.gov.my', 'MOHD SYAFIQ BIN MOHD SABRI (HSERIAN)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.250', '2026-09-21 01:49:41'),
(457, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'memo', 'Menambah memo #4: Pengisiaan Borang Perancangan LDP Program Perubatan & Pengurusan Tahun 2027', '10.168.89.169', '2026-09-21 01:50:32'),
(458, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'update', 'memo', 'Mengemaskini memo #4: Pengisiaan Borang Perancangan LDP Program Perubatan & Pengurusan Tahun 2027', '10.168.89.169', '2026-09-21 01:50:54'),
(459, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'view', 'memo', 'Membuka memo #4: Pengisiaan Borang Perancangan LDP Program Perubatan & Pengurusan Tahun 2027', '10.168.89.43', '2026-09-21 01:51:21'),
(460, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'create', 'memo', 'Menambah memo #5: Permohonan Tempahan Fasiliti Melalui Portal Rasmi Intranet Hospital Serian', '10.168.89.169', '2026-09-21 01:53:25'),
(461, 'mahani_ahmat@moh.gov.my', 'MAHANI AHMAT (MOH-SARAWAK)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.47', '2026-09-21 01:53:34'),
(462, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.90.19', '2026-09-21 04:45:19'),
(463, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'tempahan', 'Tempahan ditolak: User Training', '10.168.90.19', '2026-09-21 04:46:54'),
(464, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'tempahan', 'Tempahan diluluskan: User Training', '10.168.90.19', '2026-09-21 04:47:08'),
(465, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: Kursus Kawalan Infeksi Utk Staf Klinikal', '10.168.90.19', '2026-09-21 04:47:46'),
(466, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: User Training', '10.168.90.19', '2026-09-21 04:47:49'),
(467, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: Kursus Kawalan Infeksi Utk Staf Non Klinikal', '10.168.90.19', '2026-09-21 04:47:52'),
(468, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: CME (PPP & PPK)', '10.168.90.19', '2026-09-21 04:47:53'),
(469, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: Medical Department Meeting Bil.3', '10.168.90.19', '2026-09-21 04:47:55'),
(470, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: HPIA Cheking File', '10.168.90.19', '2026-09-21 04:47:58'),
(471, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: HPIA Cheking File', '10.168.90.19', '2026-09-21 04:47:58'),
(472, 'lesminawati@moh.gov.my', 'LESMINAWATI BT. TUGOR (HSARIKEI)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.123', '2026-09-21 05:02:35'),
(473, 'lesminawati@moh.gov.my', 'LESMINAWATI BT. TUGOR (HSARIKEI)', 'staff', 'view', 'memo', 'Membuka memo #4: Pengisiaan Borang Perancangan LDP Program Perubatan & Pengurusan Tahun 2027', '10.168.89.123', '2026-09-21 05:25:30'),
(474, 'lesminawati@moh.gov.my', 'LESMINAWATI BT. TUGOR (HSARIKEI)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.123', '2026-09-21 06:05:09'),
(475, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.88.220', '2026-09-21 06:15:07'),
(476, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'tempahan', 'Tempahan diluluskan: Lawatan Penyeliaan  dan Pemantauan Bahagian Kejururawatan Ke Fasiliti Kesihatan Negeri Sarawak', '10.168.90.19', '2026-09-21 06:15:09'),
(477, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'tempahan', 'Tempahan diluluskan: Mesyuarat Kejururawatan Bil.3/2026', '10.168.90.19', '2026-09-21 06:15:35'),
(478, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: CME', '10.168.90.19', '2026-09-21 06:34:51'),
(479, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: CME', '10.168.90.19', '2026-09-21 06:35:04'),
(480, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: CME', '10.168.90.19', '2026-09-21 06:35:12'),
(481, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: CME', '10.168.90.19', '2026-09-21 06:35:17'),
(482, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: CME', '10.168.90.19', '2026-09-21 06:35:22'),
(483, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', 'update', 'berita', 'Menerbitkan berita: CME', '10.168.90.19', '2026-09-21 06:35:27'),
(484, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.43', '2026-09-21 06:41:00'),
(485, 'sitizuhairah1997@moh.gov.my', 'SITI ZUHAIRAH BINTI ZAINUDDIN (PKDGOMBAK)', 'staff', 'login', 'auth', 'Log masuk ke sistem', '10.168.89.104', '2026-09-21 06:50:41'),
(486, 'sitizuhairah1997@moh.gov.my', 'SITI ZUHAIRAH BINTI ZAINUDDIN (PKDGOMBAK)', 'staff', 'view', 'memo', 'Membuka memo #3: JADUAL PERANCANGAN CME & PERHIMPUNAN BULANAN BAGI TAHUN 2026-1', '10.168.89.104', '2026-09-21 06:54:29');

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `tag_color` varchar(20) NOT NULL,
  `pinned` tinyint(1) DEFAULT 0,
  `excerpt` text DEFAULT NULL,
  `content` text NOT NULL,
  `status` enum('draft','published') NOT NULL DEFAULT 'published',
  `tarikh_acara` date DEFAULT NULL,
  `masa_acara` varchar(50) DEFAULT NULL,
  `penyelaras` varchar(255) DEFAULT NULL,
  `bilik_id` int(11) DEFAULT NULL,
  `tempahan_id` int(11) DEFAULT NULL,
  `author` varchar(100) NOT NULL,
  `views` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id`, `title`, `category`, `tag`, `tag_color`, `pinned`, `excerpt`, `content`, `status`, `tarikh_acara`, `masa_acara`, `penyelaras`, `bilik_id`, `tempahan_id`, `author`, `views`, `created_at`, `updated_at`) VALUES
(18, 'Kelas Agama Muslimah', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kelas Agama Muslimah</p>', 'draft', '2026-08-13', '02:00 PM - 05:00 PM', 'JM Zuhailah (Unit Infection Control)', 1, 21, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-08-13 02:19:17', '2026-08-13 04:14:11'),
(19, 'Mesyuarakat Pegawai', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesyuarakat Pegawai</p>', 'draft', '2026-08-11', '12:06 PM - 01:00 PM', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN) (Unit Pentadbiran)', 1, 4, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-08-13 03:15:18', '2026-08-13 04:14:11'),
(20, 'Mesyuarat Pengurusan Katil Hospital', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesyuarat Pengurusan Katil Hospital</p>', 'draft', '2026-08-17', '02:30 PM - Selesai', 'En. Rizuanny', 1, 22, 'Admin', 0, '2026-08-13 03:15:18', '2026-08-13 04:14:11'),
(21, 'CME (PPP/PPK)', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME (PPP/PPK)</p>', 'draft', '2026-08-21', '02:00 PM - 04:00 PM', 'SMA Kurin', 1, 23, 'Admin', 0, '2026-08-13 03:15:18', '2026-08-13 04:14:11'),
(22, 'CME (PPP/PPK)', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME (PPP/PPK)</p>', 'draft', '2026-08-28', '02:00 PM - 04:00 PM', 'SMA Kurin', 1, 24, 'Admin', 0, '2026-08-13 03:15:18', '2026-08-13 04:14:11'),
(23, 'Mesyuarat Klinik Pakar', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesyuarat Klinik Pakar</p>', 'draft', '2026-08-19', '03:30 PM - Selesai', 'SMA Willson', 1, 25, 'Admin', 0, '2026-08-13 03:15:18', '2026-08-13 04:14:11'),
(24, 'Sambutan Hari Penyusuan Susu Ibu Sedunia', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Sambutan Hari Penyusuan Susu Ibu Sedunia</p>', 'draft', '2026-08-19', '09:00 AM - Selesai', 'Sr. Telaying', 1, 26, 'Admin', 0, '2026-08-13 03:15:18', '2026-08-13 04:14:11'),
(25, 'Klinik Katarak', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Klinik Katarak</p>', 'draft', '2026-08-19', '08:00 AM - 05:00 PM', 'MA Green', 3, 27, 'Admin', 0, '2026-08-13 03:15:18', '2026-09-03 07:10:53'),
(26, 'Klinik Katarak', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Klinik Katarak</p>', 'draft', '2026-08-20', '08:00 AM - 05:00 PM', 'MA Green', 3, 28, 'Admin', 0, '2026-08-13 03:15:18', '2026-09-03 07:10:53'),
(27, 'Orientasi Staf Baharu & Pelatih MA', 'maklumat', 'Maklumat', '#2196F3', 0, '', '<p>Orientasi Staf Baharu &amp; Pelatih MA</p>', 'draft', '2026-08-17', '08:00 AM - 01:00 PM', 'JM Zuhailah', 2, 29, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-08-13 03:15:18', '2026-09-03 07:10:54'),
(28, 'Mesyuarat MPSG Bil. 2/26', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesyuarat MPSG Bil. 2/26</p>', 'draft', '2026-08-13', '08:00 AM - 01:00 PM', 'Sr. Liza', 2, 30, 'Admin', 0, '2026-08-13 03:15:18', '2026-08-13 04:14:11'),
(29, 'CME (PPP/PPK)', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME (PPP/PPK)</p>', 'draft', '2026-08-14', '02:00 PM - 04:00 PM', 'SMA Kurin', 2, 31, 'Admin', 0, '2026-08-13 03:15:18', '2026-08-13 04:14:11'),
(30, 'Kursus IR', 'latihan', 'Latihan', '#0C7B93', 0, '', '<p>Kursus IR</p>', 'draft', '2026-08-18', '08:00 AM - 05:00 PM', 'Sr. Liza', 2, 32, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-08-13 03:15:18', '2026-09-03 07:10:54'),
(31, 'Kursus IR', 'latihan', 'Latihan', '#0C7B93', 0, '', '<p>Kursus IR</p>', 'draft', '2026-08-19', '08:00 AM - 05:00 PM', 'Sr. Liza', 2, 33, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-08-13 03:15:18', '2026-09-03 07:10:55'),
(32, 'Kursus Medication Safety', 'latihan', 'Latihan', '#0C7B93', 0, '', '<p>Kursus Medication Safety</p>', 'draft', '2026-08-20', '08:00 AM - 05:00 PM', 'Sr. Linda', 2, 34, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-08-13 03:15:18', '2026-09-03 07:10:55'),
(33, 'Kursus Medication Safety', 'latihan', 'Latihan', '#0C7B93', 0, '', '<p>Kursus Medication Safety</p>', 'draft', '2026-08-21', '08:00 AM - 02:00 PM', 'Sr. Linda', 2, 35, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-08-13 03:15:18', '2026-09-03 07:10:55'),
(34, 'CME', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME</p>', 'draft', '2026-08-21', '03:00 PM - 04:00 PM', 'PSY', 2, 36, 'Admin', 0, '2026-08-13 03:15:18', '2026-08-13 04:14:11'),
(35, 'User Training', 'latihan', 'Latihan', '#0C7B93', 0, '', '<p>User Training</p>', 'draft', '2026-08-24', '02:30 PM', 'OMC', 2, 37, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-08-13 03:15:18', '2026-09-03 07:10:59'),
(36, 'Kursus NNIA', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kursus NNIA</p>', 'draft', '2026-08-26', '08:00 AM - 05:00 PM', 'M. Lesminawati', 2, 38, 'Admin', 0, '2026-08-13 03:15:18', '2026-08-13 04:14:11'),
(37, 'Kursus NNIA', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kursus NNIA</p>', 'draft', '2026-08-27', '08:00 AM - 05:00 PM', 'M. Lesminawati', 2, 39, 'Admin', 0, '2026-08-13 03:15:18', '2026-08-13 04:14:11'),
(38, 'Perhimpunan Bulanan Bil. 8/26', 'penting', 'Penting', '#E74C3C', 0, '', '<p></p>', 'draft', '2026-08-28', '03:00 PM - 04:00 PM', 'Sajian / Jurutera / Pengurusan', 2, 40, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-08-13 03:15:18', '2026-09-03 08:41:59'),
(39, 'Mesyuarat PPK Bil. 3/26 & Mesyuarat AJK Sambutan Hari PPK (Sukaneka)', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesyuarat PPK Bil. 3/26 &amp; Mesyuarat AJK Sambutan Hari PPK (Sukaneka)</p>', 'draft', '2026-08-13', '02:00 PM - Selesai', 'PPK Mohd. Tarmize', 2, 41, 'Admin', 0, '2026-08-13 03:15:18', '2026-09-03 07:10:59'),
(40, 'TEST AJAK', 'memo', 'Memo', '#9C27B0', 0, '', '<p>TEST AJAK</p>', 'draft', '2026-08-31', '08:30 AM - 09:30 AM', 'ELSIE (UNIT SAJIAN)', 1, 42, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-08-14 08:42:06', '2026-08-14 08:42:06'),
(43, 'Mesyuarat AJK Nursing Dinner', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesyuarat AJK Nursing Dinner</p>', 'published', '2026-09-01', '02:30 PM - Selesai', 'Sr. Liza (Jabatan Kejururawatan)', 1, 46, 'Admin', 0, '2026-09-03 08:38:54', '2026-09-18 02:18:34'),
(44, 'ECG Course', 'memo', 'Memo', '#9C27B0', 0, '', '<p>ECG Course</p>', 'draft', '2026-09-01', '08:00 AM - 05:00 PM', 'SMA Azuwan (Jabatan Kejururawatan)', 3, 47, 'Admin', 0, '2026-09-03 08:38:54', '2026-09-03 08:38:54'),
(45, 'Taklimat BLS 2026', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Taklimat BLS 2026</p>', 'draft', '2026-09-03', '08:00 AM - 05:00 PM', 'PPP Azuwan (Jabatan Kejururawatan)', 2, 48, 'Admin', 0, '2026-09-03 08:38:54', '2026-09-03 08:38:54'),
(46, 'CME (PPP & PPK)', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME (PPP &amp; PPK)</p>', 'draft', '2026-09-03', '02:00 PM - 04:00 PM', 'SMA Kurin (Jabatan Kejururawatan)', 1, 49, 'Admin', 0, '2026-09-03 08:38:54', '2026-09-03 08:38:54'),
(47, 'Kursus pengurusan risiko bunuh diri Hospital Serian', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kursus pengurusan risiko bunuh diri Hospital Serian</p>', 'draft', '2026-09-04', '08:00 AM - 12:00 PM', 'Dr.Thinesh (Perubatan)', 2, 50, 'Admin', 0, '2026-09-03 08:38:54', '2026-09-17 04:37:48'),
(48, 'CME', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME</p>', 'draft', '2026-09-04', '03:00 PM - 04:00 PM', 'Pengurusan (Perolehan, Aset & Stor)', 2, 51, 'Admin', 0, '2026-09-03 08:38:54', '2026-09-17 04:57:41'),
(49, 'Mesyuarat Pegawai Penyiasatan Kes Aduan', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesyuarat Pegawai Penyiasatan Kes Aduan</p>', 'draft', '2026-09-04', '08:00 AM - Selesai', 'Pn Mazlin (Pentadbiran)', 1, 52, 'Admin', 0, '2026-09-03 08:38:54', '2026-09-03 08:38:54'),
(50, 'Lawatan Dietetik Klinikal', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Lawatan Dietetik Klinikal</p>', 'draft', '2026-09-07', '09:00 AM - 05:00 PM', 'Unit Sajian', 2, 53, 'Admin', 0, '2026-09-03 08:38:54', '2026-09-17 04:55:25'),
(53, 'Jemaah Dokter Perkeso', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Jemaah Dokter Perkeso</p>', 'draft', '2026-09-09', '02:00 PM - 05:00 PM', 'Pengurusan', 1, 56, 'Admin', 0, '2026-09-03 08:38:54', '2026-09-17 04:55:26'),
(54, 'Bengkel Asas Keselamatan Kebakaran Bil.2/2026', 'memo', 'Memo', '#9C27B0', 0, '', '<p></p>', 'draft', '2026-09-09', '08:00 AM - 05:00 PM', 'SMA Kurin (Jabatan Kejururawatan)', 3, 57, 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 0, '2026-09-03 08:38:54', '2026-09-17 04:37:44'),
(55, 'Mesy. VCM & PSH', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesy. VCM &amp; PSH</p>', 'draft', '2026-09-10', '08:30 AM - 11:00 AM', 'En.Syafiq (Pentadbiran)', 2, 58, 'Admin', 0, '2026-09-03 08:38:54', '2026-09-03 08:38:54'),
(56, 'Mesy. Morbility Review', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesy. Morbility Review</p>', 'draft', '2026-09-10', '02:00 PM - Selesai', 'SMA Azuwan (Jabatan Kejururawatan)', 2, 59, 'Admin', 0, '2026-09-03 08:38:54', '2026-09-03 08:38:54'),
(57, 'Kelas Agama Muslimah - Doa-Doa Mustajab Wanita Dan Zikir-Zikir Harian', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kelas Agama Muslimah - Doa-Doa Mustajab Wanita Dan Zikir-Zikir Harian</p>', 'draft', '2026-09-10', '02:00 PM - 05:00 PM', 'JM Zuhailah (Pentadbiran)', 1, 60, 'Admin', 0, '2026-09-03 08:38:54', '2026-09-17 04:37:52'),
(58, 'Kursus BLS Bil.1/2026', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kursus BLS Bil.1/2026</p>', 'draft', '2026-09-10', '08:00 AM - 05:00 PM', 'SMA Azuwan (Jabatan Kejururawatan)', 3, 61, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-03 08:38:55'),
(59, 'Persiapan Majlis Perpisahan', 'memo', 'Memo', '#9C27B0', 0, '', '<p></p>', 'draft', '2026-09-11', '08:00 AM', 'Pentadbiran', 2, 62, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-03 08:38:55', '2026-09-17 05:55:32'),
(60, 'Perhimpunan Bulanan Bil.9/2026', 'memo', 'Memo', '#9C27B0', 0, '', '<p></p>', 'draft', '2026-09-11', '03:00 PM - 04:00 PM', 'Carakerja & Kebajikan', 2, 63, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-03 08:38:55', '2026-09-17 05:55:12'),
(61, 'CME (PPP & PPK)', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME (PPP &amp; PPK)</p>', 'draft', '2026-09-11', '02:00 PM - 04:00 PM', 'SMA Kurin (Jabatan Kejururawatan)', 1, 64, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-03 08:38:55'),
(62, 'Kursus Woundcare', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kursus Woundcare</p>', 'draft', '2026-09-14', '08:00 AM - Selesai', 'Sr.Louisiana (Jabatan Kejururawatan)', 2, 65, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-03 08:38:55'),
(63, 'Kursus Woundcare', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kursus Woundcare</p>', 'draft', '2026-09-15', '08:00 AM - Selesai', 'Sr.Louisiana (Jabatan Kejururawatan)', 2, 66, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-03 08:38:55'),
(64, 'Patient Safety Day', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Patient Safety Day</p>', 'published', '2026-09-17', '08:00 AM - 05:00 PM', 'Sr.Liza (Jabatan Kejururawatan)', 2, 67, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-03 08:43:29'),
(65, 'CME', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME</p>', 'published', '2026-09-18', '03:00 PM - 04:00 PM', 'HDU', 2, 68, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-21 06:34:51'),
(66, 'CME (PPP & PPK)', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME (PPP &amp; PPK)</p>', 'draft', '2026-09-18', '02:00 PM - 04:00 PM', 'SMA Kurin (Jabatan Kejururawatan)', 1, 69, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-03 08:38:55'),
(67, 'Klinik Katarak', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Klinik Katarak</p>', 'draft', '2026-09-21', '08:00 AM - 05:00 PM', 'SMA Green Wong (Jabatan Kejururawatan)', 3, 70, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-03 08:38:55'),
(68, 'Kursus Orientasi', 'latihan', 'Latihan', '#0C7B93', 0, '', '<p></p>', 'published', '2026-09-22', '08:00 AM - 05:00 PM', 'Pn. Norlida (Pentadbiran)', 2, 71, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-03 08:38:55', '2026-09-17 05:56:27'),
(69, 'Klinik Katarak', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Klinik Katarak</p>', 'draft', '2026-09-22', '08:00 AM - 05:00 PM', 'SMA Green Wong (Jabatan Kejururawatan)', 3, 72, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-03 08:38:55'),
(70, 'Kursus Kawalan Infeksi Utk Staf Klinikal', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kursus Kawalan Infeksi Utk Staf Klinikal</p>', 'published', '2026-09-23', '08:00 AM - Selesai', 'SN Matina (Jabatan Kejururawatan)', 2, 73, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-21 04:47:46'),
(71, 'Kursus Kawalan Infeksi Utk Staf Non Klinikal', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kursus Kawalan Infeksi Utk Staf Non Klinikal</p>', 'published', '2026-09-24', '08:00 AM - Selesai', 'SN Matina (Jabatan Kejururawatan)', 2, 74, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-21 04:47:52'),
(72, 'CME (PPP & PPK)', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME (PPP &amp; PPK)</p>', 'published', '2026-09-25', '02:00 PM - 04:00 PM', 'SMA Kurin (Jabatan Kejururawatan)', 2, 75, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-21 04:47:53'),
(73, 'Medical Department Meeting Bil.3', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Medical Department Meeting Bil.3</p>', 'published', '2026-09-25', '02:30 PM - Selesai', 'Sr. Linda (Jabatan Kejururawatan)', 1, 76, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-21 04:47:55'),
(74, 'Mesyuarat AJK Nursing Dinner', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesyuarat AJK Nursing Dinner</p>', 'published', '2026-09-28', '02:30 PM - Selesai', 'Sr. Liza (Jabatan Kejururawatan)', 1, 77, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-17 05:56:52'),
(75, 'HPIA Cheking File', 'memo', 'Memo', '#9C27B0', 0, '', '<p>HPIA Cheking File</p>', 'published', '2026-09-29', '09:00 AM - 05:00 PM', 'Sr. Liza (Jabatan Kejururawatan)', 1, 78, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-21 04:47:58'),
(76, 'HPIA Cheking File', 'memo', 'Memo', '#9C27B0', 0, '', '<p>HPIA Cheking File</p>', 'published', '2026-09-30', '09:00 AM - 05:00 PM', 'Sr. Liza (Jabatan Kejururawatan)', 1, 79, 'Admin', 0, '2026-09-03 08:38:55', '2026-09-21 04:47:58'),
(77, 'Taklimat PPK Modul 2', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Taklimat PPK Modul 2</p>', 'draft', '2026-09-07', '08:00 AM - 09:00 AM', 'PPK Tarmize (Jabatan Kejururawatan)', 1, 80, 'Admin', 0, '2026-09-10 15:47:05', '2026-09-10 18:33:14'),
(78, 'Audit Klinikal PPP', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Audit Klinikal PPP</p>', 'draft', '2026-09-07', '09:30 AM - Selesai', 'SMA Joshua (Jabatan Kejururawatan)', 1, 81, 'Admin', 0, '2026-09-10 15:47:05', '2026-09-10 15:47:05'),
(79, 'Audit Klinikal PPP', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Audit Klinikal PPP</p>', 'draft', '2026-09-08', '08:00 AM - Selesai', 'SMA Joshua (Jabatan Kejururawatan)', 1, 82, 'Admin', 0, '2026-09-10 15:47:05', '2026-09-10 15:47:05'),
(80, 'Taklimat ETD', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Taklimat ETD</p>', 'draft', '2026-09-11', '08:00 AM - Selesai', 'SMA Azuwan (Jabatan Kejururawatan)', 1, 83, 'Admin', 0, '2026-09-10 15:47:05', '2026-09-10 15:47:05'),
(81, 'Taklimat PPK Modul 2', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Taklimat PPK Modul 2</p>', 'draft', '2026-09-14', '08:00 AM - 09:00 AM', 'PPK Tarmize (Jabatan Kejururawatan)', 1, 84, 'Admin', 0, '2026-09-10 15:47:05', '2026-09-10 18:33:14'),
(82, 'Taklimat PPK Modul 2', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Taklimat PPK Modul 2</p>', 'draft', '2026-09-21', '08:00 AM - 09:00 AM', 'PPK Tarmize (Jabatan Kejururawatan)', 1, 85, 'Admin', 0, '2026-09-10 15:47:05', '2026-09-10 18:33:14'),
(83, 'Kursus Dokumentasi', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kursus Dokumentasi</p>', 'published', '2026-09-23', '08:00 AM - 05:00 PM', 'Sr.Christina (Jabatan Kejururawatan)', 3, 86, 'Admin', 0, '2026-09-10 15:47:05', '2026-09-17 05:56:41'),
(84, 'Kursus Dokumentasi', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kursus Dokumentasi</p>', 'published', '2026-09-24', '08:00 AM - 05:00 PM', 'Sr.Christina (Jabatan Kejururawatan)', 3, 87, 'Admin', 0, '2026-09-10 15:47:05', '2026-09-17 05:56:42'),
(87, 'MAC meeting', 'memo', 'Memo', '#9C27B0', 0, '', '<p>MAC meeting</p>', 'draft', '2026-10-01', '02:30 PM - Selesai', 'Tidak dinyatakan', 1, 90, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:55:26'),
(88, 'CME (PPP & PPK)', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME (PPP &amp; PPK)</p>', 'draft', '2026-10-02', '02:00 PM - 04:00 PM', 'SMA Kurin (Jabatan Kejururawatan)', 1, 91, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(89, 'Mesy. MMR ETD Bersama Pengarah', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesy. MMR ETD Bersama Pengarah</p>', 'draft', '2026-10-05', '09:00 AM - Selesai', 'SMA Azuwan (Jabatan Kejururawatan)', 2, 92, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(90, 'Kursus BLS Bil.2/2026', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kursus BLS Bil.2/2026</p>', 'draft', '2026-10-06', '08:00 AM - 05:00 PM', 'SMA Azuwan (Jabatan Kejururawatan)', 3, 93, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(91, 'Mesy. HIACC Bil.3/2026', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesy. HIACC Bil.3/2026</p>', 'draft', '2026-10-07', '02:00 PM - 05:00 PM', 'SN Matina (Jabatan Kejururawatan)', 2, 94, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(92, 'Meeting Qrimat Bil.4/2026', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Meeting Qrimat Bil.4/2026</p>', 'draft', '2026-10-08', '08:00 AM - 01:00 PM', 'Sr. Liza (Jabatan Kejururawatan)', 2, 95, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(93, 'CME (PPP & PPK)', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME (PPP &amp; PPK)</p>', 'draft', '2026-10-08', '02:00 PM - 04:00 PM', 'SMA Kurin (Jabatan Kejururawatan)', 2, 96, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(94, 'Kelas Agama Muslimah - Mengurus Cabaran Hidup Dengan Tawakal', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kelas Agama Muslimah - Mengurus Cabaran Hidup Dengan Tawakal</p>', 'draft', '2026-10-08', '02:00 PM - 05:00 PM', 'JM Zuhailah (Pentadbiran)', 1, 97, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(95, 'Jemaah Dokter Perkeso', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Jemaah Dokter Perkeso</p>', 'draft', '2026-10-09', '02:00 PM - 05:00 PM', 'Tidak dinyatakan', 1, 99, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:55:26'),
(96, 'CME', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME</p>', 'published', '2026-10-09', '03:00 PM - 04:00 PM', 'WAD BERSALIN', 2, 98, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-21 06:35:03'),
(97, 'Pelancaran Projek Perincis MyPhIS 3.0', 'memo', 'Memo', '#9C27B0', 0, '', '<p></p>', 'published', '2026-10-12', '08:00 AM - 05:00 PM', 'Farmasi (Unit Farmasi)', 2, 100, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 05:57:18'),
(98, 'Pelancaran Projek Perincis MyPhIS 3.0', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Pelancaran Projek Perincis MyPhIS 3.0</p>', 'draft', '2026-10-12', '08:00 AM - 05:00 PM', 'Farmasi (Unit Farmasi)', 1, 101, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(99, 'Meeting P&A Bil.4/2026', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Meeting P&amp;A Bil.4/2026</p>', 'draft', '2026-10-15', '08:00 AM - 01:00 PM', 'Sr. Liza (Jabatan Kejururawatan)', 2, 102, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(100, 'CME (PPP & PPK)', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME (PPP &amp; PPK)</p>', 'draft', '2026-10-16', '02:00 PM - 04:00 PM', 'SMA Kurin (Jabatan Kejururawatan)', 1, 104, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(101, 'Perhimpunan Bulanan Bil.10/2026', 'penting', 'Penting', '#E74C3C', 1, '', '<p></p>', 'published', '2026-10-16', '03:00 PM - 04:00 PM', 'CSSD & DEWAN BEDAH', 2, 103, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 05:57:27'),
(102, 'Lawatan Dietetik Klinikal', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Lawatan Dietetik Klinikal</p>', 'draft', '2026-10-19', '09:00 AM - 05:00 PM', 'Unit Sajian', 2, 105, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:55:26'),
(103, 'Pain Kursus', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Pain Kursus</p>', 'draft', '2026-10-20', '08:00 AM - 05:00 PM', 'Sr. Liza (Jabatan Kejururawatan)', 2, 106, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(104, 'Pain Kursus', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Pain Kursus</p>', 'draft', '2026-10-21', '08:00 AM - 05:00 PM', 'Sr. Liza (Jabatan Kejururawatan)', 2, 107, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(105, 'CME (PPP & PPK)', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME (PPP &amp; PPK)</p>', 'draft', '2026-10-23', '02:00 PM - 04:00 PM', 'SMA Kurin (Jabatan Kejururawatan)', 1, 109, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(106, 'CME', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME</p>', 'published', '2026-10-23', '03:00 PM - 04:00 PM', 'WAD LELAKI', 2, 108, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-21 06:35:12'),
(107, 'Jemaah Dokter Perkeso', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Jemaah Dokter Perkeso</p>', 'draft', '2026-11-06', '02:00 PM - 05:00 PM', 'Tidak dinyatakan', 1, 111, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:55:26'),
(108, 'CME', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME</p>', 'draft', '2026-11-06', '03:00 PM - 04:00 PM', 'ETD (PPP & PPK)', 2, 110, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:55:39'),
(109, 'Lawatan Dietetik Klinikal', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Lawatan Dietetik Klinikal</p>', 'draft', '2026-11-09', '09:00 AM - 05:00 PM', 'Unit Sajian', 2, 112, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:55:26'),
(110, 'Kelas Agama Muslimah - Musahabah Akhir Tahun Dan Perancangan 2027', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Kelas Agama Muslimah - Musahabah Akhir Tahun Dan Perancangan 2027</p>', 'draft', '2026-11-12', '02:00 PM - 05:00 PM', 'JM Zuhailah (Pentadbiran)', 1, 113, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(111, 'Perhimpunan Bulanan Bil.11/2026', 'penting', 'Penting', '#E74C3C', 1, '', '<p></p>', 'published', '2026-11-13', '03:00 PM - 04:00 PM', 'REKOD PERUBATAN & KLINIK PAKAR', 2, 114, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 05:57:43'),
(112, 'CME', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME</p>', 'published', '2026-11-20', '03:00 PM - 04:00 PM', 'FORENSIK', 2, 115, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-21 06:35:17'),
(113, 'Klinikal Audit', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Klinikal Audit</p>', 'draft', '2026-11-27', '10:00 AM - Selesai', 'JM Ronie (Jabatan Kejururawatan)', 1, 116, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:54:03'),
(114, 'Jemaah Dokter Perkeso', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Jemaah Dokter Perkeso</p>', 'draft', '2026-12-04', '02:00 PM - 05:00 PM', 'Tidak dinyatakan', 1, 118, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:55:26'),
(115, 'CME', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME</p>', 'published', '2026-12-04', '03:00 PM - 04:00 PM', 'UPP', 2, 117, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-21 06:35:22'),
(116, 'Lawatan Dietetik Klinikal', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Lawatan Dietetik Klinikal</p>', 'draft', '2026-12-07', '09:00 AM - 05:00 PM', 'Unit Sajian', 2, 119, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 04:55:26'),
(117, 'Perhimpunan Bulanan Bil.12/2026', 'penting', 'Penting', '#E74C3C', 1, '', '<p></p>', 'published', '2026-12-11', '03:00 PM - 04:00 PM', 'FARMASI DALAM & LUAR', 2, 120, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 05:58:00'),
(118, 'Meeting MPSG Bil.3/2026', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Meeting MPSG Bil.3/2026</p>', 'published', '2026-12-17', '08:00 AM - 01:00 PM', 'Sr. Liza (Jabatan Kejururawatan)', 2, 121, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-17 05:57:52'),
(119, 'CME', 'memo', 'Memo', '#9C27B0', 0, '', '<p>CME</p>', 'published', '2026-12-18', '03:00 PM - 04:00 PM', 'KAWALAN PENYAKIT BERJANGKIT', 2, 122, 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 0, '2026-09-17 04:54:03', '2026-09-21 06:35:27'),
(120, 'MPSG Meeting', 'memo', 'Memo', '#9C27B0', 0, '', '<p>MPSG Meeting</p>', 'draft', '2026-10-29', '08:00 AM - Selesai', 'JM Ronie (Unit Kualiti)', 2, 123, 'ZADORA ANAK GUAM (HSERIAN)', 0, '2026-09-18 00:35:19', '2026-09-18 00:35:19'),
(121, 'User Training', 'memo', 'Memo', '#9C27B0', 0, '', '<p>User Training</p>', 'published', '2026-09-24', '02:30 PM - 03:30 PM', 'OMC', 1, 124, 'ZADORA ANAK GUAM (HSERIAN)', 0, '2026-09-21 04:47:04', '2026-09-21 04:47:49'),
(122, 'Lawatan Penyeliaan  dan Pemantauan Bahagian Kejururawatan Ke Fasiliti Kesihatan Negeri Sarawak', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Lawatan Penyeliaan  dan Pemantauan Bahagian Kejururawatan Ke Fasiliti Kesihatan Negeri Sarawak</p>', 'draft', '2026-09-26', '07:30 AM - 03:00 PM', 'Unit Kejururawatan Hospital Serian (Unit Kejururawatan)', 2, 126, 'ZADORA ANAK GUAM (HSERIAN)', 0, '2026-09-21 06:15:05', '2026-09-21 06:15:05'),
(123, 'Mesyuarat Kejururawatan Bil.3/2026', 'memo', 'Memo', '#9C27B0', 0, '', '<p>Mesyuarat Kejururawatan Bil.3/2026</p>', 'draft', '2026-09-21', '02:15 PM - 04:30 PM', 'Unit Kejururawatan Hospital Serian (Unit Kejururawatan)', 1, 125, 'ZADORA ANAK GUAM (HSERIAN)', 0, '2026-09-21 06:15:31', '2026-09-21 06:15:31');

-- --------------------------------------------------------

--
-- Table structure for table `bilik`
--

CREATE TABLE `bilik` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `kapasiti` int(11) NOT NULL,
  `kemudahan` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bilik`
--

INSERT INTO `bilik` (`id`, `nama`, `lokasi`, `kapasiti`, `kemudahan`, `gambar`, `aktif`, `created_at`) VALUES
(1, 'Bilik Mesyuarat Utama', 'Bangunan Pentadbiran', 15, 'Smart TV, WiFi', '', 1, '2026-08-03 02:58:37'),
(2, 'Bilik Persidangan', 'Bangunan Utama', 50, 'Projector, PA System', '', 1, '2026-08-03 02:58:37'),
(3, 'Dewan Alamanda/Bilik Operasi', 'Bangunan Kolej', 200, 'PA System Lengkap, Pentas, Projector', '', 1, '2026-08-03 02:58:37');

-- --------------------------------------------------------

--
-- Table structure for table `borang`
--

CREATE TABLE `borang` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `category` varchar(100) NOT NULL,
  `cat_label` varchar(100) NOT NULL,
  `version` varchar(50) DEFAULT '—',
  `doc_date` varchar(50) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `uploader` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `borang`
--

INSERT INTO `borang` (`id`, `name`, `category`, `cat_label`, `version`, `doc_date`, `size`, `type`, `uploader`, `description`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 'Borang Meninggalkan Pejabat', 'umum', 'Umum', 'v1.0', '01 Jan 2024', '68 KB', 'pdf', 'Unit HR', 'Borang permohonan untuk meninggalkan pejabat dalam waktu bekerja.', 'Dokumen/umum/KEBENARAN_MENINGGALKAN_PEJABAT.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(2, 'Borang WP (Waktu Peringkat)', 'umum', 'Umum', 'v1.0', '01 Jan 2024', '62 KB', 'pdf', 'Unit HR', 'Borang pertukaran Waktu Peringkat (WP) bekerja.', 'Dokumen/umum/BORANG_WP.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(4, 'Borang Permohonan Cuti Bersalin', 'umum', 'Umum', 'v1.0', '01 Jan 2024', '49 KB', 'pdf', 'Unit HR', 'Borang cuti bersalin bagi pegawai perkhidmatan awam.', 'Dokumen/umum/BORANG_PERMOHONAN_CUTI_BERSALIN.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(5, 'Borang Cuti Kematian Ahli Keluarga Terdekat', 'umum', 'Umum', 'v1.0', '01 Jan 2024', '111 KB', 'pdf', 'Unit HR', 'Borang kemudahan cuti tanpa rekod bagi urusan kematian ahli keluarga terdekat.', 'Dokumen/umum/BORANG_CUTI_KEMATIAN_AHLI_KELUARGA_TERDEKAT.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(6, 'Borang Cuti Tanpa Gaji (Urusan Persendirian)', 'pengurusan', 'Bahagian Khidmat Pengurusan', 'v1.0', '01 Jan 2024', '110 KB', 'pdf', 'BKP', 'Borang permohonan Cuti Tanpa Gaji.', 'Dokumen/Bahagian Khidmat Pengurusan/BORANG_PERMOHONAN_CUTI_TANPA_GAJI_URUSAN_PERSENDIRIAN.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(7, 'Borang Cuti Separuh Gaji', 'pengurusan', 'Bahagian Khidmat Pengurusan', 'v1.0', '01 Jan 2024', '109 KB', 'pdf', 'BKP', 'Borang permohonan Cuti Separuh Gaji.', 'Dokumen/Bahagian Khidmat Pengurusan/BORANG_PERMOHONAN_CUTI_SEPARUH_GAJI.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(8, 'Borang Cuti Tanpa Rekod', 'pengurusan', 'Bahagian Khidmat Pengurusan', 'v1.0', '01 Jan 2024', '120 KB', 'pdf', 'BKP', 'Borang permohonan Cuti Tanpa Rekod.', 'Dokumen/Bahagian Khidmat Pengurusan/BORANG_PERMOHONAN_CUTI_TANPA_REKOD.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(11, 'Borang Tempahan Makanan', 'pengurusan', 'Bahagian Khidmat Pengurusan', 'v1.0', '01 Jan 2024', '25 KB', 'docx', 'BKP', 'Borang tempahan makan minum bagi mesyuarat atau acara rasmi.', 'Dokumen/Bahagian Khidmat Pengurusan/borang-makan.docx', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(12, 'Borang Permohonan Bekalan Barang Runcit', 'pengurusan', 'Bahagian Khidmat Pengurusan', 'v1.0', '01 Jan 2024', '24 KB', 'docx', 'BKP', 'Permohonan bekalan barang stor pejabat.', 'Dokumen/Bahagian Khidmat Pengurusan/borang-runcit.docx', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(13, 'Borang Pengurusan Emel (Individu / Kumpulan)', 'bpm', 'Bahagian Pengurusan Maklumat', 'v1.0', '01 Jan 2024', '107 KB', 'pdf', 'BPM', 'Borang pendaftaran, pindaan atau pembatalan akaun emel.', 'Dokumen/Bahagian Pengurusan Maklumat/Borang_Pengurusan_Email_-individugroup_v2.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(14, 'Borang Pinjaman Peralatan ICT', 'bpm', 'Bahagian Pengurusan Maklumat', 'v1.0', '01 Jan 2024', '129 KB', 'pdf', 'BPM', 'Borang pinjaman sementara peralatan ICT.', 'Dokumen/Bahagian Pengurusan Maklumat/KEW.PA-9_BORANG_PERMOHONAN_PERGERAKAN_PINJAMAN_ASET_ALIH_.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(15, 'Borang Network Service Request Form (NSRF)', 'bpm', 'Bahagian Pengurusan Maklumat', 'v1.0', '01 Jan 2024', '235 KB', 'pdf', 'BPM', 'Borang permohonan perkhidmatan rangkaian dan port internet.', 'Dokumen/Bahagian Pengurusan Maklumat/Network_Service_Request_Form_NSRF_v1.2_.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(16, 'Borang Perubatan 1-09', 'kejururawatan', 'Bahagian Kejururawatan & Kewangan', 'v1.0', '01 Jan 2024', '176 KB', 'pdf', 'Kewangan', 'Borang permohonan perbelanjaan kemudahan perubatan 1-09.', 'Dokumen/Bahagian Kewangan/Borang_Perubatan_1-09.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(17, 'Borang Perubatan 2-09', 'kejururawatan', 'Bahagian Kejururawatan & Kewangan', 'v1.0', '01 Jan 2024', '131 KB', 'pdf', 'Kewangan', 'Borang permohonan perbelanjaan kemudahan perubatan 2-09.', 'Dokumen/Bahagian Kewangan/Borang_Perubatan_2-09.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(18, 'Borang Pendaftaran AMOTeX', 'ppp', 'Caw. Penolong Pegawai Perubatan', 'v1.0', '01 Jan 2024', '149 KB', 'pdf', 'Cawangan PPP', 'Borang pendaftaran sistem AMOTeX.', 'Dokumen/Cawangan Perkhidmatan Penolong Pegawai Perubatan/Borang_Pendaftaran_AMOTeX_kemaskini_19Okt2023.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(19, 'Borang Pembaharuan AMOTeX', 'ppp', 'Caw. Penolong Pegawai Perubatan', 'v1.0', '01 Jan 2024', '135 KB', 'pdf', 'Cawangan PPP', 'Borang pembaharuan pendaftaran AMOTeX.', 'Dokumen/Cawangan Perkhidmatan Penolong Pegawai Perubatan/Borang_Pembaharuan_AMOTeX_kemaskini_19Okt2023.pdf', '2026-08-11 02:14:14', '2026-08-11 02:14:14'),
(23, 'Borang Pemohonan Penggunaan Kenderaan', 'umum', 'Umum', 'v1.0', '11 Ogos 2026', '84 KB', 'pdf', 'Admin', '', 'Dokumen/uploads/borang/borang_1786416552_e547367e.pdf', '2026-08-11 02:49:12', '2026-08-11 02:49:12');

-- --------------------------------------------------------

--
-- Table structure for table `dokumen`
--

CREATE TABLE `dokumen` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `category` varchar(100) NOT NULL,
  `cat_label` varchar(100) NOT NULL,
  `version` varchar(50) DEFAULT '—',
  `doc_date` varchar(50) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `uploader` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dokumen`
--

INSERT INTO `dokumen` (`id`, `name`, `category`, `cat_label`, `version`, `doc_date`, `size`, `type`, `uploader`, `description`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 'Policy Credentialing & Privileging Hospital Serian', 'polisi-klinikal', 'Polisi Klinikal', '4.0', '2023', '8.7 MB', 'pdf', 'Pentadbiran', 'Polisi kelayakan dan keistimewaan klinikal untuk kakitangan perubatan Hospital Serian.', 'Sop %26 Policy/01 Policy Credentialing and Priviledging Hospital Serian.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(2, 'OSH Policy (Occupational Safety & Health)', 'polisi-pentadbiran', 'Polisi Pentadbiran', '2.0', '2023', '13.0 MB', 'pdf', 'Unit KKP', 'Polisi Keselamatan dan Kesihatan Pekerjaan Hospital Serian.', 'Sop %26 Policy/02 OSH Policy 2023.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(3, 'Polisi JKKP (Jawatankuasa Keselamatan & Kesihatan)', 'polisi-pentadbiran', 'Polisi Pentadbiran', '2.0', '2023', '1.0 MB', 'pdf', 'Unit KKP', 'Polisi Jawatankuasa Keselamatan dan Kesihatan Pekerjaan.', 'Sop %26 Policy/02 Polisi JKKP 2023-2026(2).pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(4, 'Policy Infection Control', 'polisi-klinikal', 'Polisi Klinikal', 'Edisi 5', '2023', '18.3 MB', 'pdf', 'Unit Kawalan Jangkitan', 'Polisi kawalan jangkitan merangkumi prosedur pencegahan dan pelaporan.', 'Sop %26 Policy/05 Policy inf. control 2023-2026(5) (1).pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(5, 'Patient & Family Rights Policy', 'polisi-klinikal', 'Polisi Klinikal', 'V2.0 / E4.0', '2023', '30.5 MB', 'pdf', 'Pentadbiran', 'Polisi hak pesakit dan keluarga Hospital Serian.', 'Sop %26 Policy/06 PT fmly Right policy 23-26.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(6, 'AMRO Policy (Antimicrobial Resistance)', 'polisi-klinikal', 'Polisi Klinikal', 'V2.0 / E1.0', '2023', '3.8 MB', 'pdf', 'Farmasi', 'Polisi rintangan antimikrob dan pengurusan antibiotik.', 'Sop %26 Policy/07 Amro 23-2026.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(7, 'Medical Operational Policy', 'polisi-jabatan', 'Polisi Jabatan', 'Edisi 3', '2023', '22.0 MB', 'pdf', 'Jabatan Perubatan', 'Polisi operasi jabatan perubatan Hospital Serian.', 'Sop %26 Policy/09a Medical operationl Policy 2023.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(8, 'Policy O&G (Obstetrics & Gynaecology)', 'polisi-jabatan', 'Polisi Jabatan', '8.0', '2023', '25.4 MB', 'pdf', 'Jabatan O&G', 'Polisi operasi Jabatan Obstetrik dan Ginekologi.', 'Sop %26 Policy/09c Policy O%26G.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(9, 'Policy O&G (Versi DOCX)', 'polisi-jabatan', 'Polisi Jabatan', '2023-2026', '2023', '1.2 MB', 'docx', 'Jabatan O&G', 'Versi Word polisi Jabatan O&G.', 'Sop %26 Policy/09c Policy O%26G 2023-  FINAL.docx', '2026-08-03 05:09:07', '2026-08-03 05:09:07'),
(10, 'Psychiatry Operational Policy', 'polisi-jabatan', 'Polisi Jabatan', '2.0', '2023', '16.4 MB', 'pdf', 'Jabatan Psikiatri', 'Polisi operasi unit Psikiatri Hospital Serian.', 'Sop %26 Policy/09i PSY - Operational Policy.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(11, 'Operating Suite Policy', 'polisi-jabatan', 'Polisi Jabatan', '2.0', '2023', '4.1 MB', 'pdf', 'Jabatan Pembedahan', 'Polisi pengurusan dewan bedah Hospital Serian.', 'Sop %26 Policy/11 operating suite 23-2026 (1).pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(12, 'Haemodialisis Operational Policy', 'polisi-jabatan', 'Polisi Jabatan', '4.0', '2023', '1.7 MB', 'pdf', 'Unit Haemodialisis', 'Polisi operasi unit haemodialisis.', 'Sop %26 Policy/13c HAEMODIALISIS.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(13, 'Pathology & Blood Transfusion Dept Policy', 'polisi-jabatan', 'Polisi Jabatan', 'V6.0 / E5.0', '2023', '8.8 MB', 'pdf', 'Jabatan Patologi', 'Polisi operasi am Jabatan Patologi dan Pemindahan Darah.', 'Sop %26 Policy/15 16 General Operational Policy version 6 of Pathology and Blood Transfusion Department Hospital Serian.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(14, 'Medical Social Worker Policy', 'polisi-jabatan', 'Polisi Jabatan', 'V2.0 / E3.0', '2023', '6.6 MB', 'pdf', 'Unit MSW', 'Polisi operasi Pekerja Sosial Perubatan.', 'Sop %26 Policy/17 H Medical social Worker 23-26.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(15, 'Fisioterapi Operational Policy', 'polisi-jabatan', 'Polisi Jabatan', 'V2.0 / E4.0', '2022', '3.4 MB', 'pdf', 'Unit Fisioterapi', 'Polisi operasi Unit Fisioterapi.', 'Sop %26 Policy/17A Fisioterapi 22-25.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(16, 'Occupational Therapy Policy', 'polisi-jabatan', 'Polisi Jabatan', 'V3.0 / E4.0', '2023', '6.8 MB', 'pdf', 'Unit OT', 'Polisi operasi Unit Terapi Pekerjaan.', 'Sop %26 Policy/17B Occ Therapy 2023-2026.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(17, 'PPP Policy (Public-Private Partnership)', 'polisi-pentadbiran', 'Polisi Pentadbiran', '2.0', '2023', '7.3 MB', 'pdf', 'Pentadbiran', 'Polisi Perkongsian Awam-Swasta Hospital Serian.', 'Sop %26 Policy/25 PPP Policy.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(18, 'Credentialing & Privileging (Versi DOCX)', 'borang', 'Borang & Templat', '2023-2026', '2023', '154 KB', 'docx', 'Pentadbiran', 'Templat dokumen C&P dalam format Word.', 'Sop %26 Policy/C%26P 23-2026.docx', '2026-08-03 05:09:07', '2026-08-03 05:09:07'),
(19, 'Infection Control Unit Operational Policy', 'polisi-klinikal', 'Polisi Klinikal', 'Edisi 5', '2023', '14.7 MB', 'pdf', 'Unit Kawalan Jangkitan', 'Polisi operasi Unit Kawalan Jangkitan.', 'Sop %26 Policy/INFECTION CONTROL UNIT OPERATIONAL POLICY.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(20, 'Senarai Polisi Hospital Serian', 'lain', 'Lain-lain', '—', '2023', '17 KB', 'docx', 'Pentadbiran', 'Senarai lengkap semua polisi Hospital Serian.', 'Sop %26 Policy/LIST OF POLICY.docx', '2026-08-03 05:09:07', '2026-08-03 05:09:07'),
(21, 'Surat Lantikan JK Patient & Family Rights', 'lain', 'Lain-lain', '—', '2023', '477 KB', 'pdf', 'Pentadbiran', 'Surat pelantikan ahli jawatankuasa hak pesakit dan keluarga.', 'Sop %26 Policy/Lantikan Pt Family Right.pdf', '2026-08-03 05:09:07', '2026-08-03 05:09:07'),
(22, 'Medical Staff By-Laws (DOCX)', 'bylaws', 'Undang-undang Kecil', '2023-2026', '2023', '293 KB', 'doc', 'Pentadbiran', 'Undang-undang kecil kakitangan perubatan (versi Word).', 'Sop %26 Policy/MEDICAL STAFF BY-LAWS HOSPITAL SERIAN 2023-2026.doc', '2026-08-03 05:09:07', '2026-08-03 05:09:07'),
(23, 'Medical Staff By-Laws (Final PDF)', 'bylaws', 'Undang-undang Kecil', '2023', '2023', '2.5 MB', 'pdf', 'Pentadbiran', 'Undang-undang kecil kakitangan perubatan (versi akhir).', 'Sop %26 Policy/Medical Staff By laws 2023 Final.pdf', '2026-08-03 05:09:07', '2026-08-03 05:09:07'),
(24, 'Policy for Outbreak Management', 'polisi-klinikal', 'Polisi Klinikal', '1.0', '2023', '1.5 MB', 'pdf', 'Unit Kawalan Jangkitan', 'Polisi pengurusan wabak dan insiden jangkitan.', 'Sop %26 Policy/POLICY FOR OUTBREAK.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(25, 'Policy of Reuse Disposable Items', 'polisi-klinikal', 'Polisi Klinikal', 'V2.0 / E1.0', '2023', '4.3 MB', 'pdf', 'Pentadbiran', 'Polisi penggunaan semula barangan pakai buang.', 'Sop %26 Policy/POLICY OF REUSE DISP.ITEM.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(26, 'Polisi Jawatankuasa POCT', 'polisi-klinikal', 'Polisi Klinikal', 'V2.0 / E1.0', '2023', '2.8 MB', 'pdf', 'Jabatan Patologi', 'Polisi ujian di tempat rawatan (Point-of-Care Testing).', 'Sop %26 Policy/POLISI JAWATANKUASA POCT VERSI 2.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(27, 'Policy Privilege Kluster SGH', 'polisi-klinikal', 'Polisi Klinikal', '3.0', '2023', '1.1 MB', 'pdf', 'Pentadbiran', 'Polisi keistimewaan kluster Hospital Umum Sarawak.', 'Sop %26 Policy/Policy Priviledge Kluster SGH.pdf', '2026-08-03 05:09:07', '2026-08-11 04:49:36'),
(28, 'Policy for Nursing in Hospital Serian', 'polisi-jabatan', 'Polisi Jabatan', '2023', '20 Sep 2023', '222 KB', 'docx', 'Jabatan Kejururawatan', 'Polisi kejururawatan Hospital Serian.', 'Sop %26 Policy/Policy for Nursing in Serian Hospital 20.9.2023.docx', '2026-08-03 05:09:07', '2026-08-03 05:09:07'),
(29, 'Service Standard Fisioterapi', 'lain', 'Lain-lain', '—', '2023', '44 KB', 'pptx', 'Unit Fisioterapi', 'Pembentangan piawaian perkhidmatan Fisioterapi.', 'Sop %26 Policy/srvce standard 17A.pptx', '2026-08-03 05:09:07', '2026-08-03 05:09:07'),
(30, 'POLISI JABATAN FARMASI', 'polisi', 'Polisi & Garis Panduan', '4.0', '15 Sep 2026', '1.8 MB', 'pdf', 'Admin', '', 'Dokumen/uploads/dokumen/doc_1789441518_0dacac36.pdf', '2026-09-15 03:05:18', '2026-09-15 03:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `tarikh` date DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galeri`
--

INSERT INTO `galeri` (`id`, `image_path`, `title`, `description`, `tarikh`, `sort_order`, `aktif`, `created_at`) VALUES
(5, 'images/galeri/galeri_1788331998_2b521a25.jpg', 'Perhimpunan Bulanan Julai', 'Perhimpunan bulanan(July) dengan sesi suai kenal staf baharu dan penyampaian Anugerah Perkhidmatan Cemerlang 2025.', '2026-07-17', 1, 1, '2026-09-02 06:53:18'),
(6, 'images/galeri/galeri_1788332079_ef21b9da.jpg', 'Sesi Senamrobik Staf Hospital Serian', 'Senamrobik bersama kakitangan Hospital Serian', '2026-07-17', 2, 1, '2026-09-02 06:54:39'),
(7, 'images/galeri/galeri_1788332200_0d07382a.jpg', 'Sambutan Hari Kebangsaan Ke 69 Hospital Serian', 'Menyambut Hari Kemerdekaan yang Ke 69 beserta sesi suai kenal staf baharu dan penyampaian anugerah-anugerah staf.', '2026-08-28', 3, 1, '2026-09-02 06:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `jadual_perancangan`
--

CREATE TABLE `jadual_perancangan` (
  `id` int(11) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `tajuk` varchar(255) NOT NULL,
  `tahun` smallint(6) NOT NULL,
  `masa` varchar(100) DEFAULT NULL,
  `tempat` varchar(255) DEFAULT NULL,
  `tanggungjawab` text DEFAULT NULL,
  `disediakan_nama` varchar(255) DEFAULT NULL,
  `disemak_nama` varchar(255) DEFAULT NULL,
  `disahkan_nama` varchar(255) DEFAULT NULL,
  `dicipta_oleh` varchar(255) DEFAULT NULL,
  `dicipta_pada` datetime NOT NULL,
  `dikemaskini_oleh` varchar(255) DEFAULT NULL,
  `dikemaskini_pada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadual_perancangan`
--

INSERT INTO `jadual_perancangan` (`id`, `jenis`, `tajuk`, `tahun`, `masa`, `tempat`, `tanggungjawab`, `disediakan_nama`, `disemak_nama`, `disahkan_nama`, `dicipta_oleh`, `dicipta_pada`, `dikemaskini_oleh`, `dikemaskini_pada`) VALUES
(1, 'cme', 'JADUAL PERANCANGAN CME HOSPITAL SERIAN BAGI TAHUN 2026', 2026, '3.00 PETANG', 'BILIK PERSIDANGAN / BILIK MESYUARAT, HOSPITAL SERIAN', 'Penganjur hendaklah menyusun atur Bilik Persidangan / Bilik Mesyuarat dan mendapatkan kebenaran menggunakan TV, LCD Projector dan Komputer Riba (jika perlu) daripada Pn. Zadora Guam (Pentadbiran) dan mengisi borang peminjaman aset tersebut.\nPenganjur hendaklah mengeluarkan surat jemputan dan pemakluman kepada semua unit sekurang-kurangnya seminggu atau tiga (3) hari sebelum tarikh \"CME\" diadakan.\nSemua anggota kesihatan adalah digalakkan untuk menghadiri CME bagi menambahkan pengetahuan selain mengumpul mata CPD.\nSila Maklumkan kepada Pn.Zadora Guam atau Pn. Nurul Amirah untuk tempahan fasiliti.\nSebarang perubahan kepada tarikh-tarikh ini hendaklah dibincangkan bersama Pengarah Hospital Serian dan memaklumkan kepada Puan Zadora Guam atau Puan Nurul Amirah Binti Bongsu untuk pindaan tarikh dalam tempahan fasiliti.', 'Zadora anak Guam', 'Nurul Amirah binti Bongsu', 'Dr. Maria binti Mesran', 'system-import@hospitalserian.moh.gov.my', '2026-09-15 15:35:31', 'system-import@hospitalserian.moh.gov.my', '2026-09-15 07:35:31'),
(2, 'perhimpunan', 'JADUAL PERANCANGAN PERHIMPUNAN BULANAN HOSPITAL SERIAN BAGI TAHUN 2026', 2026, '3.00 PETANG', 'BILIK PERSIDANGAN, HOSPITAL SERIAN', 'Penganjur hendaklah menyusun atur bilik persidangan dan mendapatkan kebenaran menggunakan LCD Projector & Komputer Riba (jika diperlukan) daripada Pn. Zadora Guam (Unit Pentadbiran) dan mengisi borang peminjaman aset tersebut.\nSebarang perubahan kepada tarikh-tarikh ini hendaklah dibincangkan bersama Pengarah Hospital Serian dan memaklumkan kepada Puan Zadora Guam atau Puan Nurul Amirah Binti Bongsu untuk pindaan tarikh dalam tempahan bilik persidangan.\nMengeluarkan surat jemputan dan pemakluman kepada semua unit sekurang-kurangnya seminggu atau 3 hari sebelum tarikh perhimpunan.\nPihak Penganjur juga bertanggungjawab mengadakan aktiviti senaman/ zumba dan lain-lain selepas selesai perhimpunan. Pemakaian baju sukan setiap kali perhimpunan adalah amat digalakkan.', 'Zadora anak Guam', 'Nurul Amirah binti Bongsu', 'Dr. Maria binti Mesran', 'system-import@hospitalserian.moh.gov.my', '2026-09-15 15:35:31', 'system-import@hospitalserian.moh.gov.my', '2026-09-15 07:35:31');

-- --------------------------------------------------------

--
-- Table structure for table `jadual_perancangan_sesi`
--

CREATE TABLE `jadual_perancangan_sesi` (
  `id` int(11) NOT NULL,
  `jadual_id` int(11) NOT NULL,
  `tarikh` date NOT NULL,
  `penganjur` varchar(255) DEFAULT NULL,
  `catatan` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadual_perancangan_sesi`
--

INSERT INTO `jadual_perancangan_sesi` (`id`, `jadual_id`, `tarikh`, `penganjur`, `catatan`) VALUES
(1, 1, '2026-01-09', 'PENGURUSAN', ''),
(2, 1, '2026-01-23', 'PENGURUSAN (KEWANGAN)', ''),
(3, 1, '2026-02-06', 'FARMASI', ''),
(4, 1, '2026-02-20', 'KLINIK PAKAR', ''),
(5, 1, '2026-03-06', 'ETD (KEJURURAWATAN)', ''),
(6, 1, '2026-03-20', 'CARA KERJA & KEBAJIKAN SOSIAL', ''),
(7, 1, '2026-04-10', 'FISIOTERAPI', ''),
(8, 1, '2026-04-24', 'SAJIAN', ''),
(9, 1, '2026-05-08', 'WAD PEREMPUAN', ''),
(10, 1, '2026-05-22', 'REKOD PERUBATAN', ''),
(11, 1, '2026-06-05', 'DEWAN BEDAH & CSSD', ''),
(12, 1, '2026-06-19', 'WAD KANAK-KANAK', ''),
(13, 1, '2026-07-10', 'KUALITI', ''),
(14, 1, '2026-07-24', 'X-RAY', ''),
(15, 1, '2026-08-07', 'MAKMAL', ''),
(16, 1, '2026-08-21', 'PSY', ''),
(17, 1, '2026-09-04', 'PENGURUSAN (PEROLEHAN, ASET & STOR)', ''),
(18, 1, '2026-09-18', 'HDU', ''),
(19, 1, '2026-10-09', 'WAD MATERNITI', ''),
(20, 1, '2026-10-23', 'WAD LELAKI', ''),
(21, 1, '2026-11-06', 'ETD (PPP & PPK)', ''),
(22, 1, '2026-11-20', 'FORENSIK', ''),
(23, 1, '2026-12-04', 'UPP', ''),
(24, 1, '2026-12-18', 'KAWALAN PENYAKIT BERJANGKIT', ''),
(25, 2, '2026-01-16', 'X-RAY & WAD LELAKI', ''),
(26, 2, '2026-02-13', 'ETD', 'SAMBUTAN TAHUN BARU CINA (17 - 18 FEBRUARI 2026)'),
(27, 2, '2026-03-13', 'FISIOTERAPI & MAKMAL', 'SAMBUTAN HARI RAYA AIDILFITRI (21 - 23 MAC 2026)'),
(28, 2, '2026-04-17', 'KUALITI & KAWALAN PENYAKIT BERJANGKIT', ''),
(29, 2, '2026-05-15', 'PSY & WAD PEREMPUAN', ''),
(30, 2, '2026-06-12', 'WAD BERSALIN & HDU', 'SAMBUTAN HARI GAWAI (01 - 02 JUN 2026)'),
(31, 2, '2026-07-17', 'PENDIDIKAN & WAD KANAK-KANAK', 'SAMBUTAN HARI SARAWAK (22 JULAI 2026)'),
(32, 2, '2026-08-28', 'PENGURUSAN, JURUTERA & SAJIAN', 'SAMBUTAN HARI KEBANGSAAN (31 OGOS 2026)'),
(33, 2, '2026-09-11', 'CARAKERJA & KEBAJIKAN', 'SAMBUTAN HARI MALAYSIA (16 SEPTEMBER 2026)'),
(34, 2, '2026-10-16', 'CSSD & DEWAN BEDAH', ''),
(35, 2, '2026-11-13', 'REKOD PERUBATAN & KLINIK PAKAR', ''),
(36, 2, '2026-12-11', 'FARMASI DALAM & LUAR', 'SAMBUTAN HARI KRISMAS (25 DISEMBER 2026)');

-- --------------------------------------------------------

--
-- Table structure for table `memo`
--

CREATE TABLE `memo` (
  `id` int(11) NOT NULL,
  `tajuk` varchar(500) NOT NULL,
  `no_rujukan` varchar(150) DEFAULT NULL,
  `tarikh_surat` date NOT NULL,
  `daripada` varchar(255) DEFAULT NULL,
  `jenis` varchar(100) NOT NULL DEFAULT 'Memo',
  `keterangan` text DEFAULT NULL,
  `fail_simpan` varchar(255) NOT NULL,
  `fail_nama` varchar(255) NOT NULL,
  `fail_jenis` varchar(10) NOT NULL,
  `fail_saiz` int(11) NOT NULL,
  `dipapar` tinyint(1) NOT NULL DEFAULT 1,
  `dimuat_naik_oleh` varchar(255) DEFAULT NULL,
  `dicipta_pada` datetime NOT NULL,
  `dikemaskini_pada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `memo`
--

INSERT INTO `memo` (`id`, `tajuk`, `no_rujukan`, `tarikh_surat`, `daripada`, `jenis`, `keterangan`, `fail_simpan`, `fail_nama`, `fail_jenis`, `fail_saiz`, `dipapar`, `dimuat_naik_oleh`, `dicipta_pada`, `dikemaskini_pada`) VALUES
(3, 'JADUAL PERANCANGAN CME & PERHIMPUNAN BULANAN BAGI TAHUN 2026-1', 'HSER.500-6/3/5(34)', '2026-12-16', 'Pengarah Hospital', 'Memo Pentadbiran', 'SEMUA KETUA UNIT,HOSPITAL SERIAN', 'memo_1789462376_d9bd6ba39622.pdf', 'MEMO DALAMAN JADUAL PERANCANGAN CME & PERHIMPUNAN BULANAN BAGI TAHUN 2026-1.pdf', 'pdf', 3366047, 1, 'elvinharrizon@moh.gov.my', '2026-09-15 16:52:56', '2026-09-15 08:52:56'),
(4, 'Pengisiaan Borang Perancangan LDP Program Perubatan & Pengurusan Tahun 2027', 'HSER.500-6/3/5(43)', '2026-09-15', 'Pengarah Hospital', 'Memo Pentadbiran', '', 'memo_1789955432_01cf20417c6e.pdf', 'Pengisiaan Borang Perancangan LDP Program Perubatan & Pengurusan Tahun 2027.pdf', 'pdf', 404020, 1, 'elvinharrizon@moh.gov.my', '2026-09-21 09:50:32', '2026-09-21 01:50:54'),
(5, 'Permohonan Tempahan Fasiliti Melalui Portal Rasmi Intranet Hospital Serian', 'HSER.100-1/3/4(110)', '2026-09-18', 'Timbalan Pengarah Hospital', 'Memo Pentadbiran', '', 'memo_1789955605_9a9088cc12ee.pdf', 'Permohonan Tempahan Fasiliti Melalui Portal Rasmi Intranet Hospital Serian.pdf', 'pdf', 404012, 1, 'elvinharrizon@moh.gov.my', '2026-09-21 09:53:25', '2026-09-21 01:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi_kempen`
--

CREATE TABLE `notifikasi_kempen` (
  `id` int(11) NOT NULL,
  `tajuk` varchar(255) NOT NULL,
  `kandungan_html` mediumtext DEFAULT NULL,
  `imej_json` text DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'draf',
  `sebab_henti` varchar(1000) DEFAULT NULL,
  `sumber_kempen_id` int(11) DEFAULT NULL,
  `dicipta_oleh` varchar(255) DEFAULT NULL,
  `dicipta_pada` datetime NOT NULL,
  `mula_hantar` datetime DEFAULT NULL,
  `selesai_pada` datetime DEFAULT NULL,
  `aktiviti_terakhir` datetime DEFAULT NULL,
  `semakan_bounce` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifikasi_kempen`
--

INSERT INTO `notifikasi_kempen` (`id`, `tajuk`, `kandungan_html`, `imej_json`, `status`, `sebab_henti`, `sumber_kempen_id`, `dicipta_oleh`, `dicipta_pada`, `mula_hantar`, `selesai_pada`, `aktiviti_terakhir`, `semakan_bounce`) VALUES
(1, 'Hebahan: Pelancaran Sistem Intranet Hospital Serian', NULL, NULL, 'diimport', 'Dihantar 11 Sept 2026 sebagai 7 batch BCC, sebelum Penghantaran Individu wujud. Status setiap staf diimport dari peti emel intranethser@gmail.com: 39 dihantar, 11 emel tidak wujud, 103 disekat Gmail (5.7.1 Message rejected).', NULL, 'elvinharrizon@moh.gov.my', '2026-09-11 15:02:52', '2026-09-11 15:03:11', '2026-09-11 15:04:52', '2026-09-11 15:04:52', NULL),
(2, 'Hebahan: Pelancaran Sistem Intranet Hospital Serian', '<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><meta name=\"color-scheme\" content=\"light dark\"><meta name=\"supported-color-schemes\" content=\"light dark\"></head><body style=\"margin:0; padding:0; background:#eef2f7;\"><table role=\"presentation\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"background:#eef2f7; padding:32px 16px; font-family:Arial,Helvetica,sans-serif;\"><tr><td align=\"center\"><table role=\"presentation\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:560px; background:#ffffff; border-radius:10px; overflow:hidden; border:1px solid #dde4ec; box-shadow:0 4px 16px rgba(15,45,80,0.08);\"><tr><td bgcolor=\"#c9a45c\" style=\"background:#c9a45c linear-gradient(135deg,#c9a45c,#dcbb78 60%,#e6c98a); padding:26px 28px 22px;\"><div style=\"color:#1a1a1a !important; font-size:11px; font-weight:700; letter-spacing:0.14em; text-transform:uppercase; margin-bottom:6px;\">Sistem Intranet</div><div style=\"color:#000000 !important; font-size:19px; font-weight:800; letter-spacing:0.02em;\">Hospital Serian</div></td></tr><tr><td bgcolor=\"#a9803c\" style=\"height:3px; line-height:3px; font-size:0; background:#a9803c;\">&nbsp;</td></tr><tr><td bgcolor=\"#ffffff\" style=\"background:#ffffff; padding:30px 28px 12px;\"><table role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin-bottom:18px;\"><tr><td bgcolor=\"#c9a04a\" style=\"width:4px; background:#c9a04a; border-radius:2px;\">&nbsp;</td><td style=\"padding-left:12px; color:#0a2647 !important; font-size:19px; font-weight:800; line-height:1.35;\">Hebahan: Pelancaran Sistem Intranet Hospital Serian</td></tr></table><div style=\"font-size:14px; color:#3a4a5c !important; line-height:1.7;\"><div>Salam sejahtera,</div><div><br></div><div>Tuan/Puan,</div><div><br></div><div>Dengan hormatnya dimaklumkan bahawa Sistem Intranet Hospital Serian kini</div><div>telah beroperasi dan boleh diakses oleh semua warga kerja.</div><div><br></div><div>Pautan sistem:</div><div><a href=\"https://intranethser.duckdns.org/intranet%20hser/\" target=\"_blank\">https://intranethser.duckdns.org/intranet hser/</a><br><br>User Manual :<br><a href=\"https://drive.google.com/drive/folders/1pmFAspBtwhb7t-XYkXVMeH6NDbLxRHfO?usp=sharing\" target=\"_blank\">https://drive.google.com/drive/folders/1pmFAspBtwhb7t-XYkXVMeH6NDbLxRHfO?usp=sharing</a></div><div><br></div><div>Antara kemudahan yang disediakan:</div><div>• Direktori telefon dan senarai kakitangan</div><div>• Dokumen, SOP, pekeliling dan polisi</div><div>• Borang dan e-Borang</div><div>• Tempahan bilik mesyuarat</div><div>• Berita dan hebahan terkini</div><div><br></div><div>Cara log masuk:</div><div>1. Buka pautan di atas</div><div>2. Klik butang \"Log Masuk dengan Google\"</div><div>3. Pilih akaun emel rasmi @<a href=\"http://moh.gov.my/\" target=\"_blank\">moh.gov.my</a> Tuan/Puan</div><div><br></div><div>Perhatian: Sistem ini hanya boleh diakses menggunakan rangkaian hospital</div><div>(WiFi atau LAN Hospital Serian) dan emel rasmi @<a href=\"http://moh.gov.my/\" target=\"_blank\">moh.gov.my</a>.</div><div><br></div><div>Bersama-sama ini disertakan poster hebahan dan manual pengguna untuk</div><div>rujukan Tuan/Puan.</div><div><br></div><div><br></div><div>Sebarang pertanyaan atau masalah capaian, sila hubungi Unit Teknologi</div><div>Maklumat di talian 011-24097634.<br><img src=\"cid:imej1@intranethser\" style=\"max-width:100%; height:auto; display:block; margin:12px 0;\"><br><div>Sekian, terima kasih.</div><div><br></div><div><br><br><br></div><div>Unit Teknologi Maklumat</div><div>Hospital Serian</div></div></div></td></tr><tr><td bgcolor=\"#ffffff\" style=\"background:#ffffff; padding:20px 28px 24px;\"><div style=\"border-top:1px solid #e7ecf1; padding-top:16px; font-size:11px; color:#94a3b8 !important; line-height:1.7;\">This is an automated email from the Hospital Serian Intranet System. Please do not reply to this email.<br>Hospital Serian, Bandar Serian, 94700 Serian, Sarawak, Ministry of Health Malaysia</div></td></tr></table></td></tr></table></body></html>', '[{\"fail\":\"imej1.jpg\",\"cid\":\"imej1@intranethser\",\"name\":\"imej1.jpg\",\"type\":\"image\\/jpeg\"}]', 'dihentikan', 'Gmail menyekat emel (5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585). Penghantaran dihentikan secara automatik supaya akaun tidak disekat lebih teruk. Tunggu sekurang-kurangnya 24 jam sebelum cuba semula.', 1, 'elvinharrizon@moh.gov.my', '2026-09-14 12:13:30', '2026-09-14 12:13:42', NULL, '2026-09-14 12:14:48', '2026-09-14 12:15:36');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi_penerima`
--

CREATE TABLE `notifikasi_penerima` (
  `id` int(11) NOT NULL,
  `kempen_id` int(11) NOT NULL,
  `emel` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'belum',
  `message_id` varchar(255) DEFAULT NULL,
  `dihantar_pada` datetime DEFAULT NULL,
  `ralat` varchar(1000) DEFAULT NULL,
  `dikemaskini_pada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifikasi_penerima`
--

INSERT INTO `notifikasi_penerima` (`id`, `kempen_id`, `emel`, `nama`, `status`, `message_id`, `dihantar_pada`, `ralat`, `dikemaskini_pada`) VALUES
(1, 1, 'abg.mahidzan@moh.gov.my', 'ABANG MAHIDZAN FAISYAL', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(2, 1, 'abangmhd.marzuki@moh.gov.my', 'ABANG MUHAMMAD BIN ABG MARZUKI', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(3, 1, 'abdazim@moh.gov.my', 'ABDUL AZIM BIN MASJAYA', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(4, 1, 'abdul.aziz@moh.gov.my', 'ABDUL AZIZ BIN MATUDIN@ SUDIN', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(5, 1, 'agnes.lilin@moh.gov.my', 'AGNES LILIN ANAK PIUH', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(6, 1, 'ainip0910@moh.gov.my', 'AIN NUKHA BINTI LOKMAN', 'tidak_wujud', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', '5.1.3 smtp; The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. For more information, go to https://support.google.com/mail/?p=NoSuchUser', '2026-09-14 03:47:17'),
(7, 1, 'ainolfirdauz@moh.gov.my', 'AINOL FIRDAUZ BIN AINIE', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(8, 1, 'aleesa.abdullah@moh.gov.my', 'ALEESA BINTI ABDULLAH @ CYNTHIA LENNY AK RUJIM', 'tidak_wujud', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', '5.1.3 smtp; The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. For more information, go to https://support.google.com/mail/?p=NoSuchUser', '2026-09-14 03:47:17'),
(9, 1, 'alice.yasmin@moh.gov.my', 'ALICE YASMIN ANAK NYAIN', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(10, 1, 'amelia.shamini@moh.gov.my', 'AMELIA SHAMINI A/P MUNIANDY', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(11, 1, 'amykle@moh.gov.my', 'AMY ANAK JEKLE', 'tidak_wujud', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', '5.1.3 smtp; The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. For more information, go to https://support.google.com/mail/?p=NoSuchUser', '2026-09-14 03:47:17'),
(12, 1, 'norfazline@moh.gov.my', 'ANGELINE ANAK MATHEW PEROS @ NORFAZLINE BINTI ABDULLAH', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(13, 1, 'arma.carmelia@moh.gov.my', 'ARMA CARMELIA BINTI ABDOL LATEP', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(14, 1, 'arrisardini@moh.gov.my', 'ARRISA ARDINI BINTI HENRY', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(15, 1, 'asan.nyumong@moh.gov.my', 'ASAN ANAK NYUMONG', 'tidak_wujud', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', '5.1.3 smtp; The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. For more information, go to https://support.google.com/mail/?p=NoSuchUser', '2026-09-14 03:47:17'),
(16, 1, 'asniza.anny@moh.gov.my', 'ASNIZA ANAK ANNY', 'tidak_wujud', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', '5.1.3 smtp; The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. For more information, go to https://support.google.com/mail/?p=NoSuchUser', '2026-09-14 03:47:17'),
(17, 1, 'azari@moh.gov.my', 'AZARI BIN MOHAMAD ZULKIPLI', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(18, 1, 'belinda.suling@moh.gov.my', 'BELINDA SULING ANAK AMIN', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(19, 1, 'bucklee.saen@moh.gov.my', 'BUCKLEE SAEN ANAK BROWN', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(20, 1, 'carlos.j@moh.gov.my', 'CARLOS ANAK JINUNG', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(21, 1, 'cassandra.jinpat@moh.gov.my', 'CASSANDRA ANAK JINPAT', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(22, 1, 'catherine.gudah@moh.gov.my', 'CATHERINE GUDAH ANAK ANDREW GASTING', 'tidak_wujud', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', '5.1.3 smtp; The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. For more information, go to https://support.google.com/mail/?p=NoSuchUser', '2026-09-14 03:47:17'),
(23, 1, 'chaishiawfung@moh.gov.my', 'CHAI SHIAW FUNG', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(24, 1, 'charmine.elvie@moh.gov.my', 'CHARMINE ELVIE ANAK ACHONG', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(25, 1, 'chew.zipeng@moh.gov.my', 'CHEW ZI PENG', 'dihantar', '<uHhA8B7bbh29535ZY5rTlhJLHLX3qVXPrmNjEMSws4@intranethser.duckdns.org>', '2026-09-11 15:03:11', NULL, '2026-09-14 03:47:17'),
(26, 1, 'christacarmela@moh.gov.my', 'CHRISTA CARMELA ANAK MAUNG', 'tidak_wujud', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', '5.1.3 smtp; The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. For more information, go to https://support.google.com/mail/?p=NoSuchUser', '2026-09-14 03:47:17'),
(27, 1, 'christina.gandan@moh.gov.my', 'CHRISTINA ANAK GANDAN', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(28, 1, 'christine.belen@moh.gov.my', 'CHRISTINE ANAK BELEN', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(29, 1, 'corry.sasoh@moh.gov.my', 'CORRY ANAK SASOH', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(30, 1, 'davidp@moh.gov.my', 'DAVID ANAK PANIT', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(31, 1, 'dayang.norhidayah@moh.gov.my', 'DAYANG NORHIDAYAH BINTI AWANG SERI\'EE', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(32, 1, 'debbie@moh.gov.my', 'DEBBIE YOLANDA ANAK STANDLEY', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(33, 1, 'dianajumain@moh.gov.my', 'DIANA BINTI JUMAIN', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(34, 1, 'dollin.jimmy@moh.gov.my', 'DOLLIN ANAK JIMMY', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(35, 1, 'dopica.manggen@moh.gov.my', 'DOPICA MANGGEN', 'tidak_wujud', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', '5.1.3 smtp; The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. For more information, go to https://support.google.com/mail/?p=NoSuchUser', '2026-09-14 03:47:17'),
(36, 1, 'eddesmond@moh.gov.my', 'ED DESMOND ANAK SLIN', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(37, 1, 'ellisia.garing@moh.gov.my', 'ELLISIA AK. GARING', 'tidak_wujud', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', '5.1.3 smtp; The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. For more information, go to https://support.google.com/mail/?p=NoSuchUser', '2026-09-14 03:47:17'),
(38, 1, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(39, 1, 'erni.s@moh.gov.my', 'ERNI BINTI SUHAILI', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(40, 1, 'erwin.richter@moh.gov.my', 'ERWIN RICHTER ANAK JOANES', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(41, 1, 'fauziana.narawi@moh.gov.my', 'FAUZIANA BINTI NARAWI', 'tidak_wujud', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', '5.1.3 smtp; The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. For more information, go to https://support.google.com/mail/?p=NoSuchUser', '2026-09-14 03:47:17'),
(42, 1, 'felix.edison@moh.gov.my', 'FELIX ANAK EDISON', 'tidak_wujud', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', '5.1.3 smtp; The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. For more information, go to https://support.google.com/mail/?p=NoSuchUser', '2026-09-14 03:47:17'),
(43, 1, 'fenieda.edward@moh.gov.my', 'FENIEDA ANAK EDWARD DAUNG', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(44, 1, 'florence.chong@moh.gov.my', 'FLORENCE CHONG', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(45, 1, 'grace.heron@moh.gov.my', 'GRACE ANAK HERON', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(46, 1, 'hajiah.man@moh.gov.my', 'HAJIAH BINTI MAN', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(47, 1, 'harissonkueh@moh.gov.my', 'HARISSON ANAK KUEH', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(48, 1, 'hazell.james@moh.gov.my', 'HAZELL ANAK JAMES BENL', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(49, 1, 'kaivoon@moh.gov.my', 'HENG KAI VOON', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(50, 1, 'dr.hidayahabdaziz@moh.gov.my', 'HIDAYAH BINTI ABD AZIZ', 'dihantar', '<SMx5vEPp4Wi7p1PfwFzRELzgLJHwwo7kKU6nDA3Zg@intranethser.duckdns.org>', '2026-09-11 15:03:29', NULL, '2026-09-14 03:47:17'),
(51, 1, 'hlorencey@moh.gov.my', 'HLORENCEY ANAK LENON NAMUT', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(52, 1, 'irene.at@moh.gov.my', 'IRENE ANAK TA\'A', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(53, 1, 'irrwan.ismail@moh.gov.my', 'IRRWAN BIN ISMAIL', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(54, 1, 'jamestie@moh.gov.my', 'JAMES TIE LOK KIN', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(55, 1, 'jason.leewhuan@moh.gov.my', 'JASON LEE WHUAN CHUIAN', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(56, 1, 'jason.sabai@moh.gov.my', 'JASON SABAI ANAK DOUGLAS TELAJAN', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(57, 1, 'joannejb@moh.gov.my', 'JOANNE JOHNNY BOUNIU', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(58, 1, 'hiijocelyn@moh.gov.my', 'JOCELYN HII LING LEE', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(59, 1, 'johanna.dorin@moh.gov.my', 'JOHANNA ANAK DORIN', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(60, 1, 'joshua.niru@moh.gov.my', 'JOSHUA NIRU JONNEW', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(61, 1, 'justin.archie@moh.gov.my', 'JUSTIN ARCHIE KATU', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(62, 1, 'kurin@moh.gov.my', 'KURIN KASIT', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(63, 1, 'lau.minchu@moh.gov.my', 'LAU MIN CHU', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(64, 1, 'learie@moh.gov.my', 'LEARIE DULCY ANAK EDWARD JANDUR', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(65, 1, 'leechiewlian@moh.gov.my', 'LEE CHIEW LIAN', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(66, 1, 'hserian.paediatric@moh.gov.my', 'LEONG MEI YEE', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(67, 1, 'leony.muhen@moh.gov.my', 'LEONY ANAK MUHEN', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(68, 1, 'lesminawati@moh.gov.my', 'LESMINAWATI BINTI TUGOR', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(69, 1, 'liana.tress@moh.gov.my', 'LIANA TRESS ANAK BETIN', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(70, 1, 'liching.glak@moh.gov.my', 'LICHING ANAK GLAK', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(71, 1, 'lidya.kadir@moh.gov.my', 'LIDYA BINTI KADIR', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(72, 1, 'lila.hayati@moh.gov.my', 'LILA HAYATI BINTI MUSLI', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(73, 1, 'limhuifern@moh.gov.my', 'LIM HUI FERN', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(74, 1, 'lim.zheng@moh.gov.my', 'LIM ZHENG YAW', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(75, 1, 'linda.nelus@moh.gov.my', 'LINDA ANAK NELUS', 'disekat', '<fNaV7gW9fxvGEtmLm0Cr1nu9C2blOaqPMUvlKsxc@intranethser.duckdns.org>', '2026-09-11 15:03:47', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(76, 1, 'liongsiawhui@moh.gov.my', 'LIONG SIAW HUI', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(77, 1, 'liza.bali@moh.gov.my', 'LIZA ANAK BALI', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(78, 1, 'lizawati.tugor@moh.gov.my', 'LIZAWATI BINTI TUGOR', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(79, 1, 'loiusianalorentis@moh.gov.my', 'LOIUSIANA LORENTIS ANAK TRAVAL', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(80, 1, 'mahani_ahmat@moh.gov.my', 'MAHANI BINTI AHMAT', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(81, 1, 'margaret.mala@moh.gov.my', 'MARGARET MALA ENTRANG', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(82, 1, 'mariamesran@moh.gov.my', 'MARIA BINTI MESRAN', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(83, 1, 'marina.anis@moh.gov.my', 'MARINA ANAK ANIS', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(84, 1, 'mary_annie@moh.gov.my', 'MARY ANNIE ANAK BANGAU', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(85, 1, 'masitah.sidi@moh.gov.my', 'MASITAH BINTI SIDI', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(86, 1, 'mat.pozan@moh.gov.my', 'MAT BIN POZAN', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(87, 1, 'matina.bawan@moh.gov.my', 'MATINA ANAK BAWAN', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(88, 1, 'matthew.wj@moh.gov.my', 'MATTHEW ANAK WILFRED NGGIE', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(89, 1, 'mazlinac@moh.gov.my', 'MAZLIN BINTI ACHER', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(90, 1, 'michelle.mamat@moh.gov.my', 'MICHELLE ANAK MAMAT', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(91, 1, 'mike.claurence@moh.gov.my', 'MIKE CLAURENCE ANAK KOLOK', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(92, 1, 'nazri.rosli@moh.gov.my', 'MOHAMAD NAZRI BIN ROSLI', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(93, 1, 'syazwan.zuki@moh.gov.my', 'MOHAMAD SYAZWAN BIN MOHAMAD ZUKI', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(94, 1, 'mohdherald@moh.gov.my', 'MOHAMMAD HERALD ABDULLAH @ HERALD', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(95, 1, 'mhdjeffery@moh.gov.my', 'MOHAMMAD JEFFERY BIN MADRIS', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(96, 1, 'mohammad.jefri@moh.gov.my', 'MOHAMMAD JEFRI BIN ABDULLAH', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(97, 1, 'mohd.rizan@moh.gov.my', 'MOHD RIZAN BIN JAPAR', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(98, 1, 'syafiq_sabri@moh.gov.my', 'MOHD SYAFIQ BIN MOHD SABRI', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(99, 1, 'mourina.dommok@moh.gov.my', 'MOURINA ANAK DOMMOK', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(100, 1, 'muhammad.nizam@moh.gov.my', 'MUHAMMAD AZRULNIZAM BIN LAMAT', 'disekat', '<GOmIMZI4fQaSTTLlP4DtrD7MgZLGSl7r5Hrz6TfG80U@intranethser.duckdns.org>', '2026-09-11 15:04:04', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(101, 1, 'muhammad.rafie@moh.gov.my', 'MUHAMMAD RAFIE AIMAN BIN RAHIM', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(102, 1, 'nggt@moh.gov.my', 'NG GEK TING', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(103, 1, 'ngyuanxun@moh.gov.my', 'NG YUAN XUN', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(104, 1, 'singjiat@moh.gov.my', 'NGU SING JIAT', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(105, 1, 'noor.zahrina@moh.gov.my', 'NOOR ZAHRINA BINTI BRAHIM', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(106, 1, 'noorazuwan@moh.gov.my', 'NOOR-AZUWAN BIN BA\'IEE', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(107, 1, 'noriana.gandu@moh.gov.my', 'NORIANA ANAK GANDU', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(108, 1, 'norkiah.keram@moh.gov.my', 'NORKIAH BINTI KERAM', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(109, 1, 'norlidadaud@moh.gov.my', 'NORLIDA BINTI DAUD', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(110, 1, 'norzarina.sapawe@moh.gov.my', 'NORZARINA BINTI SAPAWE', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(111, 1, 'nur.alya@moh.gov.my', 'NUR ALYA BINTI MOHD ROSDI', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(112, 1, 'athirahabdullah@moh.gov.my', 'NUR ATHIRAH BINTI ABDULLAH', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(113, 1, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(114, 1, 'nurulfarahin@moh.gov.my', 'NURUL FARAHIN BINTI SULEIMAN', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(115, 1, 'nurulyani.hamimi@moh.gov.my', 'NURULYANI HAMIMI BINTI DAZUKI', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(116, 1, 'oling.luhat@moh.gov.my', 'OLING LUHAT', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(117, 1, 'ooi.tzuchia@moh.gov.my', 'OOI TZU CHIA', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(118, 1, 'patemah@moh.gov.my', 'PATEMAH BINTI BUJANG', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(119, 1, 'patrick.wexller@moh.gov.my', 'PATRICK WEXLLER ANAK REJAS', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(120, 1, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(121, 1, 'rafeah.sarkawi@moh.gov.my', 'RAFEAH BINTI SARKAWI', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(122, 1, 'remuna@moh.gov.my', 'REMUNA ANAK TELOK', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(123, 1, 'rizuannyng@moh.gov.my', 'RIZUANNY NG', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(124, 1, 'roland.walter@moh.gov.my', 'ROLAND WALTER ANAK NORBERT NYULIN', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(125, 1, 'ronald.lawrence@moh.gov.my', 'RONALD ANAK LAWRENCE', 'disekat', '<YM5D1snIcmEoQkQzCrEMiombHxS77MwUVavDmQm93Q@intranethser.duckdns.org>', '2026-09-11 15:04:22', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(126, 1, 'ronieokit@moh.gov.my', 'RONIE ANAK OKIT', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(127, 1, 'rosa@moh.gov.my', 'ROSA ANAK JACOB SIHA', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(128, 1, 'rositaarip@moh.gov.my', 'ROSITA BINTI ARIP', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(129, 1, 'rosty.bonifis@moh.gov.my', 'ROSTY ANAK BONIFIS NAYAN', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(130, 1, 'rush@moh.gov.my', 'RUSH ANAK TINGGI', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(131, 1, 'salawaty@moh.gov.my', 'SALAWATY BINTI GOH', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(132, 1, 'siaw.yee@moh.gov.my', 'SIAW YEE NEO', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(133, 1, 'siera@moh.gov.my', 'SIERA BINTI MALI', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(134, 1, 'silvia.luyang@moh.gov.my', 'SILVIA ANAK LUYANG', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(135, 1, 'sitizuhairah1997@moh.gov.my', 'SITI ZUHAIRAH BINTI ZAINUDDIN', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(136, 1, 'solomi@moh.gov.my', 'SOLOMI ANAK KULAR', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(137, 1, 'stalie.julie@moh.gov.my', 'STALIE JULIE ANAK ASI', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(138, 1, 'subibah.rosli@moh.gov.my', 'SUBIBAH BINTI ROSLI', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(139, 1, 'drsureshdominic@moh.gov.my', 'SURESH DOMINIC VINCENT A/L JOHN VINCENT', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(140, 1, 'nurhusna@moh.gov.my', 'SYLVIA RONALD SAINIK @ NUR HUSNA DZAKIRAH', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(141, 1, 'telanying@moh.gov.my', 'TELANYING ANAK USAT', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(142, 1, 'thian.lee@moh.gov.my', 'THIAN LEE PING', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(143, 1, 'thineshkumar@moh.gov.my', 'THINESH KUMAR A/L KARADAPANDDY', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(144, 1, 'thiyagu@moh.gov.my', 'THIYAGU A/L RAMACHANDARAM', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(145, 1, 'timothy.aaron@moh.gov.my', 'TIMOTHY AARON ANAK JUNGU @ KERON', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(146, 1, 'tina.mais@moh.gov.my', 'TINA ANAK MA-IS', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(147, 1, 'vivi.nelson@moh.gov.my', 'VIVI ANAK NELSON', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(148, 1, 'willson.mack@moh.gov.my', 'WILLSON ANAK MACK MAEH', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(149, 1, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(150, 1, 'dr_zafirah@moh.gov.my', 'ZAFIRAH BINTI ROSDI', 'disekat', '<DLOYO96VGzxxbiOh4jLaDm2cT06julGCSLdcWS5kahY@intranethser.duckdns.org>', '2026-09-11 15:04:39', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(151, 1, 'zainal.hakim@moh.gov.my', 'ZAINAL BIN HAKIM', 'disekat', '<FgvnEY9FHO7tnSdkDqqvoRFEBgHsFFOFQEx5CAtmjM@intranethser.duckdns.org>', '2026-09-11 15:04:52', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(152, 1, 'zakirah.fashihana@moh.gov.my', 'ZAKIRAH FASHIHANA HUSNA BINTI ADNAN', 'disekat', '<FgvnEY9FHO7tnSdkDqqvoRFEBgHsFFOFQEx5CAtmjM@intranethser.duckdns.org>', '2026-09-11 15:04:52', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(153, 1, 'zuhailah.reduan@moh.gov.my', 'ZUHAILAH BINTI REDUAN', 'disekat', '<FgvnEY9FHO7tnSdkDqqvoRFEBgHsFFOFQEx5CAtmjM@intranethser.duckdns.org>', '2026-09-11 15:04:52', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 03:47:17'),
(664, 2, 'hlorencey@moh.gov.my', 'HLORENCEY ANAK LENON NAMUT', 'disekat', '<2x2kPpScfyrnrPqIBwvTfZjr4OSAN1Z5f1O4ZcA6z0@intranethser.duckdns.org>', '2026-09-14 12:13:48', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 04:15:36'),
(665, 2, 'irene.at@moh.gov.my', 'IRENE ANAK TA\'A', 'disekat', '<Z5iqPNg60PnXtctKF9wrFZ2a76VRW52rBAQ3py4cg@intranethser.duckdns.org>', '2026-09-14 12:14:03', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 04:15:36'),
(666, 2, 'irrwan.ismail@moh.gov.my', 'IRRWAN BIN ISMAIL', 'disekat', '<PvaadfE1FRz3mPfpNmY7qXpZOooGncgeYDHoLBD4Ro@intranethser.duckdns.org>', '2026-09-14 12:14:18', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 04:15:36'),
(667, 2, 'jamestie@moh.gov.my', 'JAMES TIE LOK KIN', 'disekat', '<dzSrAfNuqWk0gjkKP60QCNinKpNpfMOdqAB4ABnY0@intranethser.duckdns.org>', '2026-09-14 12:14:32', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 04:15:36'),
(668, 2, 'jason.leewhuan@moh.gov.my', 'JASON LEE WHUAN CHUIAN', 'disekat', '<LxtfEU1ccHNG2DRG1TzDKkSCISBHwHdrJT9vj27hcs@intranethser.duckdns.org>', '2026-09-14 12:14:48', '5.7.1 smtp; Message rejected. For more information, go to https://support.google.com/mail/answer/69585', '2026-09-14 04:15:36'),
(669, 2, 'jason.sabai@moh.gov.my', 'JASON SABAI ANAK DOUGLAS TELAJAN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(670, 2, 'joannejb@moh.gov.my', 'JOANNE JOHNNY BOUNIU', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(671, 2, 'hiijocelyn@moh.gov.my', 'JOCELYN HII LING LEE', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(672, 2, 'johanna.dorin@moh.gov.my', 'JOHANNA ANAK DORIN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(673, 2, 'joshua.niru@moh.gov.my', 'JOSHUA NIRU JONNEW', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(674, 2, 'justin.archie@moh.gov.my', 'JUSTIN ARCHIE KATU', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(675, 2, 'kurin@moh.gov.my', 'KURIN KASIT', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(676, 2, 'lau.minchu@moh.gov.my', 'LAU MIN CHU', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(677, 2, 'learie@moh.gov.my', 'LEARIE DULCY ANAK EDWARD JANDUR', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(678, 2, 'leechiewlian@moh.gov.my', 'LEE CHIEW LIAN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(679, 2, 'hserian.paediatric@moh.gov.my', 'LEONG MEI YEE', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(680, 2, 'leony.muhen@moh.gov.my', 'LEONY ANAK MUHEN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(681, 2, 'lesminawati@moh.gov.my', 'LESMINAWATI BINTI TUGOR', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(682, 2, 'liana.tress@moh.gov.my', 'LIANA TRESS ANAK BETIN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(683, 2, 'liching.glak@moh.gov.my', 'LICHING ANAK GLAK', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(684, 2, 'lidya.kadir@moh.gov.my', 'LIDYA BINTI KADIR', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(685, 2, 'lila.hayati@moh.gov.my', 'LILA HAYATI BINTI MUSLI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(686, 2, 'limhuifern@moh.gov.my', 'LIM HUI FERN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(687, 2, 'lim.zheng@moh.gov.my', 'LIM ZHENG YAW', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(688, 2, 'linda.nelus@moh.gov.my', 'LINDA ANAK NELUS', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(689, 2, 'liongsiawhui@moh.gov.my', 'LIONG SIAW HUI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(690, 2, 'liza.bali@moh.gov.my', 'LIZA ANAK BALI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(691, 2, 'lizawati.tugor@moh.gov.my', 'LIZAWATI BINTI TUGOR', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(692, 2, 'loiusianalorentis@moh.gov.my', 'LOIUSIANA LORENTIS ANAK TRAVAL', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(693, 2, 'mahani_ahmat@moh.gov.my', 'MAHANI BINTI AHMAT', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(694, 2, 'margaret.mala@moh.gov.my', 'MARGARET MALA ENTRANG', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(695, 2, 'mariamesran@moh.gov.my', 'MARIA BINTI MESRAN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(696, 2, 'marina.anis@moh.gov.my', 'MARINA ANAK ANIS', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(697, 2, 'mary_annie@moh.gov.my', 'MARY ANNIE ANAK BANGAU', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(698, 2, 'masitah.sidi@moh.gov.my', 'MASITAH BINTI SIDI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(699, 2, 'mat.pozan@moh.gov.my', 'MAT BIN POZAN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(700, 2, 'matina.bawan@moh.gov.my', 'MATINA ANAK BAWAN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(701, 2, 'matthew.wj@moh.gov.my', 'MATTHEW ANAK WILFRED NGGIE', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(702, 2, 'mazlinac@moh.gov.my', 'MAZLIN BINTI ACHER', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(703, 2, 'michelle.mamat@moh.gov.my', 'MICHELLE ANAK MAMAT', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(704, 2, 'mike.claurence@moh.gov.my', 'MIKE CLAURENCE ANAK KOLOK', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(705, 2, 'nazri.rosli@moh.gov.my', 'MOHAMAD NAZRI BIN ROSLI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(706, 2, 'syazwan.zuki@moh.gov.my', 'MOHAMAD SYAZWAN BIN MOHAMAD ZUKI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(707, 2, 'mohdherald@moh.gov.my', 'MOHAMMAD HERALD ABDULLAH @ HERALD', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(708, 2, 'mhdjeffery@moh.gov.my', 'MOHAMMAD JEFFERY BIN MADRIS', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(709, 2, 'mohammad.jefri@moh.gov.my', 'MOHAMMAD JEFRI BIN ABDULLAH', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(710, 2, 'mohd.rizan@moh.gov.my', 'MOHD RIZAN BIN JAPAR', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(711, 2, 'syafiq_sabri@moh.gov.my', 'MOHD SYAFIQ BIN MOHD SABRI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(712, 2, 'mourina.dommok@moh.gov.my', 'MOURINA ANAK DOMMOK', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(713, 2, 'muhammad.nizam@moh.gov.my', 'MUHAMMAD AZRULNIZAM BIN LAMAT', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(714, 2, 'muhammad.rafie@moh.gov.my', 'MUHAMMAD RAFIE AIMAN BIN RAHIM', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(715, 2, 'nggt@moh.gov.my', 'NG GEK TING', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(716, 2, 'ngyuanxun@moh.gov.my', 'NG YUAN XUN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(717, 2, 'singjiat@moh.gov.my', 'NGU SING JIAT', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(718, 2, 'noor.zahrina@moh.gov.my', 'NOOR ZAHRINA BINTI BRAHIM', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(719, 2, 'noorazuwan@moh.gov.my', 'NOOR-AZUWAN BIN BA\'IEE', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(720, 2, 'noriana.gandu@moh.gov.my', 'NORIANA ANAK GANDU', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30');
INSERT INTO `notifikasi_penerima` (`id`, `kempen_id`, `emel`, `nama`, `status`, `message_id`, `dihantar_pada`, `ralat`, `dikemaskini_pada`) VALUES
(721, 2, 'norkiah.keram@moh.gov.my', 'NORKIAH BINTI KERAM', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(722, 2, 'norlidadaud@moh.gov.my', 'NORLIDA BINTI DAUD', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(723, 2, 'norzarina.sapawe@moh.gov.my', 'NORZARINA BINTI SAPAWE', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(724, 2, 'nur.alya@moh.gov.my', 'NUR ALYA BINTI MOHD ROSDI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(725, 2, 'athirahabdullah@moh.gov.my', 'NUR ATHIRAH BINTI ABDULLAH', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(726, 2, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(727, 2, 'nurulfarahin@moh.gov.my', 'NURUL FARAHIN BINTI SULEIMAN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(728, 2, 'nurulyani.hamimi@moh.gov.my', 'NURULYANI HAMIMI BINTI DAZUKI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(729, 2, 'oling.luhat@moh.gov.my', 'OLING LUHAT', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(730, 2, 'ooi.tzuchia@moh.gov.my', 'OOI TZU CHIA', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(731, 2, 'patemah@moh.gov.my', 'PATEMAH BINTI BUJANG', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(732, 2, 'patrick.wexller@moh.gov.my', 'PATRICK WEXLLER ANAK REJAS', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(733, 2, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(734, 2, 'rafeah.sarkawi@moh.gov.my', 'RAFEAH BINTI SARKAWI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(735, 2, 'remuna@moh.gov.my', 'REMUNA ANAK TELOK', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(736, 2, 'rizuannyng@moh.gov.my', 'RIZUANNY NG', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(737, 2, 'roland.walter@moh.gov.my', 'ROLAND WALTER ANAK NORBERT NYULIN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(738, 2, 'ronald.lawrence@moh.gov.my', 'RONALD ANAK LAWRENCE', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(739, 2, 'ronieokit@moh.gov.my', 'RONIE ANAK OKIT', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(740, 2, 'rosa@moh.gov.my', 'ROSA ANAK JACOB SIHA', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(741, 2, 'rositaarip@moh.gov.my', 'ROSITA BINTI ARIP', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(742, 2, 'rosty.bonifis@moh.gov.my', 'ROSTY ANAK BONIFIS NAYAN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(743, 2, 'rush@moh.gov.my', 'RUSH ANAK TINGGI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(744, 2, 'salawaty@moh.gov.my', 'SALAWATY BINTI GOH', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(745, 2, 'siaw.yee@moh.gov.my', 'SIAW YEE NEO', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(746, 2, 'siera@moh.gov.my', 'SIERA BINTI MALI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(747, 2, 'silvia.luyang@moh.gov.my', 'SILVIA ANAK LUYANG', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(748, 2, 'sitizuhairah1997@moh.gov.my', 'SITI ZUHAIRAH BINTI ZAINUDDIN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(749, 2, 'solomi@moh.gov.my', 'SOLOMI ANAK KULAR', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(750, 2, 'stalie.julie@moh.gov.my', 'STALIE JULIE ANAK ASI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(751, 2, 'subibah.rosli@moh.gov.my', 'SUBIBAH BINTI ROSLI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(752, 2, 'drsureshdominic@moh.gov.my', 'SURESH DOMINIC VINCENT A/L JOHN VINCENT', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(753, 2, 'nurhusna@moh.gov.my', 'SYLVIA RONALD SAINIK @ NUR HUSNA DZAKIRAH', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(754, 2, 'telanying@moh.gov.my', 'TELANYING ANAK USAT', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(755, 2, 'thian.lee@moh.gov.my', 'THIAN LEE PING', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(756, 2, 'thineshkumar@moh.gov.my', 'THINESH KUMAR A/L KARADAPANDDY', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(757, 2, 'thiyagu@moh.gov.my', 'THIYAGU A/L RAMACHANDARAM', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(758, 2, 'timothy.aaron@moh.gov.my', 'TIMOTHY AARON ANAK JUNGU @ KERON', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(759, 2, 'tina.mais@moh.gov.my', 'TINA ANAK MA-IS', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(760, 2, 'vivi.nelson@moh.gov.my', 'VIVI ANAK NELSON', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(761, 2, 'willson.mack@moh.gov.my', 'WILLSON ANAK MACK MAEH', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(762, 2, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(763, 2, 'dr_zafirah@moh.gov.my', 'ZAFIRAH BINTI ROSDI', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(764, 2, 'zainal.hakim@moh.gov.my', 'ZAINAL BIN HAKIM', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(765, 2, 'zakirah.fashihana@moh.gov.my', 'ZAKIRAH FASHIHANA HUSNA BINTI ADNAN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30'),
(766, 2, 'zuhailah.reduan@moh.gov.my', 'ZUHAILAH BINTI REDUAN', 'belum', NULL, NULL, NULL, '2026-09-14 04:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `pautan`
--

CREATE TABLE `pautan` (
  `id` int(11) NOT NULL,
  `type` enum('perkhidmatan','pautan_utama','pautan_luaran') NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(500) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pautan`
--

INSERT INTO `pautan` (`id`, `type`, `title`, `url`, `image_path`, `sort_order`, `aktif`, `created_at`) VALUES
(1, 'perkhidmatan', 'Sistem Maklumat Pekerja (HRMIS)', 'https://hrmis2.eghrmis.gov.my/HRMISNET/Common/Main/Login.aspx', 'images/HRMIS.jpg', 1, 1, '2026-09-03 08:08:13'),
(2, 'perkhidmatan', 'Pusat Dokumen & SOP', 'dokumen.html', 'images/Dokumen SOP.jpg', 2, 1, '2026-09-03 08:08:13'),
(3, 'perkhidmatan', 'Borang Rasmi KKM & E-Borang', 'borang-hr.html', 'images/e-borang.jpg', 3, 1, '2026-09-03 08:08:13'),
(4, 'perkhidmatan', 'Tempahan Bilik/Dewan', 'tempahan-bilik.html', 'images/mesyuarat.jpg', 4, 1, '2026-09-03 08:08:13'),
(5, 'pautan_utama', 'Portal Rasmi KKM', 'https://www.moh.gov.my/', NULL, 1, 1, '2026-09-03 08:08:13'),
(6, 'pautan_utama', 'Jabatan Kesihatan Negeri Sarawak', 'https://jknsarawak.moh.gov.my/v2/bm/', NULL, 2, 1, '2026-09-03 08:08:13'),
(7, 'pautan_utama', 'e-Penyata Gaji', 'https://epenyatagaji-laporan.anm.gov.my/Layouts/Login/Login.aspx', NULL, 3, 1, '2026-09-03 08:08:13'),
(8, 'pautan_utama', 'Portal HRMIS 2.0', 'https://hrmis2.eghrmis.gov.my/', NULL, 4, 1, '2026-09-03 08:08:13'),
(9, 'pautan_utama', 'MPIS', 'https://www.cprchospital.moh.gov.my/#/login', NULL, 5, 1, '2026-09-03 08:08:13'),
(10, 'pautan_utama', 'MSQH', 'https://msqh.com.my/', NULL, 6, 1, '2026-09-03 08:08:13'),
(11, 'pautan_luaran', 'Portal KKM', 'https://www.moh.gov.my/', NULL, 1, 1, '2026-09-03 08:08:13'),
(12, 'pautan_luaran', 'JKN Sarawak', 'https://jknsarawak.moh.gov.my/v2/bm/', NULL, 2, 1, '2026-09-03 08:08:13'),
(13, 'pautan_luaran', 'e-Penyata Gaji', 'https://epenyatagaji-laporan.anm.gov.my/', NULL, 3, 1, '2026-09-03 08:08:13'),
(14, 'pautan_luaran', 'HRMIS', 'https://hrmis2.eghrmis.gov.my/', NULL, 4, 1, '2026-09-03 08:08:13'),
(15, 'pautan_luaran', 'MPIS', 'https://www.cprchospital.moh.gov.my/#/login', NULL, 5, 1, '2026-09-03 08:08:13'),
(16, 'pautan_luaran', 'MSQH', 'https://msqh.com.my/', NULL, 6, 1, '2026-09-03 08:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `slideshow`
--

CREATE TABLE `slideshow` (
  `id` int(11) NOT NULL,
  `image_path` varchar(500) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slideshow`
--

INSERT INTO `slideshow` (`id`, `image_path`, `caption`, `sort_order`, `aktif`, `created_at`) VALUES
(1, 'images/slideshow1.png', NULL, 2, 1, '2026-08-10 07:12:13'),
(2, 'images/slideshow2.png', NULL, 3, 1, '2026-08-10 07:12:13'),
(3, 'images/slideshow3.jpg', NULL, 4, 1, '2026-08-10 07:12:13'),
(4, 'images/slideshow4.png', NULL, 5, 1, '2026-08-10 07:12:13'),
(5, 'images/slideshow5.png', NULL, 6, 1, '2026-08-10 07:12:13'),
(8, 'images/slideshow6.png', NULL, 7, 0, '2026-08-10 09:02:18'),
(9, 'images/slideshow7.png', NULL, 8, 1, '2026-08-10 09:02:18'),
(10, 'images/slideshow8.png', NULL, 10, 1, '2026-08-10 09:02:18'),
(11, 'images/slideshow9.png', NULL, 11, 1, '2026-08-10 09:02:18'),
(12, 'images/slideshow10.png', NULL, 12, 1, '2026-08-10 09:02:18'),
(13, 'images/slideshow11.png', NULL, 15, 1, '2026-08-10 09:02:18'),
(14, 'images/slideshow/slide_1788425163_901b98fc.jpg', 'Hospital Serian', 9, 1, '2026-09-03 08:46:03'),
(15, 'images/slideshow/slide_1789115168_140fa0a5.png', 'Poster Hebahan Sistem Intranet', 13, 1, '2026-09-11 08:26:08'),
(16, 'images/slideshow/slide_1789365911_229df13b.jpg', 'HEBAHAN POSTMASTER: MESEJ INTEGRITI SIRI 9/2026- \"SUDAHKAH ANDA MENGISYTIHARKAN HARTA?\"', 1, 1, '2026-09-14 06:05:11'),
(17, 'images/slideshow/slide_1789460193_67b6806b.png', 'Infografik Intranet', 14, 1, '2026-09-15 08:16:33'),
(18, 'images/slideshow/slide_1789693823_91aff7c4.png', 'WAR ON SUGAR', 16, 1, '2026-09-18 01:10:23'),
(19, 'images/slideshow/slide_1789694917_0ae4ab88.jpeg', 'Facebook', 17, 1, '2026-09-18 01:28:37');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `bil` int(11) DEFAULT NULL,
  `gelaran` varchar(50) DEFAULT NULL,
  `jantina` varchar(10) DEFAULT NULL,
  `nama_penuh` varchar(255) DEFAULT NULL,
  `no_kp` varchar(50) DEFAULT NULL,
  `bangsa` varchar(50) DEFAULT NULL,
  `etnik` varchar(50) DEFAULT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `jawatan_sspa` varchar(100) DEFAULT NULL,
  `gred_sspa` varchar(50) DEFAULT NULL,
  `jawatan_ssm` varchar(100) DEFAULT NULL,
  `no_telefon` varchar(50) DEFAULT NULL,
  `emel_rasmi` varchar(100) DEFAULT NULL,
  `emel_status` varchar(20) DEFAULT NULL,
  `emel_status_nota` varchar(255) DEFAULT NULL,
  `emel_peribadi` varchar(100) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `penempatan` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `bil`, `gelaran`, `jantina`, `nama_penuh`, `no_kp`, `bangsa`, `etnik`, `agama`, `jawatan_sspa`, `gred_sspa`, `jawatan_ssm`, `no_telefon`, `emel_rasmi`, `emel_status`, `emel_status_nota`, `emel_peribadi`, `catatan`, `penempatan`, `created_at`, `updated_at`) VALUES
(1, 1, 'ENCIK', 'L', 'ABANG HISHAMUDIN BIN ABANG UNIN', '840515-13-5601', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '014 - 899 4694', '-', NULL, NULL, 'echam05@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(2, 2, 'ENCIK', 'L', 'ABANG MAHIDZAN FAISYAL', '860620-52-5423', 'MELAYU', 'MELAYU', 'ISLAM', 'JURUPULIH FISIOTERAPI', 'U6', '-', '016 - 893 3910', 'abg.mahidzan@moh.gov.my', NULL, NULL, 'misternazz@gmail.com', '-', 'UNIT FISIOTERAPI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(3, 3, 'ENCIK', 'L', 'ABANG MUHAMMAD BIN ABG MARZUKI', '940728-13-5371', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN', 'U5', '-', '013 - 817 3267', 'abangmhd.marzuki@moh.gov.my', NULL, NULL, 'lelakiAnggun3301@gmail.com', '-', 'UNIT KUALITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(4, 4, 'ENCIK', 'L', 'ABDUL AZIM BIN MASJAYA', '880526-13-5275', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU TADBIR (KEW)', 'W2 TBK1', '-', '013 - 845 9663', 'abdazim@moh.gov.my', NULL, NULL, 'azimcpf@yahoo.com.my', '-', 'UNIT KEWANGAN & AKAUN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(5, 5, 'ENCIK', 'L', 'ABDUL AZIZ BIN MATUDIN@ SUDIN', '880122-52-5293', 'BUMIPUTERA SARAWAK', 'MELANAU', 'ISLAM', 'PEMBANTU KHIDMAT AM', 'H1', 'Pembantu Operasi', '014 - 397 9678', 'abdul.aziz@moh.gov.my', NULL, NULL, 'nibsnuts@gmail.com', '-', 'UNIT PENTADBIRAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(6, 6, 'ENCIK', 'L', 'ABDUL HAKIM BIN SAIERY', '900312-13-7297', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU KHIDMAT AM', 'H1', 'Pemandu Kenderaan', '014 - 584 4656', '-', NULL, NULL, 'abdulhakim4475@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(7, 7, 'ENCIK', 'L', 'ABDUL RASID BIN AHMAD', '760714-13-5081', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '012 - 898 4275', '-', NULL, NULL, 'abdulrasid19976@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(8, 8, 'PUAN', 'P', 'ADELA ANAK BUNCHET', '831024-13-5194', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '013 - 969 4130', '-', NULL, NULL, 'happy1010we@gmail.com', '-', 'WAD BERSALIN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(9, 9, 'PUAN', 'P', 'ADELINE MARY ANAK MARTIN', '870923-52-5526', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '014 - 878 4855', '-', NULL, NULL, 'adlin2387@gmail.com', '-', 'DEWAN BEDAH', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(10, 10, 'ENCIK', 'L', 'ADMONTH ANAK SIMIYON', '770624-13-5749', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '012 - 859 8500', '-', NULL, NULL, 'admonthjagold@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(11, 11, 'PUAN', 'P', 'AGNES LILIN ANAK PIUH', '731018-13-5368', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '013 - 561 5673', 'agnes.lilin@moh.gov.my', NULL, NULL, 'agneslilin123@gmail.com', '-', 'JPL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(12, 12, 'ENCIK', 'L', 'AGUSTINE ANAK JOTES', '801210-13-5377', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '019 - 828 1277', '-', NULL, NULL, 'agustinejotes10@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(13, 13, 'PUAN', 'P', 'AIN NUKHA BINTI LOKMAN', '850913-10-5378', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '010 - 285 7535', 'ainip0910@moh.gov.my', 'tidak_wujud', 'Tidak wujud menurut pelayan emel MOH (bounce 11/9/2026, hebahan pelancaran intranet)', '-', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-09-14 03:47:17'),
(14, 14, 'ENCIK', 'L', 'AINOL FIRDAUZ BIN AINIE', '850316-13-5579', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN', 'U5', '-', '016 - 579 6322', 'ainolfirdauz@moh.gov.my', NULL, NULL, '-', '-', 'OT', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(15, 15, 'PUAN', 'P', 'ALEESA BINTI ABDULLAH @ CYNTHIA LENNY AK RUJIM', '750211-13-5494', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'ISLAM', 'JURURAWAT', 'U5', '-', '013 - 461 7705', 'aleesa.abdullah@moh.gov.my', 'tidak_wujud', 'Tidak wujud menurut pelayan emel MOH (bounce 11/9/2026, hebahan pelancaran intranet)', 'lennyrujim@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-09-14 03:47:17'),
(16, 16, 'PUAN', 'P', 'ALICE ANAK KENNI', '900128-13-5056', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PEMBANTU TADBIR (P/O)', 'N2 TBK1', '-', '013 - 575 2154', '-', NULL, NULL, 'alicemang933@gmail.com', '-', 'Kewangan', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(17, 17, 'CIK', 'P', 'ALICE YASMIN ANAK NYAIN', '880927-52-5418', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6', '-', '014 - 582 7272', 'alice.yasmin@moh.gov.my', NULL, NULL, '-', '-', 'Unit Makmal', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(18, 18, 'DR.', 'P', 'ALVINA ANAIS ANAK ADRIAN SUSIN', '970812-13-5224', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEGAWAI PERUBATAN (K)', 'UD9', '-', '019 - 818 3636', '-', NULL, NULL, 'alvina97.aa@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(19, 19, 'DR.', 'P', 'AMELIA SHAMINI A/P MUNIANDY', '910308-10-5160', 'INDIA', 'INDIA', 'KRISTIAN', 'PEGAWAI PERUBATAN', 'UD10', '-', '013 - 359 0609', 'amelia.shamini@moh.gov.my', NULL, NULL, 'ameliashamini@hotmail.com', '-', 'Unit Psikiatri', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(20, 20, 'PUAN', 'P', 'AMY ANAK JEKLE', '940614-13-5162', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U1', '-', '012 - 520 5783', 'amykle@moh.gov.my', 'tidak_wujud', 'Tidak wujud menurut pelayan emel MOH (bounce 11/9/2026, hebahan pelancaran intranet)', 'james95dylan@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-09-14 03:47:17'),
(21, 21, 'PUAN', 'P', 'ANGELA ANAK KADOI', '731031-13-5194', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '017 - 217 5194', '-', NULL, NULL, 'angelakadoi31@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(22, 22, 'PUAN', 'P', 'ANGELINE ANAK AYINE', '841229-13-5568', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT', 'U6 (KUP)', '-', '013 - 869 5358', '-', NULL, NULL, 'lynangel_dara@yahoo.com', '-', 'WAD BERSALIN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(23, 23, 'PUAN', 'P', 'ANGELINE ANAK MATHEW PEROS @ NORFAZLINE BINTI ABDULLAH', '730724-13-5272', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2 (KUP)', '-', '014 - 954 8036', 'norfazline@moh.gov.my', NULL, NULL, '-', '-', 'WAD BERSALIN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(24, 24, 'PUAN', 'P', 'ANNA SAKIA ANAK BALONG', '800308-13-5928', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '019 - 838 6308', '-', NULL, NULL, 'annasakia71@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(25, 25, 'PUAN', 'P', 'ANNA TYANNA ANNETTE ANAK STIMPERD', '970927-13-5806', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '014 - 883 7947', '-', NULL, NULL, 'tyanna9784@gmail.com', 'Mengikuti program kejururawatan mulai 11.08.2025 sehingga 10.08.2028', 'Wad Pediatrik', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(26, 26, 'CIK', 'P', 'ANTI LONG', '970930-13-5524', 'BUMIPUTERA SARAWAK', 'KAYAN', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '011 - 2688 6134', '-', NULL, NULL, 'antieylong@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(27, 27, 'PUAN', 'P', 'ARMA CARMELIA BINTI ABDOL LATEP', '860803-52-5696', 'MELAYU', 'JAWA', 'ISLAM', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 TBK1', '-', '014 - 587 6787', 'arma.carmelia@moh.gov.my', NULL, NULL, '-', '-', 'Unit Farmasi', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(28, 28, 'PUAN', 'P', 'ARRISA ARDINI BINTI HENRY', '920224-13-5556', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'ISLAM', 'PEMBANTU TADBIR (P/O)', 'N1', '-', '013 - 220 1703', 'arrisardini@moh.gov.my', NULL, NULL, 'arrisaardini@gmail.com', '-', 'Unit Rekod Perubatan', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(29, 29, 'ENCIK', 'L', 'ASAN ANAK NYUMONG', '720714-13-6133', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '019 - 328 3125', 'asan.nyumong@moh.gov.my', 'tidak_wujud', 'Tidak wujud menurut pelayan emel MOH (bounce 11/9/2026, hebahan pelancaran intranet)', 'virgodoslin@gmail.com', '-', 'UNIT HEMODIALISIS', '2026-08-03 05:15:19', '2026-09-14 06:21:41'),
(30, 30, 'PUAN', 'P', 'ASNIZA ANAK ANNY', '900513-13-5044', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U5', '-', '013 - 586 6669', 'asniza.anny@moh.gov.my', 'tidak_wujud', 'Tidak wujud menurut pelayan emel MOH (bounce 11/9/2026, hebahan pelancaran intranet)', '-', '-', 'Unit Makmal', '2026-08-03 05:15:19', '2026-09-14 03:47:17'),
(31, 31, 'PUAN', 'P', 'AUDREY CORRY ANAK THADDEUS ATEK', '830624-13-5476', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU KHIDMAT AM', 'H1', 'Pembantu Awam', '011 - 290 09782', '-', NULL, NULL, 'corryaudrey9@gmail.com', '-', 'CSSU', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(32, 32, 'ENCIK', 'L', 'AWANG MUMIN BIN AWANG ZAINI', '770312-13-5539', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '014 - 880 4201', '-', NULL, NULL, 'awang5539@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(33, 33, 'ENCIK', 'L', 'AWANGKU BOLKIAH BIN AWANG MAS ANTHONY', '791216-13-5291', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '012 - 870 7026', '-', NULL, NULL, 'bolkiahanthony79@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA, FORENSIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(34, 34, 'ENCIK', 'L', 'AZARI BIN MOHAMAD ZULKIPLI', '830428-13-5057', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI HAL EHWAL ISLAM', 'S6 TBK1', '-', '019 - 861 7657', 'azari@moh.gov.my', NULL, NULL, '-', 'PINJAM DARI HOSPITAL KAPIT', 'PENGURUSAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(35, 35, 'PUAN', 'P', 'AZURINNAH BINTI MEHRON', '850216-13-5272', 'MELAYU', 'JAWA', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '019 - 836 4672', '-', NULL, NULL, 'azurinnahmerhon@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(36, 36, 'PUAN', 'P', 'BAIZURA BINTI ABDUL RANI', '860809-52-6892', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U6 (KUP)', '-', '011 - 1057 9886', '-', NULL, NULL, 'baizuraabdulrani@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(37, 37, 'PUAN', 'P', 'BEATA ANAK RINYUK', '760514-13-5458', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI FARMASI', 'U6 KUP', '-', '019 - 825 4050', '-', NULL, NULL, 'beatarinyuk1976@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(38, 38, 'PUAN', 'P', 'BELINDA SULING ANAK AMIN', '801004-13-5464', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 (KUP)', '-', '019 - 865 2202', 'belinda.suling@moh.gov.my', NULL, NULL, '-', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(39, 39, 'ENCIK', 'L', 'BENUD ANAK TOTOL', '771020-13-5179', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU KHIDMAT AM', 'H1', 'Pembantu Awam', '010 - 432 3367', '-', NULL, NULL, 'benudtotol7@gmail.com', '-', 'Unit Farmasi', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(40, 40, 'PUAN', 'P', 'BERTHA ANAK AJIS', '821121-13-5584', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '016 - 855 8740', '-', NULL, NULL, 'berthaajis82@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(41, 41, 'PUAN', 'P', 'BIBIFAIZATULATIKA BINTI KAMEL', '940611-13-5386', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI FARMASI', 'U5', '-', '014 - 603 9727', '-', NULL, NULL, 'bibifaizatulatika@gmail.com', '-', 'Unit Farmasi', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(42, 42, 'ENCIK', 'L', 'BUCKLEE SAEN ANAK BROWN', '910623-13-5319', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U5', '-', '014 - 392 5681', 'bucklee.saen@moh.gov.my', NULL, NULL, 'elninolee@gmail.com', '-', 'UNIT HEMODIALISIS', '2026-08-03 05:15:19', '2026-09-14 06:21:45'),
(43, 43, 'ENCIK', 'L', 'BUSU BIN ANIS', '661110-13-5415', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '013 - 570 2798', '-', NULL, NULL, 'busuanis66@gmail.com', 'BERSARA WAJIB PADA 10.11.2026', 'UNIT KECEMASAN & TRAUMA, FORENSIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(44, 44, 'DR.', 'L', 'CARLOS ANAK JINUNG', '860801-52-6011', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEGAWAI PERUBATAN', 'UD12', '-', '016 - 295 1883', 'carlos.j@moh.gov.my', NULL, NULL, 'carlosjinungjuan@gmail.com', '-', 'Pengurusan/ ETD', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(45, 45, 'PUAN', 'P', 'CASSANDRA ANAK JINPAT', '850328-13-5146', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '013 - 850 8056', 'cassandra.jinpat@moh.gov.my', NULL, NULL, 'cassandrajinpat@gmail.com', '-', 'UNIT HEMODIALISIS', '2026-08-03 05:15:19', '2026-09-14 06:21:49'),
(46, 46, 'PUAN', 'P', 'CATHERINE GUDAH ANAK ANDREW GASTING', '810225-13-5964', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 TBK1', '-', '019 - 817 5260', 'catherine.gudah@moh.gov.my', 'tidak_wujud', 'Tidak wujud menurut pelayan emel MOH (bounce 11/9/2026, hebahan pelancaran intranet)', '-', '-', 'Unit Makmal', '2026-08-03 05:15:19', '2026-09-14 03:47:17'),
(47, 47, 'PUAN', 'P', 'CHAI SHIAW FUNG', '891214-13-5026', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI FARMASI', 'UF13', '-', '016 - 882 2930', 'chaishiawfung@moh.gov.my', NULL, NULL, '-', '-', 'Unit Farmasi', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(48, 48, 'DR.', 'P', 'CHAI WENN', '920912-13-5250', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI PERUBATAN', 'UD10', '-', '011 - 3659 1387', '-', NULL, NULL, 'wennchai@yahoo.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(49, 49, 'PUAN', 'P', 'CHARMINE ELVIE ANAK ACHONG', '980114-13-5402', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU TADBIR (P/O)', 'N1', '-', '011 - 3303 5121', 'charmine.elvie@moh.gov.my', NULL, NULL, 'charmineelvie14@gmail.com', 'Baru Lantik Kontrak interim', 'UNIT HASIL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(50, 50, 'DR.', 'L', 'CHEW ZI PENG', '971220-04-5385', 'CINA', 'CINA', 'KRISTIAN', 'PEGAWAI PERUBATAN (K)', 'UD10', '-', '017 - 606 1648', 'chew.zipeng@moh.gov.my', NULL, NULL, 'chewzipeng@yahoo.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(51, 51, 'DR.', 'L', 'CHONG JIA HUI', '940322-01-5943', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI PERUBATAN', 'UD10', '-', '016 - 777 9980', '-', NULL, NULL, 'chongjiahui94@gmail.com', 'BERTUKAR MASUK DARI HOSPITAL SULTANAH AMINAH JOHOR BAHRU PADA 02.10.2025', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(52, 52, 'DR.', 'L', 'CHOOI HUNG BEN', '970715-26-5115', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI PERUBATAN', 'UD10', '-', '012 - 573 6200', '-', NULL, NULL, 'hungben1997@hotmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(53, 53, 'PUAN', 'P', 'CHRISTA CARMELA ANAK MAUNG', '820409-13-5212', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '019 - 891 5060', 'christacarmela@moh.gov.my', 'tidak_wujud', 'Tidak wujud menurut pelayan emel MOH (bounce 11/9/2026, hebahan pelancaran intranet)', '-', '-', 'KLINIK PAKAR, UNIT PSIKIATRI', '2026-08-03 05:15:19', '2026-09-14 03:47:17'),
(54, 54, 'CIK', 'P', 'CHRISTINA ANAK GANDAN', '751013-13-5172', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6', '-', '011 - 2369 1998', 'christina.gandan@moh.gov.my', NULL, NULL, 'christinagandan75@gmail.com', '-', 'Wad Perempuan', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(55, 55, 'PUAN', 'P', 'CHRISTINA ANNE ANAK JOREM', '960614-13-5144', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN (K)', 'U5', '-', '011 - 1611 0729', '-', NULL, NULL, 'christinajorem3@gmail.com', 'BERTUKAR MASUK DARI HOSP. SARIKEI', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(56, 56, 'PUAN', 'P', 'CHRISTINA RINU', '761227-13-5062', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '014 - 687 3136', '-', NULL, NULL, 'christinaclista3648@gmail.com', 'Pos Basik mulai Mac 2024 hingga Ogos 2024', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(57, 57, 'PUAN', 'P', 'CHRISTINE ANAK BELEN', '790713-13-5642', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURUPULIH PERUBATAN CARA KERJA', 'U7 TBK', '-', '016 - 457 9989', 'christine.belen@moh.gov.my', NULL, NULL, 'lisa_angela09@yahoo.com', '-', 'Unit Jurupulih Perubatan Carakerja', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(58, 58, 'ENCIK', 'L', 'CLEMENT ANAK GEORGERY', '740319-13-5147', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '011 - 2509 3364', '-', NULL, NULL, 'clement5anak147@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(59, 59, 'PUAN', 'P', 'CLYNIK ANAK MANGI', '750608-13-5564', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT', 'U6 KUP', '-', '018 - 975 3571', '-', NULL, NULL, 'clynik75@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(60, 60, 'CIK', 'P', 'COLLINE ANAK BAIE', '961209-13-5532', 'BUMIPUTERA SARAWAK', '-', 'KRISTIAN', 'PEMBANTU TADBIR (P/O)', 'N1', '-', '017 - 231 2208', '-', NULL, NULL, 'cikcolin96@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(61, 61, 'PUAN', 'P', 'CONNY ANAK ENPARAH', '830824-13-5980', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '014 - 288 4243', '-', NULL, NULL, 'connyenparah@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(62, 62, 'DR.', 'L', 'CORNELIUS ANAK BENET', '930319-13-5507', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEGAWAI PERUBATAN', 'UD10', '-', '013 - 575 2088', '-', NULL, NULL, 'kayutzaeschyluslon19@gmail.com', '-', 'ETD', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(63, 63, 'PUAN', 'P', 'CORRY ANAK SASOH', '750710-13-5608', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U7 TBK 2', '-', '019 - 467 1170', 'corry.sasoh@moh.gov.my', NULL, NULL, 'corrysasoh1075@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA, UPP', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(64, 64, 'PUAN', 'P', 'CYNTHIA ANAK JAMES GIRIN', '800106-13-5532', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '019 - 817 6480', '-', NULL, NULL, 'cynthiaakjamesjames@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(65, 65, 'ENCIK', 'L', 'DAVID ANAK PANIT', '791120-13-5035', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURUPULIH FISIOTERAPI', 'U7', '-', '019 - 847 0584', 'davidp@moh.gov.my', NULL, NULL, 'dvolution69@yahoo.com.my', '-', 'UNIT FISIOTERAPI', '2026-08-03 05:15:19', '2026-09-14 06:20:50'),
(66, 66, 'PUAN', 'P', 'DAYANG IZZA AZZAILA BINTI ABANG MOHD ARIFFIN', '811207-13-5324', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U6 TBK1', '-', '013 - 570 3885', '-', NULL, NULL, 'ezza8386@gmail.com', '-', 'UNIT HEMODIALISIS', '2026-08-03 05:15:19', '2026-09-14 06:21:26'),
(67, 67, 'PUAN', 'P', 'DAYANG NORHIDAYAH BINTI AWANG SERI\'EE', '860611-13-5140', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U6 TBK1', '-', '016 - 414 7571', 'dayang.norhidayah@moh.gov.my', NULL, NULL, 'aredeng186@yahoo.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(68, 68, 'PUAN', 'P', 'DAYANG ROZAIDA BINTI AWANG ZAIDI', '840914-13-5780', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U5', '-', '014 - 697 8007', '-', NULL, NULL, 'drozaida1984@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(69, 69, 'PUAN', 'P', 'DAYANG SUHARDZASNI KHURSIAH BINTI AWANG JAMALUDDIN', '790330-08-6556', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2 (KUP)', '-', '012 - 877 6066', '-', NULL, NULL, 'justme.dsk@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(70, 70, 'CIK', 'P', 'DEBBIE YOLANDA ANAK STANDLEY', '770805-13-5844', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6', '-', '019 - 858 9493', 'debbie@moh.gov.my', NULL, NULL, 'debbieyolanda1977@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(71, 71, 'PUAN', 'P', 'DEBRA ANAK SAMUEL', '780830-13-5378', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '012 - 819 6030', '-', NULL, NULL, 'anddebz78@yahoo.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(72, 72, 'DR.', 'L', 'DHANENTHERA A/L GUNASEGARAN', '931118105461', 'INDIA', 'INDIA', 'HINDU', 'Pegawai Perubatan', 'UD10', '-', '017 - 972 2235', '-', NULL, NULL, 'dhanenthera@gmail.com', 'CUTI BELAJAR', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(73, 73, 'PUAN', 'P', 'DIANA BINTI JUMAIN', '700827-13-5040', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U7 TBK2', '-', '016 - 404 1827', 'dianajumain@moh.gov.my', NULL, NULL, 'dianajumain@gmail.com', '-', 'JPL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(74, 74, 'PUAN', 'P', 'DOLLIN ANAK JIMMY', '761225-13-5464', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '011 - 2607 2906', 'dollin.jimmy@moh.gov.my', NULL, NULL, 'dollinjimmy2@gmail.com', '-', 'JPL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(75, 75, 'PUAN', 'P', 'DOPICA MANGGEN', '790204-13-5150', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '013 - 673 7695', 'dopica.manggen@moh.gov.my', 'tidak_wujud', 'Tidak wujud menurut pelayan emel MOH (bounce 11/9/2026, hebahan pelancaran intranet)', 'dopicamanggen55@gmail.com', '-', 'UNIT HEMODIALISIS', '2026-08-03 05:15:19', '2026-09-14 06:21:52'),
(76, 76, 'PUAN', 'P', 'DORA ANAK SARUI', '811127-13-5586', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '019 - 848 9623', '-', NULL, NULL, 'dora2sarui@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(77, 77, 'PUAN', 'P', 'DORIMA ANAK BUNGGUN', '780512-13-5540', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '017 - 525 9819', '-', NULL, NULL, 'dorimamervin@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(78, 78, 'PUAN', 'P', 'DORIS ANAK LUANG', '761026-13-6288', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '019 - 970 5149', '-', NULL, NULL, 'dorisluang15@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(79, 79, 'PUAN', 'P', 'DOROTHY DEWI ANAK SIMON GINCHANG', '780612-13-5580', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 (KUP)', '-', '016 - 410 6653', '-', NULL, NULL, 'eistler2706.dd@gmail.com', '-', 'WAD BERSALIN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(80, 80, 'ENCIK', 'L', 'DOUGLAS JOSEPH ANAK SIMON', '921223-13-5639', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U5', '-', '013 - 565 5961', '-', NULL, NULL, 'glesjoe@yahoo.com', 'Lapor diri pada 27.07.2026 dr Host. Kuala Lumpur', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(81, 81, 'ENCIK', 'L', 'ED DESMOND ANAK SLIN', '910923-13-5273', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U5', '-', '019 - 849 3940', 'eddesmond@moh.gov.my', NULL, NULL, 'diend8@gmail.com', '-', 'UNIT HEMODIALISIS', '2026-08-03 05:15:19', '2026-09-14 06:21:56'),
(82, 82, 'PUAN', 'P', 'EIDA BINTI DRAHMAN', '830828-13-5726', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '019 - 839 1660', '-', NULL, NULL, 'eida280883@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(83, 83, 'PUAN', 'P', 'ELCIA PATRICIA ANAK JATU @ STEPHEN', '920120-13-5236', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U1', '-', '010 - 590 4429', '-', NULL, NULL, '-', 'Lapor diri pada 01.03.2024 dr Hosp. Bau', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(84, 84, 'PUAN', 'P', 'ELIN ANAK PANENG', '820215-13-5484', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '016 - 852 2507', '-', NULL, NULL, 'elinpaneng87@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(85, 85, 'PUAN', 'P', 'ELLCY CHIA ANAK KARUT', '860313-52-5984', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '013 - 571 0016', '-', NULL, NULL, 'ellcyangel86@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(86, 86, 'PUAN', 'P', 'ELLISIA AK. GARING', '890607-13-5030', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '016 - 985 3410', 'ellisia.garing@moh.gov.my', 'tidak_wujud', 'Tidak wujud menurut pelayan emel MOH (bounce 11/9/2026, hebahan pelancaran intranet)', '-', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-09-14 03:47:17'),
(87, 87, 'PUAN', 'P', 'ELLIZA ANAK JOHN', '810402-13-5376', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '018 - 979 0146', '-', NULL, NULL, 'elliza2481.ej@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(88, 88, 'CIK', 'P', 'ELSIEMIA ANAK RITOS', '000827-13-0998', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PENYEDIAAN MAKANAN', 'N1', '-', '018 - 984 0866', '-', NULL, NULL, 'iamelsiemiamary@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(89, 89, 'PUAN', 'P', 'EMI JINGOB', '820417-13-5490', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU TADBIR (P/O)', 'N1', '-', '013 - 895 1019', '-', NULL, NULL, 'emijingob@gmail.com', '-', 'HASIL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(90, 90, 'PUAN', 'P', 'ERNI BINTI SUHAILI', '940923-13-5422', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU TADBIR (P/O)', 'N1', 'Penyelia Asrama', '011 - 1605 8589', 'erni.s@moh.gov.my', NULL, NULL, '-', '-', 'PENTADBIRAN AM', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(91, 91, 'ENCIK', 'L', 'ERWIN RICHTER ANAK JOANES', '980908-13-5447', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN (K)', 'U5', '-', '013 - 817 1799', 'erwin.richter@moh.gov.my', NULL, NULL, 'erwinbudang@gmail.com', 'BERTUKAR KELUAR KE PKB BINTULU (KK TUBAU) LANTIKAN TETAP 27 JULAI 2026', 'UNIT PSIKIATRI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(92, 92, 'CIK', 'P', 'ESTHER APRIL LINUS', '950414-12-6682', 'BUMIPUTERA SABAH', 'KADAZAN DUSUN', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U5', '-', '019 - 889 3803', '-', NULL, NULL, 'eapril17@gmail.com', 'HOSPITAL MIRI', 'UNIT KECEMASAN DAN TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(93, 93, 'PUAN', 'P', 'EVALIN ANAK BUJANG', '830908-09-5146', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '011 - 1894 5146', '-', NULL, NULL, 'evalineva89@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(94, 94, 'PUAN', 'P', 'EVELYN ANAK KASSIM', '711207-13-5844', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2', '-', '019 - 878 6051', '-', NULL, NULL, 'evelynlyn71@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(95, 95, 'PUAN', 'P', 'EVERLINE ANAK GETER PUTIT', '860827-52-5818', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '019 - 827 5836', '-', NULL, NULL, 'verline8498@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(96, 96, 'DR.', 'P', 'FARAH AMALINA BINTI AHMAD EFFENDI', '920802-02-5448', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN', 'UD10', '-', '013 - 402 5768', '-', NULL, NULL, 'farahamalina67@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(97, 97, 'ENCIK', 'L', 'FAUZI BIN RAMLI', '910110-13-6519', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU KHIDMAT AM', 'H1', 'Pemandu kenderaan', '010 - 326 4642', '-', NULL, NULL, 'fauziramli6812@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(98, 98, 'PUAN', 'P', 'FAUZIANA BINTI NARAWI', '820814-13-5822', 'MELAYU', 'MELAYU', 'ISLAM', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 TBK1', '-', '014 - 671 2775', 'fauziana.narawi@moh.gov.my', 'tidak_wujud', 'Tidak wujud menurut pelayan emel MOH (bounce 11/9/2026, hebahan pelancaran intranet)', '-', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-09-14 03:47:17'),
(99, 99, 'ENCIK', 'L', 'FELIX ANAK EDISON', '950909-13-5601', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '019 - 886 7692', 'felix.edison@moh.gov.my', 'tidak_wujud', 'Tidak wujud menurut pelayan emel MOH (bounce 11/9/2026, hebahan pelancaran intranet)', 'pipiledison404@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-09-14 03:47:17'),
(100, 100, 'PUAN', 'P', 'FENIEDA ANAK EDWARD DAUNG', '940202-06-5348', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEGAWAI FARMASI', 'UF9', '-', '019 - 894 5939', 'fenieda.edward@moh.gov.my', NULL, NULL, '-', 'Bertukar masuk dari Hospital Sri Aman', 'Unit farmasi', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(101, 101, 'PUAN', 'P', 'FIONA ANAK JOEL', '890317-13-5104', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '016 - 578 0579', '-', NULL, NULL, 'fifi_apple89@yahoo.com', 'Bertukar masuk dari HUS', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(102, 102, 'PUAN', 'P', 'FLORA ANAK BAKEH', '811010-13-5160', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '017 - 810 5750', '-', NULL, NULL, 'floratiyuk@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(103, 103, 'PUAN', 'P', 'FLORENCE CHONG', '870502-52-6299', 'CINA', 'CINA', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '019 - 887 1587', 'florence.chong@moh.gov.my', NULL, NULL, 'florencechong87@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(104, 104, 'ENCIK', 'L', 'FREDDY SZE TEO LIM', '810321-13-5251', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U6 TBK1', '-', '013 - 432 4928', '-', NULL, NULL, 'freddysze5251@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(105, 105, 'PUAN', 'P', 'GRACE ANAK HERON', '810601-13-5002', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '013 - 824 2609', 'grace.heron@moh.gov.my', NULL, NULL, 'graceheron1981@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(106, 106, 'ENCIK', 'L', 'GREEN WONG ANAK ANTHONY', '710328-13-5811', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U6 KUP', '-', '019 - 891 7347', '-', NULL, NULL, 'greenwong42@gmail.com', '-', 'JPL/OFTALMOLOGI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(107, 107, 'PUAN', 'P', 'HAJIAH BINTI MAN', '840428-13-5478', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG AKAUNTAN', 'W5 KUP', '-', '013 - 576 4663', 'hajiah.man@moh.gov.my', NULL, NULL, '-', 'Melapor diri pada 15.04.2024', 'Unit Kewangan & Akaun', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(108, 108, 'PUAN', 'P', 'HALIZA BINTI ABU BAKAR', '810526-13-5394', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U5', '-', '016 - 865 4240', '-', NULL, NULL, 'halizazaili126@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(109, 109, 'ENCIK', 'L', 'HALTREY KIDUN LINGAI', '761110-13-5739', 'BUMIPUTERA SARAWAK', 'SILA PILIH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '014 - 288 1950', '-', NULL, NULL, 'hhaltrey@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(110, 110, 'ENCIK', 'L', 'HAMDAN BIN MARNI', '711127-13-5027', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU KHIDMAT AM', 'H1', 'Pemandu kenderaan', '011 - 2635 1136', '-', NULL, NULL, 'hamdanhjmarni3@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(111, 111, 'PUAN', 'P', 'HAMIZA BINTI HAMID', '791022-13-5074', 'BUMIPUTERA SARAWAK', 'MELANAU', 'ISLAM', 'JURURAWAT', 'U5', '-', '013 - 843 6763', '-', NULL, NULL, 'hamizahamidhamiza@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(112, 112, 'DR.', 'P', 'HAMSA LAXMEE A/P RAMAKRISHNAN', '940902-02-5566', 'INDIA', 'INDIA', 'HINDU', 'PEGAWAI PERUBATAN', 'UD10', '-', '011 - 2647 9030', '-', NULL, NULL, 'hlaxmee2@gmail.com', 'CUTI BELAJAR', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(113, 113, 'ENCIK', 'L', 'HARISSON ANAK KUEH', '960614-13-5515', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEGAWAI SAINS (MIKROBIOLOGI) (K)', 'C9', '-', '011 - 2170 1471', 'harissonkueh@moh.gov.my', NULL, NULL, '-', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(114, 114, 'ENCIK', 'L', 'HARRY ANAK JULET', '761002-13-5897', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '016 - 816 7156', '-', NULL, NULL, 'harryqtk1679@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(115, 115, 'CIK', 'P', 'HASIMA BINTI HIPNI', '800125-13-5466', 'BUMIPUTERA SARAWAK', 'MELANAU', 'ISLAM', 'JURURAWAT', 'U6 TBK1', '-', '019 - 889 7911', '-', NULL, NULL, 'hasimahipni80@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(116, 116, 'ENCIK', 'L', 'HASSANAL BIN HUSSAIN', '710527-13-5339', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN', 'U6 TBK1', '-', '019 - 242 4741', '-', NULL, NULL, 'cdak270571@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(117, 117, 'PUAN', 'P', 'HAZELL ANAK JAMES BENL', '990430-13-5972', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '012 - 858 4641', 'hazell.james@moh.gov.my', NULL, NULL, 'hazellhnrtta@gmail.com', 'BERTUKAR MASUK DARI HOSPITAL TUNKU AZIZAH KUALA LUMPUR', 'OT', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(118, 118, 'PUAN', 'P', 'HELEN BILONG', '780826-13-5594', 'BUMIPUTERA SARAWAK', 'KAYAN', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '017 - 853 4208', '-', NULL, NULL, 'elenbhee@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(119, 119, 'ENCIK', 'L', 'HELTA ANAK MANGGIE', '770409-08-6219', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PEMBANTU KHIDMAT AM', 'H1', 'Pemandu kenderaan', '019 - 838 6379', '-', NULL, NULL, 'jjbiey13@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(120, 120, 'DR.', 'P', 'HENG KAI VOON', '930113-14-5080', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI PERUBATAN PAKAR', 'UD12', '-', '016 - 761 0061', 'kaivoon@moh.gov.my', NULL, NULL, 'hengcarmen13@gmail.com', '(PRA WARTA PAKAR PEDIATRIK)', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(121, 121, 'PUAN', 'P', 'HERMIA ANAK HASEN', '880531-13-5624', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '016 - 816 7426', '-', NULL, NULL, 'hermiahasen@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(122, 122, 'ENCIK', 'L', 'HEZRON ANAK JOSEPH ROY', '820611-13-5099', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU KHIDMAT AM', 'H1', 'Pembantu Awam', '019 - 467 3865', '-', NULL, NULL, 'hezronjosephroy@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(123, 123, 'DR.', 'P', 'HIDAYAH BINTI ABD AZIZ', '910216-01-5088', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN', 'UD12', '-', '018 - 775 0239', 'dr.hidayahabdaziz@moh.gov.my', NULL, NULL, 'daiyaaziz@yahoo.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(124, 124, 'PUAN', 'P', 'HILDA ANAK PAULUS', '811209-13-5758', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '019 - 595 8302', '-', NULL, NULL, 'hildapaulus7@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(125, 125, 'PUAN', 'P', 'HLORENCEY ANAK LENON NAMUT', '860301-13-5102', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU TADBIR (P/O)', 'N2 TBK1', '-', '013 - 839 7893', 'hlorencey@moh.gov.my', NULL, NULL, '-', '-', 'AKAUN DAN KEWANGAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(126, 126, 'CIK', 'P', 'HONG SIN YONG', '960808-07-5434', 'CINA', 'CINA', 'KRISTIAN', 'PEGAWAI FARMASI', 'UF9', '-', '016 - 441 9300', '-', NULL, NULL, 'hsy_karen@hotmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(127, 127, 'PUAN', 'P', 'IMELDA ANAK PETER KIANG', '800104-13-5424', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '014 - 397 4170', '-', NULL, NULL, 'imeldapeterkiang80@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(128, 128, 'PUAN', 'P', 'IRENE ANAK JIMAI', '860713-13-5168', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '013 - 822 0874', '-', NULL, NULL, 'irenejimai86@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(129, 129, 'PUAN', 'P', 'IRENE ANAK TA\'A', '950625-13-5458', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURUPULIH FISIOTERAPI', 'U5', '-', '019 - 418 2744', 'irene.at@moh.gov.my', NULL, NULL, 'irenetaa2595@gmail.com', '-', 'UNIT FISIOTERAPI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(130, 130, 'ENCIK', 'L', 'IRRWAN BIN ISMAIL', '780824-13-6243', 'MELAYU', 'MELAYU', 'ISLAM', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 TBK1', '-', '012 - 804 8915', 'irrwan.ismail@moh.gov.my', NULL, NULL, '-', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(131, 131, 'PUAN', 'P', 'ISABELLA ANAK JOANES', '740301-13-5894', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '013 - 576 6993', '-', NULL, NULL, 'casill1974@gmail.com', '-', 'Klinik TBCP', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(132, 132, 'ENCIK', 'L', 'ISMAIL BIN YAN', '740226-13-5981', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU KHIDMAT AM', 'H1', 'Pembantu Awam', '013 - 862 0085', '-', NULL, NULL, 'ismailyan5981@gmail.com', '-', 'CSSU', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(133, 133, 'ENCIK', 'L', 'JAFA\'AR BIN BAKAR', '700507-13-6087', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU TADBIR (P/O)', 'N2 TBK1', 'Pegawai Khidmat Pelanggan', '011 - 2512 4724', '-', NULL, NULL, 'pkphospserian@gmail.com', '-', 'PENGURUSAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(134, 134, 'ENCIK', 'L', 'JAMADIL BIN HASNI', '750509-13-5809', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN', 'U6 KUP', '-', '019 - 866 0880', '-', NULL, NULL, 'jamadilhasni@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(135, 135, 'PUAN', 'P', 'JAMAIEH BINTI AMIT', '670831-13-5954', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU TADBIR (P/O)', 'N2 TBK1', 'Pegawai Khidmat Pelanggan', '011 - 1457 3631', '-', NULL, NULL, 'jamaiehamit67@gmail.com', '-', 'PENGURUSAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(136, 136, 'ENCIK', 'L', 'JAMES TIE LOK KIN', '810915-13-5013', 'CINA', 'CINA', 'KRISTIAN', 'PEGAWAI FARMASI', 'UF14', '-', '016 - 894 8942', 'jamestie@moh.gov.my', NULL, NULL, '-', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(137, 137, 'PUAN', 'P', 'JANE ANAK JUSTIN', '960118-13-5508', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U5', '-', '011 - 1405 4291', '-', NULL, NULL, '-', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(138, 138, 'ENCIK', 'L', 'JASON LEE WHUAN CHUIAN', '930408-13-5365', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI FARMASI', 'UF9', '-', '016 - 578 8571', 'jason.leewhuan@moh.gov.my', NULL, NULL, '-', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(139, 139, 'ENCIK', 'L', 'JASON SABAI ANAK DOUGLAS TELAJAN', '900729-13-7313', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PEGAWAI FARMASI', 'UF13', '-', '016 - 895 0910', 'jason.sabai@moh.gov.my', NULL, NULL, '-', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(140, 140, 'PUAN', 'P', 'JAUYAH BINTI JILI', '710111-13-5124', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U5 (KUP)', '-', '017 - 802 3688', '-', NULL, NULL, 'jauyahjili@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(141, 141, 'ENCIK', 'L', 'JENGAN ANAK ENTAU', '950526-13-6017', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PEMBANTU PENYEDIAAN MAKANAN', 'N1', '-', '017 - 986 0170', '-', NULL, NULL, 'nganentaungan@gmail.com', '-', 'UNIT SAJIAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(142, 142, 'PUAN', 'P', 'JENIFER ANAK RICHARD JOHN APUI', '711205-13-5090', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '014 - 974 4550', '-', NULL, NULL, 'jeneferjane5090@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(143, 143, 'CIK', 'P', 'JOAN MACLYN ROMANICA ANAK JOSHUA', '840806-06-5068', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI FARMASI', 'U6 TBK1', '-', '019 - 857 1257', '-', NULL, NULL, 'mayblynn7571@yahoo.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(144, 144, 'DR.', 'P', 'JOANNE JOHNNY BOUNIU', '880614-12-5480', 'BUMIPUTERA SABAH', 'KADAZAN DUSUN', 'KRISTIAN', 'PEGAWAI PERUBATAN PAKAR', 'UD13', '-', '016 - 839 1168', 'joannejb@moh.gov.my', NULL, NULL, 'joannejb@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(145, 145, 'CIK', 'P', 'JOCELYN HII LING LEE', '910221-13-6028', 'CINA', 'CINA', 'KRISTIAN', 'PEGAWAI FARMASI', 'UF9', '-', '016 - 859 7888', 'hiijocelyn@moh.gov.my', NULL, NULL, 'hiijocelyn@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(146, 146, 'CIK', 'P', 'JOHANNA ANAK DORIN', '871221-13-5640', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURUPULIH PERUBATAN CARA KERJA', 'U6 TBK1', '-', '019 - 914 4600', 'johanna.dorin@moh.gov.my', NULL, NULL, '-', '-', 'UNIT CARAKERJA PERUBATAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(147, 147, 'ENCIK', 'L', 'JOSHUA NIRU JONNEW', '790304-13-5211', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U6', '-', '012 - 847 8976', 'joshua.niru@moh.gov.my', NULL, NULL, 'jnjonnew@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(148, 148, 'PUAN', 'P', 'JOY TUKAD SERUNG', '870812-13-5306', 'BUMIPUTERA SARAWAK', 'KELABIT', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '012 - 854 0383', '-', NULL, NULL, 'joytukad087@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(149, 149, 'ENCIK', 'L', 'JUSTIN ARCHIE KATU', '870206-52-6075', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U5', '-', '019 - 837 8402', 'justin.archie@moh.gov.my', NULL, NULL, '-', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(150, 150, 'ENCIK', 'L', 'KALANG LAWAI', '700323-13-5725', 'BUMIPUTERA SARAWAK', 'KENYAH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U7 TBK1', '-', '017 - 457 9866', '-', NULL, NULL, 'kalanglawai827@gmail.com', '-', 'JPL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(151, 151, 'PUAN', 'P', 'KANUI ANAK MANGGOL', '751118-13-5996', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '012 - 858 4877', '-', NULL, NULL, 'kanuijolhi@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(152, 152, 'CIK', 'P', 'KATHERINE KATERI ANAK GADONG', '800723-13-5984', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '019 - 816 4041', '-', NULL, NULL, 'katherinekateri@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(153, 153, 'PUAN', 'P', 'KATHY ANAK RUJIS', '870901-52-5824', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '012 - 673 4042', '-', NULL, NULL, 'rujiskathy7731@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(154, 154, 'CIK', 'P', 'KATIJAH BINTI ROHIM', '790518-13-5516', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '011 - 3141 6684', '-', NULL, NULL, 'katijahrohim@yahoo.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(155, 155, 'PUAN', 'P', 'KELLYNE AK LIPA', '890930-13-5022', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U1', '-', '013 - 823 7817', '-', NULL, NULL, 'keltnsonlee@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(156, 156, 'ENCIK', 'L', 'KOK TZE YEAN', '961127-07-5345', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI FARMASI', 'UF9', '-', '017 - 740 3670', '-', NULL, NULL, 'tzeyean71@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(157, 157, 'ENCIK', 'L', 'KURIN KASIT', '700515-13-5447', 'BUMIPUTERA SARAWAK', 'IBAN', 'SILA PILIH', 'PENOLONG PEGAWAI PERUBATAN', 'U6', '-', '012 - 885 0595', 'kurin@moh.gov.my', NULL, NULL, '-', '-', 'UNIT PENGURUSAN PPP', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(158, 158, 'PUAN', 'P', 'LAU MIN CHU', '661028-13-5352', 'CINA', 'CINA', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '019 - 483 7030', 'lau.minchu@moh.gov.my', NULL, NULL, '-', '-', 'OT', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(159, 159, 'PUAN', 'P', 'LAURA NADIA ANAK DOMINIC', '900517-13-7338', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '013 - 817 3317', 'lauranadia90@gmail.com', NULL, NULL, '-', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(160, 160, 'DR.', 'L', 'LAW ZHEN THENG', '930508-08-6193', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI PERUBATAN', 'UD10', '-', '014 - 346 2718', '-', NULL, NULL, 'ztheng@hotmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(161, 161, 'PUAN', 'P', 'LEARIE DULCY ANAK EDWARD JANDUR', '900903-13-5058', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU TADBIR (P/O)', 'N1', '-', '014 - 599 9856', 'learie@moh.gov.my', NULL, NULL, '-', '-', 'HASIL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(162, 162, 'PUAN', 'P', 'LEE CHIEW LIAN', '770407-13-5398', 'CINA', 'CINA', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 (KUP)', '-', '016 - 682 1691', 'leechiewlian@moh.gov.my', NULL, NULL, '-', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(163, 163, 'PUAN', 'P', 'LENNIE BANDAH', '731101-13-5131', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'ISLAM', 'PENOLONG PEGAWAI FARMASI', 'U6 TBK1', '-', '019 - 847 6960', '-', NULL, NULL, 'lenniebandah@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(164, 164, 'DR.', 'P', 'LEONG MEI YEE', '910926075536', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI PERUBATAN PAKAR', 'UD12', '-', '016 - 427 5907', 'hserian.paediatric@moh.gov.my', NULL, NULL, 'meiyee926@gmail.com', '-', 'PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(165, 165, 'PUAN', 'P', 'LEONY ANAK MUHEN', '771106-13-6084', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '011 - 1986 5720', 'leony.muhen@moh.gov.my', NULL, NULL, 'muhenleony@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(166, 166, 'PUAN', 'P', 'LESMINAWATI BINTI TUGOR', '740410-13-5252', 'MELAYU', 'JAWA', 'ISLAM', 'JURURAWAT', 'U6', '-', '014 - 377 4622', 'lesminawati@moh.gov.my', NULL, NULL, 'lesmina1974@yahoo.com', '-', 'UNIT KEJURURAWATAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(167, 167, 'ENCIK', 'L', 'LEWIS ANAK AMAT', '880619-52-5037', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U6 TBK1', '-', '019 - 875 0551', '-', NULL, NULL, 'lewis.a.kkgedong@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(168, 168, 'DR.', 'P', 'LI JEN TAU', '950802016952', 'CINA', 'CINA', 'BUDDHA', 'Pegawai Perubatan', 'UD10', '-', '016 - 611 0176', '-', NULL, NULL, 'ntauli@yahoo.com', 'CUTI BELAJAR', 'O&G', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(169, 169, 'PUAN', 'P', 'LIANA TRESS ANAK BETIN', '940209-13-6356', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURU X-RAY', 'U5', '-', '013 - 736 9061', 'liana.tress@moh.gov.my', NULL, NULL, 'lianatress@yahoo.com', '-', 'X-RAY', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(170, 170, 'PUAN', 'P', 'LICHING ANAK GLAK', '700417-13-5486', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT', 'U7 TBK2', '-', '013 - 841 5807', 'liching.glak@moh.gov.my', NULL, NULL, 'lichingglak145@gmail.com', '-', 'KLINIK PAKAR', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(171, 171, 'PUAN', 'P', 'LIDYA BINTI KADIR', '941125-13-5166', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU TADBIR (P/O)', 'N1', '-', '011 - 1605 1616', 'lidya.kadir@moh.gov.my', NULL, NULL, 'lidyakadir@icloud.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(172, 172, 'CIK', 'P', 'LIEU ANAK AWIL', '700905-13-6074', 'BUMIPUTERA SARAWAK', 'IBAN', 'BAHAI', 'JURURAWAT', 'U7 TBK 2', '-', '013 - 807 0400', '-', NULL, NULL, 'lieuawil70@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(173, 173, 'PUAN', 'P', 'LILA HAYATI BINTI MUSLI', '780719-13-5150', 'MELAYU', 'MELAYU', 'ISLAM', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 TBK1', '-', '016 - 577 5722', 'lila.hayati@moh.gov.my', NULL, NULL, 'hayati_mlt@yahoo.com', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(174, 174, 'PUAN', 'P', 'LILY GUIK @ LAURA', '740612-12-5722', 'BUMIPUTERA SABAH', 'KADAZAN DUSUN', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 (KUP)', '-', '019 - 854 0723', '-', NULL, NULL, 'laurabosco1206@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19');
INSERT INTO `staff` (`id`, `bil`, `gelaran`, `jantina`, `nama_penuh`, `no_kp`, `bangsa`, `etnik`, `agama`, `jawatan_sspa`, `gred_sspa`, `jawatan_ssm`, `no_telefon`, `emel_rasmi`, `emel_status`, `emel_status_nota`, `emel_peribadi`, `catatan`, `penempatan`, `created_at`, `updated_at`) VALUES
(175, 175, 'PUAN', 'P', 'LILY LAU MING CHING', '740601-13-5554', 'CINA', 'CINA', 'SILA PILIH', 'JURURAWAT', 'U5', '-', '016 - 859 1440', '-', NULL, NULL, 'lilylau3963@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(176, 176, 'DR.', 'P', 'LIM HUI FERN', '980922-07-5508', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI PERUBATAN (K)', 'UD10', '-', '012 - 425 8002', 'limhuifern@moh.gov.my', NULL, NULL, 'huifern.lim@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(177, 177, 'DR.', 'L', 'LIM KELVIN', '941217146241', 'CINA', 'CINA', 'BUDDHA', 'Pegawai Perubatan', 'UD10', '-', '018 - 397 0766', '-', NULL, NULL, 'limkelvin.will@gmail.com', 'CUTI BELAJAR', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(178, 178, 'DR.', 'L', 'LIM ZEN PEI', '911015-13-6021', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI PERUBATAN', 'UD10', '-', '019 - 452 3520', '-', NULL, NULL, 'renpilim1015@gmail.com', '(PRA WARTA PAKAR PERUBATAN DALAMAN)', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(179, 179, 'DR.', 'L', 'LIM ZHENG YAW', '950616018057', 'CINA', 'CINA', 'BUDDHA', 'Pegawai Perubatan', 'UD10', '-', '012 - 710 9268', 'lim.zheng@moh.gov.my', NULL, NULL, 'limzhengyaw2010@gmail.com', 'CUTI BELAJAR', 'O&G', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(180, 180, 'CIK', 'P', 'LINDA ANAK NELUS', '750202-13-5628', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6', '-', '011-1287 2275', 'linda.nelus@moh.gov.my', NULL, NULL, 'lindanelus1975@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(181, 181, 'CIK', 'P', 'LIONG SIAW HUI', '841109-13-5766', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI FARMASI', 'UF14', '-', '012 - 808 5600', 'liongsiawhui@moh.gov.my', NULL, NULL, 'n.shliong@gmail.com', 'BERTUKAR MASUK DARI PKB SAMARAHAN (KK KOTA SAMARAHAN) PADA 01.10.2025', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(182, 182, 'CIK', 'P', 'LISA AK JUAN', '880329-52-5880', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI FARMASI', 'U6', '-', '014 - 876 3445', '-', NULL, NULL, 'lisajuan29@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(183, 183, 'PUAN', 'P', 'LISLIM LAH', '821019-13-5262', 'BUMIPUTERA SARAWAK', 'KAYAN', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '019 - 834 6131', '-', NULL, NULL, 'liscajt3@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(184, 184, 'ENCIK', 'L', 'LISTER ANAK HAMILSON', '840414-13-5979', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '013 - 685 5780', '-', NULL, NULL, 'lister4270@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(185, 185, 'PUAN', 'P', 'LIZA ANAK BALI', '791221-13-5376', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT', 'U6', '-', '019 - 837 5435', 'liza.bali@moh.gov.my', NULL, NULL, 'baliliza79@gmail.com', '-', 'WAD KANAK-KANAK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(186, 186, 'PUAN', 'P', 'LIZAWATI BINTI TUGOR', '820802-13-5702', 'MELAYU', 'JAWA', 'ISLAM', 'JURURAWAT', 'U5', '-', '014 - 694 5745', 'lizawati.tugor@moh.gov.my', NULL, NULL, 'izza82.lt@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(187, 187, 'PUAN', 'P', 'LOIUSIANA LORENTIS ANAK TRAVAL', '741226-13-5468', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6', '-', '010 - 277 5468', 'loiusianalorentis@moh.gov.my', NULL, NULL, 'louisetraval3@gmail.com', '-', 'UNIT KAWALAN INFEKSI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(188, 188, 'PUAN', 'P', 'LUCY ANAK GEORGE MANGGU', '730724-13-5424', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI FARMASI', 'U6 TBK1', '-', '013 - 816 0174', '-', NULL, NULL, 'lucygeorge74@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(189, 189, 'ENCIK', 'L', 'MACKY LABONG', '700727-13-6193', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU KHIDMAT AM', 'H1', 'Pemandu Kenderaan', '011 - 2516 3211', '-', NULL, NULL, 'mackylabong4@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(190, 190, 'PUAN', 'P', 'MAGDALENA ANAK MUNAN', '700519-13-5348', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6', '-', '013 - 729 3837', '-', NULL, NULL, 'munanmagdalena@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(191, 191, 'PUAN', 'P', 'MAHANI BINTI AHMAT', '810809135458', 'BUMIPUTERA SARAWAK', 'MELAYU', 'ISLAM', 'PEGAWAI FARMASI', 'UF14', '-', '013 - 567 5331', 'mahani_ahmat@moh.gov.my', NULL, NULL, '-', 'BERTUKAR MASUK DARI CAW. FARMASI LOGISTIK NEGERI SARAWAK PADA 20.04.2026', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(192, 192, 'PUAN', 'P', 'MARGARET MALA ENTRANG', '910728-13-5032', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U5', '-', '014 - 383 9073', 'margaret.mala@moh.gov.my', NULL, NULL, '-', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(193, 193, 'PUAN', 'P', 'MARIA ANAK JOHARI', '870514-52-6122', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '019 - 875 7110', '-', NULL, NULL, 'unyetkentut@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(194, 194, 'DR.', 'P', 'MARIA BINTI MESRAN', '850120-14-6110', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN', 'UD14', '-', '012 - 304 9835', 'mariamesran@moh.gov.my', NULL, NULL, 'maria_mesran@yahoo.com', '-', 'PENGURUSAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(195, 195, 'PUAN', 'P', 'MARIA SOFYANA ANAK TAMA', '860327-13-5020', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '011 - 2501 9520', '-', NULL, NULL, 'tamamaria712@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(196, 196, 'PUAN', 'P', 'MARIAM ANAK YOUS', '760205-13-5390', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI FARMASI', 'U6 TBK1', '-', '019 - 837 1485', '-', NULL, NULL, 'mariamyous5390@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(197, 197, 'CIK', 'P', 'MARIANA ANAK GARAN', '850918-13-5840', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '019 - 459 5720', '-', NULL, NULL, 'marianagaran85@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(198, 198, 'PUAN', 'P', 'MARINA ANAK ANIS', '830911-13-5014', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '012 - 898 7907', 'marina.anis@moh.gov.my', NULL, NULL, '-', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(199, 199, 'PUAN', 'P', 'MARINARIDAYU BINTI SAHARI', '780316-13-5340', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PENYEDIAAN MAKANAN', 'N2 TBK1', '-', '016 - 861 8017', '-', NULL, NULL, 'shineeryue@gmail.com', '-', 'UNIT SAJIAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(200, 200, 'PUAN', 'P', 'MARLINA ANAK JUGAH', '830301-05-5308', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 TBK1', '-', '011 - 2517 9016', '-', NULL, NULL, 'mamadexter2290@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(201, 201, 'PUAN', 'P', 'MARTHA ANAK CLEMENT ANUT', '810707-13-5529', 'BUMIPUTERA SARAWAK', 'SILA PILIH', 'KRISTIAN', 'PENOLONG PEGAWAI FARMASI', 'U6 TBK1', '-', '013 - 895 7676', '-', NULL, NULL, 'marthabellethea@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(202, 202, 'PUAN', 'P', 'MARTHA ANAK JOSEPH ROY', '770727-13-5338', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '019 - 854 6694', '-', NULL, NULL, 'marthajosephroy77@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(203, 203, 'PUAN', 'P', 'MARY ANAK JAI', '761031-13-5108', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '013 - 578 6031', '-', NULL, NULL, 'maryjai059@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(204, 204, 'PUAN', 'P', 'MARY ANAK MICHAEL', '780402-13-5988', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 (KUP)', '-', '010 - 976 8463', '-', NULL, NULL, 'marymichael463@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(205, 205, 'PUAN', 'P', 'MARY ANNIE ANAK BANGAU', '811225-13-5328', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU TADBIR (P/O)', 'N2', '-', '013 - 656 7063', 'mary_annie@moh.gov.my', NULL, NULL, '-', '-', 'UNIT PENTADBIRAN AM', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(206, 206, 'CIK', 'P', 'MARY ROWENTA ANAK MISENG', '950420-13-5462', 'BUMIPUTERA SARAWAK', '-', 'KRISTIAN', 'PEMBANTU TADBIR (P/O)', 'N1', '-', '013 - 895 1804', '-', NULL, NULL, 'maryrowenta@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(207, 207, 'PUAN', 'P', 'MAS SUHAILA BINTI MOHAMAD', '770307-13-5630', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '019 - 839 7387', '-', NULL, NULL, 'mohammadmassuhaila@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(208, 208, 'PUAN', 'P', 'MASITAH BINTI SIDI', '761212-13-5334', 'BUMIPUTERA SARAWAK', 'MELAYU SARAWAK', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '019 - 876 0991', 'masitah.sidi@moh.gov.my', NULL, NULL, 'masitahcd@gmail.com', '-', 'JPL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(209, 209, 'ENCIK', 'L', 'MAT BIN POZAN', '740120-13-5529', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN', 'U6', '-', '013 - 579 2230', 'mat.pozan@moh.gov.my', NULL, NULL, 'matpozanhdu@gmail.com', '-', 'UNIT HEMODIALISIS', '2026-08-03 05:15:19', '2026-09-14 06:21:59'),
(210, 210, 'PUAN', 'P', 'MATINA ANAK BAWAN', '760610-13-5642', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '019 - 876 9123', 'matina.bawan@moh.gov.my', NULL, NULL, 'matinabawan76@gmail.com', '-', 'UNIT KAWALAN INFEKSI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(211, 211, 'ENCIK', 'L', 'MATTHEW ANAK WILFRED NGGIE', '780301-13-5639', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PEMBANTU KHIDMAT AM', 'H1', 'Pemandu Kenderaan', '013 - 823 2317', 'matthew.wj@moh.gov.my', NULL, NULL, '-', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(212, 212, 'ENCIK', 'L', 'MAZALAN ANAK DASU', '770911-13-5485', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU KHIDMAT AM', 'H1', 'Pembantu Awam', '011 - 4001 0788', '-', NULL, NULL, 'mazalandasu@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(213, 213, 'PUAN', 'P', 'MAZLIN BINTI ACHER', '801021-13-5650', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI KERJA SOSIAL PERUBATAN', 'S10', '-', '019 - 827 9060', 'mazlinac@moh.gov.my', NULL, NULL, '-', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(214, 214, 'PUAN', 'P', 'MELOR BINTI ZARAWI', '750907-13-5230', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U6 TBK1', '-', '016 - 809 5004', '-', NULL, NULL, 'melorzarawi@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(215, 215, 'PUAN', 'P', 'MERESI ANAK JANGIN', '801106-13-6070', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '012 - 870 4630', '-', NULL, NULL, 'meresi0611@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(216, 216, 'PUAN', 'P', 'MERILYN ANAK RINGGUS', '771019-13-5374', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '014 - 884 9896', '-', NULL, NULL, 'merilynringgus12@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(217, 217, 'PUAN', 'P', 'MICHELLE ANAK MAMAT', '941219-13-5036', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PEGAWAI FARMASI', 'UF10', '-', '011 - 2663 5014', 'michelle.mamat@moh.gov.my', NULL, NULL, 'michellemamat19@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(218, 218, 'ENCIK', 'L', 'MIKE CLAURENCE ANAK KOLOK', '880814-13-5501', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURU X-RAY', 'U5', '-', '014 - 886 7413', 'mike.claurence@moh.gov.my', NULL, NULL, 'kolokmc@yahoo.com', '-', 'X-RAY', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(219, 219, 'PUAN', 'P', 'MISIA ANAK RUPEN', '770614-13-5438', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '010 - 946 7286', '-', NULL, NULL, 'misiamat38@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(220, 220, 'ENCIK', 'L', 'MOHAMAD AIMAN NAIM BIN JUNAIDI', '011221-13-0727', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN (K)', 'U5', '-', '012 - 774 0546', '-', NULL, NULL, 'aimannaim173@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(221, 221, 'ENCIK', 'L', 'MOHAMAD DZULKERNAINY BIN OTHMAN', '770527-13-5667', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU KHIDMAT AM', 'H1', 'Pemandu Kenderaan', '010 - 946 4865', '-', NULL, NULL, 'dayangkent7795@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(222, 222, 'ENCIK', 'L', 'MOHAMAD FAUZAN BIN MASUNUT', '750508-13-5663', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '019 - 849 3352', '-', NULL, NULL, 'mfauzan5663@gmail.com', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(223, 223, 'ENCIK', 'L', 'MOHAMAD NAZRI BIN ROSLI', '970328-13-6241', 'BUMIPUTERA SARAWAK', 'MELANAU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN (K)', 'U5', '-', '010 - 978 4864', 'nazri.rosli@moh.gov.my', NULL, NULL, 'nazrirosli28@gmail.com', 'BERTUKAR KELUAR PKB MUKAH (KK KUALA REJANG) LANTIKAN TETAP 27 JULAI 2026', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(224, 224, 'ENCIK', 'L', 'MOHAMAD PAJAR BIN AMAN', '780304-13-5335', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN', 'U6 TBK1', '-', '017 - 855 5792', '-', NULL, NULL, 'ikhmuq@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA, FORENSIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(225, 225, 'DR.', 'L', 'MOHAMAD SYAZWAN BIN MOHAMAD ZUKI', '940702-03-5057', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN', 'UD10', '-', '014 - 513 6645', 'syazwan.zuki@moh.gov.my', NULL, NULL, 'syazwanzuki@yahoo.com', 'BERTUKAR MASUK DARI HOSPITAL SELAYANG PADA 02.10.2025', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(226, 226, 'ENCIK', 'L', 'MOHAMMAD HERALD ABDULLAH @ HERALD', '751018-13-5251', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'ISLAM', 'PEMBANTU TADBIR (P/O)', 'N2 TBK1', '-', '017 - 839 1340', 'mohdherald@moh.gov.my', NULL, NULL, '-', '-', 'PENTADBIRAN AM', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(227, 227, 'ENCIK', 'L', 'MOHAMMAD JEFFERY BIN MADRIS', '790523-13-6097', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU KESELAMATAN', 'KP1', 'PEGAWAI KESELAMATAN', '011 - 1693 9360', 'mhdjeffery@moh.gov.my', NULL, NULL, '-', 'BERTUKAR DARI PEJABAT FARMSASI BAHAGIAN SARIKEI 06/10/2025', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(228, 228, 'ENCIK', 'L', 'MOHAMMAD JEFRI BIN ABDULLAH', '721116-13-5629', 'BUMIPUTERA SARAWAK', 'IBAN', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN', 'U7 TBK1', '-', '019 - 868 1524', 'mohammad.jefri@moh.gov.my', NULL, NULL, '-', '-', 'OT', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(229, 229, 'ENCIK', 'L', 'MOHAMMAD NOH BIN NARAWI', '840325-13-6101', 'BUMIPUTERA SARAWAK', 'MELANAU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '014 - 580 8839', '-', NULL, NULL, 'nohtx84@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(230, 230, 'ENCIK', 'L', 'MOHD. NA\'EM BIN MAHDI', '900309135071', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU KHIDMAT AM', 'H1', 'Pemandu Kenderaan', '014 - 262 3907', '-', NULL, NULL, 'suhadaahmad1998@icloud.com', 'PINJAM DARI HOSPITAL KAPIT', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(231, 231, 'ENCIK', 'L', 'MOHD RIZAN BIN JAPAR', '840718-03-5029', 'MELAYU', 'MELAYU', 'ISLAM', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 TBK1', '-', '013 - 822 6255', 'mohd.rizan@moh.gov.my', NULL, NULL, 're_zhan1807@yahoo.com', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(232, 232, 'ENCIK', 'L', 'MOHD SYAFIQ BIN MOHD SABRI', '890211-06-5291', 'MELAYU', 'MELAYU', 'ISLAM', 'JURUTERA (ELEKTRIK)', 'J9', '-', '013 - 633 7984', 'syafiq_sabri@moh.gov.my', NULL, NULL, '-', '-', 'PENGURUSAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(233, 233, 'ENCIK', 'L', 'MOHD SYAFIQ BIN SAJELI', '940726-13-5159', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN', 'U5', '-', '010 - 959 6722', '-', NULL, NULL, 'mohdsyafiqsajeli@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(234, 234, 'PUAN', 'P', 'MONALIZA BINTI ABDULLAH', '850925-13-5734', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'ISLAM', 'JURURAWAT', 'U5', '-', '013 - 813 5964', '-', NULL, NULL, 'udakmona85@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(235, 235, 'PUAN', 'P', 'MORRIE ANAK TAWIE', '820906-13-6144', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '019 - 824 0262', '-', NULL, NULL, 'morrie778@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(236, 236, 'PUAN', 'P', 'MOURINA ANAK DOMMOK', '720109-13-5490', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U7 TBK1', '-', '016 - 864 8637', 'mourina.dommok@moh.gov.my', NULL, NULL, 'mourinadommok@gmail.com', '-', 'UNIT HEMODIALISIS', '2026-08-03 05:15:19', '2026-09-14 06:22:03'),
(237, 237, 'ENCIK', 'L', 'MUHAMAD TARMIZE BIN DRAHMAN', '781114-13-5873', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '019 - 868 2755', '-', NULL, NULL, 'mtarmize14@gmail.com', '-', 'JPL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(238, 238, 'ENCIK', 'L', 'MUHAMMAD AZRULNIZAM BIN LAMAT', '940607-13-5615', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PENYEDIAAN MAKANAN', 'N1', '-', '013 - 829 8489', 'muhammad.nizam@moh.gov.my', NULL, NULL, 'azrulnizamlamat@gmail.com', '-', 'UNIT SAJIAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(239, 239, 'DR.', 'L', 'MUHAMMAD FIRDAUS BIN MOHD NASIR', '960206-10-6213', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN', 'UD10', '-', '011 - 1898 5272', '-', NULL, NULL, 'firdauslah06@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(240, 240, 'ENCIK', 'L', 'MUHAMMAD NAZIFFUDDIN BIN NAZLIN', '010118-01-0255', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN (K)', 'U5', '-', '013 - 606 6753', '-', NULL, NULL, 'mnaziff1811@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(241, 241, 'ENCIK', 'L', 'MUHAMMAD RAFIE AIMAN BIN RAHIM', '010804-01-0407', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN (K)', 'U5', '-', '011 - 2417 5745', 'muhammad.rafie@moh.gov.my', NULL, NULL, 'aimanrafie24@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(242, 242, 'PUAN', 'P', 'MUNIRAH ABDUL RAHMAN', '831228-13-5794', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '011 - 1409 2331', '-', NULL, NULL, 'munirahabdulrahman240@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(243, 243, 'PUAN', 'P', 'NANCY ANAK PINTAK', '790415-13-5302', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '013 - 571 9287', '-', NULL, NULL, 'nancypintak30@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(244, 244, 'DR.', 'P', 'NEO WEN TING', '880406-01-5412', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI PERUBATAN PAKAR', 'UD13', '-', '012 - 737 7658', '-', NULL, NULL, 'my_wenting88@yahoo.com', '(O&G) BERTUKAR MASUK KE HOSP. SERIAN PADA 26.08.2025 DARI HUS', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(245, 245, 'CIK', 'P', 'NG GEK TING', '810613-13-5018', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI FARMASI', 'UF14', '-', '012 - 885 8730', 'nggt@moh.gov.my', NULL, NULL, '-', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(246, 246, 'ENCIK', 'L', 'NG YUAN XUN', '890102-08-5189', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI FARMASI', 'UF12', '-', '018 - 952 7408', 'ngyuanxun@moh.gov.my', NULL, NULL, '-', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(247, 247, 'DR.', 'L', 'NGO NGUK KEONG', '960229-08-5355', 'CINA', 'CINA', 'KRISTIAN', 'PEGAWAI PERUBATAN', 'UD10', '-', '018 - 571 1091', '-', NULL, NULL, 'ngongukkeong@yahoo.com', 'BERTUKAR MASUK DARI HOSPITAL SERI MANJUNG PERAK PADA 02.10.2025', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(248, 248, 'PUAN', 'P', 'NGU SING JIAT', '871106-52-6056', 'CINA', 'CINA', 'KRISTIAN', 'PEGAWAI FARMASI', 'UF14', '-', '016 - 896 8432', 'singjiat@moh.gov.my', NULL, NULL, '-', 'BERTUKAR MASUK DARI HUS PADA 15.1.2025', 'Unit Farmasi', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(249, 249, 'PUAN', 'P', 'NOBERT ANAK SAKONG', '760524-13-5996', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '014 - 282 8590', '-', NULL, NULL, 'nobertnobert306@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(250, 250, 'CIK', 'P', 'NOOR ZAHRINA BINTI BRAHIM', '850115-13-5054', 'MELAYU', 'MELAYU', 'ISLAM', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 (KUP)', '-', '011 - 1989 7959', 'noor.zahrina@moh.gov.my', NULL, NULL, '-', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(251, 251, 'ENCIK', 'L', 'NOOR-AZUWAN BIN BA\'IEE', '871013-13-5275', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN', 'U6', '-', '011 - 7214 4721', 'noorazuwan@moh.gov.my', NULL, NULL, '-', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(252, 252, 'ENCIK', 'L', 'NORAIMAN BIN MOHAMAD SPIEE', '911110-13-6345', 'MELAYU', 'MELAYU', 'ISLAM', 'JURUPULIH FISIOTERAPI', 'U5', '-', '010 - 527 2723', '-', NULL, NULL, 'aimanmspiee@gmail.com', '-', 'UNIT FISIOTERAPI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(253, 253, 'PUAN', 'P', 'NORAINI ANAK SIJAU', '801112-13-6050', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '011 - 1260 9844', '-', NULL, NULL, 'norainisijau@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(254, 254, 'PUAN', 'P', 'NORASTRIA FIZARAZA BINTI NORMAN', '930515-13-6494', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN (K)', 'U5', '-', '011 - 2186 6862', '-', NULL, NULL, 'norastriafizarazanorman@gmail.com', 'Lantik Semula Kontrak 24.07.2023', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(255, 255, 'PUAN', 'P', 'NORHAYATI ABDULLAH @ JESSIE ANAK GAMOK', '740801-13-5356', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'ISLAM', 'PEMBANTU TADBIR (P/O)', 'N2 TBK1', '-', '013 - 804 9854', '-', NULL, NULL, 'jsscyat@gmail.com', '-', 'AKAUN DAN KEWANGAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(256, 256, 'PUAN', 'P', 'NORIA ANAK AWANG', '830826-13-6346', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '010 - 550 9676', '-', NULL, NULL, 'noria2608@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(257, 257, 'PUAN', 'P', 'NORIANA ANAK GANDU', '780512-13-5428', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '016 - 444 3026', 'noriana.gandu@moh.gov.my', NULL, NULL, 'norianagandu@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(258, 258, 'PUAN', 'P', 'NORIZAN BINTI MOSRI', '960108-13-5440', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN PAKAR', 'U1', '-', '012 - 845 3194', '-', NULL, NULL, 'izanmosri96@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(259, 259, 'PUAN', 'P', 'NORKIAH BINTI KERAM', '820309-13-5290', 'MELAYU', 'MELAYU', 'ISLAM', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 TBK1', '-', '011 - 2504 6177', 'norkiah.keram@moh.gov.my', NULL, NULL, '-', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(260, 260, 'PUAN', 'P', 'NORLIDA BINTI DAUD', '890130-13-6342', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU TADBIR (P/O)', 'N1', '-', '014 - 948 8030', 'norlidadaud@moh.gov.my', NULL, NULL, '-', '-', 'PENTADBIRAN AM', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(261, 261, 'CIK', 'P', 'NORZARINA BINTI SAPAWE', '871110-52-6200', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI TADBIR', 'N5', '-', '013 - 825 5599', 'norzarina.sapawe@moh.gov.my', NULL, NULL, '-', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(262, 262, 'PUAN', 'P', 'NUR AFIFAH RESIK BINTI ABDULLAH', '840626-13-5014', 'BUMIPUTERA SARAWAK', 'IBAN', 'ISLAM', 'JURURAWAT', 'U5', '-', '017 - 261 5681', '-', NULL, NULL, 'nuafifahabdullah@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(263, 263, '-', 'P', 'NUR AISYAH GUAN ABDULLAH', '810208-52-6052', '-', '-', '-', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '-', '-', NULL, NULL, '-', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(264, 264, 'PUAN', 'P', 'NUR ALYA BINTI MOHD ROSDI', '990922-08-5262', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI SAINS KIMIA HAYAT', 'C9', '-', '011 - 1075 1076', 'nur.alya@moh.gov.my', NULL, NULL, '-', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(265, 265, 'DR.', 'P', 'NUR ANIS AFIFAH BINTI BAKRI', '940317-02-5258', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN', 'UD10', '-', '018 - 277 3270', '-', NULL, NULL, 'dranis.afifah@gmail.com', 'BERTUKAR MASUK DARI HOSPITAL SULTAN ABDUL HALIM SUNGAI PETANI KEDAH PADA 02.10.2025', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(266, 266, 'PUAN', 'P', 'NUR ASYIKIN BINTI ABDULLAH', '770716-13-5746', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2', '-', '017 - 573 5949', '-', NULL, NULL, 'nurasyikin.ikin1977@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(267, 267, 'PUAN', 'P', 'NUR ATHIRAH BINTI ABDULLAH', '770520-13-5840', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'ISLAM', 'JURURAWAT', 'U5', '-', '016 - 856 4498', 'athirahabdullah@moh.gov.my', NULL, NULL, '-', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(268, 268, 'PUAN', 'P', 'NUR DY\'EMIRA BINTI BOGI', '950412-13-5278', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U5', '-', '014 - 578 3095', '-', NULL, NULL, 'mirabogi95@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(269, 269, 'DR.', 'P', 'NUR FARHANA BINTI MUHAMMAD', '931025-10-6692', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN', 'UD10', '-', '018 - 288 3937', '-', NULL, NULL, 'nurfarhanamuhammad2@gmail.com', 'BERTUKAR MASUK DARI', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(270, 270, 'PUAN', 'P', 'NUR HARFYNA BINTI MOHARMAT', '900112-13-5238', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U5', '-', '014 - 998 3703', '-', NULL, NULL, 'nharfyna@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(271, 271, 'CIK', 'P', 'NUR HIDAYATUL AKMAL BINTI ADENI', '990109-13-5474', 'MELAYU', 'MELAYU', 'ISLAM', 'PENOLONG PEGAWAI PERUBATAN', 'U5', '-', '011 - 2699 0561', '-', NULL, NULL, 'nurhdytul@gmail.com', 'BERTUKAR MASUK DARI HOSPITAL UMUM SARAWAK', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(272, 272, 'CIK', 'P', 'NUR IRWANA ELISYA ABDULLAH', '861014-52-6690', 'BUMIPUTERA SARAWAK', 'IBAN', 'ISLAM', 'JURURAWAT', 'U5', '-', '018 - 322 3305', '-', NULL, NULL, 'carolyza1986@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(273, 273, 'PUAN', 'P', 'NURASSLINDA BINTI ABDULLAH @ CYNTHIA MELINDA ANAK ALING', '780705-13-5272', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '013 - 847 4409', '-', NULL, NULL, 'cyncyn7409@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(274, 274, 'PUAN', 'P', 'NUR SYAHIDAH ANITA BINTI ABDULLAH', '790404-13-6318', 'BUMIPUTERA SARAWAK', 'KENYAH', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2 (KUP)', '-', '019 - 863 3788', '-', NULL, NULL, 'nnsya3788@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(275, 275, 'DR.', 'P', 'NUR\'IZZATY BINTI YUSNAZERY', '970812-13-5304', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN (K)', 'UD10', '-', '019 - 355 7097', '-', NULL, NULL, 'ynurizzaty@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(276, 276, 'CIK', 'P', 'NURSHAKINAH BINTI ABDULLAH', '921109-13-5256', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U5', '-', '011 - 1599 5624', '-', NULL, NULL, 'nurshakinahabdullah@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(277, 277, 'PUAN', 'P', 'NURUL AMIRAH BINTI BONGSU', '871227-47-5890', 'BUMIPUTERA SABAH', 'BAJAU', 'ISLAM', 'PEGAWAI PERUBATAN PAKAR', 'N5', '-', '010 - 799 1987', 'nurul.amirahbongsu@moh.gov.my', NULL, NULL, 'noroul.amyrah@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(278, 278, 'DR.', 'P', 'NURUL FARAHIN BINTI SULEIMAN', '920425-01-6326', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN', 'UD10', '-', '019 - 801 3125', 'nurulfarahin@moh.gov.my', NULL, NULL, 'n.fain254@yahoo.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(279, 279, 'PUAN', 'P', 'NURULYANI HAMIMI BINTI DAZUKI', '850622-13-5972', 'MELAYU', 'MELAYU', 'ISLAM', 'JURUPULIH PERUBATAN CARA KERJA', 'U6 TBK1', '-', '013 - 807 9799', 'nurulyani.hamimi@moh.gov.my', NULL, NULL, 'amydazuki@gmail.com', '-', 'UNIT CARAKERJA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(280, 280, 'PUAN', 'P', 'OLING LUHAT', '770707-13-5760', 'BUMIPUTERA SARAWAK', 'KENYAH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 (KUP)', '-', '011 - 1201 7595', 'oling.luhat@moh.gov.my', NULL, NULL, '-', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(281, 281, 'PUAN', 'P', 'ONG CHOON LAN', '700401-13-5764', 'CINA', 'CINA', 'BUDDHA', 'JURURAWAT', 'U7 TBK2', '-', '019 - 854 1683', '-', NULL, NULL, 'choonlanong2@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(282, 282, 'DR.', 'P', 'ONG YEE CHIING', '930821-10-5290', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI PERUBATAN', 'UD10', '-', '012 - 334 7256', '-', NULL, NULL, 'yeechiing93@gmail.com', 'CUTI BELAJAR', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(283, 283, 'DR.', 'L', 'OOI TZU CHIA', '960616-02-6101', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI PERUBATAN', 'UD10', '-', '016 - 770 8136', 'ooi.tzuchia@moh.gov.my', NULL, NULL, 'ooitzuchia@gmail.com', '-', 'ETD', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(284, 284, 'PUAN', 'P', 'PATEMAH BINTI BUJANG', '820505-13-6012', 'BUMIPUTERA SARAWAK', 'MELAYU SARAWAK', 'ISLAM', 'JURU X-RAY', 'U5', '-', '019 - 866 2458', 'patemah@moh.gov.my', NULL, NULL, '-', '-', 'XRAY', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(285, 285, 'ENCIK', 'L', 'PATRICK WEXLLER ANAK REJAS', '970916-13-5675', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU KHIDMAT AM', 'H1', 'Pembantu Operasi', '013 - 604 0197', 'patrick.wexller@moh.gov.my', NULL, NULL, 'patrickgikz@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(286, 286, 'PUAN', 'P', 'PEMELA CANDIDA ANAK JOHNY', '830130-13-5230', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '013 - 829 6125', '-', NULL, NULL, 'kikoyuna83@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(287, 287, 'ENCIK', 'L', 'PENAN ANAK  HUT', '740906-13-5539', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU KHIDMAT AM', 'H1', 'Pembantu Awam', '014 - 318 6418', '-', NULL, NULL, 'penanhut1974@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(288, 288, 'PUAN', 'P', 'PENNY ANAK GEORGE MANGGU', '800107-13-5438', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI FARMASI', 'U6 TBK1', '-', '019 - 876 8649', '-', NULL, NULL, 'pennygeorgemanggu@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(289, 289, 'PUAN', 'P', 'QHUZIEMA BINTI MATERANG', '890217-13-6548', 'MELAYU', 'MELANAU', 'ISLAM', 'PEMBANTU PENYEDIAAN MAKANAN', 'N1', '-', '011 - 1064 1644', '-', NULL, NULL, 'qhuziema89@gmail.com', '-', 'UNIT SAJIAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(290, 290, 'PUAN', 'P', 'RAFEAH BINTI SARKAWI', '720311-13-5320', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U3 TBK1', '-', '016 - 894 2701', 'rafeah.sarkawi@moh.gov.my', NULL, NULL, 'rafeah5320@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(291, 291, 'PUAN', 'P', 'RAJIAH BINTI MOHAMAD', '871104-52-5922', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U5', '-', '012 - 855 0038', '-', NULL, NULL, 'raziqhaikal25@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(292, 292, 'PUAN', 'P', 'RASIDAH BINTI SELI', '890924-13-6002', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PENYEDIAAN MAKANAN', 'N1', '-', '010 - 881 5243', '-', NULL, NULL, 'zahiraharieysha89@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(293, 293, 'PUAN', 'P', 'REMUNA ANAK TELOK', '780628-13-5614', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 (KUP)', '-', '011 - 2501 3129', 'remuna@moh.gov.my', NULL, NULL, 'remunatelok1@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(294, 294, 'ENCIK', 'L', 'RENNDY RYAN ANAK NORSIAH', '841029-13-5707', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U5 TBK1', '-', '012 - 899 0704', '-', NULL, NULL, 'ryanx619@yahoo.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(295, 295, 'DR.', 'P', 'RENUGAHH A/P SUKALINGAM', '920223-14-6114', 'INDIA', 'INDIA', 'HINDU', 'PEGAWAI PERUBATAN', 'UD10', '-', '010 - 374 2195', '-', NULL, NULL, 'renugasukalingam@gmail.com', '-', 'UNIT PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(296, 296, 'PUAN', 'P', 'RILA ANAK LINGKONG', '790212-13-6102', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 (KUP)', '-', '011 - 1201 7970', '-', NULL, NULL, 'yungrilling@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(297, 297, 'CIK', 'P', 'RINNIE ANAK PAIENG', '021117-13-0742', 'BUMIPUTERA SARAWAK', 'SILA PILIH', 'KRISTIAN', 'PEMBANTU KHIDMAT AM', 'H1', 'Pembantu Awam', '011 - 2525 7267', '-', NULL, NULL, 'rinnienie28@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(298, 298, 'ENCIK', 'L', 'RIZUANNY NG', '860302-13-5403', 'CINA', 'HAKKA', 'KRISTIAN', 'PENOLONG PEGAWAI TADBIR', 'N5', 'PENOLONG PEGAWAI TADBIR (REKOD PERUBATAN)', '019 - 771 0203', 'rizuannyng@moh.gov.my', NULL, NULL, 'rizuanny86@gmail.com', '-', 'UNIT REKOD PERUBATAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(299, 299, 'PUAN', 'P', 'ROHANA A/P RUT', '810925-13-5826', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI FARMASI', 'U6 TBK1', '-', '014 - 652 5377', '-', NULL, NULL, 'rohanarut81@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(300, 300, 'ENCIK', 'L', 'ROLAND WALTER ANAK NORBERT NYULIN', '730824-13-5333', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U6 TBK1', '-', '017 - 801 1921', 'roland.walter@moh.gov.my', NULL, NULL, 'rolandwalter824@gmail.com', '-', 'JPL NCD', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(301, 301, 'ENCIK', 'L', 'RONALD ANAK LAWRENCE', '771105-13-5469', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURU X-RAY', 'U6', '-', '013 - 574 4484', 'ronald.lawrence@moh.gov.my', NULL, NULL, 'xmen1351@gmail.com', '-', 'XRAY', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(302, 302, 'PUAN', 'P', 'RONIE ANAK OKIT', '800615-13-5338', 'BUMIPUTERA SARAWAK', 'SILA PILIH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '011 - 2552 6744', 'ronieokit@moh.gov.my', NULL, NULL, 'ronieokit1@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(303, 303, 'ENCIK', 'L', 'RONY ANAK KATAU', '850617-13-6057', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U6 TBK1', '-', '016 - 201 9748', '-', NULL, NULL, 'ronykatau17@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(304, 304, 'PUAN', 'P', 'ROSA ANAK JACOB SIHA', '730421-13-5566', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 TBK1', '-', '019 - 879 1260', 'rosa@moh.gov.my', NULL, NULL, '-', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(305, 305, 'PUAN', 'P', 'ROSA ANAK TIHEW', '820711-13-5168', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U6 TBK1', '-', '019 - 865 5538', '-', NULL, NULL, 'rosathiew@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(306, 306, 'PUAN', 'P', 'ROSEMIZA ANAK PRASARA', '980525-13-5562', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '016 - 620 7291', '-', NULL, NULL, 'rosemiza.prasara@gmail.com', 'LANTIKAN BARU 21.10.2024', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(307, 307, 'PUAN', 'P', 'ROSIAH BINTI SALEM', '790204-13-5994', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U6 (KUP)', '-', '016 - 865 1514', '-', NULL, NULL, 'farhanfarhana0411@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(308, 308, 'CIK', 'P', 'ROSITA BINTI ARIP', '750802-13-5824', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U6 TBK1', '-', '019 - 466 1214', 'rositaarip@moh.gov.my', NULL, NULL, 'rositaarip@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(309, 309, 'PUAN', 'P', 'ROSSNAH ANAK AKOU', '880718-13-5376', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '010 - 599 2959', '-', NULL, NULL, 'rossnahakakou.88@gmail.com', 'LANTIKAN BARU 21.10.2024', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(310, 310, 'PUAN', 'P', 'ROSTY ANAK BONIFIS NAYAN', '740406-13-5794', 'BUMIPUTERA SARAWAK', 'SILA PILIH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 (KUP)', '-', '011 - 1479 7290', 'rosty.bonifis@moh.gov.my', NULL, NULL, 'rostybonifisn@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(311, 311, 'ENCIK', 'L', 'ROYSTON ANAK RAYMOND', '850616-12-5591', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU KHIDMAT AM', 'H1', 'Pemandu Kenderaan', '017 - 252 4323', '-', NULL, NULL, 'roystonraymond21@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(312, 312, 'ENCIK', 'L', 'ROZZI ANAK CHILI', '830426-13-5723', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U6 TBK1', '-', '011 - 3366 2280', '-', NULL, NULL, 'rozzi9003@gmail.com', '-', 'Klinik TBCP', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(313, 313, 'ENCIK', 'L', 'RUSH ANAK TINGGI', '870919-52-6411', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U5', '-', '011 - 3690 9661', 'rush@moh.gov.my', NULL, NULL, '-', '-', 'UNIT PSIKIATRI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(314, 314, 'PUAN', 'P', 'SABRINA ANAK NORBAT', '790515-13-5246', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '019 - 846 6240', '-', NULL, NULL, 'sabrinanorbat79@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(315, 315, 'ENCIK', 'L', 'SAIMOND ANAK AHO', '760903-13-5275', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U6 TBK1', '-', '018 - 986 7042', '-', NULL, NULL, 'sharpshooter9927@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(316, 316, 'PUAN', 'P', 'SALAWATY BINTI GOH', '770605-13-5014', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2 (KUP)', '-', '013 - 567 7535', 'salawaty@moh.gov.my', NULL, NULL, 'watygoh77@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(317, 317, 'DR.', 'L', 'SAM JIA YIT', '981008-43-5289', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI PERUBATAN (K)', 'UD9', '-', '017 - 667 1878', '-', NULL, NULL, 'samjiayit@hotmail.com', 'TAMAT KONTRAK: 12.03.2026', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(318, 318, 'PUAN', 'P', 'SARAH SONJA ANAK ANDREW RACHENG', '770814-13-5862', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '013 - 804 3830', '-', NULL, NULL, 'sarahsonja77@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(319, 319, 'ENCIK', 'L', 'SELVESTER CHUA ANAK DUNGGO', '861113-13-5361', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PENYEDIAAN MAKANAN', 'N1', '-', '011 - 3365 8365', '-', NULL, NULL, 'selvesterchua1986@gmail.com', '-', 'UNIT SAJIAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(320, 320, 'PUAN', 'P', 'SHARIFAH NORMALA BINTI WAN MAN', '870711-52-6076', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PENYEDIAAN MAKANAN', 'N1', '-', '013 - 698 3611', '-', NULL, NULL, 'sharifahnormala@yahoo.com', '-', 'UNIT SAJIAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(321, 321, 'PUAN', 'P', 'SHARONNINA HANNEY SAMAI ANAK GARAN', '961030-13-5284', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '019 - 404 8056', '-', NULL, NULL, 'sharonninahanney@gmail.com', 'BERTUKAR MASUK DARI HOSPITAL TUNKU AZIZAH KUALA LUMPUR', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(322, 322, 'ENCIK', 'L', 'SHARUDDIN BIN SAPRAN', '930126-13-5594', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '011 - 3928 6809', '-', NULL, NULL, 'udentwak93@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(323, 323, 'PUAN', 'P', 'SHERLY ANAK BAJAK', '820707-13-5712', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '011 - 3927 8089', '-', NULL, NULL, 'sherlybajak0707@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(324, 324, 'CIK', 'P', 'SIAW YEE NEO', '890821-13-6050', 'CINA', 'CINA', 'BUDDHA', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U5', '-', '010 - 976 9333', 'siaw.yee@moh.gov.my', NULL, NULL, '-', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(325, 325, 'PUAN', 'P', 'SIERA BINTI MALI', '870325-30-5072', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'ISLAM', 'JURURAWAT', 'U5', '-', '019 - 805 7518', 'siera@moh.gov.my', NULL, NULL, 'siera.mali31@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(326, 326, 'PUAN', 'P', 'SILVIA ANAK LUYANG', '760403-13-5180', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 TBK1', '-', '019 - 828 6609', 'silvia.luyang@moh.gov.my', NULL, NULL, '-', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(327, 327, 'PUAN', 'P', 'SITI MASHURI BINTI JAHIL', '920310-13-5544', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PENYEDIAAN MAKANAN', 'N1', '-', '011 - 1933 6293', '-', NULL, NULL, 'mashurisiti@gmail.com', '-', 'UNIT SAJIAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(328, 328, 'PUAN', 'P', 'SITI NOOR HAFIZA BINTI MAJALAN', '910201-13-6426', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U1', '-', '014 - 892 1261', '-', NULL, NULL, 'hafizamajalan@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(329, 329, 'PUAN', 'P', 'SITI NURNATASAH BINTI SAPANI', '860812-13-5278', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U5', '-', '011 - 3333 1724', '-', NULL, NULL, 'mamaamnanamani@gmail.com', 'BERTUKAR MASUK DARI HOSPITAL SIMUNJAN', 'ETD', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(330, 330, 'DR.', 'P', 'SITI NURUL AIDA BINTI AHMAD', '950716-11-5436', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN', 'UD10', '-', '017 - 951 7512', '-', NULL, NULL, 'nurulaida.taqwa@gmail.com', 'BERTUKAR MASUK DARI HOSPITAL KEMAMAN TERENGGANU PADA 02.10.2025', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(331, 331, 'PUAN', 'P', 'SITI NURULASSHYIKIN BINTI IDRIS', '900516-13-5058', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT', 'U5', '-', '014 - 575 3898', '-', NULL, NULL, 'sitinurulasshyikinidris@yahoo.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(332, 332, 'PUAN', 'P', 'SITI ROHAIDA BINTI MD AMEN', '810820-13-5782', 'BUMIPUTERA SARAWAK', 'MELANAU', 'ISLAM', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6', '-', '014 - 393 4250', '-', NULL, NULL, 'ctrohaida81@gmail.com', '-', 'MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(333, 333, 'PUAN', 'P', 'SITI SARRA ABDULLAH', '760106-13-5432', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '014 - 956 4049', '-', NULL, NULL, 'sitisarraabdullahabdullah@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(334, 334, 'PUAN', 'P', 'SITI SYUHADA MOHD SHUKRI', '920207-13-5378', 'BUMIPUTERA SARAWAK', 'IBAN', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U1', '-', '011 - 2993 0920', '-', NULL, NULL, 'syutas@yahoo.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(335, 335, 'PUAN', 'P', 'SITI ZUHAIRAH BINTI ZAINUDDIN', '970812-14-5350', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI FARMASI', 'UF9', '-', '011 - 2854 8084', 'sitizuhairah1997@moh.gov.my', NULL, NULL, '-', 'BERTUKAR MASUK DARI PEJABAT KESIHATAN DAERAH GOMBAK PADA 05.06.2025', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(336, 336, 'PUAN', 'P', 'SOLOMI ANAK KULAR', '761208-13-5868', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 (KUP)', '-', '011 - 2532 7839', 'solomi@moh.gov.my', NULL, NULL, 'loomiekular@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(337, 337, 'PUAN', 'P', 'SOPHY ANAK RUNTA', '900802-13-5104', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '011 - 1938 6480', '-', NULL, NULL, 'csophyrunta@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(338, 338, 'PUAN', 'P', 'STALIE JULIE ANAK ASI', '901203-13-5078', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U1', '-', '011 - 2983 9742', 'stalie.julie@moh.gov.my', NULL, NULL, '-', '-', 'JPL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(339, 339, 'PUAN', 'P', 'STELLA ANAK LUPIT', '760913-13-5914', 'BUMIPUTERA SARAWAK', 'SILA PILIH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '014 - 585 6242', '-', NULL, NULL, 'stella.lupid76@gmail.com', '-', 'ETD', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(340, 340, 'PUAN', 'P', 'SUBIBAH BINTI ROSLI', '820131-13-5508', 'BUMIPUTERA SARAWAK', 'KEDAYAN', 'ISLAM', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 TBK1', '-', '013 - 820 8244', 'subibah.rosli@moh.gov.my', NULL, NULL, '-', '-', 'UNIT MAKMAL', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(341, 341, 'PUAN', 'P', 'SUHAILAH BINTI JALANI', '780223-13-5042', 'BUMIPUTERA SARAWAK', 'MELANAU', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '013 - 800 9664', '-', NULL, NULL, 'suhailahjalani@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(342, 342, 'DR.', 'L', 'SURESH DOMINIC VINCENT A/L JOHN VINCENT', '811003-01-6681', 'INDIA', 'INDIA', 'HINDU', 'PEGAWAI PERUBATAN', 'UD14', '-', '016 - 205 3989', 'drsureshdominic@moh.gov.my', NULL, NULL, '-', '-', 'UNIT PSIKIATRI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(343, 343, 'PUAN', 'P', 'SUSAN ANAK INCHE', '790213-13-5144', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI FARMASI', 'U6 TBK1', '-', '011 - 2784 1302', '-', NULL, NULL, 'susaninche@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(344, 344, 'PUAN', 'P', 'SUSANTI BT.ABDULLAH @ CATHERINE AK ELIAS', '760415-13-5110', 'BUMIPUTERA SARAWAK', 'SILA PILIH', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '013 - 823 8087', '-', NULL, NULL, 'susantiabdullah907@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(345, 345, 'PUAN', 'P', 'SUSIE ANAK SALIM', '761013-13-5200', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PENYEDIAAN MAKANAN', 'N1', '-', '014 - 336 1575', '-', NULL, NULL, 'esyzye1575@gmail.com', '-', 'UNIT SAJIAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(346, 346, 'PUAN', 'P', 'SUZIE ANAK JARI', '810808-13-5974', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U6 TBK1', '-', '017 - 317 0081', '-', NULL, NULL, 'stephendarrel76@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(347, 347, 'PUAN', 'P', 'SUZYNAWATY BINTI MOHAMAD', '800506-13-5830', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '011 - 1261 3007', '-', NULL, NULL, 'angah8708@gmail.com', '-', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(348, 348, 'PUAN', 'P', 'SYLVIA RONALD SAINIK @ NUR HUSNA DZAKIRAH', '821001-12-5074', 'BUMIPUTERA SABAH', 'KADAZAN DUSUN', 'ISLAM', 'PEMBANTU TADBIR (P/O)', 'N2 TBK1', '-', '019 - 821 1290', 'nurhusna@moh.gov.my', NULL, NULL, '-', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(349, 349, 'DR.', 'L', 'TAN JEF WAYNE', '910414-08-5861', 'CINA', 'CINA', 'KRISTIAN', 'PEGAWAI PERUBATAN', 'UD12', '-', '012 - 980 5860', '-', NULL, NULL, 'jefwaynetan@gmail.com', '-', 'Perubatan Dalaman', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(350, 350, 'PUAN', 'P', 'TARINA ANAK BANTOK', '850925-13-5582', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU TADBIR (P/O)', 'N2 TBK1', 'Pegawai Khidmat Pelanggan', '016 - 809 7379', '-', NULL, NULL, 'tarina2509@gmail.com', '-', 'PENGURUSAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19');
INSERT INTO `staff` (`id`, `bil`, `gelaran`, `jantina`, `nama_penuh`, `no_kp`, `bangsa`, `etnik`, `agama`, `jawatan_sspa`, `gred_sspa`, `jawatan_ssm`, `no_telefon`, `emel_rasmi`, `emel_status`, `emel_status_nota`, `emel_peribadi`, `catatan`, `penempatan`, `created_at`, `updated_at`) VALUES
(351, 351, 'PUAN', 'P', 'TELANYING ANAK USAT', '760209-13-6104', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT', 'U6', '-', '019 - 665 7629', 'telanying@moh.gov.my', NULL, NULL, 'nesslyee.angel@gmail.com', '-', 'WAD MATERNITI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(352, 352, 'PUAN', 'P', 'TERESA ANAK RUMPET', '751207-13-5322', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI FARMASI', 'U6 TBK1', '-', '019 - 878 8493', '-', NULL, NULL, 'teresarumpet@yahoo.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(353, 353, 'CIK', 'P', 'THIAN LEE PING', '950601-13-5154', 'CINA', 'CINA', 'BUDDHA', 'PEGAWAI FARMASI', 'UF12', '-', '014 - 683 8416', 'thian.lee@moh.gov.my', NULL, NULL, 'leepingthian95@gmail.com', '-', 'UNIT FARMASI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(354, 354, 'DR.', 'L', 'THINESH KUMAR A/L KARADAPANDDY', '861111-56-6141', 'INDIA', 'INDIA', 'HINDU', 'PEGAWAI PERUBATAN PAKAR', 'UD14', '-', '012 - 687 2547', 'thineshkumar@moh.gov.my', NULL, NULL, 'thinesh_mufc@hotmail.com', 'Psikaitri LAPOR DIRI PADA 02.01.2024', 'UNIT PSIKIATRI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(355, 355, 'DR.', 'L', 'THIYAGU A/L RAMACHANDARAM', '921020-14-6733', 'INDIA', 'INDIA', 'HINDU', 'PEGAWAI PERUBATAN', 'UD10', '-', '012 - 305 0395', 'thiyagu@moh.gov.my', NULL, NULL, 'tyagu2014@gmail.com', '-', 'Perubatan Dalaman', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(356, 356, 'ENCIK', 'L', 'TIMOTHY AARON ANAK JUNGU @ KERON', '870423-08-5093', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURU X-RAY', 'U5', '-', '010 - 598 1531', 'timothy.aaron@moh.gov.my', NULL, NULL, 'thimzaj_007@yahoo.com', '-', 'UNIT PENGIMEJAN DAN DIAGNOSTIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(357, 357, 'ENCIK', 'L', 'TIMOTHY ANAK NASIN', '800624-13-5903', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '012 - 853 3700', '-', NULL, NULL, 'nandes7714@gmail.com', '-', 'UNIT CSSD', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(358, 358, 'PUAN', 'P', 'TINA ANAK MA-IS', '890604-13-5932', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '014 - 877 1866', 'tina.mais@moh.gov.my', NULL, NULL, 'tinamais89@yahoo.com', 'Lapor diri pada 01.03.2024 dr HUS', 'UNIT HEMODIALISIS', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(359, 359, 'PUAN', 'P', 'TRACY ELEBTH', '810128-13-5161', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '011 - 2518 2492', '-', NULL, NULL, 'tracyjohniddy@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(360, 360, 'PUAN', 'P', 'VERONICA JANET ANAK JOSEPH DEWI', '761216-13-5462', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '013 - 856 4389', '-', NULL, NULL, 'qaa5026b@gmail.com', '-', 'WAD PEREMPUAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(361, 361, 'CIK', 'P', 'VIVI ANAK NELSON', '910813-13-5192', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U5', '-', '014 - 391 2029', 'vivi.nelson@moh.gov.my', NULL, NULL, '-', '-', 'UNIT MAKMAL & PATOLOGI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(362, 362, 'PUAN', 'P', 'VIVIAN ANAK MICHAEL RUNDU', '891117-14-5396', 'BUMIPUTERA SARAWAK', 'IBAN', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U1', '-', '010 - 968 8324', '-', NULL, NULL, 'vivianaileen89@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(363, 363, 'CIK', 'P', 'VIVIAN ANN DUBAH ANAK OLIVER', '990516-13-5586', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U5', '-', '014 - 899 5220', '-', NULL, NULL, 'viviananndubah@gmail.com', '-', 'DEWAN BEDAH', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(364, 364, 'PUAN', 'P', 'VOON SIEW MOI', '930721-13-5476', 'CINA', 'CINA', 'KRISTIAN', 'JURURAWAT', 'U5', '-', '014 - 683 2746', '-', NULL, NULL, 'siewmoivoon@gmail.com', 'Bertukar masuk dari PJHUS mulai 15.04.2024', 'WAD PEDIATRIK', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(365, 365, 'PUAN', 'P', 'WANICE ANAK MASEK', '690914-13-5368', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'JURURAWAT MASYARAKAT', 'U3 TBK2', '-', '013 - 516 9131', '-', NULL, NULL, 'simwanice@gmail.com', '-', 'WAD LELAKI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(366, 366, 'ENCIK', 'L', 'WILLSON ANAK MACK MAEH', '790902-13-5449', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PENOLONG PEGAWAI PERUBATAN', 'U6', '-', '010 - 222 7793', 'willson.mack@moh.gov.my', NULL, NULL, 'willsonmack007793@gmail.com', '-', 'KLINIK PAKAR', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(367, 367, 'PUAN', 'P', 'ZADORA ANAK GUAM', '860731-13-5014', 'BUMIPUTERA SARAWAK', 'BIDAYUH', 'KRISTIAN', 'PEMBANTU TADBIR (P/O)', 'N1', '-', '016 - 546 3461', 'zadora@moh.gov.my', NULL, NULL, '-', '-', 'UNIT PENTADBIRAN', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(368, 368, 'DR.', 'P', 'ZAFIRAH BINTI ROSDI', '920428-03-6170', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN', 'UD10', '-', '018 - 288 0428', 'dr_zafirah@moh.gov.my', NULL, NULL, 'zzafirahd@yahoo.com', 'CUTI BELAJAR', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(369, 369, 'ENCIK', 'L', 'ZAILI BIN ISMAIL', '800216-13-5795', 'MELAYU', 'MELAYU', 'ISLAM', 'PEMBANTU PERAWATAN KESIHATAN', 'U1', '-', '016 - 292 7217', '-', NULL, NULL, 'zailiismail8@gmail.com', '-', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(370, 370, 'ENCIK', 'L', 'ZAINAL BIN HAKIM', '760124-13-5751', 'MELAYU', 'MELAYU', 'ISLAM', 'JURUTEKNOLOGI MAKMAL PERUBATAN', 'U6 TBK1', '-', '019 - 439 4949', 'zainal.hakim@moh.gov.my', NULL, NULL, 'zainalhakim2015@gmail.com', '-', 'UNIT MAKMAL & PATOLOGI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(371, 371, 'DR.', 'P', 'ZAKIRAH FASHIHANA HUSNA BINTI ADNAN', '970612-02-6306', 'MELAYU', 'MELAYU', 'ISLAM', 'PEGAWAI PERUBATAN (K)', 'UD9', '-', '017 - 503 5693', 'zakirah.fashihana@moh.gov.my', NULL, NULL, 'zfashihanahu@gmail.com', '-', 'Tiada Rekod', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(372, 372, 'PUAN', 'P', 'ZUHAILAH BINTI REDUAN', '770717-13-5422', 'MELAYU', 'MELAYU', 'ISLAM', 'JURURAWAT MASYARAKAT', 'U2 TBK1', '-', '013 - 831 4943', 'zuhailah.reduan@moh.gov.my', NULL, NULL, 'rzuhailah@gmail.com', '-', 'UNIT KAWALAN INFEKSI', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(373, 373, 'ENCIK', 'L', 'ZULIMAN BIN YUSUF', '860227-13-5277', 'BUMIPUTERA SARAWAK', 'IBAN', 'ISLAM', 'PEMBANTU KHIDMAT AM', 'H1', 'Pemandu Kenderaan', '018 - 325 4900', '-', NULL, NULL, 'zulimanaman@gmail.com', 'PINJAM DARI HOSPITAL SRI AMAN', 'UNIT KECEMASAN & TRAUMA', '2026-08-03 05:15:19', '2026-08-03 05:15:19'),
(376, 374, 'DR.', 'P', 'THZEN YEN YEN', '911031-13-5678', '', '', '', 'PEGAWAI PERUBATAN', '-', '-', '012 - 899 6288', '', NULL, NULL, '', 'LAPOR DIRI 17/08/2026', '', '2026-08-17 06:39:11', '2026-08-17 06:39:11'),
(377, 375, 'ENCIK', 'L', 'MAC ALLISTER ANAK PHILIP', '901031-13-5097', 'BUMIPUTERA SARAWAK', '', '', 'JURURAWAT', 'U5', '-', '018 - 2694416', '', NULL, NULL, '', 'LAPOR DIRI 17/08/2026', '', '2026-08-17 06:41:25', '2026-08-17 06:41:25'),
(378, 376, 'CIK', 'P', 'GERTRUDE ANAK JURAM', '890412-13-5188', 'BUMIPUTERA SARAWAK', '', '', 'JURURAWAT', 'U5', '-', '014 - 6972837', '', NULL, NULL, '', 'LAPOR DIRI 17/8/2026', '', '2026-08-17 06:44:30', '2026-08-17 06:44:30'),
(379, 377, 'CIK', 'P', 'SILVIA ANAK TOKOP', '820811-13-6010', 'BUMIPUTERA SARAWAK', '', '', 'JURURAWAT', 'U5', '-', '019 - 4866848', '', NULL, NULL, '', 'LAPOR DIRI 17/08/2026', '', '2026-08-17 06:48:55', '2026-08-17 06:48:55'),
(380, 378, 'CIK', 'P', 'HELLY ROZANE ANAK MICKA', '930524-13-5290', 'BUMIPUTERA SARAWAK', '', '', 'JURURAWAT', 'U5', '-', '014 - 8934067', '', NULL, NULL, '', 'LAPOR DIRI 17/08/2026', '', '2026-08-17 06:51:59', '2026-08-17 06:51:59'),
(381, 379, 'CIK', 'P', 'JUZIMAH BINTI JUBLEE', '810911-13-6094', 'BUMIPUTERA SARAWAK', '', 'ISLAM', 'JURURAWAT', 'U5', '-', '019 - 8368434', '', NULL, NULL, '', 'LAPOR DIRI 17/08/2026', '', '2026-08-17 06:55:30', '2026-08-17 06:55:30'),
(382, 380, 'ENCIK', 'L', 'ELVIN HARRIZON BIN M BENLY RYXLER', '', '', '', '', '', '', '', '', 'elvinharrizon@moh.gov.my', NULL, NULL, '', '', '', '2026-08-19 07:05:21', '2026-08-19 07:05:21'),
(384, 381, 'CIK', 'P', 'PRESCILIA ELSIE ANAK HONCHIN', '960501135324', '-', '-', '-', '-', '-', '-', '-', 'prescilia.elsie@moh.gov.my', NULL, NULL, '-', '-', '-', '2026-08-19 07:14:21', '2026-09-14 03:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `telefon_groups`
--

CREATE TABLE `telefon_groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `color` varchar(20) NOT NULL,
  `icon` text NOT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `telefon_groups`
--

INSERT INTO `telefon_groups` (`id`, `group_name`, `color`, `icon`, `sort_order`) VALUES
(2, 'Pentadbiran & Pengurusan', '#00508F', '<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\"><rect x=\"2\" y=\"3\" width=\"20\" height=\"14\" rx=\"2\" ry=\"2\"></rect><line x1=\"8\" y1=\"21\" x2=\"16\" y2=\"21\"></line><line x1=\"12\" y1=\"17\" x2=\"12\" y2=\"21\"></line></svg>', 1),
(15, 'Bilik Penyelia Jururawat', '#E91E63', '<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\"><path d=\"M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2\"></path><circle cx=\"12\" cy=\"7\" r=\"4\"></circle></svg>', 2),
(16, 'Lain-lain', '#607D8B', '<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\"><circle cx=\"12\" cy=\"12\" r=\"1\"></circle><circle cx=\"19\" cy=\"12\" r=\"1\"></circle><circle cx=\"5\" cy=\"12\" r=\"1\"></circle></svg>', 3);

-- --------------------------------------------------------

--
-- Table structure for table `telefon_items`
--

CREATE TABLE `telefon_items` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ext` varchar(100) NOT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `telefon_items`
--

INSERT INTO `telefon_items` (`id`, `group_id`, `name`, `ext`, `sort_order`) VALUES
(1, 16, 'Kecemasan / ETD', '082-876900', 1),
(2, 16, 'ETD - Triage', '148', 2),
(3, 16, 'ETD - Green Zone (Room 10)', '239', 3),
(4, 16, 'ETD - Yellow Zone / MA Kaunter', '105 / 082-872268', 4),
(5, 16, 'ETD - Red Zone / Respy', '185', 5),
(6, 16, 'ETD - MO Kaunter', '180 / 105', 6),
(7, 16, 'ETD - Pemandu', '126', 7),
(8, 2, 'Admin - PH (Dr Maria)', '102', 1),
(9, 2, 'Timbalan TPH (Dr Carlos)', '151', 2),
(10, 2, 'AA Amirah - Pengurusan', '103', 3),
(11, 2, 'AA Norzarina - Perolehan', '212', 4),
(12, 2, 'Konferen', '175', 5),
(13, 2, 'Jurutera Mr Syafiq', '013-6337984', 6),
(14, 2, 'CC - Pn Mary', '129', 7),
(15, 2, 'Pejabat AM / Admin / PT', '182 / 194', 8),
(16, 2, 'CC Kewangan - Pn Hajiah', '166', 9),
(17, 2, 'PT / P.O (Kew.)', '192 / 143', 10),
(18, 2, 'Ustaz Azari', '011-37575057', 11),
(19, 2, 'Pegawai Keselamatan - En Jeffery', '143', 12),
(20, 2, 'Pondok Pengawal / Security', '152', 13),
(21, 2, 'SMA Pengurusan - En Azuwan', '109', 14),
(22, 2, 'SMA Specialist Clinic - En Wilson', '221', 15),
(23, 15, 'Matron Lesminawati', '160', 1),
(24, 15, 'PA / Sr Diana', '104', 2),
(25, 2, 'Conference Room', '108', 16),
(26, 2, 'Meeting Room - Linkway', '175', 17),
(27, 16, 'Kaunter Makmal', '118', 8),
(28, 16, 'Makmal - Microb / Sari', '176', 9),
(29, 16, 'Blood Bank', '177', 10),
(30, 16, 'Makmal - Pegawai Sains (En Harrison Kuek)', '113', 11),
(31, 16, 'Makmal - Ketua Unit (Pn Nur Alia)', '226', 12),
(32, 16, 'Malaria Lab', '243', 13),
(33, 16, 'Wad Bersalin - Talian Utama', '082-872291', 14),
(34, 16, 'Wad Bersalin - Kaunter', '170', 15),
(35, 16, 'Labour Room', '215', 16),
(36, 16, 'Wad Bersalin - Isolation Room', '237', 17),
(37, 16, 'Colposcopy (O&G) Room', '220', 18),
(38, 15, 'Sr Telanying - Wad Bersalin', '171', 3),
(39, 16, 'Wad Lelaki', '128', 19),
(40, 15, 'Sr Linda - Wad Lelaki', '178', 4),
(41, 16, 'Wad Lelaki - MO On Call Room', '123 / 082-875823', 20),
(42, 16, 'Wad Perempuan', '101', 21),
(43, 15, 'Sr Christina - Wad Perempuan', '233', 5),
(44, 16, 'Wad Kanak-Kanak / Paed', '167', 22),
(45, 15, 'Sr Debbie - Wad Kanak-Kanak / OT', '117 / 082-873026', 6),
(46, 16, 'Paed SP', '240', 23),
(47, 16, 'HDU', '147', 24),
(48, 16, 'HDU - Ketua Unit (SMA Mat Pozan)', '145', 25),
(49, 16, 'AMRO / Unit Rekod', '224', 26),
(50, 16, 'Unit Rekod - Ketua Unit (En Rizuanny Ng)', '165 / 082-876791', 27),
(51, 16, 'Farmasi Out Patient', '119 / 234', 28),
(52, 16, 'Farmasi - Inpatient', '134', 29),
(53, 16, 'Farmasi - Ketua Unit', '114', 30),
(54, 16, 'Stor Ubat', '223', 31),
(55, 16, 'X-Ray / Kaunter', '112 / 082-872348', 32),
(56, 16, 'X-Ray - Ketua Unit (En Ronald)', '227', 33),
(57, 16, 'OT (Dewan Bedah)', '110 / 082-873312', 34),
(58, 16, 'OT - Ketua Unit (SMA Jeffery)', '110', 35),
(59, 16, 'CSSD / CSSU', '121', 36),
(61, 16, 'OPD Kaunter / Hasil', '120', 37),
(62, 16, 'OPD - Porter', '216', 38),
(63, 16, 'OPD - Rabbies', '155', 39),
(64, 16, 'OPD - Room 3', '157', 40),
(65, 16, 'OPD - Room 4', '157', 41),
(66, 16, 'OPD - Room 5', '141', 42),
(67, 16, 'OPD - Room 6', '230', 43),
(68, 16, 'OPD - Room 7', '130', 44),
(69, 16, 'OPD - Room 8', '131', 45),
(70, 16, 'OPD - Room 9', '132', 46),
(71, 16, 'PSY / Quality', '153 / 082-872304', 47),
(72, 16, 'PSY SP', '163', 48),
(73, 15, 'Sr Liza - Quality', '153', 7),
(74, 16, 'Kaunseling / Pendidikan', '144', 49),
(75, 16, 'Psikiatri - Staff / Warga Klinik', '219', 50),
(76, 16, 'Kebajikan - Pn Mazlin', '232', 51),
(77, 16, 'Dental Kaunter', '168', 52),
(78, 16, 'Pergigian - Pakar', '164', 53),
(79, 16, 'Dental Stor', '159', 54),
(80, 16, 'Fisio', '116', 55),
(81, 16, 'Cara Pulih Kerja', '218', 56),
(82, 16, 'Pendidikan Kesihatan', '144', 57),
(83, 16, 'Infection Control', '139', 58),
(84, 16, 'Forensic / Rumah Mayat', '149', 59),
(85, 16, 'Laundry', '225', 60),
(86, 16, 'OMC (24hrs)', '169 / 013-6696346', 61),
(87, 16, 'Unit Sajian', '228', 62),
(88, 16, 'Pegawai Y/M', '190', 63);

-- --------------------------------------------------------

--
-- Table structure for table `tempahan`
--

CREATE TABLE `tempahan` (
  `id` int(11) NOT NULL,
  `bilik_id` int(11) NOT NULL,
  `tarikh` date NOT NULL,
  `masa_mula` time NOT NULL,
  `masa_tamat` time DEFAULT NULL,
  `bilangan_hadir` int(11) DEFAULT NULL,
  `tujuan` text NOT NULL,
  `keperluan_khas` text DEFAULT NULL,
  `nama_pemohon` varchar(255) NOT NULL,
  `nama_penganjur` varchar(255) DEFAULT NULL,
  `unit_pemohon` varchar(255) NOT NULL,
  `telefon_pemohon` varchar(50) NOT NULL,
  `email_pemohon` varchar(255) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `catatan_admin` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tempahan`
--

INSERT INTO `tempahan` (`id`, `bilik_id`, `tarikh`, `masa_mula`, `masa_tamat`, `bilangan_hadir`, `tujuan`, `keperluan_khas`, `nama_pemohon`, `nama_penganjur`, `unit_pemohon`, `telefon_pemohon`, `email_pemohon`, `status`, `catatan_admin`, `created_at`) VALUES
(4, 1, '2026-08-11', '12:06:00', '13:00:00', 40, 'Mesyuarakat Pegawai', '', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', NULL, 'Unit Pentadbiran', '194', 'elvinharrizon@moh.gov.my', 'approved', '', '2026-08-11 04:06:27'),
(11, 1, '2026-08-04', '11:00:00', NULL, 5, 'Mesyuarat O&G', 'Projektor,Mic,Laptop', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', NULL, 'Unit bersalin', '194', 'elvinharrizon@moh.gov.my', 'pending', NULL, '2026-08-11 07:25:02'),
(13, 1, '2026-08-06', '14:00:00', '16:00:00', 5, 'Mesyuarat PPP/PPK', 'Laptop', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'SMA KURIN', 'Unit Pentadbiran', '194', 'elvinharrizon@moh.gov.my', 'pending', NULL, '2026-08-11 07:54:27'),
(14, 1, '2026-08-07', '14:00:00', '17:00:00', 5, 'PERKESO', 'Laptop', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'Pengurusan', 'Unit Pentadbiran', '194', 'elvinharrizon@moh.gov.my', 'pending', NULL, '2026-08-11 07:59:08'),
(20, 1, '2026-08-10', '09:00:00', '17:00:00', 5, 'Lawatan Dietetik', 'Laptop', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'Unit Sajian', 'Unit Sajian', '194', 'elvinharrizon@moh.gov.my', 'pending', NULL, '2026-08-11 08:23:34'),
(21, 1, '2026-08-13', '14:00:00', '17:00:00', 5, 'Kelas Agama Muslimah', 'Laptop', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'JM Zuhailah', 'Unit Infection Control', '194', 'elvinharrizon@moh.gov.my', 'approved', '', '2026-08-11 08:53:04'),
(22, 1, '2026-08-17', '14:30:00', NULL, NULL, 'Mesyuarat Pengurusan Katil Hospital', NULL, 'En. Rizuanny', 'En. Rizuanny', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(23, 1, '2026-08-21', '14:00:00', '16:00:00', NULL, 'CME (PPP/PPK)', NULL, 'SMA Kurin', 'SMA Kurin', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(24, 1, '2026-08-28', '14:00:00', '16:00:00', NULL, 'CME (PPP/PPK)', NULL, 'SMA Kurin', 'SMA Kurin', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(25, 1, '2026-08-19', '15:30:00', NULL, NULL, 'Mesyuarat Klinik Pakar', NULL, 'SMA Willson', 'SMA Willson', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(26, 1, '2026-08-19', '09:00:00', NULL, NULL, 'Sambutan Hari Penyusuan Susu Ibu Sedunia', NULL, 'Sr. Telaying', 'Sr. Telaying', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(27, 3, '2026-08-19', '08:00:00', '17:00:00', NULL, 'Klinik Katarak', NULL, 'MA Green', 'MA Green', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(28, 3, '2026-08-20', '08:00:00', '17:00:00', NULL, 'Klinik Katarak', NULL, 'MA Green', 'MA Green', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(29, 2, '2026-08-17', '08:00:00', '13:00:00', NULL, 'Orientasi Staf Baharu & Pelatih MA', NULL, 'JM Zuhailah', 'JM Zuhailah', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(30, 2, '2026-08-13', '08:00:00', '13:00:00', NULL, 'Mesyuarat MPSG Bil. 2/26', NULL, 'Sr. Liza', 'Sr. Liza', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(31, 2, '2026-08-14', '14:00:00', '16:00:00', NULL, 'CME (PPP/PPK)', NULL, 'SMA Kurin', 'SMA Kurin', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(32, 2, '2026-08-18', '08:00:00', '17:00:00', NULL, 'Kursus IR', NULL, 'Sr. Liza', 'Sr. Liza', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(33, 2, '2026-08-19', '08:00:00', '17:00:00', NULL, 'Kursus IR', NULL, 'Sr. Liza', 'Sr. Liza', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(34, 2, '2026-08-20', '08:00:00', '17:00:00', NULL, 'Kursus Medication Safety', NULL, 'Sr. Linda', 'Sr. Linda', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(35, 2, '2026-08-21', '08:00:00', '14:00:00', NULL, 'Kursus Medication Safety', NULL, 'Sr. Linda', 'Sr. Linda', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(36, 2, '2026-08-21', '15:00:00', '16:00:00', NULL, 'CME', NULL, 'PSY', 'PSY', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(37, 2, '2026-08-24', '14:30:00', NULL, NULL, 'User Training', NULL, 'OMC', 'OMC', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(38, 2, '2026-08-26', '08:00:00', '17:00:00', NULL, 'Kursus NNIA', NULL, 'M. Lesminawati', 'M. Lesminawati', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(39, 2, '2026-08-27', '08:00:00', '17:00:00', NULL, 'Kursus NNIA', NULL, 'M. Lesminawati', 'M. Lesminawati', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(40, 2, '2026-08-28', '15:00:00', '16:00:00', NULL, 'Perhimpunan Bulanan Bil. 8/26', NULL, 'Sajian / Jurutera / Pengurusan', 'Sajian / Jurutera / Pengurusan', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(41, 2, '2026-08-13', '14:00:00', NULL, NULL, 'Mesyuarat PPK Bil. 3/26 & Mesyuarat AJK Sambutan Hari PPK (Sukaneka)', NULL, 'PPK Mohd. Tarmize', 'PPK Mohd. Tarmize', '-', '-', '-', 'approved', NULL, '2026-08-13 02:48:41'),
(42, 1, '2026-08-31', '08:30:00', '09:30:00', 3, 'TEST AJAK', '', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'ELSIE', 'UNIT SAJIAN', '123', 'prescilia.elsie@moh.gov.my', 'approved', '', '2026-08-14 08:41:33'),
(46, 1, '2026-09-01', '14:30:00', NULL, NULL, 'Mesyuarat AJK Nursing Dinner', NULL, 'Sr. Liza', 'Sr. Liza', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(47, 3, '2026-09-01', '08:00:00', '17:00:00', NULL, 'ECG Course', NULL, 'SMA Azuwan', 'SMA Azuwan', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(48, 2, '2026-09-03', '08:00:00', '17:00:00', NULL, 'Taklimat BLS 2026', NULL, 'PPP Azuwan', 'PPP Azuwan', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(49, 1, '2026-09-03', '14:00:00', '16:00:00', NULL, 'CME (PPP & PPK)', NULL, 'SMA Kurin', 'SMA Kurin', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(50, 2, '2026-09-04', '08:00:00', '12:00:00', NULL, 'Kursus pengurusan risiko bunuh diri Hospital Serian', NULL, 'Dr.Thinesh', 'Dr.Thinesh', 'Perubatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(51, 2, '2026-09-04', '15:00:00', '16:00:00', NULL, 'CME', NULL, 'Pengurusan (Perolehan, Aset & Stor)', 'Pengurusan (Perolehan, Aset & Stor)', 'Pengurusan (Perolehan, Aset & Stor)', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(52, 1, '2026-09-04', '08:00:00', NULL, NULL, 'Mesyuarat Pegawai Penyiasatan Kes Aduan', NULL, 'Pn Mazlin', 'Pn Mazlin', 'Pentadbiran', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(53, 2, '2026-09-07', '09:00:00', '17:00:00', NULL, 'Lawatan Dietetik Klinikal', NULL, 'Unit Sajian', 'Unit Sajian', 'Unit Sajian', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(56, 1, '2026-09-09', '14:00:00', '17:00:00', NULL, 'Jemaah Dokter Perkeso', NULL, 'Pengurusan', 'Pengurusan', 'Pengurusan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(57, 3, '2026-09-09', '08:00:00', '17:00:00', NULL, 'Bengkel Asa Keselamatan Kebakaran Bil.2/2026', NULL, 'SMA Kurin', 'SMA Kurin', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(58, 2, '2026-09-10', '08:30:00', '11:00:00', NULL, 'Mesy. VCM & PSH', NULL, 'En.Syafiq', 'En.Syafiq', 'Pentadbiran', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(59, 2, '2026-09-10', '14:00:00', NULL, NULL, 'Mesy. Morbility Review', NULL, 'SMA Azuwan', 'SMA Azuwan', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(60, 1, '2026-09-10', '14:00:00', '17:00:00', NULL, 'Kelas Agama Muslimah - Doa-Doa Mustajab Wanita Dan Zikir-Zikir Harian', NULL, 'JM Zuhailah', 'JM Zuhailah', 'Pentadbiran', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(61, 3, '2026-09-10', '08:00:00', '17:00:00', NULL, 'Kursus BLS Bil.1/2026', NULL, 'SMA Azuwan', 'SMA Azuwan', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:54'),
(62, 2, '2026-09-11', '08:00:00', NULL, NULL, 'Persiapan Majlis Perpisahan', NULL, 'Pentadbiran', 'Pentadbiran', 'Pentadbiran', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(63, 2, '2026-09-11', '15:00:00', '16:00:00', NULL, 'Perhimpunan Bulanan Bil.9/2026', NULL, 'Carakerja & Kebajikan', 'Carakerja & Kebajikan', 'Carakerja & Kebajikan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(64, 1, '2026-09-11', '14:00:00', '16:00:00', NULL, 'CME (PPP & PPK)', NULL, 'SMA Kurin', 'SMA Kurin', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(65, 2, '2026-09-14', '08:00:00', NULL, NULL, 'Kursus Woundcare', NULL, 'Sr.Louisiana', 'Sr.Louisiana', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(66, 2, '2026-09-15', '08:00:00', NULL, NULL, 'Kursus Woundcare', NULL, 'Sr.Louisiana', 'Sr.Louisiana', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(67, 2, '2026-09-17', '08:00:00', '17:00:00', NULL, 'Patient Safety Day', NULL, 'Sr.Liza', 'Sr.Liza', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(68, 2, '2026-09-18', '15:00:00', '16:00:00', NULL, 'CME', NULL, 'HDU', 'HDU', 'HDU', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(69, 1, '2026-09-18', '14:00:00', '16:00:00', NULL, 'CME (PPP & PPK)', NULL, 'SMA Kurin', 'SMA Kurin', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(70, 3, '2026-09-21', '08:00:00', '17:00:00', NULL, 'Klinik Katarak', NULL, 'SMA Green Wong', 'SMA Green Wong', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(71, 2, '2026-09-22', '08:00:00', '17:00:00', NULL, 'Kursus Orientasi', NULL, 'Pn. Norlida', 'Pn. Norlida', 'Pentadbiran', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(72, 3, '2026-09-22', '08:00:00', '17:00:00', NULL, 'Klinik Katarak', NULL, 'SMA Green Wong', 'SMA Green Wong', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(73, 2, '2026-09-23', '08:00:00', NULL, NULL, 'Kursus Kawalan Infeksi Utk Staf Klinikal', NULL, 'SN Matina', 'SN Matina', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(74, 2, '2026-09-24', '08:00:00', NULL, NULL, 'Kursus Kawalan Infeksi Utk Staf Non Klinikal', NULL, 'SN Matina', 'SN Matina', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(75, 2, '2026-09-25', '14:00:00', '16:00:00', NULL, 'CME (PPP & PPK)', NULL, 'SMA Kurin', 'SMA Kurin', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(76, 1, '2026-09-25', '14:30:00', NULL, NULL, 'Medical Department Meeting Bil.3', NULL, 'Sr. Linda', 'Sr. Linda', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(77, 1, '2026-09-28', '14:30:00', NULL, NULL, 'Mesyuarat AJK Nursing Dinner', NULL, 'Sr. Liza', 'Sr. Liza', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(78, 1, '2026-09-29', '09:00:00', '17:00:00', NULL, 'HPIA Cheking File', NULL, 'Sr. Liza', 'Sr. Liza', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(79, 1, '2026-09-30', '09:00:00', '17:00:00', NULL, 'HPIA Cheking File', NULL, 'Sr. Liza', 'Sr. Liza', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-03 08:38:55'),
(80, 1, '2026-09-07', '08:00:00', '09:00:00', NULL, 'Taklimat PPK Modul 2', NULL, 'PPK Tarmize', 'PPK Tarmize', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-10 15:47:05'),
(81, 1, '2026-09-07', '09:30:00', NULL, NULL, 'Audit Klinikal PPP', NULL, 'SMA Joshua', 'SMA Joshua', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-10 15:47:05'),
(82, 1, '2026-09-08', '08:00:00', NULL, NULL, 'Audit Klinikal PPP', NULL, 'SMA Joshua', 'SMA Joshua', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-10 15:47:05'),
(83, 1, '2026-09-11', '08:00:00', NULL, NULL, 'Taklimat ETD', NULL, 'SMA Azuwan', 'SMA Azuwan', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-10 15:47:05'),
(84, 1, '2026-09-14', '08:00:00', '09:00:00', NULL, 'Taklimat PPK Modul 2', NULL, 'PPK Tarmize', 'PPK Tarmize', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-10 15:47:05'),
(85, 1, '2026-09-21', '08:00:00', '09:00:00', NULL, 'Taklimat PPK Modul 2', NULL, 'PPK Tarmize', 'PPK Tarmize', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-10 15:47:05'),
(86, 3, '2026-09-23', '08:00:00', '17:00:00', NULL, 'Kursus Dokumentasi', NULL, 'Sr.Christina', 'Sr.Christina', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-10 15:47:05'),
(87, 3, '2026-09-24', '08:00:00', '17:00:00', NULL, 'Kursus Dokumentasi', NULL, 'Sr.Christina', 'Sr.Christina', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-10 15:47:05'),
(90, 1, '2026-10-01', '14:30:00', NULL, NULL, 'MAC meeting', NULL, 'Tidak dinyatakan', NULL, 'Tidak dinyatakan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(91, 1, '2026-10-02', '14:00:00', '16:00:00', NULL, 'CME (PPP & PPK)', NULL, 'SMA Kurin', 'SMA Kurin', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(92, 2, '2026-10-05', '09:00:00', NULL, NULL, 'Mesy. MMR ETD Bersama Pengarah', NULL, 'SMA Azuwan', 'SMA Azuwan', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(93, 3, '2026-10-06', '08:00:00', '17:00:00', NULL, 'Kursus BLS Bil.2/2026', NULL, 'SMA Azuwan', 'SMA Azuwan', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(94, 2, '2026-10-07', '14:00:00', '17:00:00', NULL, 'Mesy. HIACC Bil.3/2026', NULL, 'SN Matina', 'SN Matina', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(95, 2, '2026-10-08', '08:00:00', '13:00:00', NULL, 'Meeting Qrimat Bil.4/2026', NULL, 'Sr. Liza', 'Sr. Liza', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(96, 2, '2026-10-08', '14:00:00', '16:00:00', NULL, 'CME (PPP & PPK)', NULL, 'SMA Kurin', 'SMA Kurin', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(97, 1, '2026-10-08', '14:00:00', '17:00:00', NULL, 'Kelas Agama Muslimah - Mengurus Cabaran Hidup Dengan Tawakal', NULL, 'JM Zuhailah', 'JM Zuhailah', 'Pentadbiran', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(98, 2, '2026-10-09', '15:00:00', '16:00:00', NULL, 'CME', NULL, 'WAD BERSALIN', 'WAD BERSALIN', 'WAD BERSALIN', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(99, 1, '2026-10-09', '14:00:00', '17:00:00', NULL, 'Jemaah Dokter Perkeso', NULL, 'Tidak dinyatakan', NULL, 'Tidak dinyatakan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(100, 2, '2026-10-12', '08:00:00', '17:00:00', NULL, 'Pelancaran Projek Perincis MyPhIS 3.0', NULL, 'Farmasi', 'Farmasi', 'Unit Farmasi', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(101, 1, '2026-10-12', '08:00:00', '17:00:00', NULL, 'Pelancaran Projek Perincis MyPhIS 3.0', NULL, 'Farmasi', 'Farmasi', 'Unit Farmasi', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(102, 2, '2026-10-15', '08:00:00', '13:00:00', NULL, 'Meeting P&A Bil.4/2026', NULL, 'Sr. Liza', 'Sr. Liza', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(103, 2, '2026-10-16', '15:00:00', '16:00:00', NULL, 'Perhimpunan Bulanan Bil.10/2026', NULL, 'CSSD & DEWAN BEDAH', 'CSSD & DEWAN BEDAH', 'CSSD & DEWAN BEDAH', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(104, 1, '2026-10-16', '14:00:00', '16:00:00', NULL, 'CME (PPP & PPK)', NULL, 'SMA Kurin', 'SMA Kurin', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(105, 2, '2026-10-19', '09:00:00', '17:00:00', NULL, 'Lawatan Dietetik Klinikal', NULL, 'Unit Sajian', 'Unit Sajian', 'Unit Sajian', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(106, 2, '2026-10-20', '08:00:00', '17:00:00', NULL, 'Pain Kursus', NULL, 'Sr. Liza', 'Sr. Liza', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(107, 2, '2026-10-21', '08:00:00', '17:00:00', NULL, 'Pain Kursus', NULL, 'Sr. Liza', 'Sr. Liza', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(108, 2, '2026-10-23', '15:00:00', '16:00:00', NULL, 'CME', NULL, 'WAD LELAKI', 'WAD LELAKI', 'WAD LELAKI', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(109, 1, '2026-10-23', '14:00:00', '16:00:00', NULL, 'CME (PPP & PPK)', NULL, 'SMA Kurin', 'SMA Kurin', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(110, 2, '2026-11-06', '15:00:00', '16:00:00', NULL, 'CME', NULL, 'ETD (PPP & PPK)', 'ETD (PPP & PPK)', 'ETD (PPP & PPK)', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(111, 1, '2026-11-06', '14:00:00', '17:00:00', NULL, 'Jemaah Dokter Perkeso', NULL, 'Tidak dinyatakan', NULL, 'Tidak dinyatakan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(112, 2, '2026-11-09', '09:00:00', '17:00:00', NULL, 'Lawatan Dietetik Klinikal', NULL, 'Unit Sajian', 'Unit Sajian', 'Unit Sajian', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(113, 1, '2026-11-12', '14:00:00', '17:00:00', NULL, 'Kelas Agama Muslimah - Musahabah Akhir Tahun Dan Perancangan 2027', NULL, 'JM Zuhailah', 'JM Zuhailah', 'Pentadbiran', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(114, 2, '2026-11-13', '15:00:00', '16:00:00', NULL, 'Perhimpunan Bulanan Bil.11/2026', NULL, 'REKOD PERUBATAN & KLINIK PAKAR', 'REKOD PERUBATAN & KLINIK PAKAR', 'REKOD PERUBATAN & KLINIK PAKAR', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(115, 2, '2026-11-20', '15:00:00', '16:00:00', NULL, 'CME', NULL, 'FORENSIK', 'FORENSIK', 'FORENSIK', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(116, 1, '2026-11-27', '10:00:00', NULL, NULL, 'Klinikal Audit', NULL, 'JM Ronie', 'JM Ronie', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(117, 2, '2026-12-04', '15:00:00', '16:00:00', NULL, 'CME', NULL, 'UPP', 'UPP', 'UPP', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(118, 1, '2026-12-04', '14:00:00', '17:00:00', NULL, 'Jemaah Dokter Perkeso', NULL, 'Tidak dinyatakan', NULL, 'Tidak dinyatakan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(119, 2, '2026-12-07', '09:00:00', '17:00:00', NULL, 'Lawatan Dietetik Klinikal', NULL, 'Unit Sajian', 'Unit Sajian', 'Unit Sajian', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(120, 2, '2026-12-11', '15:00:00', '16:00:00', NULL, 'Perhimpunan Bulanan Bil.12/2026', NULL, 'FARMASI DALAM & LUAR', 'FARMASI DALAM & LUAR', 'FARMASI DALAM & LUAR', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(121, 2, '2026-12-17', '08:00:00', '13:00:00', NULL, 'Meeting MPSG Bil.3/2026', NULL, 'Sr. Liza', 'Sr. Liza', 'Jabatan Kejururawatan', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(122, 2, '2026-12-18', '15:00:00', '16:00:00', NULL, 'CME', NULL, 'KAWALAN PENYAKIT BERJANGKIT', 'KAWALAN PENYAKIT BERJANGKIT', 'KAWALAN PENYAKIT BERJANGKIT', '082-874311', 'rekod.tempahan@hospitalserian.moh.gov.my', 'approved', NULL, '2026-09-17 00:30:28'),
(123, 2, '2026-10-29', '08:00:00', NULL, 20, 'MPSG Meeting', 'MPSG Meeting', 'ZADORA ANAK GUAM (HSERIAN)', 'JM Ronie', 'Unit Kualiti', 'ext 153', 'zadora@moh.gov.my', 'approved', '', '2026-09-18 00:33:51'),
(124, 1, '2026-09-24', '14:30:00', '15:30:00', 15, 'User Training', '', 'ZADORA ANAK GUAM (HSERIAN)', 'OMC', 'OMC', '082548000', 'zadora@moh.gov.my', 'approved', '', '2026-09-21 04:40:47'),
(125, 1, '2026-09-21', '14:15:00', '16:30:00', 13, 'Mesyuarat Kejururawatan Bil.3/2026', 'Laptop dan remote tv', 'LESMINAWATI BT. TUGOR (HSARIKEI)', 'Unit Kejururawatan Hospital Serian', 'Unit Kejururawatan', '160 / 0143774622', 'lesminawati@moh.gov.my', 'approved', '', '2026-09-21 05:08:37'),
(126, 2, '2026-09-26', '07:30:00', '15:00:00', 15, 'Lawatan Penyeliaan  dan Pemantauan Bahagian Kejururawatan Ke Fasiliti Kesihatan Negeri Sarawak', 'Laptop , mikrofon', 'LESMINAWATI BT. TUGOR (HSARIKEI)', 'Unit Kejururawatan Hospital Serian', 'Unit Kejururawatan', '160 / 0143774622', 'lesminawati@moh.gov.my', 'approved', '', '2026-09-21 05:14:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` enum('staff','ketua_unit','admin','super_admin') DEFAULT 'staff',
  `modules` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `role`, `modules`, `created_at`) VALUES
(1, 'elvinharrizon@moh.gov.my', 'ELVIN HARRIZON BIN M BENLY RYXLER (HSERIAN)', 'super_admin', NULL, '2026-08-04 00:16:07'),
(2, 'prescilia.elsie@moh.gov.my', 'PRESCILIA ELSIE ANAK HONCHIN (HSERIAN)', 'super_admin', NULL, '2026-08-11 00:55:29'),
(3, 'mary_annie@moh.gov.my', 'PUAN MARY ANNIE ANAK BANGAU (HSERIAN)', 'staff', NULL, '2026-08-12 02:02:50'),
(4, 'mariamesran@moh.gov.my', 'MARIA BINTI MESRAN', 'super_admin', NULL, '2026-08-13 07:49:39'),
(5, 'carlos.j@moh.gov.my', 'CARLOS ANAK JINUNG', 'super_admin', NULL, '2026-09-11 00:45:13'),
(6, 'abdazim@moh.gov.my', 'ABDUL AZIM BIN MASJAYA', 'admin', '[\"borang\"]', '2026-09-11 01:22:54'),
(7, 'lidya.kadir@moh.gov.my', 'LIDYA BINTI KADIR', 'super_admin', NULL, '2026-09-11 01:23:14'),
(8, 'liza.bali@moh.gov.my', 'LIZA ANAK BALI', 'admin', '[\"dokumen\"]', '2026-09-11 01:27:32'),
(9, 'norzarina.sapawe@moh.gov.my', 'NORZARINA BINTI SAPAWE (HSERIAN)', 'admin', '[\"slideshow\",\"galeri\",\"pautan\"]', '2026-09-11 01:27:56'),
(10, 'nurul.amirahbongsu@moh.gov.my', 'NURUL AMIRAH BINTI BONGSU (HSERIAN)', 'admin', '[\"staff\",\"telefon\",\"dokumen\",\"memo\",\"borang\",\"slideshow\",\"galeri\",\"pautan\",\"bilik\",\"tempahan\"]', '2026-09-11 01:29:22'),
(11, 'zadora@moh.gov.my', 'ZADORA ANAK GUAM (HSERIAN)', 'admin', '[\"memo\",\"berita\",\"bilik\",\"tempahan\",\"jadual\"]', '2026-09-11 01:29:39'),
(12, 'chaishiawfung@moh.gov.my', 'CHAI SHIAW FUNG (MOH-SARAWAK)', 'staff', NULL, '2026-09-11 07:15:43'),
(13, 'erni.s@moh.gov.my', 'ERNI BINTI SUHAILI (HSERIAN)', 'staff', NULL, '2026-09-11 07:17:43'),
(14, 'norlidadaud@moh.gov.my', 'NORLIDA BINTI DAUD (MOH-SARAWAK)', 'staff', NULL, '2026-09-11 07:36:35'),
(15, 'ngyuanxun@moh.gov.my', 'NG YUAN XUN (HSERIAN)', 'staff', NULL, '2026-09-14 04:32:04'),
(16, 'mahani_ahmat@moh.gov.my', 'MAHANI AHMAT (MOH-SARAWAK)', 'staff', NULL, '2026-09-14 06:08:49'),
(17, 'harissonkueh@moh.gov.my', 'ENCIK HARISSON ANAK KUEH (MOH-SARAWAK)', 'staff', NULL, '2026-09-15 00:05:17'),
(18, 'noorazuwan@moh.gov.my', 'NOOR AZUWAN BIN BAIEE (HSIMUNJAN)', 'staff', NULL, '2026-09-18 04:13:32'),
(19, 'syafiq_sabri@moh.gov.my', 'MOHD SYAFIQ BIN MOHD SABRI (HSERIAN)', 'staff', NULL, '2026-09-21 01:49:41'),
(20, 'lesminawati@moh.gov.my', 'LESMINAWATI BT. TUGOR (HSARIKEI)', 'staff', NULL, '2026-09-21 05:02:35'),
(21, 'sitizuhairah1997@moh.gov.my', 'SITI ZUHAIRAH BINTI ZAINUDDIN (PKDGOMBAK)', 'staff', NULL, '2026-09-21 06:50:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created` (`created_at`),
  ADD KEY `idx_email` (`user_email`),
  ADD KEY `idx_module` (`module`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bilik_id` (`bilik_id`);

--
-- Indexes for table `bilik`
--
ALTER TABLE `bilik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borang`
--
ALTER TABLE `borang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadual_perancangan`
--
ALTER TABLE `jadual_perancangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadual_perancangan_sesi`
--
ALTER TABLE `jadual_perancangan_sesi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadual_tarikh` (`jadual_id`,`tarikh`);

--
-- Indexes for table `memo`
--
ALTER TABLE `memo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `papar_tarikh` (`dipapar`,`tarikh_surat`);

--
-- Indexes for table `notifikasi_kempen`
--
ALTER TABLE `notifikasi_kempen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifikasi_penerima`
--
ALTER TABLE `notifikasi_penerima`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kempen_emel` (`kempen_id`,`emel`),
  ADD KEY `kempen_status` (`kempen_id`,`status`),
  ADD KEY `message_id` (`message_id`);

--
-- Indexes for table `pautan`
--
ALTER TABLE `pautan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slideshow`
--
ALTER TABLE `slideshow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_kp` (`no_kp`);

--
-- Indexes for table `telefon_groups`
--
ALTER TABLE `telefon_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telefon_items`
--
ALTER TABLE `telefon_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `tempahan`
--
ALTER TABLE `tempahan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bilik_id` (`bilik_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=487;

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `bilik`
--
ALTER TABLE `bilik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `borang`
--
ALTER TABLE `borang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jadual_perancangan`
--
ALTER TABLE `jadual_perancangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jadual_perancangan_sesi`
--
ALTER TABLE `jadual_perancangan_sesi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `memo`
--
ALTER TABLE `memo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifikasi_kempen`
--
ALTER TABLE `notifikasi_kempen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifikasi_penerima`
--
ALTER TABLE `notifikasi_penerima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=767;

--
-- AUTO_INCREMENT for table `pautan`
--
ALTER TABLE `pautan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `slideshow`
--
ALTER TABLE `slideshow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=385;

--
-- AUTO_INCREMENT for table `telefon_groups`
--
ALTER TABLE `telefon_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `telefon_items`
--
ALTER TABLE `telefon_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `tempahan`
--
ALTER TABLE `tempahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`bilik_id`) REFERENCES `bilik` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `telefon_items`
--
ALTER TABLE `telefon_items`
  ADD CONSTRAINT `telefon_items_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `telefon_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tempahan`
--
ALTER TABLE `tempahan`
  ADD CONSTRAINT `tempahan_ibfk_1` FOREIGN KEY (`bilik_id`) REFERENCES `bilik` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
