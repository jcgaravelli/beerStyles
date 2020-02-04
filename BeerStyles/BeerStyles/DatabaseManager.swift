////
////  DatabaseManager.swift
////  BeerStyles
////
////  Created by Paulo César Morandi Massuci on 07/07/15.
////  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
////
//
//import Foundation
//import CoreData
//
//class DatabaseManager
//{
//    // Database manager singleton
//    static let sharedInstance = DatabaseManager()
//    
//    
//    
//    
//    var managedObjectContext: NSManagedObjectContext? = {
//        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
//        var applicationDocumentsDirectory: NSURL = urls[urls.count-1] as? NSURL
//        
//        let modelURL = NSBundle.mainBundle().URLForResource("MiniChallengeTracker", withExtension: "momd")!
//        var managedObjectModel: NSManagedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL)!
//        
//        
//        // Create the coordinator and store
//        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
//        let url = applicationDocumentsDirectory.URLByAppendingPathComponent("MiniChallengeTracker.sqlite")
//        var error: NSError? = nil
//        var failureReason = "There was an error creating or loading the application's saved data."
//        if coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil, error: &error) == nil {
//            coordinator = nil
//            // Report any error we got.
//            var dict = [String: AnyObject]()
//            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
//            dict[NSLocalizedFailureReasonErrorKey] = failureReason
//            dict[NSUnderlyingErrorKey] = error
//            error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
//            // Replace this with code to handle the error appropriately.
//            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            NSLog("Unresolved error \(error), \(error!.userInfo)")
//            abort()
//        }
//        
//        //var persistentStoreCoordinator: NSPersistentStoreCoordinator? = coordinator
//        
//        
//        if coordinator == nil {
//            return nil
//        }
//        var managedObjectContext = NSManagedObjectContext()
//        managedObjectContext.persistentStoreCoordinator = coordinator
//        return managedObjectContext
//        }()
//    
//    func saveContext () {
//        if let moc = self.managedObjectContext {
//            var error: NSError? = nil
//            if moc.hasChanges && !moc.save(&error) {
//                // Replace this implementation with code to handle the error appropriately.
//                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                NSLog("Unresolved error \(error), \(error!.userInfo)")
//                abort()
//            }
//        }
//    }
//}
