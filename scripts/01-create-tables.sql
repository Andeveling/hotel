-- =======================================
-- 01-CREATE-TABLES.SQL
-- File: Creation of main tables
-- =======================================

-- Drop tables if they already exist (to avoid conflicts on repeated executions)
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS guests;
DROP TABLE IF EXISTS rooms;

-- Create the rooms table
CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(50) NOT NULL,
    type VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Create the guests table
CREATE TABLE guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

-- Create the reservations table
CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    start_date DATE NOT NULL,
    nights INT NOT NULL
);

-- =======================================
-- End of script for table creation
-- =======================================
