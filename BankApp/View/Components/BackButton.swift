//
//  BackButton.swift
//  BankApp
//
//  Created by Malik Alijanov on 23.04.25.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    @Binding var path: [Route]
    var body: some View {

        Button(action: {
            path.removeLast()
        }) {
            HStack(spacing: 8) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .buttonStyle(PlainButtonStyle())
    }
}


