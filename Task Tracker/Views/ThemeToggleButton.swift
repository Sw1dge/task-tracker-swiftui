//
//  SwiftUIView.swift
//  Task Tracker
//
//  Created by Mac on 05.01.2026.
//

import SwiftUI

struct ThemeToggleButton: View {
    
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        Button {
            withAnimation {
                themeManager.theme = themeManager.theme.next()
            }
        } label: {
            Image(systemName: themeManager.theme.systemImage)
                .foregroundColor(.primary)
                .padding(8)
        }
    }
}
