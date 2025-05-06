//
//  SectionView.swift
//  BankApp
//
//  Created by Malik Alijanov on 06.05.25.
//

import SwiftUI

struct SectionView: View {
    let title: String?
    let isTitle:Bool?
    let items: [SettingItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if isTitle == true{
                Text(title ?? "Title")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .light))
                    .padding(.vertical, 8)
            }
            ForEach(items) { item in
                SettingRow(item: item)
            }
        }
    }
}


