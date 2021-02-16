-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Nov 2020 pada 16.04
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `logistik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dta_barang`
--

CREATE TABLE `dta_barang` (
  `kd_barang` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jumlah` int(15) NOT NULL,
  `harga` int(15) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `kondisi` varchar(20) NOT NULL,
  `stock_awal` int(15) NOT NULL,
  `stock_terjual` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dta_barang`
--

INSERT INTO `dta_barang` (`kd_barang`, `nama`, `jumlah`, `harga`, `satuan`, `kondisi`, `stock_awal`, `stock_terjual`) VALUES
('KDR-0001', 'coba', 190, 300000, 'Unit', '- Kondisi Barang -', 200, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dta_supplier`
--

CREATE TABLE `dta_supplier` (
  `id_supplier` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nomor` varchar(20) NOT NULL,
  `fax` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `website` varchar(20) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dta_supplier`
--

INSERT INTO `dta_supplier` (`id_supplier`, `nama`, `nomor`, `fax`, `email`, `website`, `alamat`) VALUES
('IDSUP-0001', 'coba', '0210928348', '0210398483', 'coba@gmail.com', ' coba.com', 'cobaaaaaa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dta_trnsaksi_brng_keluar`
--

CREATE TABLE `dta_trnsaksi_brng_keluar` (
  `id_transaksi` varchar(20) NOT NULL,
  `id_supplier` varchar(20) NOT NULL,
  `nmasup` varchar(50) NOT NULL,
  `kd_barang` varchar(20) NOT NULL,
  `nmabar` varchar(50) NOT NULL,
  `jumlah` int(15) NOT NULL,
  `harga` int(15) NOT NULL,
  `total` int(15) NOT NULL,
  `status` varchar(20) NOT NULL,
  `waktu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dta_trnsaksi_brng_keluar`
--

INSERT INTO `dta_trnsaksi_brng_keluar` (`id_transaksi`, `id_supplier`, `nmasup`, `kd_barang`, `nmabar`, `jumlah`, `harga`, `total`, `status`, `waktu`) VALUES
('TRSBK-0001', 'IDSUP-0001', 'coba', 'KDR-0001', 'coba', 10, 300000, 3000000, '- Status Pengantaran', '2020-11-01 21.58.04');

--
-- Trigger `dta_trnsaksi_brng_keluar`
--
DELIMITER $$
CREATE TRIGGER `kurangjumlahbarang` AFTER INSERT ON `dta_trnsaksi_brng_keluar` FOR EACH ROW begin
update dta_barang set jumlah = jumlah-new.jumlah, stock_terjual = stock_terjual+new.jumlah where kd_barang = new.kd_barang;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dta_trnsaksi_brng_masuk`
--

CREATE TABLE `dta_trnsaksi_brng_masuk` (
  `id_transaksi` varchar(20) NOT NULL,
  `id_supplier` varchar(20) NOT NULL,
  `nmasup` varchar(50) NOT NULL,
  `kd_barang` varchar(20) NOT NULL,
  `nmabar` varchar(50) NOT NULL,
  `jumlah` int(15) NOT NULL,
  `harga` int(15) NOT NULL,
  `total` int(15) NOT NULL,
  `waktu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dta_trnsaksi_brng_masuk`
--

INSERT INTO `dta_trnsaksi_brng_masuk` (`id_transaksi`, `id_supplier`, `nmasup`, `kd_barang`, `nmabar`, `jumlah`, `harga`, `total`, `waktu`) VALUES
('TRSBM-0001', 'IDSUP-0001', 'coba', 'KDR-0001', 'coba', 200, 300000, 60000000, '2020-11-01 21.57.39');

--
-- Trigger `dta_trnsaksi_brng_masuk`
--
DELIMITER $$
CREATE TRIGGER `tambahjumlahbarang` AFTER INSERT ON `dta_trnsaksi_brng_masuk` FOR EACH ROW begin
update dta_barang set jumlah = jumlah+new.jumlah, stock_awal = stock_awal+new.jumlah where kd_barang = new.kd_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `masuk`
--

CREATE TABLE `masuk` (
  `id` int(5) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `masuk`
--

INSERT INTO `masuk` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'dika', '12345');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dta_barang`
--
ALTER TABLE `dta_barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indeks untuk tabel `dta_supplier`
--
ALTER TABLE `dta_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `dta_trnsaksi_brng_keluar`
--
ALTER TABLE `dta_trnsaksi_brng_keluar`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `dta_trnsaksi_brng_masuk`
--
ALTER TABLE `dta_trnsaksi_brng_masuk`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `masuk`
--
ALTER TABLE `masuk`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `masuk`
--
ALTER TABLE `masuk`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
