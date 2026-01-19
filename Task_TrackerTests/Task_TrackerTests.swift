//
//  Task_TrackerTests.swift
//  Task TrackerTests
//
//  Created by Mac on 19.12.2025.
//

@testable import Task_Tracker
import CoreData
import XCTest

final class Task_TrackerTests: XCTestCase {
    
    var context: NSManagedObjectContext!
    
    override func setUp() {
        super.setUp()
        let container = NSPersistentContainer(name: "TasksModel")
        
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("In-memory store error: \(error), \(error.userInfo)")
            }
        }
        
        context = container.viewContext
    }
    
    override func tearDown() {
        context = nil
        super.tearDown()
    }
    
    func testCreateTask() throws {
        
        let testDate = Date()
        
        let task = TaskItem(context: context)
        task.title = "Test"
        task.content = "Test content"
        task.isDone = false
        
        try context.save()
        
        let request: NSFetchRequest<TaskItem> = TaskItem.fetchRequest()
        let tasks = try context.fetch(request)
        
        XCTAssertEqual(tasks.count, 1)
        XCTAssertEqual(tasks.first?.title, "Test")
        XCTAssertEqual(tasks.first?.content, "Test content")
        XCTAssertEqual(tasks.first?.isDone, false)
    }
    
    func testDeleteTask() throws {
        let task = TaskItem(context: context)
        task.title = "Test"
        
        try context.save()
        
        context.delete(task)
        try context.save()
        
        let request: NSFetchRequest<TaskItem> = TaskItem.fetchRequest()
        let count = try context.count(for: request)
        
        XCTAssertEqual(0, count)
    }
    
    func testSorting() throws {
        let task1 = TaskItem(context: context)
        task1.title = "Later"
        task1.dueDate = Date().addingTimeInterval(1000)
        
        let task2 = TaskItem(context: context)
        task2.title = "Soon"
        task2.dueDate = Date()
        
        try context.save()
        
        let request: NSFetchRequest<TaskItem> = TaskItem.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "dueDate", ascending: true)
        ]
        
        let tasks = try context.fetch(request)
        
        XCTAssertEqual(tasks.first?.title, "Soon")
    }

}
