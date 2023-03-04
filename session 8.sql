CREATE DATABASE courses
GO
DROP DATABASE courses
GO
USE courses
GO

CREATE TABLE Student(
SID INT PRIMARY KEY NOT NULL,
S_FName varchar(50)NOT NULL,
S_LName varchar(50) NOT NULL,
UNIQUE(SID),
);
GO

CREATE TABLE Course(
CID INT PRIMARY KEY NOT NULL,
C_Name VARCHAR(30) NOT NULL,
);
GO

CREATE TABLE Course_Grades (
CGID INT NOT NULL,
Semester CHAR(4) NOT NULL,
CID INT NOT NULL,
SID INT NOT NULL,
Grade CHAR(2) NOT NULL,
PRIMARY KEY (CGID),
CONSTRAINT FK_CID FOREIGN KEY (SID) REFERENCES Student(SID),
CONSTRAINT FK_SID FOREIGN KEY (CID) REFERENCES Course(CID),

UNIQUE(CGID),
);
GO

use courses
go
drop table Student

insert into Student 
values  (12345,'Chris','Rock'),
		(23456,'Chris','Farley'),
		(34567,'David','Spade'),
		(45678,'Liz','Lemon'),
		(56789,'Jack','Donaghy')

insert into Course
values (101001,'Intro to Computers'),
	   (101002,'Programming'),
	   (101003,'Databases'),
	   (101004,'Websites'),
	   (101005,'IS Management')

insert into Course_Grades
values (2010101,'SP10',101005,34567,'D+'),
	   (2010308,'FA10',101005,34567,'A-'),
	   (2010309,'FA10',101001,45678,'B+'),
	   (2011308,'FA11',101003,23456,'B-'),
	   (2012206,'SU12',101002,56789,'A+');
	   
--3
ALTER TABLE Student ALTER COLUMN S_FName varchar(30)
GO
--4
ALTER TABLE Course ADD Faculty_LName varchar(30)NOT NULL
--5
 UPDATE Course SET Faculty_LName='Potter',C_Name='Intro to Wizardry' WHERE CID=101001;
 --6
 sp_rename 'Course.C_Name', 'Course_Name', 'COLUMN'
 Go
 --7

 --8
 DROP TABLE Student
 GO
 --9
 TRUNCATE TABLE Course
 --10 
 ALTER TABLE Course_Grades 
 DROP CONSTRAINT CID,SID