//
//  EmailField.swift
//  BankApp
//
//  Created by Malik Alijanov on 22.04.25.
//

import SwiftUI

struct ReusableTextField: View {
    let title: String
    let placeholder: String
    let iconName: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(.primary)

            HStack {
                Image(systemName: iconName)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)

                TextField(placeholder, text: $text)
                    .padding(.vertical, 10)
                    .keyboardType(keyboardType)
                    .autocapitalization(.none)
            }
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.4)),
                alignment: .bottom
            )
        }
    }
}


