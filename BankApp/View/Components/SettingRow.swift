//
//  SettingRow.swift
//  BankApp
//
//  Created by Malik Alijanov on 06.05.25.
//

import SwiftUI

struct SettingRow: View {
    let item: SettingItem

    var body: some View {
        Group {
            if let destination = item.destinationView {
                NavigationLink(destination: destination) {
                    rowContent
                }
            } else {
                rowContent
            }
        }
    }

    var rowContent: some View {
        HStack {
            if let iconName = item.icon {
                     Image(iconName)
                 }
            Text(item.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
            Spacer()
            Image(item.iconName)
        }
        .padding(.vertical, 12)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.gray.opacity(0.3)),
            alignment: .bottom
        )
    }
}



#Preview {
    SettingRow(item: SettingItem(title: "General", iconName: "path", destinationView: AnyView(MyProfile()),icon: "settingIcon"))
}
