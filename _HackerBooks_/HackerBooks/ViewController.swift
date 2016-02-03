//
//  traductorViewController.swift
//  HackerBooks
//
//  Created by Javier Contreras on 17/1/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import Foundation


import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var TextView: UITextView!
    
    var traductor = String ()
    
    override func viewDidLoad() {

        TextView.text = traductor
        
        super.viewDidLoad()

    }
}