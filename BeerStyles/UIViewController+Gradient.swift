  //
//  UIViewController+Gradient.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 17/07/15.
//
//

import UIKit
  
  extension UIViewController{
    
    func gradientColor(){
        
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor(red:1.0, green:0.85, blue:0.20, alpha:1.0).CGColor,UIColor(red:0.80, green:0.59, blue:0.00, alpha:1.0).CGColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height + 300)
        
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        
        
        
    }
     
    
    
    
    
    
  }
