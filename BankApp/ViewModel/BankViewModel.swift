//
//  BankViewModel.swift
//  BankApp
//
//  Created by Malik Alijanov on 16.04.25.
//

import Foundation
import SwiftUI

class BankViewModel: ObservableObject {
    @Published var cards: [Card] = [
        Card(title: "Bank Card", cardName: "SwiftUICodes", cardNumber: "1234", expressionDate: "01/29"),
        Card(title: "Cashback Card", cardName: "SwiftUICodes", cardNumber: "5678", expressionDate: "02/30"),
        Card(title: "Credit Card", cardName: "SwiftUICodes", cardNumber: "9101", expressionDate: "03/01"),
        Card(title: "EDV Card", cardName: "SwiftUICodes", cardNumber: "1213", expressionDate: "03/02")
    ]
    
    @Published var transactions: [Transaction] = (0..<15).map { _ in
        Transaction(iconName: "cart.fill", title: "Shopping", date: "12 Oct 2025", amount: "-$150.00")
    }
    
    func cycleCard() {
        if let last = cards.popLast() {
            cards.insert(last, at: 0)
        }
    }
}



