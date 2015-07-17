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
  let gradientLayer = CAGradientLayer()
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tempMAX: UILabel!
    @IBOutlet weak var glasses: UILabel!
    var currentObject : PFObject!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientColor()
        
        
            }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let object = currentObject {
                        name.text = object["name"] as? String
                            tempMAX.text = object["nameLocal"] as? String
                    }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

<<<<<<< HEAD
//
=======
    func gradientColor(){
        
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor(red:1.0, green:0.85, blue:0.20, alpha:1.0).CGColor,UIColor(red:0.80, green:0.59, blue:0.00, alpha:1.0).CGColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, atIndex: 0)

        
        
        
    }
    

>>>>>>> d84335bbeddd58310a84769b0ead34affd48a185




    
}
