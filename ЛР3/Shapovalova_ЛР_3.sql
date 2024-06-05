--Створення бази даних "STUDENTS":
CREATE DATABASE STUDENTS;

--Перейдіть до бази даних "STUDENTS":
USE STUDENTS;

--Створення таблиць
CREATE TABLE PersonalInfo (

StudentID INT PRIMARY KEY,

FirstName NVARCHAR(50),

LastName NVARCHAR(50),

DateOfBirth DATE);


CREATE TABLE AcademicInfo (

RecordID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

Faculty NVARCHAR(100),

Curator NVARCHAR(100),

EnrollmentYear INT);


CREATE TABLE ContactInfo (

ContactID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

Email NVARCHAR(100),

PhoneNumber NVARCHAR(15));

--Операції зі структурою таблиці "ContactInfo".
ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

--Змінення типу даних стовбця
ALTER TABLE AcademicInfo

ALTER COLUMN Faculty NVARCHAR(150);

--Додайте нову таблицю "Extracurricular"
CREATE TABLE Extracurricular (

ActivityID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

ActivityName NVARCHAR(100),

JoinDate DATE);

DROP TABLE Extracurricular;

-- Створення таблиці TEACHER
CREATE DATABASE TEACHER;

-- Видалення таблиці TEACHER 
DROP DATABASE TEACHER;

--Додати три рядки даних до таблиці "PersonalInfo"
USE STUDENTS;

INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)

VALUES

(1, 'Олександр', 'Петров', '2000-05-15'),

(2, 'Марія', 'Іваненко', '2001-03-22'),

(3, 'Василь', 'Коваленко', '1999-10-10');

