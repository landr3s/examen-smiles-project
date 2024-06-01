# Universidad Politécnica Salesiana

## Nombre: Andrés Guamán
## Materia: Plataformas Web

---

## Proyecto: Smiles

### Descripción del Proyecto

El proyecto "Smiles" es una aplicación web desarrollada como parte del curso de Plataformas Web en la Universidad Politécnica Salesiana. El objetivo del proyecto es proporcionar una plataforma en línea para gestionar productos de una tienda fitness, con roles diferenciados para clientes, vendedores y administradores.

#### Funcionalidades Principales

- **Cliente:**
  - Navegar y visualizar productos disponibles.
  - Agregar productos al carrito de compras.
  - Realizar compras y gestionar su carrito.

- **Vendedor:**
  - Añadir nuevos productos al catálogo.
  - Actualizar el stock de productos existentes.

- **Administrador:**
  - Gestionar (editar/eliminar) todos los productos en la plataforma.
  - Acceso a funcionalidades avanzadas de administración.

### Tecnologías Utilizadas

- **Backend:**
  - Java Servlet
  - JDBC para la conexión a la base de datos

- **Frontend:**
  - JSP (JavaServer Pages)
  - HTML, CSS, JavaScript (jQuery)

- **Base de Datos:**
  - PostgreSQL

---

### Iniciar el Proyecto

Para iniciar el proyecto "Smiles" después de clonar el repositorio, sigue los pasos a continuación:

#### Prerrequisitos

- Tener instalado Java (JDK 8 o superior).
- Tener instalado un servidor de aplicaciones compatible con Java Servlets (por ejemplo, Apache Tomcat).
- Tener instalado PostgreSQL para gestionar la base de datos.
- Tener configurado Maven para gestionar las dependencias del proyecto.

#### Clonar el Repositorio

1. Abre tu terminal o línea de comandos.
2. Ejecuta el siguiente comando para clonar el repositorio:

## Configurar la Base de Datos

1. Crea una nueva base de datos en PostgreSQL llamada `gojos`.

2. Ejecuta los siguientes scripts SQL para crear las tablas necesarias y agregar algunos datos iniciales:

    ```sql
    CREATE TABLE users (
        id SERIAL PRIMARY KEY,
        username VARCHAR(50) NOT NULL,
        password VARCHAR(100) NOT NULL,
        role VARCHAR(20) NOT NULL
    );

    INSERT INTO users (username, password, role) VALUES
    ('admin', 'admin_password', 'admin'),
    ('client', 'client_password', 'client'),
    ('seller', 'seller_password', 'seller');

    CREATE TABLE products (
        id SERIAL PRIMARY KEY,
        title VARCHAR(100) NOT NULL,
        description TEXT NOT NULL,
        quantity INT NOT NULL,
        price DECIMAL(10, 2) NOT NULL
    );

    INSERT INTO products (title, description, quantity, price) VALUES
    ('Proteína Whey', 'Proteína Whey para el crecimiento muscular.', 50, 29.99),
    ('Cinturón de Levantamiento de Pesas', 'Cinturón de cuero resistente para levantamiento de pesas.', 30, 19.99),
    ('Mancuernas Ajustables', 'Mancuernas ajustables de 5 a 50 libras.', 20, 99.99);
    ```

## Configurar el Proyecto en Eclipse

1. Abre Eclipse y selecciona `File > Import > Maven > Existing Maven Projects`.

2. Navega hasta el directorio donde clonaste el repositorio y selecciona la carpeta del proyecto.

3. Configura el servidor Apache Tomcat:
    - Ve a `Window > Preferences > Server > Runtime Environments` y añade tu instalación de Tomcat.

4. Configura la conexión a la base de datos en el archivo `db.properties` ubicado en la carpeta `src/main/resources`.

    ```properties
    db.url=jdbc:postgresql://localhost:5432/gojos
    db.username=tu_usuario
    db.password=tu_contraseña
    ```

## Ejecutar el Proyecto

1. En Eclipse, haz clic derecho sobre el proyecto y selecciona `Run As > Run on Server`.

2. Selecciona tu servidor Apache Tomcat configurado y haz clic en `Finish`.

Tu aplicación debería estar en funcionamiento y accesible en `http://localhost:8080/examen-smiles`.

---

¡Gracias por revisar el proyecto "Smiles"! Si tienes alguna pregunta o sugerencia, no dudes en contactarme.

