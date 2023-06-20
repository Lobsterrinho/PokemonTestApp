//
//  PokemonsCoreDataService.swift
//  PokemonTestApp
//
//  Created by Lobster on 11.05.23.
//

import CoreData

final class PokemonsCoreDataService {
    
    private init() { }
    
    public static let shared = PokemonsCoreDataService()
    
    public var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    public lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PokemonTestApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
