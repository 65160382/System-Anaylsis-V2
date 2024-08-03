-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2024 at 05:29 PM
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
-- Database: `secondhandmarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `registration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `Customer_id` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL,
  `Order_id` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `Order_date` timestamp NULL DEFAULT current_timestamp(),
  `Payment_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `Payment_id` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Product_id`, `name`, `price`, `description`, `image`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'Smartphone XYZ', 699, 'Latest smartphone with advanced features', 'https://media.education.studio7thailand.com/57312/iPhone_14_Pro_Max_Gold_PDP_Image_Position-1A_Gold_2-square_medium.jpg', 100, '2024-08-02 16:51:47', '2024-08-03 14:06:14'),
(2, 'Laptop ABC', 1199, 'High-performance laptop for gaming and work', 'https://mercular.s3.ap-southeast-1.amazonaws.com/images/products/2023/08/Product/acer-nitro-16-an16-41-r12p-gaming-notebook-back-left-view.jpg', 50, '2024-08-02 16:51:47', '2024-08-03 14:11:47'),
(3, 'Wireless Earbuds', 149, 'Noise-cancelling wireless earbuds with long battery life', 'https://www.yamaha.com/yamahavgn/PIM/Images/01-TW-E3B-Black-03_1fb09687cc38d06d4cb325ec931685c4.jpg', 200, '2024-08-02 16:51:47', '2024-08-03 14:13:32'),
(4, 'Smartwatch 5', 299, 'Smartwatch with health tracking features', 'https://media-cdn.bnn.in.th/365240/xiaomi-redmi-watch-4-obsidian-black-1-square_medium.jpg', 150, '2024-08-02 16:51:47', '2024-08-03 14:14:04'),
(5, '4K TV', 799, 'Ultra HD 4K TV with vibrant colors and smart features', 'https://inwfile.com/s-cf/jh0rfu.png', 80, '2024-08-02 16:51:47', '2024-08-03 14:14:38'),
(6, 'Bluetooth Speaker', 99, 'Portable Bluetooth speaker with powerful sound', 'https://soundcore.ph/cdn/shop/products/22391aedb46430f25929321d1cb298a5.jpg?v=1657179624&width=1024', 250, '2024-08-02 16:51:47', '2024-08-03 14:15:26'),
(7, 'Digital Camera', 499, 'High-resolution digital camera for professional photography', 'https://ph-live-01.slatic.net/p/a5f87dae05e40bece0871f637d357c9b.jpg', 60, '2024-08-02 16:51:47', '2024-08-03 14:16:07'),
(8, 'Gaming Console', 399, 'Next-gen gaming console with immersive graphics', 'https://media.studio7thailand.com/21160/Switch-H-New-Nintendo-Switch-Console-Neon-Red-Blue-1-square_medium.jpg', 120, '2024-08-02 16:51:47', '2024-08-03 14:16:37'),
(9, 'Tablet Pro', 599, 'Powerful tablet with large display and stylus support', 'https://media.studio7thailand.com/81576/iPad_Pro_Cellular_12-9_in_6th_Gen_Space_Gray_5G_2-square_medium.jpg', 90, '2024-08-02 16:51:47', '2024-08-03 14:17:06'),
(10, 'Fitness Tracker', 129, 'Wearable fitness tracker with heart rate monitoring', 'https://i.ebayimg.com/images/g/z2cAAOSwTF9djg1i/s-l1600.jpg', 180, '2024-08-02 16:51:47', '2024-08-03 14:19:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Customer_id`,`Product_id`,`Order_id`),
  ADD KEY `fk_Customer_has_Products_Products1_idx` (`Product_id`),
  ADD KEY `fk_Customer_has_Products_Customer_idx` (`Customer_id`),
  ADD KEY `fk_Order_Payments1_idx` (`Payment_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`Payment_id`),
  ADD KEY `fk_Payments_Customer1_idx` (`Customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `Payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_Customer_has_Products_Customer` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Customer_has_Products_Products1` FOREIGN KEY (`Product_id`) REFERENCES `products` (`Product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Order_Payments1` FOREIGN KEY (`Payment_id`) REFERENCES `payments` (`Payment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_Payments_Customer1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
