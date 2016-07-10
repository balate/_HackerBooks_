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
    
    var model: JCOBooks?{
        
        willSet {
        }
        
        didSet{
            
            self.updateUI()
        }
    }
    
    var pdf: NSURL?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUI()

        
    }
    
    func updateUI(){
        
        if let model = self.model{
        
           self.title = model.title
            
            if let viewRead = self.viewRead{
                
                let url = model.pdf
                
                let request = NSURLRequest(URL: url)
                
                viewRead.loadRequest(request)
                
                }
            }
        
        }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
