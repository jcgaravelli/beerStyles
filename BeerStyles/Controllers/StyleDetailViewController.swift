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
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tempMAX: UILabel!
    @IBOutlet weak var glasses: UILabel!
    var currentObject : PFObject!
    @IBOutlet weak var Construction: UILabel!
    
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var characteristics: UILabel!
    @IBOutlet weak var abvRange: UILabel!
    @IBOutlet weak var foodPairing: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Description.sizeToFit()
        
        
        gradientColor()
        
        
            }
    
    func adjustContentSize() {
        var contentRect = CGRectZero
        for view in self.scroll.subviews {
            contentRect = CGRectUnion(contentRect, view.frame)
        }
        
        self.scroll.contentSize = contentRect.size
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let object = currentObject {
                        name.text = object["name"] as? String
                        Description.text = object["description"] as? String
                        characteristics.text = object["characteristics"] as? String
                        foodPairing.text = object["food"] as? String

            


                        Description.sizeToFit()
            
            
            //tempMAX.text = object["nameLocal"] as? String
            
        }
        
        adjustContentSize()
        
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
