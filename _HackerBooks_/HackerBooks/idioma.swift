//
//  idioma.swift
//  HackerBooks
//
//  Created by Javier Contreras on 15/1/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import Foundation

class Idioma  {
    
    var palabras = ["hola":"hello", "adios":"bye"]
    
    init (palabras : [String: String]){
        
        self.palabras = palabras
        }
}
