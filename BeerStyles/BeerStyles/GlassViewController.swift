//
//  GlassViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 16/07/15.
//
//

import UIKit
import Parse

class GlassViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegate{

    
    var countries = [PFObject]()
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellWidth = ((UIScreen.mainScreen().bounds.width) - 32 - 30 ) / 3
        let cellLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        cellLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)

    }
    override func viewDidAppear(animated: Bool) {
        loadCollectionViewData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCollectionViewData() {
        
        // Build a parse query object
        var query = PFQuery(className:"Glass")
        
        // Check to see if there is a search term
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            // The find succeeded now rocess the found objects into the countries array
            if error == nil {
                
                // Clear existing country data
                self.countries.removeAll(keepCapacity: true)
                
                // Add country objects to our array
                if let objects = objects as? [PFObject] {
                    self.countries = Array(objects.generate())
                }
                
                // reload our data into the collection view
                self.collectionView.reloadData()
                
            } else {
                // Log details of the failure
              
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
    }
    
    
    //CollectionView
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var alfa = self.countries.count
         println(alfa)
        
        return alfa
       
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! GlassCollectionViewCell
        
        // Display the country name
        if let value = self.countries[indexPath.row]["name"] as? String {
            cell.glassLabel.text = value
        } 
        
        // Display "initial" flag image
        var initialThumbnail = UIImage(named: "name")
        cell.glassImage.image = initialThumbnail
        
        // Fetch final flag image - if it exists
        if let value = countries[indexPath.row]["flag"] as? PFFile {
            let finalImage = self.countries[indexPath.row]["flag"] as? PFFile
            finalImage!.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        cell.glassImage.image = UIImage(data:imageData)
                    }
                }
            }
        }
        return cell
    }


    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
