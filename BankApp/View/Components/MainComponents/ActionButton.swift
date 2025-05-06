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
                    .font(.system(size: 25))
                    .foregroundColor(Color("DarkBlue"))
                    .padding(20)
                    .background(Color("LightGray"))
                    .clipShape(Circle())
            }
            Text(labels)
                .font(.caption)
                .foregroundColor(Color("DarkBlue"))
        }
    }
}

#Preview {
    ActionButton(iconName: "arrow.up", labels: "Sent", action: {})
}
