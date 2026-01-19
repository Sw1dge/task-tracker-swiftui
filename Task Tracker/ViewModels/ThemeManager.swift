//
//  ThemManager.swift
//  Task Tracker
//
//  Created by Mac on 05.01.2026.
//

import Foundation
import SwiftUI

class ThemeManager: ObservableObject {
    @AppStorage("appTheme") private var themeRaw: String = AppTheme.system.rawValue
    
    var theme: AppTheme {
        get {
            AppTheme(rawValue: themeRaw) ?? .system
        }
        set {
            themeRaw = newValue.rawValue
            objectWillChange.send()
        }
    }
    
    var colorScheme: ColorScheme? {
        theme.colorScheme
    }
}
