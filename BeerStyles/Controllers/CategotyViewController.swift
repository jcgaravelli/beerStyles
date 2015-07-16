//
//  CategotyViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 16/07/15.
//
//

import UIKit
import Parse


class CategotyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func aleSelect(sender: AnyObject) {
        var object : PFObject = parseFind("Ale")
        performSegueWithIdentifier("categoryToFather", sender: object)
    }
    
    @IBAction func lagerSelect(sender: AnyObject) {
        var object : PFObject = parseFind("Lager")
        performSegueWithIdentifier("categoryToFather", sender: object)
    }
    @IBAction func spontaneousSelect(sender: AnyObject) {
        var object : PFObject = parseFind("Spontaneous")
        performSegueWithIdentifier("categoryToFather", sender: object)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "categoryToFather" {
            if let destination = segue.destinationViewController as? FatherStyleViewController {
                
                destination.categoryObject = (sender as! PFObject)
            }
        }

    }
    
    

    func parseFind(type:NSString)->PFObject{
        var query = PFQuery(className:"Category")
        query.whereKey("name", equalTo:type)
       var sender = query.getFirstObject()
            
            
        
        return sender!
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
