//
//  DetailCell.swift
//  App
//
//  Created by Ino on 06/04/2024.
//

import SwiftUI

struct DetailCell: View {
    
    // MARK: - Properties
    
    let title: String
    let description: String
    let imageName: String
    
    // MARK: - View
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: imageName)
                    .foregroundStyle(.white)

                Text(title)
                    .foregroundStyle(.white)
            }
            
            Text(description)
                .foregroundStyle(.white)
                .font(.title)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    DetailCell(title: "Min Temp", description: "6", imageName: "thermometer.low")
}
