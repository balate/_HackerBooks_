//
//  BooksTableViewController.swift
//  HackerBooks
//
//  Created by Javier Contreras on 23/1/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import UIKit

class LibraryViewController: UITableViewController {
    
    //var model : JCOBooks?
    var model : JCOLibrary?
    
    
    // funcion que extrae el JSON de libros
    private func decodeJSON() ->[StrictJCOBook]?{
       
        let result : [StrictJCOBook]? = nil
        
        
        do{

          
            if let url = NSBundle.mainBundle().URLForResource("books_readable.json"), //Obtener la url del ficehero
                data = NSData(contentsOfURL: url), //leemos el fichero JSON a un NSData
                bookArray = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray{   //Parseamos el fichero
                    
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
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
