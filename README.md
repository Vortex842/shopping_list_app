# Shopping List App

La **Shopping List App** te permite organizar tus compras de manera clara. Puedes visualizar y gestionar tus productos, ya sea marcándolos como comprados o manteniéndolos en tu lista pendiente. Además, tienes la opción de borrar la lista completa o solo los productos marcados.

### TODO
* [ ] Additional:
  * [ ] Order of ascendant/descendant products for name
  * [ ] Filter for all/checked/unchecked
  * [ ] Pop sound on tap button for his checking
  * [ ] History shops
* [ ] Major:
  * [ ] Error messages for Text Fields
  * [ ] Focus on Text Field 'nameController'
  * [ ] Functionality of press enter on Text Field
  * [ ] Checking button with onTap
  * [ ] ClipRRect for TextFields
* [✅] Fix:
  * [✅] Colors of confirm/cancel buttons in dark mode
  * [✅] Corners of button section for color bg 

## Funcionalidades Principales
* **Implementación**
  * **Clean Architecture**
  * Principios **SOLID**

* **Clase Product**
  * Atributos:
    * name
    * amount
    * price

* **Lista de Productos**
  * Métodos:
    * Agregar
    * Eliminar
    * Filtrar

* **Persistencia de Datos**
  * Los productos se guardarán automáticamente al agregar o eliminar, asegurando que los datos persistan al cerrar la aplicación.

* **Interfaz de Usuario**
  * Modal: Se mostrará un modal correspondiente al agregar o eliminar un producto.

* **Funcionalidad de Selección Múltiple**
  * Posibilidad de seleccionar varios productos a la vez.

* **Side Menu**
  * Agregar un menú lateral con transformaciones visuales.

* **Selección de Idioma**
  * Permite a los usuarios elegir entre español e inglés.

## Pasos para Ejecutar la Aplicación

Clona el repositorio.
   ```bash
   git clone https://github.com/Vortex842/shopping_list_app
   ```

## Contribuciones
¡Las contribuciones son bienvenidas! Si deseas contribuir al proyecto, sigue estos pasos:

1. Haz un fork del proyecto.
2. Crea una rama para tus cambios.
3. Realiza las modificaciones.
4. Envía un pull request.