//
//  Storyboarded.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 03/02/20.
//

import UIKit

protocol Storyboarded {}

extension Storyboarded where Self: UIViewController {
    
    /// Cria um identifier usando o nome da classe
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    /// Cria um segue identifier usando o nome da classe ignorando "ViewController" no fim
    /// ex.: LoginViewController -> identifier: Login
    static var segueIdentifier: String {
        let identifier = String(describing: self)
        let vcString = "ViewController"
        let endIndex = identifier.index(identifier.endIndex, offsetBy: -vcString.count)
        return String(identifier[identifier.startIndex..<endIndex])
    }
}
