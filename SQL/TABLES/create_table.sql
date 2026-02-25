/* =====================================================
   HOTEL MANAGEMENT SYSTEM DATABASE
   ===================================================== */

-- Optional: create database
CREATE DATABASE HotelManagement;
USE HotelManagement;


/* =========================
   1. USERS TABLE
   ========================= */
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    user_mobile VARCHAR(15),
    user_email VARCHAR(100),
    user_address VARCHAR(255)
);


/* =========================
   2. ROLES TABLE
   ========================= */
CREATE TABLE Roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(50),
    role_desc VARCHAR(255)
);


/* =========================
   3. LOGIN TABLE
   ========================= */
CREATE TABLE Login (
    login_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    user_password VARCHAR(255),
    role_id INT,
    user_id INT,

    FOREIGN KEY (role_id) REFERENCES Roles(role_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


/* =========================
   4. PERMISSION TABLE
   ========================= */
CREATE TABLE Permission (
    per_id INT PRIMARY KEY,
    per_name VARCHAR(100),
    per_module VARCHAR(100),
    per_role_id INT,

    FOREIGN KEY (per_role_id) REFERENCES Roles(role_id)
);


/* =========================
   5. CUSTOMER TABLE
   ========================= */
CREATE TABLE Customer (
    cus_id INT PRIMARY KEY,
    cus_name VARCHAR(100),
    cus_mobile VARCHAR(15),
    cus_email VARCHAR(100),
    cus_address VARCHAR(255),
    cus_pass VARCHAR(255)
);


/* =========================
   6. HOTEL TABLE
   ========================= */
CREATE TABLE Hotel (
    hotel_id INT PRIMARY KEY,
    hotel_name VARCHAR(100),
    hotel_type VARCHAR(50),
    hotel_desc VARCHAR(255),
    hotel_rent DECIMAL(10,2)
);


/* =========================
   7. BOOKING TABLE
   ========================= */
CREATE TABLE Booking (
    book_id INT PRIMARY KEY,
    book_type VARCHAR(50),
    book_desc VARCHAR(255),
    cus_id INT,
    hotel_id INT,

    FOREIGN KEY (cus_id) REFERENCES Customer(cus_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);


/* =========================
   8. PAYMENTS TABLE
   ========================= */
CREATE TABLE Payments (
    pay_id INT PRIMARY KEY,
    pay_date DATE,
    pay_amt DECIMAL(10,2),
    pay_desc VARCHAR(255),
    pay_cus_id INT,

    FOREIGN KEY (pay_cus_id) REFERENCES Customer(cus_id)
);