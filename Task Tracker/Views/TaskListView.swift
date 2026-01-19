//
//  TaskListView.swift
//  Task Tracker
//
//  Created by Illia Fedorov on 19.12.2025.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject private var viewModel: TaskListViewModel
    
    init(context: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: TaskListViewModel(context: context))
    }
    
    @State private var openCreateMenu: Bool = false
    @State private var selectedTask: TaskItem?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.tasks) { task in
                    Group {
                        TaskRow(task: task,
                                onToggle: { updateTask in
                            viewModel.updateTask(updateTask)
                        },
                                onEdit: {
                            selectedTask = task
                        })
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let task = viewModel.tasks[index]
                        viewModel.deleteTask(task)
                    }
                }
            }
            .sheet(item: $selectedTask) { task in
                if let index = viewModel.tasks.firstIndex(where: { $0.id == task.id }) {
                    TaskDetailView(viewModel: viewModel, task: $viewModel.tasks[index])
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        openCreateMenu = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.primary)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    ThemeToggleButton()
                }
            }
            .sheet(isPresented: $openCreateMenu) {
                TaskCreateView(viewModel: viewModel)
            }
        }
    }
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
}
