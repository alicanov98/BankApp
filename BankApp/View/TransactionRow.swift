//
//  TransactionRow.swift
//  BankApp
//
//  Created by Malik Alijanov on 16.04.25.
//

import SwiftUI

struct TransactionRow: View {
    var transaction: Transaction

    var body: some View {
        HStack {
            Image(systemName: transaction.iconName)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(Color.red.opacity(0.5))
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(transaction.title)
                    .font(.headline)
                Text(transaction.date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(transaction.amount)
                .font(.caption)
                .foregroundColor(.red)
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}



