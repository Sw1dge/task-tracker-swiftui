//
//  TaskListViewModel.swift
//  Task Tracker
//
//  Created by Mac on 19.12.2025.
//

import Foundation
import SwiftUI
import CoreData

class TaskListViewModel: ObservableObject {
    
    @Published var tasks: [TaskItem] = []
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchTasks()
    }
    
    func fetchTasks() {
        let request: NSFetchRequest<TaskItem> = TaskItem.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \TaskItem.isDone, ascending: true),
            NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)
        ]

        do {
            tasks = try context.fetch(request)
        } catch {
            print(error)
        }
    }
    
    func addTask(title: String, content: String?, dueDate: Date?) {
        let newTask = TaskItem(context: context)
        newTask.id = UUID()
        newTask.title = title
        newTask.isDone = false
        newTask.dueDate = dueDate
        
        saveContext()
        fetchTasks()
    }
    
    func updateTask(_ task: TaskItem) {
        saveContext()
        fetchTasks()
    }
    
    func deleteTask(_ task: TaskItem) {
        context.delete(task)
        saveContext()
        fetchTasks()
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Save error: \(error)")
            }
        }
    }
}
