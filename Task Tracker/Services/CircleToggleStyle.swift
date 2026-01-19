//
//  Customstyle.swift
//  Task Tracker
//
//  Created by Mac on 19.12.2025.
//

import SwiftUI

struct CircleToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            ZStack {
                Circle()
                    .stroke(Color.primary, lineWidth: 2)
                    .frame(width: 24, height: 24)
                
                if configuration.isOn {
                    Circle()
                        .fill(Color.primary)
                        .frame(width: 24, height: 24)
                        .transition(.scale)
                }
            }
            .onTapGesture {
                withAnimation {
                    configuration.isOn.toggle()
                }
            }
            
            configuration.label
                .strikethrough(configuration.isOn)
        }
    }
}
