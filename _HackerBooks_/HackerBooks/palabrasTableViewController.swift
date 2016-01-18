//
//  palabrasTableViewController.swift
//  HackerBooks
//
//  Created by Javier Contreras on 15/1/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import UIKit

class palabrasTableViewController: UITableViewController {


    var words = ["Spanish": ["Hola", "Adios"], "English": ["Hello", "Bye"]]
    
    struct Objects {
        
        var sectionName : String!
        var sectionObjects : [String]!
    }
    
    var objectArray = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (key, value) in words {
            print("\(key) -> \(value)")
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray[section].sectionObjects.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellHola", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        cell.textLabel?.text = objectArray[indexPath.section].sectionObjects[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return objectArray[section].sectionName
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath :  NSIndexPath = self.tableView.indexPathForSelectedRow!
        
        let DestViewController = segue.destinationViewController as! ViewController
        
        let objectWords = objectArray[indexPath.section].sectionObjects[indexPath.row]
        DestViewController.detail = objectWords
        
        //DestViewController.detail =  objectArray[indexPath.section].sectionObjects[indexPath.row]
    }

}
   
   /*
    
    //var model : Idioma?
     var hola : [String] = ["hola","adios"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return hola.count
      
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hola.count
    
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellHola", forIndexPath: indexPath)
        // Configure the cell...
       // var hola : String = "hola"
      
        
        cell.textLabel?.text = hola[indexPath.row]
        

        return cell
    }
 

    
    
    
    
    
    

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


} 
*/
*/
