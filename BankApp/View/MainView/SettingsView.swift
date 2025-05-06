//
//  TransferView.swift
//  BankApp
//
//  Created by Malik Alijanov on 24.04.25.
//

import SwiftUI

let generalSettings: [SettingItem] = [
    .init(title: "My Profile", iconName: "path", destinationView: AnyView(MyProfile()),icon: ""),
    .init(title: "Contact Us", iconName: "path", destinationView: AnyView(ContactUs()),icon: "")
]

let securitySettings: [SettingItem] = [
    .init(title: "Change Password", iconName: "path", destinationView: AnyView(ChangePassword()),icon: ""),
    .init(title: "Privacy Policy", iconName: "path", destinationView: AnyView(PrivacyPolicy()),icon: "")
]


struct SettingsView: View {
    @State private var selectedLanguage = "English"
      @State private var isLanguageSheetPresented = false

      let languages = ["English", "Azerbaijani", "Turkish", "Russian"]
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Header(title: "Settings",rightIcon: true, rightIconName:"logout")
            Text("General")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray)
                .font(.system(size: 16, weight: .light))
                 Button {
                     isLanguageSheetPresented = true
                 } label: {
                     HStack {
                         Text("Language")
                             .frame(maxWidth: .infinity, alignment: .leading)
                             .foregroundColor(.black)

                         Spacer()

                         HStack(spacing: 20) {
                             Text(selectedLanguage)
                                 .foregroundColor(.gray)
                                 .font(.system(size: 16, weight: .light))
                             Image("path")
                         }
                     }
                     .padding(.bottom,12)
                 }
                 .sheet(isPresented: $isLanguageSheetPresented) {
                     LanguageSelectionView(
                         selectedLanguage: $selectedLanguage,
                         languages: languages
                     )
                 }
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.3)),
                alignment: .bottom
            )
            SectionView( title: "General", isTitle: false, items: generalSettings)
                        
            SectionView(title: "Security", isTitle: true, items: securitySettings)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal,16)
    }
}

#Preview {
    SettingsView()
}
