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
    
    override func viewWillAppear(animated: Bool) {
        animateTable()
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
    
<<<<<<< HEAD
    
    func gradientColor(){
        
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor(red:1.0, green:0.85, blue:0.20, alpha:1.0).CGColor,UIColor(red:0.80, green:0.59, blue:0.00, alpha:1.0).CGColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
    }
    
    
    func animateTable() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells()
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as! UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as! UITableViewCell
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: nil, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }

    
    
    
=======
>>>>>>> 0fb76477be4925ae12cd04a2d57b686b0316b9ae
}