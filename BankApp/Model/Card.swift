//
//  Card.swift
//  BankApp
//
//  Created by Malik Alijanov on 16.04.25.
//

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var cardName: String
    var titleCard: String
    var cardNumber: String
    var expressionDate: String
}
