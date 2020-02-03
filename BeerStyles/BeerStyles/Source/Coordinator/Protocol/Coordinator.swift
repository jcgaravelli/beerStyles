//
//  Coordinator.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 03/02/20.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
