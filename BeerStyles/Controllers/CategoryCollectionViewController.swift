//
//  EmbebedoCollectionViewController.swift
//  BeerStyles
//
//  Created by Matheus Santos Lopes on 13/07/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

import UIKit


class CategoryCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    let reuseIdentifier = "cellCategory"
    var imagesStyles : [String] = ["","cerveja","cerveja","cerveja","cerveja"]
    var screenSize : CGRect!
    var screenWidth : CGFloat!
    var screenHeight : CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = self.view.frame
        screenWidth = screenSize.width
        screenHeight = screenSize.height
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
    
    // MARK: UICollectionViewDataSource
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return imagesStyles.count
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if indexPath.row == 0
        {
            return CGSize(width: screenWidth, height: screenWidth/3)
        }
        return CGSize(width: 180, height: 180);
        
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        
        
        
        let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cellCategory", forIndexPath: indexPath) as! CategoryCollectionViewCell
        
        
        if indexPath.row == 0
        {
            //cell.backgroundColor = UIColor.blueColor()
        }else
        {
            //cell.backgroundColor = UIColor.whiteColor()
            cell.imageCategory.image = UIImage(named: imagesStyles[indexPath.row])
        }
        
        
        
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
//        
//        switch indexPath.row
//        {
//        case 1:
//            performSegueWithIdentifier("ShowStyles", sender: nil)
//        case 2:
//            performSegueWithIdentifier("ShowTutorial", sender: nil)
//        case 3:
//            performSegueWithIdentifier("ShowCups", sender: nil)
//        case 4:
//            performSegueWithIdentifier("ShowFoods", sender: nil)
//        default:
//            break
//        }
        
        
}


}


