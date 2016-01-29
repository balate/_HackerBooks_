//
//  BookDetailViewController.swift
//  HackerBooks
//
//  Created by Javier Contreras on 29/12/15.
//  Copyright © 2015 Ocon. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var model : JCOBooks?
    
    @IBOutlet weak var authorlabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBAction func downloadBook(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = JCOBooks(title: "titulo", authors: ["autor1","autor2"], tags: ["tag1","tag2"], image: NSURL(), pdf: NSURL())
        //me quedo por aqui pendiente de implementar....
        //self.authorlabel.text = self.model?.descAuthor()
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
