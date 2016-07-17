//
//  JCOTags.swift
//  HackerBooks
//
//  Created by Javier Contreras on 29/1/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import Foundation


class JCOTags: Equatable,Hashable {
    
    var name : String
    

    
    

    
    //MARK: - Hashable
    var hashValue : Int{
        
        return name.hashValue
        
    }
    

    //MARK: - init 
    init( name : String){
    
        self.name = name
    }
    
    convenience init(){
        self.init(name: "")
    }
    
   
    //Normalize Name
    func normalizedName() -> String {
    
         return self.name.capitalizedString
    }
    
    
    //MARK: - Proxies
    var proxyForComparison : String{
        
        get{
            return "\(name)"
        }
    }
    
    var proxyForSorting : String{
        
        get{
            return "\(name)"
        }
    }
    
}


//MARK: - Operators

func ==(lhs:JCOTags, rhs:JCOTags) -> Bool{
    
    // 1er caso: son el mismo objeto
    guard !(lhs === rhs) else{
        return true
    }
    
    // 2do caso: tienen clases distintas
    guard lhs.dynamicType == rhs.dynamicType else{
        return false
    }
    
    // Caso genérico
    return (lhs.proxyForComparison == rhs.proxyForComparison)

}



func <(lhs:JCOTags, rhs:JCOTags) -> Bool{
    
    if (lhs.name == "Favourites"){
        return true
    }
    
    if (rhs.name == "Favourites") {
        return false
    }
    return (lhs.proxyForSorting < rhs.proxyForSorting)
    
}



