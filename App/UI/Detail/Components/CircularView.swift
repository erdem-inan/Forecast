//
//  CircularView.swift
//  App
//
//  Created by Ino on 06/04/2024.
//

import SwiftUI

struct CircularView: View {
    
    var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.blue.opacity(0.3), lineWidth: 10)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}


#Preview {
    CircularView(progress: 0.3)
}
