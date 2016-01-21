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


//MARK: - Keys
enum JSONKeys : String {

    case title = "title"
    case authors = "authors"
    case tags = "tags"
    case image_url = "image_url"
    case pdf_url = "pdf_url"
    
    
}

//MARK: - Structs
struct StrictJCOBook {
    
    let title   : String
    let authors : NSArray
    let tags    : NSArray
    let image   : NSURL
    let pdf     : NSURL
    
}


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

func decode(JCOBooks json: JSONDictionary ) throws -> StrictJCOBook {

    // simulamos que todo funciona OK y no hay nil
    guard let urlPdf = json[JSONKeys.pdf_url.rawValue] as? String,
                pdf_url  = NSURL(string: urlPdf) else {
    
        throw JSONProcessingErrors.WrongURLFormatForJSONResource
    }
    
    
    guard let urlImage = json[JSONKeys.pdf_url.rawValue] as? String,
        image_url  = NSURL(string: urlImage) else {
            
            throw JSONProcessingErrors.WrongURLFormatForJSONResource
    }
    

    guard let authors = json[JSONKeys.authors.rawValue] as? NSArray else {
    
    throw JSONProcessingErrors.WrongJSONFormat
    }

    guard let tag = json[JSONKeys.tags.rawValue] as? NSArray else {
            
            throw JSONProcessingErrors.WrongJSONFormat
    }
    
    guard let title = json[JSONKeys.title.rawValue]as? String else {
    
        throw JSONProcessingErrors.WrongJSONFormat
    }


    
    //Crear el libro
    return StrictJCOBook.init(title: title, authors: authors, tags: tag, image: image_url, pdf: pdf_url)
   
}




extension JCOBooks {
    
    //Init que acepta los parametros empaquetados en un StrictJCOBook
    convenience init (StrictJCOBook c: StrictJCOBook){
        
        //Llamar al inicializador designado pasandole el StrictJCOBook
        self.init(
            title : c.title,
            author  : c.authors as! [String] , // tengo mis dudas si esto tirará
            tags    : c.tags as! [String],
            image   : c.image,
            pdf     : c.pdf)
        
    }
    
}






