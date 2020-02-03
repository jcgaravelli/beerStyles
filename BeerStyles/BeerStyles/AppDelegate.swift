//
//  AppDelegate.swift
//  BeerStyles
//
//  Created by Fernando H M Bastos on 7/6/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

//hue
import UIKit
import Parse
import Bolts

//teste git

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: MainCoordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let navController = UINavigationController()
        
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }
}
