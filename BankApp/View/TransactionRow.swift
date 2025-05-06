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
            HStack(spacing: 12){
                Image(transaction.iconName)
                    .font(.system(size: 25))
                    .foregroundColor(Color("DarkBlue"))
                    .padding(10)
                    .background(Color("LightGray"))
                    .clipShape(Circle())

                VStack(alignment: .leading,spacing: 3) {
                    Text(transaction.title)
                        .font(.system(size: 18,weight: .medium))
                    Text(transaction.category)
                        .font(.system(size: 14,weight: .regular))
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Text(transaction.receive == true ?
                "$\(String(format: "%.2f", transaction.amount))" :
                "-$\(String(format: "%.2f", transaction.amount))")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(transaction.receive == true ? .blue : .red)
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    TransactionRow(transaction: Transaction(iconName: "star.fill", title: "Money Transfer", category: "Transaction", amount: 100,receive:true,sent:false))
}

