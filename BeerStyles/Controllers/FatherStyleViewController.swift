//
//  FatherStyleViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 14/07/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

import UIKit
import Foundation
import ParseUI
import Parse


class FatherStyleViewController: PFQueryTableViewController {
    
    
    
    
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "FatherStyle"
        self.textKey = "name"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "FatherStyle")
        
        query.orderByAscending("name")
        return query
    }
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let nameEnglish = object?["name"] as? String {
            cell?.textLabel?.text = nameEnglish
        }
   
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
        
        var row = Int(indexPath.row)
       
        
        performSegueWithIdentifier("fatherToSon", sender: objects?[row])
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "fatherToSon" {
            if let destination = segue.destinationViewController as? StyleTableViewController {

                    destination.fatherObject = (sender as! PFObject)
                }
            }
    
    }
//

        

    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        println("break1")
//        if segue.identifier == "fatherToSon" {
//             println(segue.identifier)
//            
//                    }var destination = segue.destinationViewController as! PFQueryCollectionViewController
//            println("break3")
//                if let indexPath = tableView.indexPathForSelectedRow()?.row
//                {
//                    println("break4")
//                    let row = Int(indexPath)
//                   
//                    fatherObject = (objects?[row] as! PFObject)
//                }
//            }


    
    
    
}





