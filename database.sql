-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2018 at 05:36 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bioskop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(5) NOT NULL,
  `nama_admin` varchar(30) NOT NULL,
  `email_admin` varchar(55) NOT NULL,
  `password_admin` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `email_admin`, `password_admin`) VALUES
(1, 'Aa Suhendar', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(5) UNSIGNED ZEROFILL NOT NULL,
  `fname_customer` varchar(20) NOT NULL,
  `lname_customer` varchar(20) NOT NULL,
  `jk_customer` varchar(1) NOT NULL,
  `username_customer` varchar(12) NOT NULL,
  `password_customer` varchar(60) NOT NULL,
  `email_customer` varchar(50) NOT NULL,
  `phone_customer` varchar(20) NOT NULL,
  `saldo_customer` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `fname_customer`, `lname_customer`, `jk_customer`, `username_customer`, `password_customer`, `email_customer`, `phone_customer`, `saldo_customer`) VALUES
(00005, 'Aa', 'Suhendar', 'L', 'batim', '$2y$10$pycmk9TubDq1mGmPEXD0t./YCAIaR84CGDkQf4ZXeEyXx.WauCst6', 'batem@gmail.com', '0822121212', 65000);

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id_film` int(5) NOT NULL,
  `image` varchar(60) NOT NULL,
  `judul` varchar(30) NOT NULL,
  `trailer` varchar(100) NOT NULL,
  `tgl_rilis` date NOT NULL,
  `durasi` int(3) NOT NULL,
  `sinopsis` text,
  `artis` text,
  `kategori1` varchar(20) NOT NULL,
  `kategori2` varchar(20) DEFAULT NULL,
  `kategori3` varchar(20) DEFAULT NULL,
  `rating` varchar(2) DEFAULT NULL,
  `negara` varchar(20) DEFAULT NULL,
  `produksi` varchar(60) DEFAULT NULL,
  `id_admin` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id_film`, `image`, `judul`, `trailer`, `tgl_rilis`, `durasi`, `sinopsis`, `artis`, `kategori1`, `kategori2`, `kategori3`, `rating`, `negara`, `produksi`, `id_admin`) VALUES
(12, 'Stand Up Get Up.jpg', 'Stand Up Get Up', 'http://12asdw.com', '2018-06-23', 123, 'Batim', 'Batim', 'Action', 'Action', 'Action', 'BO', 'United States', 'Batim', 1),
(13, 'The Matrix.jpg', 'The Matrix', 'https://www.youtube.com/watch?v=vKQi3bBA1y8', '2018-06-24', 136, 'Cerita film ini tentang seorang hacker yang bernama Neo dan mengetahui akan keadaan sebenarnya dari realitas dan lalu bergabung dengan sebuah kelompok pemberontak melawan program-program komputer penjaga yang disebut agen-agen. Para pemberontak ini dipimpin oleh Morpheus. Anggota lainnya adalah Trinity, Cypher, Tank, dan lain-lain.', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving, Joe Pantoliano', 'Action', 'Crime', 'Sci-Fi', 'R', 'United States', 'Warner Bros. Pictures', 1),
(14, 'The Matrix Reloaded.jpg', 'The Matrix Reloaded', 'https://www.youtube.com/watch?v=kYzz0FSgpSU', '2018-06-23', 138, 'Ini merupakan episode terakhir dari trilogi Matrix. Zion terancam dalam bahaya karena mesin-mesin sentinel telah mampu menyerang pertahanan Zion dan hendak menghancurkan kota tersebut. Militer Zion pun bersiap memberikan perlawanan seadanya kepada mesin-mesin tersebut. Di lain sisi, Oracle mengisyaratkan bahwa Neo harus menghancurkan rival abadinya: Mr.Smith yang kini semakin merajalela tak terbendung. Dalam bagian akhir ini, pertanyaan besar mengenai nasib Zion dan Matrix akan terjawab, dan apakah Neo benar-benar Sang Terpilih yang mampu memberikan kedamaian bagi umat manusia.', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving, Harold Perrineau, Randall Duk, Kim Jada, Pinkett Smith', 'Action', 'Crime', 'Mystery', 'BO', 'United States', 'Warner Bros. Pictures', 1);

-- --------------------------------------------------------

--
-- Table structure for table `studio`
--

CREATE TABLE `studio` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `kapasitas` int(3) NOT NULL,
  `harga` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studio`
--

INSERT INTO `studio` (`id`, `nama`, `kapasitas`, `harga`) VALUES
(1, 'Reguler', 50, 35000),
(2, 'Sweet', 30, 50000),
(3, 'Platinum', 20, 70000),
(4, 'Imax', 40, 75000);

-- --------------------------------------------------------

--
-- Table structure for table `tayang`
--

CREATE TABLE `tayang` (
  `id` int(5) NOT NULL,
  `tanggal_awal` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `id_film` int(5) NOT NULL,
  `id_studio` int(3) NOT NULL,
  `jam1` time NOT NULL,
  `jam2` time DEFAULT NULL,
  `jam3` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tayang`
--

INSERT INTO `tayang` (`id`, `tanggal_awal`, `tanggal_akhir`, `id_film`, `id_studio`, `jam1`, `jam2`, `jam3`) VALUES
(5, '2018-06-24', '2018-10-31', 13, 1, '08:00:00', '10:00:00', '12:00:00'),
(6, '2018-06-24', '2019-01-31', 14, 1, '11:00:00', '13:00:00', '15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `id` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `tanggal_tonton` date NOT NULL,
  `id_customer` int(5) UNSIGNED ZEROFILL NOT NULL,
  `film_id` int(5) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `id_studio` int(5) NOT NULL,
  `nama_studio` varchar(15) NOT NULL,
  `seat` varchar(30) NOT NULL,
  `jam_tonton` time NOT NULL,
  `jumlah_orang` int(3) NOT NULL,
  `harga` int(6) NOT NULL,
  `total_harga` int(10) NOT NULL,
  `kodebooking` varchar(15) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`id`, `tanggal`, `tanggal_tonton`, `id_customer`, `film_id`, `judul`, `id_studio`, `nama_studio`, `seat`, `jam_tonton`, `jumlah_orang`, `harga`, `total_harga`, `kodebooking`, `status`) VALUES
(1, '2018-06-24', '2018-06-24', 00005, 14, 'The Matrix Reloaded', 1, 'Reguler', 'A1 ', '08:00:00', 1, 35000, 35000, 'BCERIAEU0O6', 'Ready To Watch'),
(2, '2018-06-24', '2018-06-24', 00005, 13, 'The Matrix', 1, 'Reguler', 'F5 ', '08:00:00', 1, 35000, 35000, 'BCERIAUL26H', 'Ready To Watch');

-- --------------------------------------------------------

--
-- Table structure for table `topup`
--

CREATE TABLE `topup` (
  `id` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `id_customer` int(5) UNSIGNED ZEROFILL NOT NULL,
  `uang` int(6) NOT NULL,
  `kode_topup` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topup`
--

INSERT INTO `topup` (`id`, `tanggal`, `id_customer`, `uang`, `kode_topup`, `status`) VALUES
(1, '2018-06-24', 00005, 50000, 'TOPUP1010101', 'Approved'),
(2, '2018-06-24', 00005, 10000, 'VOCN58976KR5M', 'Approved'),
(3, '2018-06-24', 00005, 10000, 'VOCCKPI2JS6QP', 'Approved'),
(4, '2018-06-24', 00005, 100000, 'VOCBVPWQB0U50', 'Approved');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`),
  ADD KEY `id_film` (`id_film`),
  ADD KEY `id_film_2` (`id_film`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `studio`
--
ALTER TABLE `studio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tayang`
--
ALTER TABLE `tayang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_studio` (`id_studio`),
  ADD KEY `id_film` (`id_film`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_studio` (`id_studio`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `topup`
--
ALTER TABLE `topup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tayang`
--
ALTER TABLE `tayang`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `topup`
--
ALTER TABLE `topup`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Constraints for table `tayang`
--
ALTER TABLE `tayang`
  ADD CONSTRAINT `tayang_ibfk_1` FOREIGN KEY (`id_studio`) REFERENCES `studio` (`id`),
  ADD CONSTRAINT `tayang_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`);

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `studio` FOREIGN KEY (`id_studio`) REFERENCES `studio` (`id`),
  ADD CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id_film`),
  ADD CONSTRAINT `tiket_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);

--
-- Constraints for table `topup`
--
ALTER TABLE `topup`
  ADD CONSTRAINT `topup_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
