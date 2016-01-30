//
//  FoundationExtension.swift
//  HackerBooks
//
//  Created by Javier Contreras on 20/1/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import Foundation


extension NSBundle {
    
    func URLForResource (fileName: String)->NSURL?{
        
        let tokens = fileName.componentsSeparatedByString(".")
        
        return self.URLForResource(tokens.first, withExtension: tokens.last)
        
        
    }
}