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
            ActionButton(iconName: "arrow.up", labels: "Sent"){
               
            }
            ActionButton(iconName: "arrow.down", labels: "Receive"){
               
            }
            ActionButton(iconName: "dollarsign.circle", labels: "Loan"){
                
            }
            ActionButton(iconName: "icloud.and.arrow.up", labels: "Topup"){
                
            }
        }
        .background(Color.white)
        .padding()
    }
}


