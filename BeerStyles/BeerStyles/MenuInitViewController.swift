//
//  MenuInitViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 17/07/15.
//
//

import UIKit

////, UICollectionViewDataSource, UICollectionViewDelegate
//class MenuInitViewController:UIViewController, UISearchBarDelegate, {
//    
//    var styles = [PFObject]()
//    
//    @IBOutlet weak var tablevView: UITableView!
//    
//    @IBOutlet weak var searchBar: UISearchBar!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//
//        // Do any additional setup after loading the view.
//    }
//    
//    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    // Metodos de search
//    
//    func loadTableViewData() {
//        
//        // Build a parse query object
//        var query = PFQuery(className:"Style")
//        
//        // Check to see if there is a search term
//        if searchBar.text != "" {
//            query.whereKey("name", containsString: searchBar.text.lowercaseString)
//        }
//        
//        // Fetch data from the parse platform
//        query.findObjectsInBackgroundWithBlock {
//            (objects: [AnyObject]?, error: NSError?) -> Void in
//            
//            // The find succeeded now rocess the found objects into the countries array
//            if error == nil {
//                
//                // Clear existing country data
//                self.styles.removeAll(keepCapacity: true)
//                
//                // Add country objects to our array
//                if let objects = objects as? [PFObject] {
//                    self.styles = Array(objects.generate())
//                }
//                
//                // reload our data into the collection view
//                self.tablevView.reloadData()
//                
//            } else {
//                // Log details of the failure
//                println("Error: \(error!) \(error!.userInfo!)")
//            }
//        }
//    }
//    
//    
//    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
//        
//        // Dismiss the keyboard
//        searchBar.resignFirstResponder()
//        
//        // Reload of table data
//        self.loadTableViewData()
//    }
//    
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        
//        // Dismiss the keyboard
//        searchBar.resignFirstResponder()
//        
//        // Reload of table data
//        self.loadTableViewData()
//    }
//    
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        
//        // Clear any search criteria
//        searchBar.text = ""
//        
//        // Dismiss the keyboard
//        searchBar.resignFirstResponder()
//        
//        // Reload of table data
//        self.loadTableViewData()
//    }
//    
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
