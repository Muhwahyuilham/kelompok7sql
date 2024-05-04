-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2024 at 05:03 PM
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
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `ID_Pelanggan` int(11) NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Alamat` text DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Nomor_Telepon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`ID_Pelanggan`, `Nama`, `Alamat`, `Email`, `Nomor_Telepon`) VALUES
(1, 'John Doe', 'Jl. Raya No. 123', 'john@example.com', '08123456789'),
(2, 'Jane Smith', 'Jl. Melati No. 5', 'jane@example.com', '08567891234'),
(3, 'Michael Lee', 'Jl. Anggrek No. 7', 'michael@example.com', '08123456700');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `ID_Pembayaran` int(11) NOT NULL,
  `ID_Pesanan` int(11) DEFAULT NULL,
  `Metode_Pembayaran` varchar(100) DEFAULT NULL,
  `Tanggal_Pembayaran` date DEFAULT NULL,
  `Jumlah_Pembayaran` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`ID_Pembayaran`, `ID_Pesanan`, `Metode_Pembayaran`, `Tanggal_Pembayaran`, `Jumlah_Pembayaran`) VALUES
(1, 1, 'Transfer Bank', '2024-05-02', 950.00),
(2, 2, 'Kartu Kredit', '2024-05-03', 200.00),
(3, 3, 'Transfer Bank', '2024-05-04', 300.00);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `ID_Pesanan` int(11) NOT NULL,
  `ID_Pelanggan` int(11) DEFAULT NULL,
  `Tanggal_Pesanan` date DEFAULT NULL,
  `Total_Harga` decimal(10,2) DEFAULT NULL,
  `Status_Pesanan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`ID_Pesanan`, `ID_Pelanggan`, `Tanggal_Pesanan`, `Total_Harga`, `Status_Pesanan`) VALUES
(1, 1, '2024-05-01', 950.00, 'Selesai'),
(2, 2, '2024-05-02', 200.00, 'Dalam Proses'),
(3, 3, '2024-05-03', 300.00, 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `ID_Produk` int(11) NOT NULL,
  `Nama_Produk` varchar(255) DEFAULT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL,
  `Kategori` varchar(100) DEFAULT NULL,
  `ID_Pelanggan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`ID_Produk`, `Nama_Produk`, `Deskripsi`, `Harga`, `Stok`, `Kategori`, `ID_Pelanggan`) VALUES
(1, 'Laptop ASUS', 'Laptop dengan spesifikasi tinggi', 800.00, 10, 'Elektronik', 1),
(2, 'Buku Programming', 'Buku panduan untuk pemrograman', 50.00, 30, 'Buku', 2),
(3, 'Celana Jeans', 'Celana jeans warna biru', 150.00, 20, 'Fashion', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`ID_Pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`ID_Pembayaran`),
  ADD KEY `ID_Pesanan` (`ID_Pesanan`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`ID_Pesanan`),
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`ID_Produk`),
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`ID_Pesanan`) REFERENCES `pesanan` (`ID_Pesanan`);

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `pelanggan` (`ID_Pelanggan`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `pelanggan` (`ID_Pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
