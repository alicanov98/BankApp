//
//  ActionButtonsView.swift
//  BankApp
//
//  Created by Malik Alijanov on 24.04.25.
//

import SwiftUI

struct ActionButtonsView: View {
    @Binding var path: [Route]
    var body: some View {
        HStack(spacing: 25) {
            ActionButton(iconName: "arrow.left.arrow.right", labels: "Transfer"){
                path.append(.transfer)
            }
            ActionButton(iconName: "dollarsign.circle", labels: "Pay"){
                path.append(.pay)
            }
            ActionButton(iconName: "creditcard", labels: "Card"){
                path.append(.card)
            }
            ActionButton(iconName: "chart.bar", labels: "Stats"){
                path.append(.stats)
            }
        }
        .padding()
    }
}


