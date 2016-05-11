//
//  BooksTableViewController.swift
//  HackerBooks
//
//  Created by Javier Contreras on 23/1/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import UIKit

class LibraryViewController: UITableViewController {
    
    var model : JCOLibrary?
    
    
    // funcion que extrae el JSON de libros
    private func decodeJSON() ->[StrictJCOBook]?{
       
        let result : [StrictJCOBook]? = nil
        
        
        do{
        
            //Obtener la url del ficehero
            //leemos el fichero JSON a un NSData, esto puede salir mal
            //Parseamos el fichero
            if let url = NSBundle.mainBundle().URLForResource("books_readable.json"),
                dataUrl = NSData(contentsOfURL: url),
                bookArray = try NSJSONSerialization.JSONObjectWithData(dataUrl, options: .AllowFragments) as? JSONArray{
                    
                    
                    //todo es cojonudo!
                    return decode(JCOBooks: bookArray)
            }
            
            
        }catch{
        
            print("Error al parsear el JSON")
            
            
        }
        
        return result
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = " HackerBooks List "
        
        //crear modelo
        if let books = decodeJSON(){
         
            model = JCOLibrary(books: books)
           
        
        }else{
        
            fatalError("Se jodio y no se pudo parsear")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
       return (model?.library.keys.count)!
    
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        let tag = self.model?.tagAtIndex(section)!
        
        return (self.model?.booksForTag(tag!.name)!.count)!
     
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.model?.tagAtIndex(section)!.name
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BookId", forIndexPath: indexPath) as! BookCellViewCell
        
        let tag = self.model?.tagAtIndex(indexPath.section)!
        let book = self.model?.booksForTag(tag!.name)! [indexPath.row]
        
        //cell.textLabel?.text = book!.title
        //cell.detailTextLabel?.text = book?.author.joinWithSeparator(",")
        
        cell.titleCell.text = book!.title
        cell.authorCell.text = book?.author.joinWithSeparator(", ")
                
        
        
       if let urlImg = NSData(contentsOfURL: (book?.image)!){
            cell.imageCell.image = UIImage(data: urlImg)
            
        }
        
       
    
      

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "BookDetails") {
        
            let viewDetails: BooksDetailsViewController = segue.destinationViewController as! BooksDetailsViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow
            
            let tag = model?.tagAtIndex(indexPath!.section)
            let book = self.model?.booksForTag(tag!.name)! [indexPath!.row]
            
            
         
            
            viewDetails.book = book
            
            
        }
        
       

    }
    

}
