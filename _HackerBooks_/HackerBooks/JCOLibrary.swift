//
//  JCOLibrary.swift
//  HackerBooks
//
//  Created by Javier Contreras on 27/12/15.
//  Copyright © 2015 Ocon. All rights reserved.
//

import UIKit



class JCOLibrary {
    
    //MARK: - Properties
    static let urlHttps = "https://t.co/K9ziV0z3SJ"
    static let urlLocal = "JCOBooks"
    var library : [JCOTags : [JCOBooks]]
    
    var countTags: Int{
        get{
            return self.library.keys.count
        }
    }
    
    //MARK: - Initialization
    init (arrayOfBooks books:[JCOBooks]){
        
        //del array de libros tenemos que pasar a un diccionario {tag(clave) -> array de libros(valor)}
        self.library = [ JCOTags : [JCOBooks]]()
        
        for book in books{
            for tagInBook in book.tags{
                
                if (self.library.keys.contains(JCOTags(name: tagInBook))){
                    self.library[JCOTags(name: tagInBook)]?.append(book)
                }else{
                    self.library[JCOTags(name: tagInBook)] = [book]
                }
                
            }
            
        }
        
    }
    
   

    
    
    
    //MARK - Methods
    
    
    //function array of books instaces about theme. The book can content one o more theme if not return nil
    func booksForTag (tag: String)->[JCOBooks]?{
        
        
        var books : [JCOBooks]
        
        //si existe el tag que nos piden devolvemos todos sus libros sino que le peten
        if (self.library.keys.contains(JCOTags(name: tag))){
            
            books = self.library[JCOTags(name: tag)]!
            
        }else{
            
            return nil
        }
        
        books.sortInPlace({ (s1: JCOBooks, s2: JCOBooks) -> Bool in
            
            return s1.title.lowercaseString > s2.title.lowercaseString
            
        })
        
        return books
    }
    
    
    //function for book in the position 'index' by a tag
    func bookAtIndex(Index: Int, Tag: String)->JCOBooks?{
        
        if let booksForTag = self.booksForTag(Tag){
            return booksForTag [Index]
        }
        
        return nil
    }
    
    //function for tag in the position 'index'
    func tagAtIndex(Index: Int)->JCOTags?{
        
        return tagSorted()[Index]
        
    }
    
    //function sorted tags
    func tagSorted()->[JCOTags]{
        
        var keys : [JCOTags]
        keys = Array (self.library.keys)
        keys.sortInPlace({(s1 : JCOTags, s2 : JCOTags) -> Bool in
            
            
            if (s1.name.lowercaseString == "Favorite".lowercaseString){
                return true
            }else if (s2.name.lowercaseString == "Favorite".lowercaseString){
                return false
            }else{
                return s1 > s2
            }
            
            }
        )
        
        return keys
        
    }
    
}

