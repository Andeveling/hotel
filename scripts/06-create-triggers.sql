-- =======================================
-- 06-CREATE-TRIGGERS.SQL
-- File: Create triggers for the system
-- =======================================

DELIMITER $$

-- Trigger: After a reservation is deleted, update the room status
CREATE TRIGGER after_reservation_delete
AFTER DELETE ON reservations
FOR EACH ROW
BEGIN
    -- Update the room status to 'Available' when a reservation is deleted
    UPDATE rooms
    SET status = 'Available'
    WHERE room_id = OLD.room_id;
END$$

-- Trigger: After a room status is updated, log the change
CREATE TRIGGER after_room_status_update
AFTER UPDATE ON rooms
FOR EACH ROW
BEGIN
    -- Log the change only if the room status has been modified
    IF OLD.status != NEW.status THEN
        INSERT INTO room_status_audit (room_id, old_status, new_status)
        VALUES (NEW.room_id, OLD.status, NEW.status);
    END IF;
END$$

-- Trigger: Prevent inserting reservations with a start date in the past
CREATE TRIGGER before_reservation_insert
BEFORE INSERT ON reservations
FOR EACH ROW
BEGIN
    -- Validate that the start date is in the future
    IF NEW.start_date < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The start date must be greater than the current date.';
    END IF;
END$$

DELIMITER ;

-- =======================================
-- End of script for creating triggers
-- =======================================
