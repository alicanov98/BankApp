//
//  SettingItem.swift
//  BankApp
//
//  Created by Malik Alijanov on 06.05.25.
//

import SwiftUI

struct SettingItem: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
    let destinationView: AnyView?
    let icon: String?
}
