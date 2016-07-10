//
//  JCOBooks.swift
//  HackerBooks
//
//  Created by Javier Contreras on 26/12/15.
//  Copyright © 2015 Ocon. All rights reserved.
//

import UIKit


class JCOBooks : Equatable{

    //MARK: - Properties
    let title    : String //label
    let author   : [String] //label
    let tags     : [String] //label
    var image    : NSURL //image
    var pdf : NSURL //boton que te lleve a un pdfview
    

    
    //MARK: - Initialization
    init (title : String,
        author  : [String],
        tags    : [String],
        image   : NSURL,
        pdf     : NSURL) {
            self.title = title
            self.author = author
            self.tags = tags
            self.image = image
            self.pdf = pdf
    
    }
    
    
    //MARK: - Proxy
    
    var proxyForComparison : String {
        
        get {
            
           return "A\(title)\(author)\(tags)\(image)\(pdf)"
            
        }
        
    }
   
    var proxyForSorting : String {
    
        
      //return "A\(title)\(author)\(tags)"
        return "A\(title)\(author)\(tags)\(image)\(pdf)"
    
    }
    
    
  


}


//MARK: - Operators

func ==(lhs:JCOBooks, rhs:JCOBooks) -> Bool{

    if (lhs.title.lowercaseString == rhs.title.lowercaseString){
        return true
    }else{
        return false
    }
  
    
}



func <(lhs:JCOBooks, rhs:JCOBooks) -> Bool{


    //return (lhs.proxyForSorting < rhs.proxyForSorting)
    
    return (lhs.proxyForSorting < rhs.proxyForSorting)
    

}




