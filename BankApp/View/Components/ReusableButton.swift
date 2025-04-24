//
//  ReusableButton.swift
//  BankApp
//
//  Created by Malik Alijanov on 22.04.25.
//

import SwiftUI

struct ReusableButton: View {
    let title: String
    let backgroundColor: Color
    let textColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(12)
        }
    }
}


