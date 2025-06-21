-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2025 at 04:55 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scd_praktikum`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_product_type2` (IN `p_id` INT, IN `p_nama` VARCHAR(100), IN `p_kategori` VARCHAR(100), IN `p_harga` INT)   BEGIN
    -- Nonaktifkan yang lama
    UPDATE product_dim_type2
    SET end_date = CURDATE(), current_flag = 'N'
    WHERE produk_id = p_id AND current_flag = 'Y';

    -- Tambahkan versi baru
    INSERT INTO product_dim_type2 (produk_id, nama, kategori, harga, start_date, end_date, current_flag)
    VALUES (p_id, p_nama, p_kategori, p_harga, CURDATE(), NULL, 'Y');
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_dim_type1`
--

CREATE TABLE `product_dim_type1` (
  `produk_id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_dim_type1`
--

INSERT INTO `product_dim_type1` (`produk_id`, `nama`, `kategori`, `harga`) VALUES
(1, 'keripik', 'Snack', 4500),
(2, 'Coklat Premium', 'Snack', 10000),
(3, 'Kentang', 'Toiletries', 20000),
(4, 'Sampo', 'Toiletries', 12000),
(5, 'Teh Botol', 'Minuman', 6000);

-- --------------------------------------------------------

--
-- Table structure for table `product_dim_type2`
--

CREATE TABLE `product_dim_type2` (
  `produk_id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `current_flag` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_dim_type2`
--

INSERT INTO `product_dim_type2` (`produk_id`, `nama`, `kategori`, `harga`, `start_date`, `end_date`, `current_flag`) VALUES
(1, 'keripik', 'Snack', 3000, '2025-06-17', '2025-06-17', 'N'),
(1, 'keripik', 'Snack', 4500, '2025-06-18', '2025-06-17', 'N'),
(2, 'Coklat', 'Snack', 5000, '2025-06-17', '2025-06-17', 'N'),
(3, 'Sabun', 'Toiletries', 7000, '2025-06-17', '2025-06-17', 'N'),
(4, 'Sampo', 'Toiletries', 12000, '2025-06-17', '2025-06-17', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `product_dim_type3`
--

CREATE TABLE `product_dim_type3` (
  `produk_id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `current_flag` char(1) DEFAULT NULL,
  `harga_lama` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_dim_type3`
--

INSERT INTO `product_dim_type3` (`produk_id`, `nama`, `kategori`, `harga`, `start_date`, `end_date`, `current_flag`, `harga_lama`) VALUES
(1, 'keripik', 'Snack', 4500, '2025-06-17', NULL, 'Y', 3000),
(2, 'Coklat', 'Snack', 10000, '2025-06-17', NULL, 'Y', 5000),
(3, 'Kentang', 'Toiletries', 20000, '2025-06-17', NULL, 'Y', 7000),
(4, 'Sampo', 'Toiletries', 12000, '2025-06-17', NULL, 'Y', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_dim_type1`
--
ALTER TABLE `product_dim_type1`
  ADD PRIMARY KEY (`produk_id`);

--
-- Indexes for table `product_dim_type2`
--
ALTER TABLE `product_dim_type2`
  ADD PRIMARY KEY (`produk_id`,`start_date`);

--
-- Indexes for table `product_dim_type3`
--
ALTER TABLE `product_dim_type3`
  ADD PRIMARY KEY (`produk_id`,`start_date`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
