


### _HackerBooks_
App IOS para leer libros con Iphone desarrollado con tecnolgía Swift

## - Modelo
**JCOBook:** representa un libro.
**JCOLibrary:** representa al conjunto de libros.
**JCOTags:** representa las etiquetas o tematica de los libros.

## - Controladores
**LibraryViewController:** El controlador encargado de mostrar la lista de todos los libros
**BookCellViewCell:** El controlador que se encarga de mostrar una celda personalizada de la lista (LibraryViewController)
**BooksDetailsViewController:** El controlador encargado de mostrar los detalles del libro
**ReadViewController**: El controlador encargado de mostrar el PDF

## - Vista
**TableLibrary.storyboard**: Se encargara de la gestión de las Escenas (vistas) que representa cada controlador (Lista, celda persanalizada, detalle y vista PDF) 

## - Segues
A traves del uso de los segues se realiza la transición entre las Escenas (Vistas)

## - Cuestiones sobre la Practicaç

# como almacenarías la propiedad booleana isFavorite
En mi caso he usado UserDefaults

# Como pasar la informacion desde JCOBooks a libraryViewController?
Se pueden usar Notficaciones o Delegado.
##Extras
#Qué funcionalidades le añaderías antes de subirla a la App Store?
- Añadir un login
- Añadir libros 
- Eliminar libros 
- Añadir tags 
- Añadir y compartir comentarios sobre libros (en la apps y redes sociales)
- Añadir funcionalidad de votación
- funcionalidad recomendar a otros usuarios
- funcionalidad marcar los libros leidos
- Añadir a la vista del libro, editor de texto para añadir marcas, subrayado etc... 










Application eBook Reader for Iphone. The app has been developed in Swift code. 
#Author : Javier Contreras Ocon 
