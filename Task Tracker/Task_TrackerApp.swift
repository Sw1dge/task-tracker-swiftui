//
//  Task_TrackerApp.swift
//  Task Tracker
//
//  Created by Mac on 19.12.2025.
//

import SwiftUI

@main
struct Task_TrackerApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var theme: ThemeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            TaskListView(context: persistenceController.container.viewContext)
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .environmentObject(theme)
            .preferredColorScheme(theme.colorScheme)
        }
    }
}
