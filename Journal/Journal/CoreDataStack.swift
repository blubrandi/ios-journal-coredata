//
//  CoreDataStack.swift
//  Journal
//
//  Created by BDawg on 11/11/19.
//  Copyright © 2019 Brandi. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "JournalEntry")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load persisitent stores: \(error)")
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
