//
//  StyleTableViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 14/07/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

import UIKit
import ParseUI
import Parse

class StyleTableViewController: PFQueryTableViewController {

    
    var fatherObject: PFObject!
    
    // Initialise the PFQueryTable tableview
   
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientColor()
    }
    
    
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "Style"
        self.textKey = "name"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        
        
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        var objectID = fatherObject
        //var pointer: AnyObject! = objectID["objectID"]
        var query = PFQuery(className: "Style")
        query.orderByAscending("name")
        query.whereKey("fatherStyle", equalTo:fatherObject)

        return query
    }

    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell =         tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PFTableViewCell
    
        
        // Extract values from the PFObject to display in the table cell
        if let nameEnglish = object?["name"] as? String {
            cell.textLabel?.text = nameEnglish
        }
        
        
        
        
        return cell
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("tableToDetail", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "tableToDetail" {
                if let destination = segue.destinationViewController as? StyleDetailViewController {
                    if let indexPath = tableView.indexPathForSelectedRow()?.row
                    {
                        
                            let row = Int(indexPath)
                            destination.currentObject = (objects?[row] as! PFObject)
                    }
        }
    }
    }
    
}