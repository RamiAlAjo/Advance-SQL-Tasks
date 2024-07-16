-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 11:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schooldb_rami`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `ClassID` int(11) NOT NULL,
  `ClassName` varchar(100) DEFAULT NULL,
  `TeacherID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ClassID`, `ClassName`, `TeacherID`) VALUES
(1, 'Math', 1),
(2, 'Science', 2),
(3, 'History', 3),
(4, 'Art', 4),
(5, 'Music', 5);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `EnrollmentID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `EnrollmentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`EnrollmentID`, `StudentID`, `ClassID`, `EnrollmentDate`) VALUES
(1, 1, 1, '2023-01-10'),
(2, 2, 2, '2023-01-15'),
(4, 4, 4, '2023-01-25'),
(5, 5, 5, '2023-01-30');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `BirthDate`, `Email`) VALUES
(1, 'John', 'Doe', '2005-04-23', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '2006-08-15', 'jane.smith@example.com'),
(3, 'Emily', 'Johnson', '2005-12-05', 'emily.j@example.com'),
(4, 'Michael', 'Brown', '2007-01-22', 'michael.b@example.com'),
(5, 'Sarah', 'Davis', '2006-11-30', 'sarah.d@example.com'),
(6, 'Anna', 'White', '2007-03-14', 'anna.white@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `TeacherID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`TeacherID`, `FirstName`, `LastName`, `Email`) VALUES
(1, 'Robert', 'Williams', 'robert.williams@example.com'),
(2, 'Linda', 'Taylor', 'linda.newemail@example.com'),
(3, 'James', 'Brown', 'james.brown@example.com'),
(4, 'Patricia', 'Johnson', 'patricia.johnson@example.com'),
(5, 'Jennifer', 'Garcia', 'jennifer.garcia@example.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ClassID`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `ClassID` (`ClassID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`TeacherID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`TeacherID`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
