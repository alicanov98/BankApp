//
//  Transaction.swift
//  BankApp
//
//  Created by Malik Alijanov on 16.04.25.
//

import Foundation


struct Transaction: Identifiable {
    var id = UUID()
    var iconName: String
    var title: String
    var category: String
    var amount: Double 
    var receive: Bool
    var sent: Bool
}
