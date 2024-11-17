-- =======================================
-- 05-CREATE-STORED-PROCEDURE.SQL
-- File: Create stored procedure for reservations
-- =======================================

DELIMITER $$

-- Stored procedure to register a reservation
CREATE PROCEDURE register_reservation (
    IN p_guest_id INT,
    IN p_room_id INT,
    IN p_start_date DATE,
    IN p_nights INT
)
BEGIN
    DECLARE room_status VARCHAR(20);
    
    -- Retrieve the status of the room
    SELECT status INTO room_status FROM rooms WHERE room_id = p_room_id;

    -- Check if the room is already reserved
    IF room_status = 'Reserved' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The room is already reserved.';
    ELSE
        -- Insert the reservation into the reservations table
        INSERT INTO reservations (guest_id, room_id, start_date, nights)
        VALUES (p_guest_id, p_room_id, p_start_date, p_nights);

        -- Update the room status to 'Reserved'
        UPDATE rooms
        SET status = 'Reserved'
        WHERE room_id = p_room_id;
    END IF;
END$$

DELIMITER ;

-- =======================================
-- End of script for creating the stored procedure
-- =======================================
