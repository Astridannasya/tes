-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Apr 2021 pada 03.18
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pengaduan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `id_user`, `nama`, `username`, `password`, `telp`, `created_at`, `updated_at`) VALUES
('1234567895483759', 8, 'Nur Melasari', 'Mela', '$2y$10$QdPnldgnBc7.mP/2Z9dhnuWgpCTI2z1/hZ7bpdx9rTsJOSszXAN0.', '085774941008', '2021-04-03 23:03:56', '2021-04-03 23:03:56'),
('5674345678987654', 7, 'Astridannasya', 'Astridannasya20', '$2y$10$KmsQklRwaP1OVEkesIPRl.y8jf4CR5TWwEwH3n4J6Lyw45bRzoTE2', '089563214565', '2021-04-03 07:46:59', '2021-04-03 07:46:59'),
('9878675432567546', 4, 'Astidputri', 'Astridputri12', '$2y$10$Uo1wQt4l4oRYyFIPefoLQueGJeSj5muoJSNw/Au/SyNIwdjTYjnrW', '089678654567', '2021-03-15 22:07:44', '2021-04-02 05:03:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_04_06_041223_create_masyarakat_table', 1),
(2, '2020_04_06_041447_create_pengaduan_table', 1),
(3, '2020_04_06_041502_create_petugas_table', 1),
(4, '2020_04_06_041516_create_tanggapan_table', 1),
(5, '2020_04_06_054307_create_users_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tgl_pengaduan` date NOT NULL,
  `nik` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi_laporan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','proses','selesai') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `isi_laporan`, `foto`, `status`, `created_at`, `updated_at`) VALUES
(5, '2021-03-16', '2147483647', 'jalan berlubang', '1.jpg', 'selesai', '2021-03-15 22:36:15', '2021-03-15 22:41:53'),
(8, '2021-04-04', '2147483647', 'tes tes', '1.jpg', '0', '2021-04-03 21:39:08', '2021-04-03 21:39:08'),
(9, '2021-04-04', '1234567895483759', 'Ini adalah pengaduan Nur Melasari!', 'jon-tyson-XzUMBNmQro0-unsplash.jpg', 'selesai', '2021-04-03 23:05:26', '2021-04-03 23:09:38'),
(10, '2021-04-04', '1234567895483759', 'Disini sungai membendung, tolong sampahnya dibuang dengan cepat agar tidak terjadi kebanjiran', 'andrew-neel-z55CR_d0ayg-unsplash.jpg', '0', '2021-04-03 23:13:15', '2021-04-03 23:13:15'),
(11, '2021-04-04', '9878675432567546', 'Selamatttt', 'jon-tyson-XzUMBNmQro0-unsplash.jpg', 'selesai', '2021-04-04 16:14:18', '2021-04-04 16:17:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `nama_petugas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('admin','petugas') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `id_user`, `nama_petugas`, `username`, `password`, `telp`, `level`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin', '$2y$10$frm8/tbLV7UC1HV/dZgMh.mhU1qxeG3rLVe6RMZvWaHO.jxe1ochS', '0', 'admin', '2020-04-12 02:26:16', '2020-04-12 02:26:16'),
(8, 6, 'Riniari', 'riniari123', '$2y$10$FFpTrC3xiaciZOCOLLurIubo9ORcKHAojiEuAk0wqWdkDCK.gHK7u', '089786787787', 'petugas', '2021-03-15 22:39:18', '2021-03-15 22:39:18'),
(10, 10, 'Bagas', 'bagas123', '$2y$10$XSnfpMO1p3dD3/oLGXCCz.wldqCDxM5AlW1wWQsRDbSgsnzBNr5yG', '089645321234', 'admin', '2021-04-04 15:09:29', '2021-04-04 15:09:29'),
(15, 15, 'Sinta', 'Sintasusanti', '$2y$10$YVozsYFFG5vDapMLLXHBKOCGPqkB4BFjdNgSLcrv78wd5RlUgKIdm', '081234543455', 'petugas', '2021-04-04 16:06:55', '2021-04-04 16:06:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_pengaduan` int(11) NOT NULL,
  `tgl_tanggapan` date NOT NULL,
  `tanggapan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`, `id_petugas`, `created_at`, `updated_at`) VALUES
(2, 5, '2021-04-04', 'Baik akan segera di perbaiki', 1, '2021-03-15 22:41:53', '2021-04-04 15:56:32'),
(3, 9, '2021-04-04', 'Ini tanggapan petugas!', 9, '2021-04-03 23:09:38', '2021-04-03 23:09:38'),
(4, 11, '2021-04-04', 'Ini Tanggapan', 1, '2021-04-04 16:17:20', '2021-04-04 16:17:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('admin','petugas','masyarakat') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `level`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$BIOy8wJ/.ykTuCnBOhbmsuUE08DGirmm2rn5XMVxra9HeD0YPp.Q6', 'admin', '2020-04-12 02:26:16', '2020-04-12 02:26:16'),
(7, 'Astridannasya20', '$2y$10$KmsQklRwaP1OVEkesIPRl.y8jf4CR5TWwEwH3n4J6Lyw45bRzoTE2', 'masyarakat', '2021-04-03 07:46:59', '2021-04-03 07:46:59'),
(4, 'Astridputri12', '$2y$10$Uo1wQt4l4oRYyFIPefoLQueGJeSj5muoJSNw/Au/SyNIwdjTYjnrW', 'masyarakat', '2021-03-15 22:07:43', '2021-04-02 05:03:36'),
(6, 'riniari123', '$2y$10$FFpTrC3xiaciZOCOLLurIubo9ORcKHAojiEuAk0wqWdkDCK.gHK7u', 'petugas', '2021-03-15 22:39:18', '2021-03-15 22:39:18'),
(8, 'Mela', '$2y$10$QdPnldgnBc7.mP/2Z9dhnuWgpCTI2z1/hZ7bpdx9rTsJOSszXAN0.', 'masyarakat', '2021-04-03 23:03:56', '2021-04-03 23:03:56'),
(10, 'bagas123', '$2y$10$XSnfpMO1p3dD3/oLGXCCz.wldqCDxM5AlW1wWQsRDbSgsnzBNr5yG', 'admin', '2021-04-04 15:09:27', '2021-04-04 15:09:27'),
(15, 'Sintasusanti', '$2y$10$YVozsYFFG5vDapMLLXHBKOCGPqkB4BFjdNgSLcrv78wd5RlUgKIdm', 'petugas', '2021-04-04 16:06:55', '2021-04-04 16:06:55');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`),
  ADD KEY `FK_NIK` (`nik`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`),
  ADD KEY `FK_PENGADUAN` (`id_pengaduan`),
  ADD KEY `FK_PETUGAS` (`id_petugas`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
