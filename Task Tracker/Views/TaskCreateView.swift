//
//  TaskCreateView.swift
//  Task Tracker
//
//  Created by Mac on 03.01.2026.
//

import SwiftUI

struct TaskCreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: TaskListViewModel
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var dueDate: Date = Date()
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: $title)
                    TextField("Content", text: $content)
                    DatePicker("Due Date", selection: $dueDate)
                }
            }
            .padding()
            .toolbar {
                Button(action: {
                    if (title != "") {
                        viewModel.addTask(title: title, content: content, dueDate: dueDate)
                    }
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                }
            }
        }
    }
}
