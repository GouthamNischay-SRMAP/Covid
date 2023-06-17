-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2023 at 04:22 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `admindetails` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `admindetails` (`username`, `password`) VALUES
('admin', 'password'),
('goutham', 'qawsed');


CREATE TABLE `bookings` (
  `username` varchar(20) NOT NULL,
  `covidno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `bookings` (`username`, `covidno`) VALUES
('goutham', '12345'),
('goutham', '12345'),
('goutham', '12345');

DELIMITER $$
CREATE TRIGGER `update_avail` AFTER INSERT ON `bookings` FOR EACH ROW BEGIN
    UPDATE coviddetails
    SET availableseats = availableseats - 1
    WHERE covidno = NEW.covidno;
END
$$
DELIMITER ;

CREATE TABLE `coviddetails` (
  `covidno` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `destination` varchar(20) NOT NULL,
  `availableseats` int(11) NOT NULL DEFAULT 60
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `coviddetails` (`covidno`, `date`, `time`, `destination`, `availableseats`) VALUES
('12345', '2023-06-17', '19:30:00','Vijaywada', 57),
('1478', '2023-06-23', '06:30:00', 'Banglore', 60);

CREATE TABLE `userdetails` (
  `username` varchar(20) NOT NULL,
  `password` varchar(25) NOT NULL,
  `mailid` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `userdetails` (`username`, `password`, `mailid`) VALUES
('username', 'password', 'username@gmail.com');


ALTER TABLE `admindetails`
  ADD PRIMARY KEY (`username`);


ALTER TABLE `coviddetails`
  ADD PRIMARY KEY (`covidno`);


ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
