-- =======================================
-- 07-INSERT-RESERVATIONS.SQL
-- File: Insert reservations using the stored procedure
-- =======================================

DELIMITER $$

-- Use the stored procedure to register reservations
CALL register_reservation(1, 1, '2024-12-01', 3); -- Guest 1 reserves Room 101 for 3 nights
CALL register_reservation(2, 2, '2024-12-05', 2); -- Guest 2 reserves Room 102 for 2 nights
CALL register_reservation(3, 3, '2024-12-10', 5); -- Guest 3 reserves Presidential Suite for 5 nights

DELIMITER ;

-- =======================================
-- End of script for inserting reservations
-- =======================================
