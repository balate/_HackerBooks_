//
//  BooksDetailsViewController.swift
//  HackerBooks
//
//  Created by Javier Contreras on 3/2/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import UIKit

class BooksDetailsViewController: UIViewController {

    var books : [JCOBooks] = []
    
    var titleDetail = ""
    var authorsDetail = [String]()
    var tagsDetail = [String]()
    var imageDetail = UIImage()
    var pdfDetail = String()
    
    
    

    
    @IBOutlet weak var titleD: UILabel!{
    
        didSet{
        
            self.titleD.text = titleDetail
        }
    }
    
    
    @IBOutlet weak var AuthorD: UILabel!{
    
        didSet{
        
            self.AuthorD.text = authorsDetail.joinWithSeparator(", ")
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
