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
    var image    : NSData //image
    var pdf : NSURL //boton que te lleve a un pdfview
    
    //MARK: - Initialization
    init (title : String,
        author  : [String],
        tags    : [String],
        image   : NSData,
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
            
            return "\(title)\(author)\(tags)\(pdf)"
            
        }
        
    }
    
    var proxyForSorting : String {
    
        return "\(title)\(author)\(tags)"
    
    }
    
    
    /*
    //función para devolver un string bonito de los autores
    func descAuthor()-> String{
        
        var aux : String = ""
        if([self.author .count] == 1){
            return self.author[0]
            
        }else{
            aux = StringLiteralType("%@", self.author[0])
            for element  in self.author{
                
                aux = StringLiteralType(stringInterpolation: "%@ , %@", aux, element)
                
            }
            
            return aux
            
        }
    }

    */
   /*
    //función para devolver un string bonito de los tags
    func descTags()-> String{
        
        var auxTag : String = ""
        if([self.tags .count] == 1){
            return self.tags[0]
            
        }else{
            auxTag = StringLiteralType("%@", self.tags[0])
            for element  in self.tags{
                
                auxTag = StringLiteralType(stringInterpolation: "%@ , %@", auxTag, element)
                
            }
            
            return auxTag
            
        }
    }



}
*/


}

//MARK: - Operators

func ==(lhs:JCOBooks, rhs:JCOBooks) -> Bool{

    //compared if the same object
    guard !(lhs == rhs) else{
    
        return true
    }
    
    //compared if the same class
    guard  lhs.dynamicType == rhs.dynamicType else{
    
        return false
        
    }
    
    //case generic
    return  (lhs.proxyForComparison == rhs.proxyForComparison)
    
    
}



func <(lhs:JCOBooks, rhs:JCOBooks) -> Bool{


    return (lhs.proxyForSorting < rhs.proxyForSorting)

}





//función para devolver un string bonito de los autores
extension JCOBooks: CustomStringConvertible{
    var description: String{
        get{
            if title != "" {
                return "<\(self.dynamicType): \(title)>"
            }else{
                return "<\(self.dynamicType)>"
            }
        }
    }
}


/*
func == (lhs : JCOBooks, rhs: JCOBooks) -> Bool{

    return lhs.title.lowercaseString == rhs.title.lowercaseString

}*/