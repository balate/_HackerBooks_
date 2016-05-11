//
//  BooksDetailsViewController.swift
//  HackerBooks
//
//  Created by Javier Contreras on 3/2/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import UIKit

class BooksDetailsViewController: UIViewController {

   
    
    @IBOutlet weak var titleDetails: UILabel!
    
    @IBOutlet weak var authorDetail: UILabel!
    
    @IBOutlet weak var tagDetails: UILabel!

    @IBOutlet weak var imageDetails: UIImageView!
    
    
    var book : JCOBooks?{
        
        
        
    
    willSet {
        }
    
        didSet{
        
            self.updateUI()
 
            }

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.updateUI()
    
    }

  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func updateUI(){
        
        
        
    if let book = self.book {
    if let titleDetails  = self.titleDetails,
            tagDetails   = self.tagDetails,
            authorDetail = self.authorDetail,
            imageDetails = self.imageDetails {
    
    self.title = book.title
    titleDetails.text = book.title
    authorDetail.text = book.author.joinWithSeparator(", ")
    tagDetails.text = book.tags.joinWithSeparator(", ")
    
   let urlImg = book.image
            
        if let imageUrl = NSData(contentsOfURL: urlImg)
            {
                imageDetails.image = UIImage(data: imageUrl)
                
                }
                
                
            
            }
        }
    }
    
  
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "readPDF" {
        
            let readVC = segue.destinationViewController as? ReadViewController
           
            readVC?.model = book
        }
        
    }


}
