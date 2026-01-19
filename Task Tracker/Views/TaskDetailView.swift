//
//  TaskDetailView.swift
//  Task Tracker
//
//  Created by Mac on 22.12.2025.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: TaskListViewModel
    @Binding var task: TaskItem
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: task.titleBinding)
                    TextField("Content", text: task.contentBinding)
                    DatePicker("Due Date", selection: task.dueDateBinding)
                }
            }
            .padding()
            .toolbar {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

extension TaskItem {
    var titleBinding: Binding<String> {
        Binding(
            get: { self.title ?? "" },
            set: { newValue in
                self.title = newValue
                try? self.managedObjectContext?.save()
            }
        )
    }
    
    var contentBinding: Binding<String> {
        Binding(
            get: { self.content ?? "" },
            set: { newValue in
                self.content = newValue
                try? self.managedObjectContext?.save()
            }
        )
    }
    
    var dueDateBinding: Binding<Date> {
        Binding(
            get: { self.dueDate ?? Date() },
            set: { newValue in
                self.dueDate = newValue
                try? self.managedObjectContext?.save()
            }
        )
    }
}
