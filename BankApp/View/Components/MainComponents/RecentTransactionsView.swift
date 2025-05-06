//
//  RecentTransactionsView.swift
//  BankApp
//
//  Created by Malik Alijanov on 24.04.25.
//

import SwiftUI

struct RecentTransactionsView: View {
    @ObservedObject var viewModel: BankViewModel
    var isCardDetailPage: Bool = false

    var totalIncome: Double {
        viewModel.transactions
            .filter { $0.receive }
            .compactMap { Double($0.amount) }
            .reduce(0, +)
    }

    var totalExpense: Double {
        viewModel.transactions
            .filter { !$0.receive }
            .compactMap { Double($0.amount) }
            .reduce(0, +)
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Transactions")
                    .font(.system(size: 20))
                    .padding(.horizontal)
                Spacer()
                Button(action:{}){
                    Text("Sell All")
                        .font(.system(size: 14))
                        .padding(.horizontal)
                        .foregroundColor(Color("Blue"))
                }
            }
            .padding(.vertical, 3)

            if isCardDetailPage {
                HStack(spacing: 20) {
                    HStack(spacing: 4) {
                        Text("Income:")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))

                        Text("$\(String(format: "%.2f", totalIncome))")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .medium))
                    }

                    HStack(spacing: 4) {
                        Text("Expense:")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))

                        Text("$\(String(format: "%.2f", totalExpense))")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .medium))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(viewModel.transactions) { tx in
                        TransactionRow(transaction: tx)
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color.white)
        .cornerRadius(20)
    }
}



struct RecentTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BankViewModel()
        return RecentTransactionsView(viewModel: viewModel)
    }
}
