//
//  MenuViewController.swift
//  BeerStyles
//
//  Created by Júlio César Garavelli on 16/07/15.
//
//

import UIKit
import Parse

class MenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {

    let reuseIdentifier = "cellMenu"
    var imagesMenu : [String] = ["stylesIcon","howIcon","glassIcon","foodIcon"]
    var screenSize : CGRect!
    var screenWidth : CGFloat!
    var screenHeight : CGFloat!
    
    
    let lista : [String] = ["abc", "bcd", "cde", "def", "efg", "fgh", "ghi", "hij"]
    var listaFiltrada : [String] = [String]()
    var resultSearchController = UISearchController()
    
  //  @IBOutlet var menu: UICollectionView!
    
    @IBOutlet weak var referenceView: UIView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tableView.hidden = true
        
        
//        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            attributes.transform3D = CATransform3DMakeTranslation(self.collectionView.bounds.size.width, 0, 0);
//            } completion:^(BOOL finished){
//            attributes.transform = CGAffineTransformMakeTranslation(0, -120);
            //code needed to make it bounce a little
           // }];
        
//        self.view.bringSubviewToFront(self.referenceView)
////      self.view.hidden(self.backgroundView)
//        self.backgroundView?.hidden = true
//        self.referenceView?.hidden = false
     //   self.view.bringSubviewToFront(self.referenceView)
        
        gradientColor()
        screenSize = self.view.frame
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        //create search result controller
        //setup of resultSearchController
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        
        //self.resultSearchController.searchBar.backgroundImage = UIImage.new()
        self.resultSearchController.searchBar.sizeToFit()
        
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        
        self.tableView.reloadData()
     
        
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view, typically from a nib.
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Table View Data Source and Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.resultSearchController.active {
            
            return self.listaFiltrada.count
            
        } else {
            
            return self.lista.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
//        cell.textLabel?.textColor = UIColor.whiteColor()
//        cell.backgroundColor = UIColor.clearColor()
        
        if self.resultSearchController.active {
            
            cell.textLabel?.text = self.listaFiltrada[indexPath.row]
            
        } else {
            
            cell.textLabel?.text = self.lista[indexPath.row]
        }
        
        return cell
    }
    
    
    
    
    
    // MARK: - Result Search Controller Delegate
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        self.tableView.hidden = false
        
//        self.view.bringSubviewToFront(self.backgroundView)
//        self.backgroundView?.hidden = true
    
        
        //remove all destinations from the filtered list
        self.listaFiltrada.removeAll(keepCapacity: false)
        
        //performs the search
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", self.resultSearchController.searchBar.text!)
        let array = (lista as NSArray).filteredArrayUsingPredicate(searchPredicate)
        listaFiltrada = array as! [String]
        
        if self.resultSearchController.active && self.resultSearchController.searchBar.text.isEmpty {
            self.listaFiltrada = self.lista
        }
        
        //reload table view's data
        self.tableView.reloadData()
    }
    
    
    
    
    
    
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        NSLog("%d", imagesMenu.count);
        return imagesMenu.count
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        if indexPath.row == 0
//    if indexPath.row == -1
//        
//        {
//            return CGSize(width: screenWidth, height: screenWidth/3)
//        }
        return CGSize(width: 180, height: 180);
        
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        
        
        
        let cell : MenuCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cellMenu", forIndexPath: indexPath) as! MenuCollectionViewCell
        
        
//        if indexPath.row == 0
//    if indexPath.row == -1
//        {
//            //cell.backgroundColor = UIColor.blueColor()
//        }else
//        {
            //cell.backgroundColor = UIColor.whiteColor()
            cell.imageMenu.image = UIImage(named: imagesMenu[indexPath.row])
//        }
        
      
            
  
            
  
        
        
        return cell
    }
    
    
    
    
    // MARK: -CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        switch indexPath.row
        {
        case 0:
            performSegueWithIdentifier("ShowCategories", sender: nil)
        case 1:
            performSegueWithIdentifier("ShowTutorial", sender: nil)
        case 2:
            performSegueWithIdentifier("ShowGlasses", sender: nil)
        case 3:
            performSegueWithIdentifier("ShowFoods", sender: nil)
        default:
            break
        }
        
        
        

        
    }
    
}

    