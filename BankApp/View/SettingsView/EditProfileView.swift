//
//  EditProfileView.swift
//  BankApp
//
//  Created by Malik Alijanov on 08.05.25.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.presentationMode) var pm
    @State private var name = "Məlik Əlicanov"
    @State private var email = "alicanov98@gmail.com"
    @State private var phone = "+994507705055"
    @State private var selectedDay = 1
    @State private var selectedMonth = "Yanvar"
    @State private var selectedYear = 2000
    var body: some View {
        VStack{
            Header(title: "Edit Profile",leftIcon: true,onLeftTap: {
                pm.wrappedValue.dismiss()
            })
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text("Məlik Əlicanov")
                .font(.system(size: 27,weight: .medium))
                .foregroundColor(.black)
            Text("Ios Developer")
                .font(.system(size: 16,weight: .light))
                .foregroundColor(.black.opacity(0.6))
                .padding(.bottom,16)
                LabeledInputField(label: "Full Name", iconName: "profileIcon", text: $name)
            LabeledInputField(label: "Email Address", iconName: "emails", text: $email)
           LabeledInputField(label: "Phone Number", iconName: "phone", text: $phone)
            BirthDateSelector(selectedDay: $selectedDay, selectedMonth: $selectedMonth, selectedYear: $selectedYear)
            Text("Joined 28 Jan 2025")
                .font(.system(size: 16,weight: .light))
                .foregroundColor(.black.opacity(0.6))
                .padding(.bottom,16)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 12)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EditProfileView()
}
