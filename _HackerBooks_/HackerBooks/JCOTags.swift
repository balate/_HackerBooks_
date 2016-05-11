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
    
    convenience init(){
        self.init(name: "hola")
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
    
    if (lhs.name == rhs.name){
        return true
    }else{
        return false
    }
    
    
}



func <(lhs:JCOTags, rhs:JCOTags) -> Bool{
    
    
    return (lhs.proxyForSorting < rhs.proxyForSorting)
    
}






