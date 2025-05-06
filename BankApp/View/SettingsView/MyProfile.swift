//
//  MyProfile.swift
//  BankApp
//
//  Created by Malik Alijanov on 06.05.25.
//

import SwiftUI

let profileSection: [SettingItem] = [
    .init(title: "Personal Information", iconName: "path", destinationView: AnyView(ChangePassword()),icon: "profileIcon"),
    .init(title: "Payment Preferences", iconName: "path", destinationView: AnyView(PrivacyPolicy()),icon: "creditCards"),
    .init(title: "Banks and Cards", iconName: "path", destinationView: AnyView(PrivacyPolicy()),icon: "creditcardEdit"),
    .init(title: "Notifications", iconName: "path", destinationView: AnyView(PrivacyPolicy()),icon: "notificationIcon"),
    .init(title: "Message Center", iconName: "path", destinationView: AnyView(PrivacyPolicy()),icon: "messageCenter"),
    .init(title: "Address", iconName: "path", destinationView: AnyView(PrivacyPolicy()),icon: "location"),
    .init(title: "Settings", iconName: "path", destinationView: AnyView(PrivacyPolicy()),icon: "settingIcon"),
    
]

struct MyProfile: View {
    @Environment(\.presentationMode) var pm
    var body: some View {
        VStack(spacing:20){
            Header(
                title: "Profile",
                leftIcon:true,
                rightIcon: true,
                onLeftTap:  {
                    pm.wrappedValue.dismiss()
                },
                rightIconName: "userEdit"
            )
            HStack{
                Image("profile")
                    .frame(width: 60,height: 60)
                    .clipShape(Circle())
                
            VStack(alignment:.leading,spacing: 7){
                Text("Məlik Əlicanov")
                    .font(.system(size: 27,weight: .medium))
                    .foregroundColor(.black)
                Text("Ios Developer,")
                    .font(.system(size: 12,weight: .light))
                    .foregroundColor(.black.opacity(0.6))
            }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            SectionView( title: "title", isTitle: false, items: profileSection)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 12)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MyProfile()
}
