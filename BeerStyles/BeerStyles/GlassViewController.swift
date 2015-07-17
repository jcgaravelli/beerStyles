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

    
    var glasses = [PFObject]()
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        gradientColor()
        
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
                self.glasses.removeAll(keepCapacity: true)
                
                // Add country objects to our array
                if let objects = objects as? [PFObject] {
                    self.glasses = Array(objects.generate())
                }
                
                // reload our data into the collection view
                self.collectionView.reloadData()

            } else {
                // Log details of the failure
              
                //println("Error: \(error!) \(error!.userInfo!)")
            }
        }
 

}
    
    
    //CollectionView
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var alfa = self.glasses.count
         println(alfa)
        
        return alfa
       
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! GlassCollectionViewCell
        
        // Display the country name
        if let value = self.glasses[indexPath.row]["name"] as? String {
            cell.glassLabel.text = value
        } 
        
        // Display "initial" flag image
        var initialThumbnail = UIImage(named: "name")
       // cell.glassImage.image = initialThumbnail
        
        // Fetch final flag image - if it exists
        if let value = glasses[indexPath.row]["flag"] as? PFFile {
            let finalImage = self.glasses[indexPath.row]["flag"] as? PFFile
            finalImage!.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                     //   cell.glassImage.image = UIImage(data:imageData)
                    }
                }
            }
        }
        return cell
    }


    
    
    //Fazendo Segue
    // Process collectionView cell selection
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let currentObject = glasses[indexPath.row]
        performSegueWithIdentifier("glassColectToDetails", sender: currentObject)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // If a cell has been selected within the colleciton view - set currentObjact to selected
        var currentObject : PFObject?
        if let country = sender as? PFObject{
            currentObject = sender as? PFObject
        } else {
            // No cell selected in collectionView - must be a new country record being created
            currentObject = PFObject(className:"Glass")
        }
        
        // Get a handle on the next story board controller and set the currentObject ready for the viewDidLoad method
        var detailScene = segue.destinationViewController as! GlassDetailViewController
        detailScene.currentObject = (currentObject)
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
