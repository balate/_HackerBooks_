//
//  JCOTags.swift
//  HackerBooks
//
//  Created by Javier Contreras on 29/1/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import Foundation


class JCOTags: Equatable, Comparable,Hashable {
    
    var name : String

    
    //MARK: - Hashable
    var hashValue : Int{
        
        return name.hashValue
        
    }
    

    //MARK: - init 
    init( name : String){
    
        self.name = name
    }
    
    //Normalize Name
    func normalizedName() -> String {
    
         return self.name.capitalizedString
    }
    
    //MARK: - Proxies
    var proxyForComparison : String {
    
        get {
        
            return "\(name)"
        }
    }
    
    var proxyForSorting : String {
    
        get {
        
            return "\(name)"
        }
    }
    
}


//MARK: - Operators
func ==(lhs:JCOTags, rhs:JCOTags) -> Bool{
    
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



func <(lhs:JCOTags, rhs:JCOTags) -> Bool{
    
    
    return (lhs.proxyForSorting < rhs.proxyForSorting)
    
}




