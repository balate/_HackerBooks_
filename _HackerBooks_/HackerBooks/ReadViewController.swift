//
//  ReadViewController.swift
//  HackerBooks
//
//  Created by Javier Contreras on 9/2/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import UIKit


class ReadViewController: UIViewController {
    
    
    @IBOutlet weak var viewRead: UIWebView!
    
    var book: JCOBooks?
    
    var pdf: NSURL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //corregir siguiente código para no mostrar una web estatica.
        let url = NSURL(string: "https://www.csc.com")
        let request = NSURLRequest(URL: url!)
        viewRead.loadRequest(request)
        
        
        
         // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
