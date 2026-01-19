//
//  SwiftUIView.swift
//  Task Tracker
//
//  Created by Mac on 05.01.2026.
//

import SwiftUI

struct TaskRow: View {
    
    var task: TaskItem
    var onToggle: (TaskItem) -> Void
    var onEdit: () -> Void
    
    var body: some View {
        HStack {
            Toggle("", isOn: Binding(
                get: { task.isDone },
                set: {
                    var updated = task
                    updated.isDone = $0
                    onToggle(updated)
                }
            ))
            .toggleStyle(CircleToggleStyle())
            
            Button(action: onEdit) {
                Text(task.title ?? "")
                    .foregroundColor(textColor)
            }
            .buttonStyle(.plain)
            
            Spacer()
            
            Text(dateText)
                .font(.subheadline)
                .foregroundColor(dateColor)
        }
    }
    
    private var isOverdue: Bool {
        guard let taskDate = task.dueDate as Date? else { return false }
        return taskDate < Date() && !task.isDone
    }
    
    private var textColor: Color {
        if task.isDone { return .gray }
        if isOverdue { return .red }
        return .primary
    }
    
    private var dateColor: Color {
        isOverdue ? .red : .gray
    }
    
    private var dateText: String {
        let f = DateFormatter()
        f.dateStyle = .short
        f.timeStyle = .short
        return f.string(from: task.dueDate ?? Date())
    }
}
