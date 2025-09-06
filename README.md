# To Do List

Aplicación móvil Flutter que permita a los usuarios crear una lista de tareas por realizar.
Visualizando información detallada de las tareas, todo ello obtenido a través de la base de datos local Isar y el uso del gestor de estado provider, utilizando buenas prácticas con una arquitectura de codo limpio.
## Instalación

**version de flutter 3.24.5**

1. Clona el repositorio:
   ```sh
   git clone https://github.com/duvandaza/ToDoList.git
2. Abre en tu IDE de preferencia
3. Navega a la ruta del proyecto
4. Instala las dependencias con el comando
    ```sh
   flutter pub get
5. Correr el proyecto con el comando 
    ```sh
    Flutter run
## Arquitectura Limpia

En este proyecto se utilizó arquitectura limpia basada en una serie de capas conformadas por dominio (entidades), lógica de negocio y presentación ubicadas en la carpeta de infraestructura y presentación, donde se alojan las vistas, widgets, proveedores.

![Arquitectura](assets/arquitectura.png)

### Dominio (domain)
es la capa definida por el negocio, es decir, no debe estar atada a ningún concepto técnico y dentro de ella vemos las entidades y los casos de uso.

### Infrastructure (Logica de negocio)
Esta capa maneja la lógica de negocio que debe llevar cada caso de uso de los modelos de dominio, es decir si tengo una clase dominio que debe llevar 3 métodos, entonces se debe seguir estas reglas como mínimo, a su vez se encuentra el manejo de la implementación de los repositorios, es decir es el puente entre la capa de dominio y la capa de presentación.

### Presentation (presentacion)
Esta capa maneja las vistas y la estructura de los widgets del el aplicativo móvil. Para este proyecto se utilizó la organización basada en carpetas por cada módulo donde van alojando las vistas (screen), los proveedores de servicios (providers), controladores (controller) para el flujo de servicio. Además, se tiene una carpeta de widgets donde se alojan los widget que se utilizan en diferentes vistas implementando la reutilización.


