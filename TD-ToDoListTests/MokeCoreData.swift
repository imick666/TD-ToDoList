//
//  MokeCoreData.swift
//  TD-ToDoListTests
//
//  Created by mickael ruzel on 10/10/2020.
//

import Foundation
import CoreData

final class MokeCoreData {
    class func createContext() -> NSManagedObjectContext {
        let managedObjectMode = NSManagedObjectModel.mergedModel(from: nil)!
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectMode)
        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        } catch {
            fatalError("Failed to create persistentStore")
        }
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentStoreCoordinator
        
        return context
    }
}
