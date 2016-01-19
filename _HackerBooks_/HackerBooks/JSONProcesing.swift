//
//  JSONProcesing.swift
//  HackerBooks
//
//  Created by Javier Contreras on 19/1/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import UIKit


/*
{
"authors": "Marijn Haverbeke ",
"image_url": "http://hackershelf.com/media/cache/e5/27/e527064919530802af898a4798318ab9.jpg",
"pdf_url": "http://eloquentjavascript.net/Eloquent_JavaScript.pdf",
"tags": "javascript",
"title": "Eloquent JavaScript"
}
*/


//MARK: - Alias

typealias JSONObject = AnyObject                //cualquier objeto (el value de un json)
typealias JSONDictionary = [String:JSONObject]  // un diccionario de String y cualquier objeto
typealias JSONArray = [JSONDictionary]          // Array de Diccionario



//MARK: - Errors 

enum JSONProcessingErrors : ErrorType{

    case WrongURLFormatForJSONResource
    case ResourcePointedByURLNotReachable
    case JSONParsingError
    case WrongJSONFormat

}


//MARK: - Decoding 

