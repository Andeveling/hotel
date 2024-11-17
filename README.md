# Sistema de Gestión de Reservas de Hotel

Este proyecto implementa un sistema de gestión de reservas para un hotel utilizando MySQL como base de datos y Docker para la contenerización. El sistema permite gestionar habitaciones, huéspedes, reservas y eventos, y está diseñado para facilitar la creación y administración de reservas de manera eficiente.

## Descripción

El sistema incluye las siguientes características:

- **Gestión de habitaciones**: Información sobre las habitaciones, su tipo, precio y estado (disponible o reservada).
- **Gestión de huéspedes**: Información sobre los huéspedes, como nombre y correo electrónico.
- **Reservas**: Permite realizar, registrar y consultar reservas.
- **Procedimientos almacenados y triggers**: Para automatizar procesos y garantizar la integridad de los datos.
- **Eventos programados**: Para la eliminación de reservas expiradas automáticamente.
- **Vista**: Para visualizar las reservas y sus costos.

## Tecnologías utilizadas

- **MySQL**: Base de datos relacional.
- **Docker**: Para contenerizar el entorno de base de datos.
- **SQL**: Para la creación de tablas, procedimientos, vistas, triggers y eventos.

## Instrucciones de uso

### Requisitos

- Docker instalado en tu máquina.
- Acceso a la terminal o consola.

### Iniciar el proyecto con Docker

1. **Clona el repositorio**:
   
   ```bash
   git clone git@github.com:Andeveling/hotel.git
   cd hotel
   ```

2. **Construye la imagen de Docker**:

   Desde la carpeta raíz del proyecto, ejecuta el siguiente comando:

   ```bash
   docker build -t hotel-db .
   ```

3. **Inicia el contenedor de MySQL**:

   Asegúrate de que el puerto 3306 no esté en uso, luego ejecuta:

   ```bash
   docker run -d -p 3306:3306 --name hotel_db_container hotel-db
   ```

   El contenedor de MySQL se iniciará y la base de datos se configurará automáticamente con las tablas, procedimientos almacenados, triggers y eventos definidos en los scripts de inicialización.

4. **Accede a la base de datos**:

   Puedes conectarte al contenedor de MySQL utilizando MySQL Workbench, DBeaver o cualquier otro cliente MySQL. La conexión sería con las siguientes credenciales:

   - **Host**: `localhost`
   - **Puerto**: `3306`
   - **Usuario**: `hotel_user`
   - **Contraseña**: `hotel_password`
   - **Base de datos**: `hotel_db`

### Estructura de archivos

- `Dockerfile`: Archivo para crear la imagen de Docker con MySQL.
- `init.sql`: Script de inicialización que carga todos los scripts de configuración.
- `scripts/01-create-tables.sql`: Crea las tablas necesarias en la base de datos.
- `scripts/02-alter-tables.sql`: Modifica las tablas para agregar nuevas columnas o restricciones.
- `scripts/03-insert-data.sql`: Inserta datos iniciales en las tablas.
- `scripts/04-create-view.sql`: Crea una vista para mostrar las reservas y sus costos.
- `scripts/05-create-stored-procedure.sql`: Crea procedimientos almacenados para registrar reservas.
- `scripts/06-create-triggers.sql`: Crea triggers para automatizar procesos, como actualizar el estado de las habitaciones.
- `scripts/07-insert-reservations.sql`: Inserta algunas reservas iniciales en el sistema.
- `scripts/08-create-event.sql`: Crea un evento programado para eliminar las reservas expiradas.

## Características adicionales

### Eventos

El sistema incluye un **evento programado** que se ejecuta todos los días y elimina las reservas expiradas (reservas cuya fecha de finalización es anterior a la fecha actual).

### Triggers

Los triggers están diseñados para automatizar procesos importantes en la base de datos, como actualizar el estado de las habitaciones cuando se elimina una reserva o cuando se realiza una actualización en las habitaciones.

### Procedimientos almacenados

Se utiliza un **procedimiento almacenado** para registrar reservas de forma eficiente, asegurando que las habitaciones no estén reservadas al momento de intentar hacer una nueva reserva.

## Contribuciones

Si deseas contribuir a este proyecto, puedes seguir estos pasos:

1. Haz un fork del proyecto.
2. Crea una nueva rama para tus cambios (`git checkout -b feature/nueva-funcionalidad`).
3. Haz los cambios necesarios y confirma los mismos (`git commit -am 'Agregada nueva funcionalidad'`).
4. Haz push a la rama (`git push origin feature/nueva-funcionalidad`).
5. Abre un pull request en GitHub.

## Licencia

Este proyecto está bajo la Licencia MIT - consulta el archivo [LICENSE](LICENSE) para más detalles.

## Contacto

Para cualquier consulta o sugerencia, no dudes en contactar al autor del proyecto: [Andres Parra] - [andeveling@gmail.com].
