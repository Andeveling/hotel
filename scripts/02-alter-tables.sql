-- =======================================
-- 02-ALTER-TABLES.SQL
-- File: Alteration of main tables
-- =======================================

-- Add status column to the rooms table
ALTER TABLE rooms
ADD COLUMN status ENUM('Available', 'Reserved') DEFAULT 'Available';

-- Modify the price column in the rooms table to allow higher precision
ALTER TABLE rooms
MODIFY COLUMN price DECIMAL(10,4) NOT NULL;

-- Add foreign key constraints to the reservations table
ALTER TABLE reservations
ADD CONSTRAINT fk_guest_id FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
ADD CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES rooms(room_id);

-- =======================================
-- End of script for table alterations
-- =======================================
