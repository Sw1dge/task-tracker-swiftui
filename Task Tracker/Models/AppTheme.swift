//
//  AppTheme.swift
//  Task Tracker
//
//  Created by Illia Fedorov on 05.01.2026.
//

import SwiftUICore

enum AppTheme: String, CaseIterable {
    case system
    case light
    case dark
    
    var id: String { rawValue }
    
    var systemImage: String {
        switch self {
        case .system:
            return "circle.lefthalf.filled"
        case .light:
            return "sun.max.fill"
        case .dark:
            return "moon.fill"
        }
    }
    
    var colorScheme: ColorScheme? {
        switch self {
        case .system: return nil
        case .light: return .light
        case .dark: return .dark
        }
    }
}

extension AppTheme {
    func next() -> AppTheme {
        switch self {
        case .system:
            return .light
        case .light:
            return .dark
        case .dark:
            return .system
        }
    }
}
