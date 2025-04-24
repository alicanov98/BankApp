//
//  ActionButton.swift
//  BankApp
//
//  Created by Malik Alijanov on 24.04.25.
//

import SwiftUI


struct ActionButton: View {
    var iconName: String
    var labels: String
    var action: () -> Void
    var body: some View {
        VStack {
            Button (action: action) {
                Image(systemName: iconName)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7)]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing))
                    .clipShape(Circle())
            }
            Text(labels)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}


