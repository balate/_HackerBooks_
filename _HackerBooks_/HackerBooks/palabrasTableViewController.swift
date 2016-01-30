//
//  palabrasTableViewController.swift
//  HackerBooks
//
//  Created by Javier Contreras on 15/1/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import UIKit

class palabrasTableViewController: UITableViewController {


    //var words = ["Spanish": ["Hola", "Adios"], "English": ["Hello", "Bye"]]
    
    var words = [ " Hola " : " Hello ", " Adios " : " Bye " , " Uno " : " One ", " Azul " : " Blue "]
    
    struct Objects {
        
        var sectionName : String!
        var sectionObjects : String!
    }
    
    var objectArray = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "El Cutre Traductor"
        
        for (key, value) in words {
        
            print("\(key)\(value)")
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellHola", forIndexPath: indexPath) 
        
        // Configure the cell...
        cell.textLabel?.text = objectArray[indexPath.row].sectionName
     
        
        
        return cell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath :  NSIndexPath = self.tableView.indexPathForSelectedRow!
        
        let DestViewController = segue.destinationViewController as! ViewController
        
        let translateView = objectArray[indexPath.row].sectionObjects
        
        
        
        DestViewController.traductor = translateView
        
        
    }


}
   
   
