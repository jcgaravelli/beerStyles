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


//criação da tela com os estilos

class StyleTableViewController: PFQueryTableViewController {

    //criação de um objeto o parse
    var fatherObject: PFObject!
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientColor()
        
        //TAMANHO DA LINHA
        self.tableView.rowHeight = 60.0
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
         animateTable()
    }
    
    override func objectsDidLoad(error: NSError?) {
        super.objectsDidLoad(error)
        animateTable()
    }


    
    
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // CONFIGURAÇAO DA PFQueryTableView
        self.parseClassName = "Style"
        self.textKey = "name"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        
        
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        var objectID = fatherObject
        var query = PFQuery(className: "Style")
        query.orderByAscending("name")
        query.whereKey("fatherStyle", equalTo:fatherObject)

        return query
    }

    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell =  tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PFTableViewCell
        
    
        
        // Extract values from the PFObject to display in the table cell
        if let name = object?["name"] as? String {
            cell.textLabel?.text = name
            cell.textLabel?.font = UIFont(name: "Chunkfive", size: 20)
           
            
        }
        
        
        
        
        return cell
    }
    
    
    //segue para a página de perfil
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
    
    
    

    //animação das tabelas
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

    
    
    
}