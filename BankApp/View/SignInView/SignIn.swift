//
//  SignIn.swift
//  BankApp
//
//  Created by Malik Alijanov on 22.04.25.
//

import SwiftUI

struct SignIn: View {
    @Binding var path: [Route]
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var isSecureText:Bool = true
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("Sign In")
                    .font(.system(size: 32, weight: .medium))
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 40)
                ReusableTextField(
                    title: "Email Address",
                    placeholder: "Enter your email",
                    iconName: "envelope",
                    text: $email,
                    keyboardType: .emailAddress
                )
                .padding(.bottom, 20)
                PasswordField(password: $password)
                    .padding(.bottom, 30)
                ReusableButton(
                    title: "Sign In",
                    backgroundColor: .blue,
                    textColor: .white
                ) {
                    path.append(.mainPage)
                }
                .padding(.top, 20)
                HStack{
                    Text("I'm a new user.")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                    Button("Sign Up"){
                        path.append(.signUp)
                    }  .font(.system(size: 14))
                        .foregroundColor(.blue)
                    
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding(.top, 29)
            }
            .padding(.horizontal,20)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var path: [Route] = []

        var body: some View {
            SignIn(path: $path)
        }
    }

    return PreviewWrapper()
}
