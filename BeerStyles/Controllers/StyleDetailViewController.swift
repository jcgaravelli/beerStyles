//
//  StyleDetailViewController.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 14/07/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

import UIKit
import Parse
import Bolts
import ParseUI



class StyleDetailViewController: UIViewController {
   
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tempMAX: UILabel!
    @IBOutlet weak var glasses: UILabel!
    var currentObject : PFObject!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
//
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        name.text = currentObject
        if let object = currentObject {
                        name.text = object["name"] as? String
                            tempMAX.text = object["nameLocal"] as? String
                    }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    






    
}
