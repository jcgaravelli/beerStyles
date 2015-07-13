//
//  ParseManager.swift
//  BeerStyles
//
//  Created by Paulo César Morandi Massuci on 09/07/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

import Foundation
import Parse
import ParseUI

func retriveData(){
    
    var style = PFObject(className:"Style")
    style.saveEventually()
    
    
}