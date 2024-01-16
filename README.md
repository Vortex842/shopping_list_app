# Shopping List App
Anota los productos de tu compra de forma limpia. Puedes visualizarlos ya sea si estan tachados o esten pendientes a comprar. Ademas podras borrar completamente la lista o solamente los productos que esten tachados de la misma.


## TODO
* Agragar tema light / dark
    * Font Montserrat
    * Colores:
        * Page Background: FFFFFF / 1D1B20
        * Cards Color: F3EDF7 / 211F26
        * Button Color: ECE6F0 / 2B2930
        * Edit Foreground: 0B4B01
        * Edit Background: 59FF56
        * Delete Foreground: 780000
        * Delete Background: FF5656
        * Select Foreground: 430078
        * Select Background: BB77FF
        * Foreground Primary Color (in light mode): 1D1B20
        * Foreground Primary Color (in dark mode): D2C2EB
        * Icon Foreground: 21005D
* Implementar
    * Clean Architecture
    * Principios SOLID
* Class *Product*
    * name
    * amount
    * price
* *List< Product >*
    * Add
    * Delete
    * Filter
* Al agregar o eliminar un producto, esto debera tener una persistencia de datos al cerrar por completo la aplicacion.
* Para estas acciones tambien que se muestre el modal correspondiente.
* Agregar funcionalidadad de multi seleccion de productos
* Agregar un Side Menu contranformaciones
* Seleccionar varios productos o toda la lista
* Agregar seleccion de lenguaje español/english