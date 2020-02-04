//
//  MainCoordinator.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 03/02/20.
//

import Foundation

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = NewMenuViewController.instatiate(menuItems: createModel())
        navigationController.pushViewController(vc, animated: false)
    }
    
    private func createModel() -> [MenuItemModel] {
        let item1 = MenuItemModel(imageItem: "stylesIcon", segue: "stylesIcon")
        let item2 = MenuItemModel(imageItem: "HowIcon", segue: "stylesIcon")
        let item3 = MenuItemModel(imageItem: "glassIcon", segue: "stylesIcon")
        let item4 = MenuItemModel(imageItem: "foodIcon", segue: "stylesIcon")
        return [item1, item2, item3, item4]
    }
}
