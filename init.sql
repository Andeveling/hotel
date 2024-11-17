-- init.sql
-- Ensure the event scheduler is enabled
SET GLOBAL event_scheduler = ON;

SOURCE /docker-entrypoint-initdb.d/scripts/01-create-tables.sql;
SOURCE /docker-entrypoint-initdb.d/scripts/02-alter-tables.sql;
SOURCE /docker-entrypoint-initdb.d/scripts/03-insert-data.sql;
SOURCE /docker-entrypoint-initdb.d/scripts/04-create-view.sql;
SOURCE /docker-entrypoint-initdb.d/scripts/05-create-stored-procedure.sql;
SOURCE /docker-entrypoint-initdb.d/scripts/06-create-triggers.sql;
SOURCE /docker-entrypoint-initdb.d/scripts/07-insert-reservations.sql;
SOURCE /docker-entrypoint-initdb.d/scripts/08-create-event.sql;
