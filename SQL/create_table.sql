/* =====================================================
   COMPLETE DATABASE using ER DIAGRAM 
   ===================================================== */
CREATE DATABASE HotelManagement;
USE HotelManagement;

/* =====================================================
   CREATE NEW TABLES (MATCHING ER DIAGRAM)
   ===================================================== */

-- HOTEL
CREATE TABLE Hotel (
    hotel_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(150)
);

-- ROOMS (Hotel HAS Rooms)
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    hotel_id INT,
    FOREIGN KEY (hotel_id)
        REFERENCES Hotel(hotel_id)
        ON DELETE CASCADE
);

-- CUSTOMER
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(15)
);

-- PAYMENT (Customer PAY)
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    payment_method VARCHAR(50),
    amount DECIMAL(10,2),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
        ON DELETE CASCADE
);

-- RESERVATION (Customer RESERVES Rooms)
CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY,
    customer_id INT,
    room_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
        ON DELETE CASCADE,
    FOREIGN KEY (room_id)
        REFERENCES Rooms(room_id)
        ON DELETE CASCADE
);


/* =====================================================
   VERIFY
   ===================================================== */

SHOW TABLES;

+---------------------------+
| Tables_in_hotelmanagement |
+---------------------------+
| customer                  |
| hotel                     |
| payment                   |
| reservation               |
| rooms                     |
+---------------------------+
   
DESC Hotel;

+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| hotel_id | int(11)      | NO   | PRI | NULL    |       |
| name     | varchar(100) | YES  |     | NULL    |       |
| location | varchar(150) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
   
DESC Rooms;

+----------+---------+------+-----+---------+-------+
| Field    | Type    | Null | Key | Default | Extra |
+----------+---------+------+-----+---------+-------+
| room_id  | int(11) | NO   | PRI | NULL    |       |
| hotel_id | int(11) | YES  | MUL | NULL    |       |
+----------+---------+------+-----+---------+-------+
   
DESC Customer;

+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | int(11)      | NO   | PRI | NULL    |       |
| name        | varchar(100) | YES  |     | NULL    |       |
| address     | varchar(255) | YES  |     | NULL    |       |
| phone       | varchar(15)  | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
   
DESC Payment;

+----------------+---------------+------+-----+---------+-------+
| Field          | Type          | Null | Key | Default | Extra |
+----------------+---------------+------+-----+---------+-------+
| payment_id     | int(11)       | NO   | PRI | NULL    |       |
| payment_method | varchar(50)   | YES  |     | NULL    |       |
| amount         | decimal(10,2) | YES  |     | NULL    |       |
| customer_id    | int(11)       | YES  | MUL | NULL    |       |
+----------------+---------------+------+-----+---------+-------+
   
DESC Reservation;

+----------------+---------+------+-----+---------+-------+
| Field          | Type    | Null | Key | Default | Extra |
+----------------+---------+------+-----+---------+-------+
| reservation_id | int(11) | NO   | PRI | NULL    |       |
| customer_id    | int(11) | YES  | MUL | NULL    |       |
| room_id        | int(11) | YES  | MUL | NULL    |       |
+----------------+---------+------+-----+---------+-------+

