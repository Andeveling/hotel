-- =======================================
-- 08-CREATE-EVENT.SQL
-- File: Create event to delete expired reservations
-- =======================================

-- Create an event to delete expired reservations
CREATE EVENT IF NOT EXISTS delete_expired_reservations
ON SCHEDULE EVERY 1 DAY
STARTS '2024-11-18 00:00:00'
DO
    DELETE FROM reservations
    WHERE DATE_ADD(start_date, INTERVAL nights DAY) < CURDATE();

-- =======================================
-- End of script for creating the event
-- =======================================
