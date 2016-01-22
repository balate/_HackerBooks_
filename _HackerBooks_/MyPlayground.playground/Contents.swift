//: Playground - noun: a place where people can play

import Cocoa


//COMO MONTAR UN JSON PARA DESPUES DECODIFICAR

// como si fuera el AnyObjet (valor de las propiedades del JSON por ejemplo ANAKIN seria el value de Nombre)
var ValorNombre = "javi"
var ValorApellido = "Contreras"
var ValorAlias = "Balate"
var ArrayUsuario = ["Nombre" :ValorNombre, "Apellido": ValorApellido, "Alias":ValorAlias] // Juntando todos los VALORES en un DICCIONARIO con CLAVE/VALOR de Creo JSON.

var ValorNombre2 = "alfonso"
var ValorApellido2 = "Ocón"
var ValorAlias2 = "Ratón"
var ArrayUsuario2 = ["Nombre" :ValorNombre2, "Apellido": ValorApellido2, "Alias":ValorAlias2] // Juntando todos los VALORES en un DICCIONARIO con CLAVE/VALOR Creo un objeto de JSON.

// crear un ARRAY de DICCIONARIO. Es decir un Array en el que cada valor sea un diccionario. Así obtengo una lista de objetos en el que cada objeto es un diccionario compuesto de unas propiedades. :)
var ListaMiembros = [ArrayUsuario, ArrayUsuario]


typealias JSONObject = AnyObject                //cualquier objeto (el value de un json)
typealias JSONDictionary = [String:JSONObject]  // un diccionario de String y cualquier objeto
typealias JSONArray = [JSONDictionary]



