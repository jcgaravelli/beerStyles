//
//  UIStoryboard .swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 03/02/20.
//
//

import UIKit

extension UIStoryboard {
    enum Name: String {
        case menu = "Menu"
    }
    
    static func viewController<T: UIViewController>(from storyboard: UIStoryboard.Name) -> T where T: Storyboarded {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: T.self.storyboardIdentifier) as? T else {
            fatalError("Could not instantiate ViewController with identifier: \(T.storyboardIdentifier)")
        }
        return viewController
    }
    
//    static func viewController<T: UIViewController>(from storyboard: UIStoryboard.Name, id: String) -> T {
//        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
//        guard let viewController = storyboard.instantiateViewController(withIdentifier: id) as? T else {
//            fatalError("Could not instantiate ViewController with identifier: \(id)")
//        }
//        
//        return viewController
//    }
}
