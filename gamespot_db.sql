-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2021 at 12:52 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamespot_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `CCNumber` varchar(16) DEFAULT NULL,
  `Balance` double DEFAULT 50
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `UserName`, `Email`, `Password`, `CCNumber`, `Balance`) VALUES
(1, 'cotne2', 'cotne2@gmail.com', '123456', '1596384569125478', 15),
(2, 'giorgi', 'giorgi@gmail.com', 'giorgi123', '1234567891234567', 43),
(3, 'cotne123', 'cotne@gmail.com', 'cotne123', '1596384569125412', 46);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `Quantity` tinyint(4) DEFAULT 1,
  `ProductID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `Quantity`, `ProductID`, `CustomerID`) VALUES
(3, 1, 3, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Price` double(5,2) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Video` varchar(45) DEFAULT NULL,
  `Platform` enum('Windows','Linux') DEFAULT NULL,
  `Cover` varchar(55) DEFAULT NULL,
  `Image1` varchar(55) DEFAULT NULL,
  `Image2` varchar(55) DEFAULT NULL,
  `Image3` varchar(55) DEFAULT NULL,
  `Image4` varchar(55) DEFAULT NULL,
  `ExeFile` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `Title`, `Price`, `Description`, `Video`, `Platform`, `Cover`, `Image1`, `Image2`, `Image3`, `Image4`, `ExeFile`) VALUES
(2, 'City Racing', 5.00, 'City Racing is a hugely popular sandbox GTA style car racing game. This game gives you the freedom to explore the city in any way you want. Your can participate in illegal street races, win money, make spectacular jumping stunts, upgrade your car to beat your racing opponents or you can just work as a taxi driver. The gameplay is easy, you just need quick reflexes and a good eye to avoid the police cars and make some money. Download this full version racing game now and try to survive in the big city.', NULL, 'Windows', '/resources/images/city-racing-1.jpg', '/resources/images/city-racing-1.jpg', '/resources/images/city-racing-2.jpg', '/resources/images/city-racing-3.jpg', '/resources/images/city-racing-4.jpg', 'http://www.gametop.com/download-free-games/city-racing/download.html'),
(3, 'Alien Shooter', 6.00, 'The endless darkness and the somber, long passages of a military complex have become the abode of evil, as thousands of blood-thirsty creatures fill its offices, storehouses and mysterious laboratories. Your mission is simple: clear the base at all costs. You will be provided with explosives to help you gain access to the teleports from where thousands of pitiless creatures pour. A stationary gun will aid in the defense of the area. You have been granted access to the most advanced weapons technology money can buy. As you earn your pay, you can equip yourself with additional weapons in the arming area and biomechanical implants that will make your fighting abilities super human. The alien invasion has begun, we have one chance, and that is to stop them cold in their staging area. Do not allow them escape this facility, you are our last hope. The fate of humanity now depends on you! Download free game today and dive into the middle of a war in Alien Shooter, a fast-paced action game.', NULL, 'Windows', '/resources/images/city-racing-1.jpg', '', '', '', '', 'http://www.gametop.com/download-free-games/alien-shooter/download.html');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
