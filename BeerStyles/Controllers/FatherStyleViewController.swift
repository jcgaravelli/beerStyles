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
    var categoryObject: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientColor()
    }
    
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
        query.whereKey("category", equalTo:categoryObject)
        return query
    }
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PFTableViewCell
        
        
        // Extract values from the PFObject to display in the table cell
        if let nameEnglish = object?["name"] as? String {
            cell.textLabel?.text = nameEnglish
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


        

    func gradientColor(){
        
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor(red:0.92, green:0.87, blue:0.17, alpha:1.0).CGColor,UIColor(red:0.69, green:0.34, blue:0.17, alpha:1.0).CGColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        
        
        
    }
    
    
    
    
}





