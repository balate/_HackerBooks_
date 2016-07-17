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
            //if let url = NSBundle.mainBundle().URLForResource("books_readable.json"), //URLLocal para ir más rápido
            if let url = NSURL(string: JCOLibrary.urlLibrary),
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
        let ud : NSUserDefaults =  NSUserDefaults.standardUserDefaults()
        let book1s : [StrictJCOBook]
        if let books = decodeJSON(){
            book1s = books
            model = JCOLibrary(books: books)
            
            
        }else{
            
            fatalError("Se jodio y no se pudo parsear")
        }
        
        if let f = ud.objectForKey("Favourites"){
            if !(model?.library.keys.contains(JCOTags(name: "Favourites")))!{
                
                var booksFavourite : [JCOBooks] = Array()
                
                for bf in ud.objectForKey("Favourites") as! [String]{
                    for b in book1s {
                        if b.title == bf{
                            for tag in b.tags {
                                var booksfortag : [JCOBooks] = (model?.booksForTag(tag))!
                                var i : NSInteger = 0
                                for b2 in booksfortag {
                                    if b2.title == b.title {
                                        var booksfinal : [JCOBooks] = (model?.booksForTag(tag))!
                                        booksfinal.removeAtIndex(i)
                                        var libromodificado : JCOBooks = JCOBooks(StrictJCOBook: b)
                                        libromodificado.tags.append("Favourite")
                                        libromodificado.isFavourite = true
                                        booksfinal.append(libromodificado)
                                        self.model?.library[JCOTags(name: tag)] = booksfinal                                    }
                                    i += 1
                                }
                                
                            }
                            var libromodificado2 : JCOBooks = JCOBooks(StrictJCOBook: b)
                            libromodificado2.tags.append("Favourites")
                            libromodificado2.isFavourite = true
                            booksFavourite.append(libromodificado2)
                        }
                    }
                }
                self.model!.library[JCOTags(name: "Favourites")] = booksFavourite
            }
            
        }


    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //crear modelo
        let ud : NSUserDefaults =  NSUserDefaults.standardUserDefaults()
        let book1s : [StrictJCOBook]
        if let books = decodeJSON(){
            book1s = books
            model = JCOLibrary(books: books)
            
            
        }else{
            
            fatalError("Se jodio y no se pudo parsear")
        }
        
        if let f = ud.objectForKey("Favourites"){
            if !(model?.library.keys.contains(JCOTags(name: "Favourites")))!{
                
                var booksFavourite : [JCOBooks] = Array()
                
                
                for bf in ud.objectForKey("Favourites") as! [String]{
                    for b in book1s {
                        if b.title == bf{
                            for tag in b.tags {
                                var booksfortag : [JCOBooks] = (model?.booksForTag(tag))!
                                var i : NSInteger = 0
                                for b2 in booksfortag {
                                    if b2.title == b.title {
                                        var booksfinal : [JCOBooks] = (model?.booksForTag(tag))!
                                        booksfinal.removeAtIndex(i)
                                        var libromodificado : JCOBooks = JCOBooks(StrictJCOBook: b)
                                        libromodificado.tags.append("Favourite")
                                        libromodificado.isFavourite = true
                                        booksfinal.append(libromodificado)
                                        self.model?.library[JCOTags(name: tag)] = booksfinal                                    }
                                    i += 1
                                }
                                
                            }
                            var libromodificado2 : JCOBooks = JCOBooks(StrictJCOBook: b)
                            libromodificado2.tags.append("Favourites")
                            libromodificado2.isFavourite = true
                            booksFavourite.append(libromodificado2)
                        }
                    }
                }
                self.model!.library[JCOTags(name: "Favourites")] = booksFavourite
            }
            
        }
        
        self.tableView.reloadData()

        
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
        
       
        
        cell.titleCell.text = book!.title
        cell.authorCell.text = book?.author.joinWithSeparator(", ")
                
        if (book?.isFavourite)! {
            cell.backgroundColor = UIColor.greenColor()
        }else{
            cell.backgroundColor = UIColor.whiteColor()
        }
        
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
