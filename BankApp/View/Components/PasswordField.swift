//
//  PasswordField.swift
//  BankApp
//
//  Created by Malik Alijanov on 22.04.25.
//

import SwiftUI

struct PasswordField: View {
    @Binding var password: String
    @State private var isSecureText: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Password")
                .font(.system(size: 16))
                .foregroundColor(.black)
                .padding(.bottom, 5)
            
            HStack {
                Image(systemName:"lock")
                    .font(.system(size: 20))
                    .foregroundColor(Color.gray)
                
                if isSecureText {
                    SecureField("Enter your password", text: $password)
                        .padding()
                        .cornerRadius(8)
                } else {
                    TextField("Enter your password", text: $password)
                        .padding()
                        .cornerRadius(8)
                }
                
                Button(action: {
                    isSecureText.toggle()
                }) {
                    Image(systemName: isSecureText ? "eye" : "eye.slash")
                        .foregroundColor(.gray)
                }
            }
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.4)), alignment: .bottom)
        }
    }
}


