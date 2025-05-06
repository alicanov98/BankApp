//
//  SignUp.swift
//  BankApp
//
//  Created by Malik Alijanov on 22.04.25.
//

import SwiftUI

struct SignUp: View {
    @Binding var path: [Route]
    @Environment(\.dismiss) var dismiss
    @State private var fullName:String = ""
    @State private var email:String = ""
    @State private var phone:String = ""
    @State private var password:String = ""
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading){
                Text("Sign Up")
                    .font(.system(size: 32, weight: .medium))
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 40)
                VStack(spacing:20){
                    ReusableTextField(title: "Full Name", placeholder: "Enter your full name", iconName: "envelope", text: $fullName)
                    ReusableTextField(title: "Phone Number", placeholder: "Enter your phone", iconName: "phone", text: $phone,keyboardType:.numberPad)
                    ReusableTextField(title: "Email Address", placeholder: "Enter your email address", iconName: "envelope", text: $email)
                    PasswordField(password: $password)
                }
                .padding(.bottom,40)
                
                ReusableButton(title: "Sign up", backgroundColor: Color.blue, textColor: Color.white) {
                    path.removeLast()
                }
                HStack{
                    Text("Already have an account.")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    Button("Sign In"){
                        path.append(.signIn)
                    }
                    .font(.system(size: 12))
                }
                .padding(.top,20)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            }
            .padding(.horizontal,20)
            
            
            
            
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if !path.isEmpty {
                        BackButton(path:$path)
                }
            }
        }
    }
}
