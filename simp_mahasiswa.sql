-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2026 at 08:37 PM
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
-- Database: `simp_mahasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id_audit` bigint(20) UNSIGNED NOT NULL,
  `id_pengguna` bigint(20) UNSIGNED DEFAULT NULL,
  `aktivitas` varchar(100) NOT NULL,
  `tabel_target` varchar(100) DEFAULT NULL,
  `id_target` varchar(100) DEFAULT NULL,
  `data_lama` longtext DEFAULT NULL,
  `data_baru` longtext DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id_fakultas` bigint(20) UNSIGNED NOT NULL,
  `id_universitas` bigint(20) UNSIGNED NOT NULL,
  `kode_fakultas` varchar(20) NOT NULL,
  `nama_fakultas` varchar(200) NOT NULL,
  `dekan` varchar(150) DEFAULT NULL,
  `uri` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id_fakultas`, `id_universitas`, `kode_fakultas`, `nama_fakultas`, `dekan`, `uri`, `created_at`, `updated_at`) VALUES
(1, 1, 'FT', 'Fakultas Teknik', 'Dr. Dekan Teknik', 'https://universitascontoh.ac.id/resource/fakultas/FT', '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(2, 1, 'FEB', 'Fakultas Ekonomi dan Bisnis', 'Dr. Dekan FEB', 'https://universitascontoh.ac.id/resource/fakultas/FEB', '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(3, 1, 'FKIP', 'Fakultas Keguruan dan Ilmu Pendidikan', 'Dr. Dekan FKIP', 'https://universitascontoh.ac.id/resource/fakultas/FKIP', '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(4, 1, 'FH', 'Fakultas Hukum', 'Dr. Dekan Hukum', 'https://universitascontoh.ac.id/resource/fakultas/FH', '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(5, 1, 'FIKES', 'Fakultas Ilmu Kesehatan', 'Dr. Dekan FIKES', 'https://universitascontoh.ac.id/resource/fakultas/FIKES', '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(6, 1, 'FISIP', 'Fakultas Ilmu Sosial dan Politik', 'Dr. Dekan FISIP', 'https://universitascontoh.ac.id/resource/fakultas/FISIP', '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(7, 1, 'FAI', 'Fakultas Agama Islam', 'Dr. Dekan FAI', 'https://universitascontoh.ac.id/resource/fakultas/FAI', '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(8, 1, 'FP', 'Fakultas Pertanian', 'Dr. Dekan Pertanian', 'https://universitascontoh.ac.id/resource/fakultas/FP', '2026-10-14 13:44:48', '2026-10-14 13:44:48');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` bigint(20) UNSIGNED NOT NULL,
  `id_prodi` bigint(20) UNSIGNED NOT NULL,
  `nim` varchar(30) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `angkatan` year(4) NOT NULL,
  `semester` tinyint(3) UNSIGNED DEFAULT NULL,
  `status_mahasiswa` enum('Aktif','Cuti','Lulus','Nonaktif','Drop Out') NOT NULL DEFAULT 'Aktif',
  `email` varchar(150) DEFAULT NULL,
  `uri` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `id_prodi`, `nim`, `nama_lengkap`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `angkatan`, `semester`, `status_mahasiswa`, `email`, `uri`, `created_at`, `updated_at`) VALUES
(1, 1, '2026010001', 'Ahmad Fauzan', 'L', 'Bengkulu', '2007-02-12', '2026', 2, 'Aktif', 'ahmad.fauzan@example.ac.id', 'https://universitascontoh.ac.id/resource/mahasiswa/2026010001', '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(2, 1, '2026010002', 'Siti Aisyah', 'P', 'Bengkulu', '2007-05-21', '2026', 2, 'Aktif', 'siti.aisyah@example.ac.id', 'https://universitascontoh.ac.id/resource/mahasiswa/2026010002', '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(3, 5, '2025010101', 'Muhammad Rizki', 'L', 'Curup', '2006-01-10', '2025', 4, 'Aktif', 'muhammad.rizki@example.ac.id', 'https://universitascontoh.ac.id/resource/mahasiswa/2025010101', '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(4, 5, '2025010102', 'Nur Azizah', 'P', 'Bengkulu', '2006-07-18', '2025', 4, 'Aktif', 'nur.azizah@example.ac.id', 'https://universitascontoh.ac.id/resource/mahasiswa/2025010102', '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(5, 6, '2024010201', 'Andi Saputra', 'L', 'Manna', '2005-09-03', '2024', 6, 'Aktif', 'andi.saputra@example.ac.id', 'https://universitascontoh.ac.id/resource/mahasiswa/2024010201', '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(6, 7, '2024010301', 'Rahma Putri', 'P', 'Bengkulu', '2005-11-15', '2024', 6, 'Aktif', 'rahma.putri@example.ac.id', 'https://universitascontoh.ac.id/resource/mahasiswa/2024010301', '2026-10-14 13:44:48', '2026-10-14 13:44:48');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` bigint(20) UNSIGNED NOT NULL,
  `id_role` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `id_prodi` bigint(20) UNSIGNED DEFAULT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `id_role`, `username`, `nama_lengkap`, `email`, `password_hash`, `id_prodi`, `aktif`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'Administrator Sistem', 'admin@universitascontoh.ac.id', 'Admin1', NULL, 1, NULL, '2026-10-14 13:44:48', '2026-10-14 14:00:24'),
(2, 2, 'operator', 'Operator Akademik', 'operator@universitascontoh.ac.id', 'Admin12', NULL, 1, NULL, '2026-10-14 13:44:48', '2026-10-14 14:00:51');

-- --------------------------------------------------------

--
-- Table structure for table `program_studi`
--

CREATE TABLE `program_studi` (
  `id_prodi` bigint(20) UNSIGNED NOT NULL,
  `id_fakultas` bigint(20) UNSIGNED NOT NULL,
  `kode_prodi` varchar(30) NOT NULL,
  `nama_prodi` varchar(200) NOT NULL,
  `jenjang` enum('D3','D4','S1','S2','S3') NOT NULL DEFAULT 'S1',
  `akreditasi` varchar(50) DEFAULT NULL,
  `kaprodi` varchar(150) DEFAULT NULL,
  `jumlah_mahasiswa` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uri` varchar(255) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `program_studi`
--

INSERT INTO `program_studi` (`id_prodi`, `id_fakultas`, `kode_prodi`, `nama_prodi`, `jenjang`, `akreditasi`, `kaprodi`, `jumlah_mahasiswa`, `uri`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 1, 'TI', 'Teknik Informatika', 'S1', 'Baik Sekali', NULL, 412, 'https://universitascontoh.ac.id/resource/prodi/TI', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(2, 1, 'SI', 'Sistem Informasi', 'S1', 'Baik Sekali', NULL, 287, 'https://universitascontoh.ac.id/resource/prodi/SI', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(3, 1, 'TE', 'Teknik Elektro', 'S1', 'Baik', NULL, 198, 'https://universitascontoh.ac.id/resource/prodi/TE', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(4, 1, 'TS', 'Teknik Sipil', 'S1', 'Baik', NULL, 175, 'https://universitascontoh.ac.id/resource/prodi/TS', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(5, 2, 'MNJ', 'Manajemen', 'S1', 'Unggul', NULL, 325, 'https://universitascontoh.ac.id/resource/prodi/MNJ', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(6, 2, 'AKN', 'Akuntansi', 'S1', 'Baik Sekali', NULL, 298, 'https://universitascontoh.ac.id/resource/prodi/AKN', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(7, 2, 'ES', 'Ekonomi Syariah', 'S1', 'Baik Sekali', NULL, 231, 'https://universitascontoh.ac.id/resource/prodi/ES', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(8, 3, 'PGSD', 'Pendidikan Guru Sekolah Dasar', 'S1', 'Unggul', NULL, 410, 'https://universitascontoh.ac.id/resource/prodi/PGSD', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(9, 3, 'PBI', 'Pendidikan Bahasa Inggris', 'S1', 'Baik Sekali', NULL, 260, 'https://universitascontoh.ac.id/resource/prodi/PBI', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(10, 3, 'PMAT', 'Pendidikan Matematika', 'S1', 'Baik', NULL, 215, 'https://universitascontoh.ac.id/resource/prodi/PMAT', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(11, 3, 'PBSI', 'Pendidikan Bahasa dan Sastra Indonesia', 'S1', 'Baik', NULL, 180, 'https://universitascontoh.ac.id/resource/prodi/PBSI', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(12, 4, 'HK', 'Ilmu Hukum', 'S1', 'Baik Sekali', NULL, 390, 'https://universitascontoh.ac.id/resource/prodi/HK', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(13, 4, 'MH', 'Magister Hukum', 'S2', 'Baik', NULL, 80, 'https://universitascontoh.ac.id/resource/prodi/MH', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(14, 5, 'KEP', 'Keperawatan', 'S1', 'Baik Sekali', NULL, 350, 'https://universitascontoh.ac.id/resource/prodi/KEP', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(15, 5, 'KESMAS', 'Kesehatan Masyarakat', 'S1', 'Baik Sekali', NULL, 310, 'https://universitascontoh.ac.id/resource/prodi/KESMAS', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(16, 5, 'GIZI', 'Gizi', 'S1', 'Baik', NULL, 205, 'https://universitascontoh.ac.id/resource/prodi/GIZI', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(17, 6, 'ADM', 'Administrasi Publik', 'S1', 'Baik Sekali', NULL, 275, 'https://universitascontoh.ac.id/resource/prodi/ADM', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(18, 6, 'KOM', 'Ilmu Komunikasi', 'S1', 'Baik', NULL, 240, 'https://universitascontoh.ac.id/resource/prodi/KOM', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(19, 6, 'SOS', 'Sosiologi', 'S1', 'Baik', NULL, 160, 'https://universitascontoh.ac.id/resource/prodi/SOS', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(20, 7, 'PAI', 'Pendidikan Agama Islam', 'S1', 'Unggul', NULL, 320, 'https://universitascontoh.ac.id/resource/prodi/PAI', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(21, 7, 'HES', 'Hukum Ekonomi Syariah', 'S1', 'Baik', NULL, 210, 'https://universitascontoh.ac.id/resource/prodi/HES', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(22, 7, 'MPI', 'Manajemen Pendidikan Islam', 'S1', 'Baik', NULL, 175, 'https://universitascontoh.ac.id/resource/prodi/MPI', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(23, 8, 'AGR', 'Agroteknologi', 'S1', 'Baik Sekali', NULL, 250, 'https://universitascontoh.ac.id/resource/prodi/AGR', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(24, 8, 'AGB', 'Agribisnis', 'S1', 'Baik Sekali', NULL, 235, 'https://universitascontoh.ac.id/resource/prodi/AGB', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(25, 8, 'TP', 'Teknologi Pangan', 'S1', 'Baik', NULL, 180, 'https://universitascontoh.ac.id/resource/prodi/TP', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(26, 8, 'KHT', 'Kehutanan', 'S1', 'Baik', NULL, 145, 'https://universitascontoh.ac.id/resource/prodi/KHT', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48'),
(27, 8, 'THP', 'Teknologi Hasil Pertanian', 'S1', 'Baik', NULL, 165, 'https://universitascontoh.ac.id/resource/prodi/THP', 1, '2026-10-14 13:44:48', '2026-10-14 13:44:48');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id_role` int(10) UNSIGNED NOT NULL,
  `nama_role` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id_role`, `nama_role`, `keterangan`) VALUES
(1, 'admin', 'Administrator sistem'),
(2, 'operator', 'Pengelola data akademik'),
(3, 'dosen', 'Pengguna dengan akses data sesuai kewenangan'),
(4, 'mahasiswa', 'Mahasiswa'),
(5, 'publik', 'Pengguna umum');

-- --------------------------------------------------------

--
-- Table structure for table `universitas`
--

CREATE TABLE `universitas` (
  `id_universitas` bigint(20) UNSIGNED NOT NULL,
  `kode_universitas` varchar(20) NOT NULL,
  `nama_universitas` varchar(200) NOT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kota` varchar(100) DEFAULT NULL,
  `provinsi` varchar(100) DEFAULT NULL,
  `kode_pos` varchar(10) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telepon` varchar(30) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `uri` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universitas`
--

INSERT INTO `universitas` (`id_universitas`, `kode_universitas`, `nama_universitas`, `slogan`, `alamat`, `kota`, `provinsi`, `kode_pos`, `email`, `telepon`, `website`, `uri`, `created_at`, `updated_at`) VALUES
(1, 'UCONTOH', 'Universitas Contoh', 'Unggul · Islam · Berkemajuan', 'Jl. Pendidikan No. 1', 'Kota Bengkulu', 'Bengkulu', '38119', 'info@universitascontoh.ac.id', '+62 736 123456', 'https://universitascontoh.ac.id', 'https://universitascontoh.ac.id/resource/universitas', '2026-10-14 13:44:48', '2026-10-14 13:44:48');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_dashboard`
-- (See below for the actual view)
--
CREATE TABLE `v_dashboard` (
`total_mahasiswa` bigint(21)
,`total_program_studi` bigint(21)
,`total_fakultas` bigint(21)
,`mahasiswa_data_tahun_ini` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_jumlah_mahasiswa_prodi`
-- (See below for the actual view)
--
CREATE TABLE `v_jumlah_mahasiswa_prodi` (
`id_prodi` bigint(20) unsigned
,`kode_prodi` varchar(30)
,`nama_prodi` varchar(200)
,`jenjang` enum('D3','D4','S1','S2','S3')
,`kode_fakultas` varchar(20)
,`nama_fakultas` varchar(200)
,`jumlah_mahasiswa` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `v_dashboard`
--
DROP TABLE IF EXISTS `v_dashboard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dashboard`  AS SELECT (select count(0) from `mahasiswa` where `mahasiswa`.`status_mahasiswa` = 'Aktif') AS `total_mahasiswa`, (select count(0) from `program_studi` where `program_studi`.`aktif` = 1) AS `total_program_studi`, (select count(0) from `fakultas`) AS `total_fakultas`, (select count(0) from `mahasiswa` where `mahasiswa`.`status_mahasiswa` = 'Aktif' and year(`mahasiswa`.`created_at`) = year(curdate())) AS `mahasiswa_data_tahun_ini` ;

-- --------------------------------------------------------

--
-- Structure for view `v_jumlah_mahasiswa_prodi`
--
DROP TABLE IF EXISTS `v_jumlah_mahasiswa_prodi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_jumlah_mahasiswa_prodi`  AS SELECT `ps`.`id_prodi` AS `id_prodi`, `ps`.`kode_prodi` AS `kode_prodi`, `ps`.`nama_prodi` AS `nama_prodi`, `ps`.`jenjang` AS `jenjang`, `f`.`kode_fakultas` AS `kode_fakultas`, `f`.`nama_fakultas` AS `nama_fakultas`, count(`m`.`id_mahasiswa`) AS `jumlah_mahasiswa` FROM ((`program_studi` `ps` join `fakultas` `f` on(`f`.`id_fakultas` = `ps`.`id_fakultas`)) left join `mahasiswa` `m` on(`m`.`id_prodi` = `ps`.`id_prodi` and `m`.`status_mahasiswa` = 'Aktif')) GROUP BY `ps`.`id_prodi`, `ps`.`kode_prodi`, `ps`.`nama_prodi`, `ps`.`jenjang`, `f`.`kode_fakultas`, `f`.`nama_fakultas` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id_audit`),
  ADD KEY `idx_audit_pengguna` (`id_pengguna`),
  ADD KEY `idx_audit_aktivitas` (`aktivitas`),
  ADD KEY `idx_audit_target` (`tabel_target`,`id_target`),
  ADD KEY `idx_audit_waktu` (`created_at`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id_fakultas`),
  ADD UNIQUE KEY `uri` (`uri`),
  ADD UNIQUE KEY `uk_fakultas_kode` (`id_universitas`,`kode_fakultas`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `uri` (`uri`),
  ADD KEY `idx_mahasiswa_prodi` (`id_prodi`),
  ADD KEY `idx_mahasiswa_nama` (`nama_lengkap`),
  ADD KEY `idx_mahasiswa_angkatan` (`angkatan`),
  ADD KEY `idx_mahasiswa_status` (`status_mahasiswa`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_pengguna_role` (`id_role`),
  ADD KEY `idx_pengguna_prodi` (`id_prodi`),
  ADD KEY `idx_pengguna_aktif` (`aktif`);

--
-- Indexes for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`id_prodi`),
  ADD UNIQUE KEY `uri` (`uri`),
  ADD UNIQUE KEY `uk_prodi_kode` (`id_fakultas`,`kode_prodi`),
  ADD KEY `idx_prodi_nama` (`nama_prodi`),
  ADD KEY `idx_prodi_jenjang` (`jenjang`),
  ADD KEY `idx_prodi_aktif` (`aktif`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`),
  ADD UNIQUE KEY `nama_role` (`nama_role`);

--
-- Indexes for table `universitas`
--
ALTER TABLE `universitas`
  ADD PRIMARY KEY (`id_universitas`),
  ADD UNIQUE KEY `kode_universitas` (`kode_universitas`),
  ADD UNIQUE KEY `uri` (`uri`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id_audit` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id_fakultas` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `program_studi`
--
ALTER TABLE `program_studi`
  MODIFY `id_prodi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `universitas`
--
ALTER TABLE `universitas`
  MODIFY `id_universitas` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `fk_audit_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD CONSTRAINT `fk_fakultas_universitas` FOREIGN KEY (`id_universitas`) REFERENCES `universitas` (`id_universitas`) ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `fk_mahasiswa_prodi` FOREIGN KEY (`id_prodi`) REFERENCES `program_studi` (`id_prodi`) ON UPDATE CASCADE;

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `fk_pengguna_prodi` FOREIGN KEY (`id_prodi`) REFERENCES `program_studi` (`id_prodi`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pengguna_role` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`) ON UPDATE CASCADE;

--
-- Constraints for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD CONSTRAINT `fk_prodi_fakultas` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id_fakultas`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
