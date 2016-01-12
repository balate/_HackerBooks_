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
    let books   : [JCOBooks]
    var tags    : [String]
    var bookCount: Int{
        
        get {
            let count: Int = self.books.count
            return count
        }
    }
    
    
    //MARK: - Initialization
    init (arrayOfBooks books:[JCOBooks], tags: [String], bookCount: Int){
        
        self.books = books
        self.tags = tags
        self.bookCount
        
    }
    
    
    //MARK - Methods
    
    //function number books for theme. Note: if not exist tag, return 0
    func bookCountForTag (tag: String)->Int {
        
        if (self.boookForTag(tag)?.count == nil){
            return 0
        }else{
            return (self.boookForTag(tag)?.count)!
        }
    }
    
    
    //function array of books instaces about theme. The book can content one o more theme if not return nil
    func boookForTag (tag: String)->[JCOBooks]?{
        
        var books : [JCOBooks] = []
        
        for element in self.books{
            if (element.tags.contains(tag)){
                books.append(element)
                }
        }
        
        books.sortInPlace({ (s1: JCOBooks, s2: JCOBooks) -> Bool in
            
            return s1.title.lowercaseString > s2.title.lowercaseString
            
        })
        
        return books
    }
    
    
    //function for book in the position 'index' by a tag
    func bookAtIndex(Index: Int, Tag: String)->JCOBooks?{
        
        if let booksForTag = self.boookForTag(Tag){
            return booksForTag [Index]
        }
        
        return nil
    }
    
    //function for tag in the position 'index'
    func tagAtIndex(Index: Int)->String?{
        
        return self.tags [Index]
        
    }
    
    //function sorted tags
    func tagSorted()->[String]{
        
        return self.tags.sort(sortTags)
    }
    
    // comparable tags
    func sortTags(s1 : String, _ s2 : String) -> Bool{
        
        
        if (s1.lowercaseString == "Favorite".lowercaseString){
            return true
        }else if (s2.lowercaseString == "Favorite".lowercaseString){
            return false
        }else{
            return s1 > s2
        }
        
    }
    
    
}

