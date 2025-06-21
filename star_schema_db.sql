-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2025 at 06:50 AM
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
-- Database: `star_schema_db_c`
--

-- --------------------------------------------------------

--
-- Table structure for table `dim_customer`
--

CREATE TABLE `dim_customer` (
  `customer_id` varchar(10) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_segment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dim_customer`
--

INSERT INTO `dim_customer` (`customer_id`, `customer_name`, `customer_segment`) VALUES
('C4001', 'Alice', 'Retail'),
('C4002', 'Bob', 'Corporate'),
('C4003', 'Charlie', 'Retail'),
('C4004', 'Diana', 'Small Business'),
('C4005', 'Eve', 'Corporate'),
('C4006', 'Frank', 'Retail'),
('C4007', 'Grace', 'Small Business');

-- --------------------------------------------------------

--
-- Table structure for table `dim_product`
--

CREATE TABLE `dim_product` (
  `product_id` varchar(10) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dim_product`
--

INSERT INTO `dim_product` (`product_id`, `product_name`, `product_type`) VALUES
('P1001', 'iPhone 14', 'phone'),
('P1002', 'Galaxy S23', 'phone'),
('P1003', 'MacBook Pro', 'laptop'),
('P1004', 'iPad Pro', 'tablet'),
('P1005', 'Pixel 7', 'phone'),
('P1006', 'Xiaomi 13', 'phone'),
('P1007', 'Surface Pro', 'tablet');

-- --------------------------------------------------------

--
-- Table structure for table `dim_store`
--

CREATE TABLE `dim_store` (
  `store_id` varchar(10) NOT NULL,
  `store_address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dim_store`
--

INSERT INTO `dim_store` (`store_id`, `store_address`, `city`) VALUES
('S2001', 'Street A No.1', 'Berlin'),
('S2002', 'Street B No.2', 'Munich'),
('S2003', 'Street C No.3', 'Berlin'),
('S2004', 'Street D No.4', 'Hamburg'),
('S2005', 'Street E No.5', 'Berlin'),
('S2006', 'Street F No.6', 'Frankfurt'),
('S2007', 'Street G No.7', 'Berlin');

-- --------------------------------------------------------

--
-- Table structure for table `dim_time`
--

CREATE TABLE `dim_time` (
  `time_id` varchar(10) NOT NULL,
  `action_year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dim_time`
--

INSERT INTO `dim_time` (`time_id`, `action_year`) VALUES
('T3001', 2022),
('T3002', 2022),
('T3003', 2023),
('T3004', 2022),
('T3005', 2022),
('T3006', 2023),
('T3007', 2022);

-- --------------------------------------------------------

--
-- Table structure for table `fact_sales`
--

CREATE TABLE `fact_sales` (
  `sales_id` int(11) NOT NULL,
  `product_id` varchar(10) DEFAULT NULL,
  `store_id` varchar(10) DEFAULT NULL,
  `time_id` varchar(10) DEFAULT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fact_sales`
--

INSERT INTO `fact_sales` (`sales_id`, `product_id`, `store_id`, `time_id`, `customer_id`, `quantity`) VALUES
(1, 'P1001', 'S2001', 'T3001', 'C4001', 10),
(2, 'P1002', 'S2002', 'T3002', 'C4002', 20),
(3, 'P1003', 'S2003', 'T3003', 'C4003', 15),
(4, 'P1004', 'S2004', 'T3004', 'C4004', 12),
(5, 'P1005', 'S2005', 'T3005', 'C4005', 8),
(6, 'P1006', 'S2006', 'T3006', 'C4006', 5),
(7, 'P1007', 'S2007', 'T3007', 'C4007', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_customer`
--
ALTER TABLE `dim_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `dim_product`
--
ALTER TABLE `dim_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `dim_store`
--
ALTER TABLE `dim_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `dim_time`
--
ALTER TABLE `dim_time`
  ADD PRIMARY KEY (`time_id`);

--
-- Indexes for table `fact_sales`
--
ALTER TABLE `fact_sales`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fact_sales`
--
ALTER TABLE `fact_sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fact_sales`
--
ALTER TABLE `fact_sales`
  ADD CONSTRAINT `fact_sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `dim_product` (`product_id`),
  ADD CONSTRAINT `fact_sales_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `dim_store` (`store_id`),
  ADD CONSTRAINT `fact_sales_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `dim_customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
