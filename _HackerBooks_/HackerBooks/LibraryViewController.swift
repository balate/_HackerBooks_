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
                data = NSData(contentsOfURL: url),
                bookArray = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray{
                    
                    
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        title = "Books List"
        //crear modelo
        if let books = decodeJSON(){
         // model = JCOLibrary(arrayOfBooks: books, tags: nil, bookCount: nil)
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
        if let countTags = model?.countTags{
            return countTags
        }
        
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if let tag = model?.tagAtIndex(section){
        
            return model!.bookCountForTag(tag.name)
        }
        
        return 0
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LibraryCell", forIndexPath: indexPath)

        //cell.textLabel?.text = model?.tagAtIndex(indexPath.section)
        
        cell.textLabel?.text = "ola q ases"
        
        

        return cell
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
