//
//  RecentTransactionsView.swift
//  BankApp
//
//  Created by Malik Alijanov on 24.04.25.
//

import SwiftUI

struct RecentTransactionsView: View {
    @ObservedObject var viewModel: BankViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Recent Transactions")
                .font(.headline)
                .padding(.horizontal)

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(viewModel.transactions) { tx in
                        TransactionRow(transaction: tx)
                    }
                }
                .padding()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}


