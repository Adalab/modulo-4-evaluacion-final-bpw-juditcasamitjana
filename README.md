**F1 Bahrain 2025 API 🏎️**

Se trata de una API RESTful construida con Node.js, Express y MySQL para ver los datos de los pilotos así como los resultados de la carrera de Fórmula 1 en Baréin 2025.

1. **Instalación:**
   Clona el repositorio: git clone https://github.com/tuusuario/f1-bahrain-api.git
   cd f1-bahrain-api

2. **Instala las dependencias:**
   npm install

3. **Crea un archivo .env con tus credenciales de base de datos:**
   DB_HOST=localhost
   DB_USER=tu_usuario
   DB_PASSWORD=tu_contraseña
   DB_NAME=nombre_base_de_datos

4. **Asegúrate de tener la base de datos creada con las tablas:**
   Las puedes encontrar en la carpeta bd/script-evaluacion-final.sql

5. **Inicia el servidor:**
   npm run dev

El servidor se ejecutará en: http://localhost:5001
