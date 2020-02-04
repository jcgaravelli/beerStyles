//
//  FatherStyleViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 14/07/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

import UIKit
import Foundation
import MediaPlayer


class FatherStyleViewController: UITableViewController {
//    var categoryObject: PFObject!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        OperationQueue.main.addOperation {
//            self.playVideo()
//        }
//        
//        //gradientColor()
//        self.tableView.rowHeight = 60.0
//        self.tableView.tableFooterView = UIView()
//        
//    }
//    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        // animateTable()
//    }
//    
//    override func objectsDidLoad(_ error: Error?) {
//        super.objectsDidLoad(error)
//      //  animateTable()
//    }
//
//    
//    
//    // Initialise the PFQueryTable tableview
//    override init(style: UITableView.Style, className: String!) {
//        super.init(style: style, className: className)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//        
//       
//        // Configure the PFQueryTableView
//        self.parseClassName = "FatherStyle"
//        self.textKey = "name"
//        self.pullToRefreshEnabled = true
//        self.paginationEnabled = false
//        
//    }
//    
//    // Define the query that will provide the data for the table view
//    
//    override func queryForTable() -> PFQuery {
//        let query = PFQuery(className: "FatherStyle")
//        
//        query.order(byAscending: "name")
//        query.whereKey("category", equalTo:categoryObject)
//        
//        
//        return query
//    }
//    
//    
//    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, object: PFObject?) -> PFTableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PFTableViewCell
//        
//
//        
//        
//        // Extract values from the PFObject to display in the table cell
//        if let nameEnglish = object?["name"] as? String {
//            cell.textLabel?.text = nameEnglish
//            cell.textLabel?.font = UIFont(name: "Chunkfive", size: 20)
//            
//        }
//   
//        
//        return cell
//        
//       
//    }
//    
//    
//    //segue
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        
//        let row = Int(indexPath.row)
//        
//        
//        performSegue(withIdentifier: "fatherToSon", sender: objects?[row])
//        
//        
//    }
//    
//    
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "fatherToSon" {
//            if let destination = segue.destination as? StyleTableViewController {
//
//                    destination.fatherObject = (sender as! PFObject)
//                
//                
//                }
//            }
//    
//    }
//
//    
//    //animação da tabela
////    func animateTable() {
////        tableView.reloadData()
////       let cells = tableView.visibleCells
////                let tableHeight: CGFloat = tableView.bounds.size.height
////        
////        for i in cells {
////            let cell: UITableViewCell = i 
////            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
////        }
////        
////        var index = 0
////        
////        for a in cells {
////            let cell: UITableViewCell = a 
////            UIView.animateWithDuration(1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: nil, animations: {
////                cell.transform = CGAffineTransformMakeTranslation(0, 0);
////                }, completion: nil)
////            
////            index += 1
////        }
////    }
//
//    
}





