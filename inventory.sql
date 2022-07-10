-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2022 pada 12.02
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `level` set('admin','owner') NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `email`, `password`, `nama`, `level`) VALUES
(1, 'a@a.a', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'test(password: test)', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `stok` int(11) NOT NULL,
  `foto_produk` varchar(255) NOT NULL,
  `status_delete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `deskripsi`, `stok`, `foto_produk`, `status_delete`) VALUES
(58, 'dffdf', 'ffgdfg', 0, '', 1),
(59, 'dssfd', 'sdfsdf', 34, '', 1),
(60, 'Laptop', 'Keren', 0, 'laptop-1.jpeg', 1),
(61, 'Asus Tuf', 'Ini khusus gaming loh', 0, 'laptop-2.jpeg', 0),
(62, 'Asus', 'Ini bukan notebook', 40, 'laptop-1.jpeg', 0),
(63, 'Laptop', 'ini keren banget', 74, '1656851874.jpeg', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_departemen` int(11) DEFAULT NULL,
  `jenis_masuk` set('pengembalian','pengadaan') NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `waktu_masuk` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_pinjam`
--

CREATE TABLE `barang_pinjam` (
  `id_barang_pinjam` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `jumlah_pinjam` int(11) NOT NULL,
  `waktu_pinjam` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE `departemen` (
  `id_departemen` int(11) NOT NULL,
  `nama_departemen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `departemen`
--

INSERT INTO `departemen` (`id_departemen`, `nama_departemen`) VALUES
(1, 'UPT'),
(2, 'Innovation Center'),
(3, 'Prodi Manajemen Informatika'),
(4, 'Prodi Teknik Informatika'),
(5, 'Kemahasiswaan'),
(6, 'Rektorat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_bulanan`
--

CREATE TABLE `stok_bulanan` (
  `id_stok_bulanan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `tahun` smallint(6) NOT NULL,
  `jumlah_stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `status_delete` (`status_delete`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`) USING BTREE,
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_departemen` (`id_departemen`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `barang_pinjam`
--
ALTER TABLE `barang_pinjam`
  ADD PRIMARY KEY (`id_barang_pinjam`) USING BTREE,
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_departemen` (`id_departemen`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id_departemen`);

--
-- Indeks untuk tabel `stok_bulanan`
--
ALTER TABLE `stok_bulanan`
  ADD PRIMARY KEY (`id_stok_bulanan`),
  ADD KEY `id_barang` (`id_barang`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id_barang_masuk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `barang_pinjam`
--
ALTER TABLE `barang_pinjam`
  MODIFY `id_barang_pinjam` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id_departemen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `stok_bulanan`
--
ALTER TABLE `stok_bulanan`
  MODIFY `id_stok_bulanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`),
  ADD CONSTRAINT `barang_masuk_ibfk_3` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Ketidakleluasaan untuk tabel `barang_pinjam`
--
ALTER TABLE `barang_pinjam`
  ADD CONSTRAINT `barang_pinjam_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `barang_pinjam_ibfk_2` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`),
  ADD CONSTRAINT `barang_pinjam_ibfk_3` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `stok_bulanan`
--
ALTER TABLE `stok_bulanan`
  ADD CONSTRAINT `stok_bulanan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
