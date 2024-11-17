# Use the official MySQL image
FROM mysql:8.0

# Copy the init.sql and scripts folder to the Docker entrypoint directory
COPY init.sql /docker-entrypoint-initdb.d/
COPY scripts/ /docker-entrypoint-initdb.d/scripts/

# Environment variables for the database
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=hotel_db
ENV MYSQL_USER=hotel_user
ENV MYSQL_PASSWORD=hotel_password

# Expose MySQL's default port
EXPOSE 3306
