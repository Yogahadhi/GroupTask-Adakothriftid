-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Des 2021 pada 02.54
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Struktur dari tabel `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Uniqlo'),
(2, 'H&M'),
(3, 'Threeseconds'),
(4, 'Volcom'),
(5, 'Levis'),
(6, 'Zara');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'T-Shirt'),
(2, 'Shirt'),
(3, 'Pants'),
(4, 'Jacket');

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 12, 'Pahrul Pahrul', 'ahmdphrl1st14@gmail.com', '123456789', 'Makassar', 'Indonesia', 123456, 'Pahrul', '4021 7700 0019 2547', '12/10', 2, 165000, 213);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 91, 1, 65000),
(92, 2, 86, 1, 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 2, 2, '1679', 70000, 'Ukuran L', '1679.jpeg', 'Adako'),
(4, 2, 1, '1680', 65000, 'Ukuran M', '1680.jpeg', 'Adako'),
(8, 4, 4, '1681', 70000, 'Ukuran M', '1681.jpeg', 'Adako'),
(83, 2, 6, '1600', 70000, 'Ukuran L', '1639207929_1600.jpeg', 'Adako'),
(85, 2, 2, '1718', 65000, 'Ukuran L', '1639208120_1718.PNG', 'Adako'),
(86, 3, 5, '1728', 100000, 'Ukuran M', '1639208175_1728.jpeg', 'Adako'),
(87, 3, 5, '1730', 100000, 'Ukuran M', '1639208233_1730.jpeg', 'Adako'),
(88, 4, 3, '1731', 65000, 'Ukuran M', '1639208279_1731.jpeg', 'Adako'),
(89, 4, 4, '1732', 65000, 'Ukuran M', '1639208313_1732.jpeg', 'Adako'),
(90, 4, 1, '1733', 65000, 'Ukuran M', '1639208346_1733.jpeg', 'Adako'),
(91, 1, 1, '1734', 65000, 'Ukuran M', '1639208404_1734.jpeg', 'Adako'),
(92, 2, 2, '1735', 70000, 'Ukuran L', '1639208438_1735.jpeg', 'Adako'),
(93, 1, 3, '1736', 70000, 'Ukuran M', '1639208477_1736.jpeg', 'Adako'),
(94, 2, 4, '1737', 70000, 'Ukuran M', '1639208514_1737.jpeg', 'Adako'),
(95, 4, 1, '1738', 70000, 'Ukuran M', '1639208545_1738.jpeg', 'Adako'),
(96, 4, 3, '1739', 70000, 'Ukuran L', '1639208578_1739.jpeg', 'Adako'),
(97, 2, 2, '1740', 70000, 'Ukuran M', '1639208603_1740.jpeg', 'Adako'),
(98, 1, 1, '1741', 70000, 'Ukuran M', '1639208630_1741.jpeg', 'Adako'),
(99, 1, 2, '1742', 70000, 'Ukuran M', '1639208666_1742.jpeg', 'Adako'),
(100, 1, 3, '1744', 65000, 'Ukuran M', '1639208709_1744.jpeg', 'Adako'),
(101, 4, 4, '1748', 70000, 'Ukuran L', '1639208765_1748.jpeg', 'Adako'),
(102, 4, 2, '1749', 65000, 'Ukuran M', '1639208795_1749.jpeg', 'Adako'),
(103, 4, 1, '1750', 70000, 'Ukuran L', '1639208829_1750.jpeg', 'Adako'),
(104, 2, 1, '1704', 70000, 'Ukuran M', '1639209333_1704.jpeg', 'Adako');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Pahrul', 'Pahrul', 'ahmdphrl1st14@gmail.com', 'sandiapa123', '9448121558', '123456789', 'sdcjns,djc'),
(26, 'Sayyid', 'Masagena', 'sayyidshiddiqm@gmail.com', 'fu4QAEnb', '12345678', 'Hertasning Baru', 'Makassar'),
(27, 'Muhammad Yoga ', 'Triatmojo', 'yogazen137@gmail.com', 'yogacantik123', '6288888888', 'Makassar', 'Indonesia'),
(28, 'Lutfiah ', 'Salim', 'lutfiahsalim@gmail.com', 'lutfiah1234567', '6288888888', 'Makassar', 'Indonesia');

--
-- Trigger `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(26, 'Sayyid', 'Masagena', 'sayyidshiddiqm@gmail.com', 'fu4QAEnb', '12345678', 'Hertasning Baru', 'Makassar'),
(27, 'Muhammad Yoga ', 'Triatmojo', 'yogazen137@gmail.com', 'yogacantik123', '6288888888', 'Makassar', 'Indonesia'),
(28, 'Lutfiah ', 'Salim', 'lutfiahsalim@gmail.com', 'lutfiah1234567', '6288888888', 'Makassar', 'Indonesia');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indeks untuk tabel `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indeks untuk tabel `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indeks untuk tabel `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indeks untuk tabel `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT untuk tabel `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
