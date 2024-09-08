-- create_db.sql
USE master;
GO

-- Create DVD Rental database
CREATE DATABASE [dvd_rental];
GO

-- Switch to DVD Rental database
USE [dvd_rental];
GO

-- Create sample tables
CREATE TABLE customer (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    email NVARCHAR(100)
);
GO

CREATE TABLE film (
    film_id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(255),
    description TEXT,
    release_year INT
);
GO
