//
//  ViewController.swift
//  BeerStyles
//
//  Created by Fernando H M Bastos on 7/6/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
        
        retriveData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        let query = PFQuery(className: "GameScore")
//        query.fromLocalDatastore()
//        query.findObjectsInBackground().continueWithBlock({
//            (task: BFTask?) -> AnyObject! in
//            if let error = task?.error {
//                // There was an error.
//                return task
//            }
//            
//            // Results were successfully found from the local datastore.
//            
//            return task
//        })
//        
    }

}

