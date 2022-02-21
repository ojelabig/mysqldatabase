-- --------------------------------------------------------
-- Host:                         database-1.c0pfhbcn1n0c.us-east-1.rds.amazonaws.com
-- Server version:               8.0.23 - Source distribution
-- Server OS:                    Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table Ojelabi.Address
CREATE TABLE IF NOT EXISTS `Address` (
  `Address_ID` int NOT NULL COMMENT 'Address ID',
  `Address1` varchar(50) NOT NULL COMMENT 'Address',
  `City` varchar(50) NOT NULL COMMENT 'City',
  `Postal_Code` varchar(50) NOT NULL COMMENT 'Postal Code',
  `Staff_ID` int NOT NULL COMMENT 'Staff ID',
  `Student_ID` int NOT NULL COMMENT 'Student ID',
  `Emergency ID` int NOT NULL COMMENT 'Emergency ID',
  PRIMARY KEY (`Address_ID`),
  KEY `FK__Student Details` (`Student_ID`),
  KEY `FK_Address_Staff` (`Staff_ID`),
  KEY `FK_Address_Emergency` (`Emergency ID`),
  CONSTRAINT `FK__Student Details` FOREIGN KEY (`Student_ID`) REFERENCES `Student Details` (`Student_ID`),
  CONSTRAINT `FK_Address_Emergency` FOREIGN KEY (`Emergency ID`) REFERENCES `Emergency` (`Emergency_ID`),
  CONSTRAINT `FK_Address_Staff` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Ojelabi.Address: ~0 rows (approximately)
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;

-- Dumping structure for table Ojelabi.Class
CREATE TABLE IF NOT EXISTS `Class` (
  `Class_ID` int NOT NULL COMMENT 'Class ID',
  `Class_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Class Name',
  `Grade_ID` int NOT NULL COMMENT 'Grade ID',
  `Classroom_ID` int NOT NULL COMMENT 'Classroom ID',
  `Staff_ID` int NOT NULL COMMENT 'Staff ID',
  PRIMARY KEY (`Class_ID`),
  KEY `FK__Staff` (`Staff_ID`),
  CONSTRAINT `FK__Staff` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Ojelabi.Class: ~0 rows (approximately)
/*!40000 ALTER TABLE `Class` DISABLE KEYS */;
/*!40000 ALTER TABLE `Class` ENABLE KEYS */;

-- Dumping structure for table Ojelabi.Emergency
CREATE TABLE IF NOT EXISTS `Emergency` (
  `Emergency_ID` int NOT NULL COMMENT 'Emergency ID',
  `First_Name` varchar(50) NOT NULL COMMENT 'First Name',
  `Last_Name` varchar(50) NOT NULL COMMENT 'Last Name',
  `Address` varchar(50) NOT NULL COMMENT 'Address',
  `City` varchar(50) NOT NULL COMMENT 'City',
  `Postal_Code` varchar(50) NOT NULL COMMENT 'Postal Code',
  `Student_ID` int NOT NULL COMMENT 'Student ID',
  PRIMARY KEY (`Emergency_ID`),
  KEY `FK_Emergency_Student Details` (`Student_ID`),
  CONSTRAINT `FK_Emergency_Student Details` FOREIGN KEY (`Student_ID`) REFERENCES `Student Details` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Ojelabi.Emergency: ~0 rows (approximately)
/*!40000 ALTER TABLE `Emergency` DISABLE KEYS */;
/*!40000 ALTER TABLE `Emergency` ENABLE KEYS */;

-- Dumping structure for table Ojelabi.Enrollment
CREATE TABLE IF NOT EXISTS `Enrollment` (
  `Enrolment_ID` int NOT NULL COMMENT 'Enrolment ID',
  `Year` year NOT NULL COMMENT 'Academic Year',
  `Term` varchar(50) NOT NULL COMMENT 'Term',
  `Enrol_Date` date NOT NULL COMMENT 'Enrolment Date',
  `Student_ID` int NOT NULL COMMENT 'Student ID',
  `Midterm_Grade` varchar(10) NOT NULL COMMENT 'Midterm Grade',
  `Final_Grade` varchar(10) NOT NULL COMMENT 'Final Grade',
  PRIMARY KEY (`Enrolment_ID`),
  KEY `FK_Enrollment_Student Details` (`Student_ID`),
  CONSTRAINT `FK_Enrollment_Student Details` FOREIGN KEY (`Student_ID`) REFERENCES `Student Details` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Ojelabi.Enrollment: ~0 rows (approximately)
/*!40000 ALTER TABLE `Enrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Enrollment` ENABLE KEYS */;

-- Dumping structure for table Ojelabi.Staff
CREATE TABLE IF NOT EXISTS `Staff` (
  `Staff_ID` int NOT NULL COMMENT 'Staff ID',
  `First_Name` varchar(50) NOT NULL COMMENT 'First Name',
  `Last_Name` varchar(50) NOT NULL COMMENT 'Last Name',
  `Class_ID` int NOT NULL COMMENT 'Class ID',
  `Email_Address` varchar(50) NOT NULL COMMENT 'Email Address',
  `Phone_No` bigint NOT NULL DEFAULT '0' COMMENT 'Phone Number',
  `DOB` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Date of Birth',
  PRIMARY KEY (`Staff_ID`),
  KEY `FK_Staff_Class` (`Class_ID`),
  CONSTRAINT `FK_Staff_Class` FOREIGN KEY (`Class_ID`) REFERENCES `Class` (`Class_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Ojelabi.Staff: ~0 rows (approximately)
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;

-- Dumping structure for table Ojelabi.Student
CREATE TABLE IF NOT EXISTS `Student` (
  `First_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'First Name',
  `Last_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Last Name',
  `DOB` date DEFAULT NULL COMMENT 'Date of Birth',
  `Email` varchar(50) DEFAULT NULL COMMENT 'Email Address',
  `Phone` varchar(50) DEFAULT NULL COMMENT 'Phone Number',
  `Gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Gender',
  `Address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Address',
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'City',
  `Postal_Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Postal Code',
  `Enroll_Date` date DEFAULT NULL COMMENT 'Enrolled Date',
  `Mid_Grade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Mid Term Grade',
  `Final_Grade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Final Grade'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Ojelabi.Student: ~0 rows (approximately)
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;

-- Dumping structure for table Ojelabi.Student Details
CREATE TABLE IF NOT EXISTS `Student Details` (
  `Student_ID` int NOT NULL COMMENT 'Student ID',
  `First_Name` varchar(50) NOT NULL COMMENT 'First Name',
  `Last_Name` varchar(50) NOT NULL COMMENT 'Last Name',
  `DOB` date NOT NULL COMMENT 'Date of Birth',
  `Class_ID` int NOT NULL COMMENT 'Class ID',
  `Email_Address` varchar(50) NOT NULL COMMENT 'Email Address',
  `Phone_No` bigint NOT NULL COMMENT 'Phone Number',
  `Gender` varchar(50) NOT NULL COMMENT 'Gender',
  `Address_ID` int NOT NULL COMMENT 'Address ID',
  PRIMARY KEY (`Student_ID`),
  UNIQUE KEY `Email_Address` (`Email_Address`),
  KEY `FK_Student Details_Class` (`Class_ID`),
  KEY `FK_Student Details_Address` (`Address_ID`),
  CONSTRAINT `FK_Student Details_Address` FOREIGN KEY (`Address_ID`) REFERENCES `Address` (`Address_ID`),
  CONSTRAINT `FK_Student Details_Class` FOREIGN KEY (`Class_ID`) REFERENCES `Class` (`Class_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Ojelabi.Student Details: ~0 rows (approximately)
/*!40000 ALTER TABLE `Student Details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student Details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
