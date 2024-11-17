-- =======================================
-- 04-CREATE-VIEW.SQL
-- File: Create reservations view
-- =======================================

-- Create a view to display reservation details
CREATE VIEW reservations_view AS
SELECT 
    guests.name AS guest_name,
    rooms.room_number AS room_number,
    rooms.type AS room_type,
    reservations.start_date,
    reservations.nights,
    (rooms.price * reservations.nights) AS total_cost
FROM reservations
JOIN guests ON reservations.guest_id = guests.guest_id
JOIN rooms ON reservations.room_id = rooms.room_id;

-- =======================================
-- End of script for creating the view
-- =======================================
