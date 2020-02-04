//
//  ViewController.swift
//  BeerStyles
//
//  Created by Fernando H M Bastos on 7/6/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
