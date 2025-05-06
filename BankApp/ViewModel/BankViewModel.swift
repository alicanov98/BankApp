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
        Card(id:1,title: "Master Card", cardName: "Bank Card",titleCard:"masterCard", cardNumber: "4595 1234", expressionDate: "01/29",cvv:"123"),
        Card(id:2,title: "VISA", cardName: "Cashback Card",titleCard:"visa", cardNumber: "8765 5678",expressionDate: "02/30",cvv:"432"),
    ]
    
    @Published var transactions: [Transaction] = [
        Transaction(iconName: "shop", title: "Bazar Store", category: "Shopping", amount: 150,receive:false,sent:false),
        Transaction(iconName: "transaction", title: "Money Transfer", category: "Transaction", amount: 100,receive:true,sent:false),
        Transaction(iconName: "apple", title: "Apple Store", category: "Entertainment", amount: 100,receive:false,sent:false),
        Transaction(iconName: "spotify", title: "Money Transfer", category: "Transaction", amount: 100,receive:false,sent:true),
        Transaction(iconName: "spotify", title: "Money Transfer", category: "Transaction", amount: 50,receive:false,sent:true)
    ]
    
    func cycleCard() {
        if let last = cards.popLast() {
            cards.insert(last, at: 0)
        }
    }
}



