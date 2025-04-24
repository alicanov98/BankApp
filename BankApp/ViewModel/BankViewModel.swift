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
        Card(title: "Master Card", cardName: "Bank Card",titleCard:"masterCard", cardNumber: "4595 1234", expressionDate: "01/29"),
        Card(title: "VISA", cardName: "Cashback Card",titleCard:"visa", cardNumber: "8765 5678",expressionDate: "02/30"),
        Card(title: "Master Card", cardName: "Credit Card",titleCard:"masterCard", cardNumber: "1019 9101", expressionDate: "03/01"),
        Card(title: "VISA", cardName: "EDV Card",titleCard:"visa", cardNumber: "3121 1213", expressionDate: "03/02")
    ]
    
    @Published var transactions: [Transaction] = [
        Transaction(iconName: "shop", title: "Bazar Store", category: "Shopping", amount: "-$150",receive:false,sent:false),
        Transaction(iconName: "transaction", title: "Money Transfer", category: "Transaction", amount: "$100",receive:true,sent:false),
        Transaction(iconName: "apple", title: "Apple Store", category: "Entertainment", amount: "-$100",receive:false,sent:false),
        Transaction(iconName: "spotify", title: "Money Transfer", category: "Transaction", amount: "-$100",receive:false,sent:true)
    ]
    
    func cycleCard() {
        if let last = cards.popLast() {
            cards.insert(last, at: 0)
        }
    }
}



