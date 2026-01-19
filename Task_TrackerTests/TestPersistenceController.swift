//
//  File.swift
//  Task TrackerTests
//
//  Created by Illia Fedorov on 07.01.2026.
//

import Foundation
import CoreData

final class TestPersistenceController {
    static let shared = TestPersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TasksModel")
        
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("In-memory store error: \(error), \(error.userInfo)")
            }
        }
    }
}
