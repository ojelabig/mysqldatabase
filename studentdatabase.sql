CREATE TABLE IF NOT EXISTS Address (
  Address_ID int NOT NULL COMMENT 'Address ID',
  Address1 varchar(50) NOT NULL COMMENT 'Address',
  City varchar(50) NOT NULL COMMENT 'City',
  Postal_Code varchar(50) NOT NULL COMMENT 'Postal Code',
  Staff_ID int NOT NULL COMMENT 'Staff ID',
  Student_ID int NOT NULL COMMENT 'Student ID',
  Emergency ID int NOT NULL COMMENT 'Emergency ID',
  PRIMARY KEY (Address_ID)
)

CREATE TABLE IF NOT EXISTS Class (
  Class_ID int NOT NULL COMMENT 'Class ID',
  Class_Name varchar(50) NOT NULL COMMENT 'Class Name',
  Grade_ID int NOT NULL COMMENT 'Grade ID',
  Classroom_ID int NOT NULL COMMENT 'Classroom ID',
  Staff_ID int NOT NULL COMMENT 'Staff ID',
  PRIMARY KEY (Class_ID)
) 

CREATE TABLE IF NOT EXISTS Emergency (
  Emergency_ID int NOT NULL COMMENT 'Emergency ID',
  First_Name varchar(50) NOT NULL COMMENT 'First Name',
  Last_Name varchar(50) NOT NULL COMMENT 'Last Name',
  Address varchar(50) NOT NULL COMMENT 'Address',
  City varchar(50) NOT NULL COMMENT 'City',
  Postal_Code varchar(50) NOT NULL COMMENT 'Postal Code',
  Student_ID int NOT NULL COMMENT 'Student ID',
  PRIMARY KEY (Emergency_ID)
) 


CREATE TABLE IF NOT EXISTS Enrollment (
  Enrolment_ID int NOT NULL COMMENT 'Enrolment ID',
  Year year NOT NULL COMMENT 'Academic Year',
  Term varchar(50) NOT NULL COMMENT 'Term',
  Enrol_Date date NOT NULL COMMENT 'Enrolment Date',
  Student_ID int NOT NULL COMMENT 'Student ID',
  Midterm_Grade varchar(10) NOT NULL COMMENT 'Midterm Grade',
  Final_Grade varchar(10) NOT NULL COMMENT 'Final Grade',
  PRIMARY KEY (Enrolment_ID)
) 

CREATE TABLE IF NOT EXISTS Staff (
  Staff_ID int NOT NULL COMMENT 'Staff ID',
  First_Name varchar(50) NOT NULL COMMENT 'First Name',
  Last_Name varchar(50) NOT NULL COMMENT 'Last Name',
  Class_ID int NOT NULL COMMENT 'Class ID',
  Email_Address varchar(50) NOT NULL COMMENT 'Email Address',
  Phone_No bigint NOT NULL DEFAULT '0' COMMENT 'Phone Number',
  DOB date NOT NULL DEFAULT '0000-00-00' COMMENT 'Date of Birth',
  PRIMARY KEY (Staff_ID),
  KEY FK_Staff_Class (Class_ID),
  CONSTRAINT FK_Staff_Class FOREIGN KEY (Class_ID) REFERENCES Class (Class_ID)
) 

CREATE TABLE IF NOT EXISTS Student (
  First_Name varchar(50) DEFAULT NULL COMMENT 'First Name',
  Last_Name varchar(50) DEFAULT NULL COMMENT 'Last Name',
  DOB date DEFAULT NULL COMMENT 'Date of Birth',
  Email varchar(50) DEFAULT NULL COMMENT 'Email Address',
  Phone varchar(50) DEFAULT NULL COMMENT 'Phone Number',
  Gender varchar(50) DEFAULT NULL COMMENT 'Gender',
  Address varchar(50) DEFAULT NULL COMMENT 'Address',
  City varchar(50) DEFAULT NULL COMMENT 'City',
  Postal_Code varchar(50) DEFAULT NULL COMMENT 'Postal Code',
  Enroll_Date date DEFAULT NULL COMMENT 'Enrolled Date',
  Mid_Grade varchar(50) DEFAULT NULL COMMENT 'Mid Term Grade',
  Final_Grade varchar(50) DEFAULT NULL COMMENT 'Final Grade'
) 

CREATE TABLE IF NOT EXISTS `Student Details` (
  Student_ID int NOT NULL COMMENT 'Student ID',
  First_Name varchar(50) NOT NULL COMMENT 'First Name',
  Last_Name varchar(50) NOT NULL COMMENT 'Last Name',
  DOB date NOT NULL COMMENT 'Date of Birth',
  Class_ID int NOT NULL COMMENT 'Class ID',
  Email_Address varchar(50) NOT NULL COMMENT 'Email Address',
  Phone_No bigint NOT NULL COMMENT 'Phone Number',
  Gender varchar(50) NOT NULL COMMENT 'Gender',
  Address_ID int NOT NULL COMMENT 'Address ID',
  PRIMARY KEY (Student_ID),
  UNIQUE KEY Email_Address (Email_Address),
  KEY FK_Student Details_Class (Class_ID),
  KEY FK_Student Details_Address (Address_ID),
  CONSTRAINT FK_Student Details_Address FOREIGN KEY (Address_ID) REFERENCES Address (Address_ID),
  CONSTRAINT FK_Student Details_Class FOREIGN KEY (Class_ID) REFERENCES Class (Class_ID)
) 

ALTER TABLE Address
  KEY FK_Student Details1 (Student_ID),
  KEY FK_Address_Staff2 (Staff_ID),
  KEY FK_Address_Emergency3 (Emergency ID),
  CONSTRAINT FK_Student Details1 FOREIGN KEY (Student_ID) REFERENCES Student Details (Student_ID),
  CONSTRAINT FK_Address_Emergency2 FOREIGN KEY (Emergency ID) REFERENCES Emergency (Emergency_ID),
  CONSTRAINT FK_Address_Staff3 FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID);
  
ALTER table Class
 KEY FK_Staff (Staff_ID),
  CONSTRAINT FK_Staff FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID);
  
ALTER table Emergency
  KEY FK_Emergency_Student Details (Student_ID),
  CONSTRAINT FK_Emergency_Student Details FOREIGN KEY (Student_ID) REFERENCES Student Details (Student_ID);
  
ALTER TABLE Enrollment
  KEY FK_Enrollment_Student Details (Student_ID),
  CONSTRAINT FK_Enrollment_Student Details FOREIGN KEY (Student_ID) REFERENCES Student Details (Student_ID);
  
ALTER TABLE Staff
  KEY FK_Staff_Class (Class_ID),
  CONSTRAINT FK_Staff_Class FOREIGN KEY (Class_ID) REFERENCES Class (Class_ID);
  
ALTER TABLE `Student Details`
  KEY FK_Student Details_Address (Address_ID),
  CONSTRAINT FK_Student Details_Address FOREIGN KEY (Address_ID) REFERENCES Address (Address_ID),
  CONSTRAINT FK_Student Details_Class FOREIGN KEY (Class_ID) REFERENCES Class (Class_ID)
