//
//  ProgressBar.swift
//  GoalsTracker
//
//  Created by Norbert Agoston on 27.12.2024.
//

import SwiftUI

struct ProgressBar: View {
    var backgroundColor: Color
    var progressColor: Color
    var progress: CGFloat // Current progress as a float between 0.0 and 1.0
//    var progress: Binding<Float>
    var height: CGFloat = 10 // Define the height in one place

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background Bar
                Rectangle()
                    .fill(backgroundColor)
                    .frame(height: height)
                    .cornerRadius(height / 2) // Rounds corners proportional to height
                
                // Progress Bar
                Rectangle()
                    .fill(progressColor)
                    .frame(width: geometry.size.width * progress, height: height)
                    .cornerRadius(height / 2)
            }
        }
        .frame(height: height) // Use the same height here
    }
}
