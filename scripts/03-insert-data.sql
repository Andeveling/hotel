-- =======================================
-- 03-INSERT-DATA.SQL
-- File: Insert initial data
-- =======================================

-- Insert data into the rooms table
INSERT INTO rooms (room_number, type, price)
VALUES 
    ('Room 101', 'Standard', 50.00),
    ('Room 102', 'Standard', 55.00),
    ('Room 103', 'Standard', 60.00),
    ('Room 104', 'Standard', 65.00),
    ('Room 201', 'Standard', 70.00),
    ('Room 202', 'Standard', 75.00),
    ('Room 203', 'Standard', 80.00),
    ('Room 204', 'Standard', 85.00),
    ('Presidential Suite', 'Suite', 200.00);

-- Insert data into the guests table
INSERT INTO guests (name, email)
VALUES 
    ('Ana Gomez', 'ana.gomez@email.com'),
    ('Luis Rodriguez', 'luis.rodriguez@email.com'),
    ('Maria Torres', 'maria.torres@email.com'),
    ('Pedro Sanchez', 'pedro.sanchez@email.com'),
    ('Juan Perez', 'juan.perez@email.com'),
    ('Carlos Perez', 'carlos.perez@email.com');

-- =======================================
-- End of script for inserting data
-- =======================================
