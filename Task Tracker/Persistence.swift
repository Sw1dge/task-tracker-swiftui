//
//  Persistence.swift
//  Task Tracker
//
//  Created by Mac on 19.12.2025.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

        let container: NSPersistentContainer

        init(inMemory: Bool = false) {
            container = NSPersistentContainer(name: "TasksModel")
            if inMemory {
                container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
            }
            container.loadPersistentStores { description, error in
                if let error = error {
                    fatalError("Core Data failed to load: \(error)")
                }
            }

            container.viewContext.automaticallyMergesChangesFromParent = true
        }
}
