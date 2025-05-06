//
//  CardDetailView.swift
//  BankApp
//
//  Created by Malik Alijanov on 29.04.25.
//

import SwiftUI

struct CardDetailView: View {
    @ObservedObject var viewModel: BankViewModel
    @Environment(\.presentationMode) var pm
    let minValue: Double = 0
    let maxValue: Double = 1000
    let id: Int

    var totalExpense: Double {
        viewModel.transactions
            .filter { !$0.receive }
            .compactMap { Double($0.amount) }
            .reduce(0, +)
    }

    @State private var sliderValue: Double = 0
    
    var body: some View {
        if let card = viewModel.cards.first(where: { $0.id == id }) {
            VStack(spacing: 16) {
                Header(title: "Card Details", leftIcon: true, rightIcon: true, onLeftTap:  {
                    pm.wrappedValue.dismiss()
                })
                CardView(card: card)
                RecentTransactionsView(viewModel: viewModel, isCardDetailPage: true)
                
                VStack {
                    HStack {
                        Text("Cari dəyər: $\(Int(totalExpense))")
                            .font(.headline)
                        Spacer()
                        Text("$\(Int(maxValue))")
                            .font(.headline)
                    }
                    .padding(.horizontal)
                    
                    CustomProgressBar(currentValue: totalExpense, maxValue: 1000)
                        .frame(height: 10)
                        .padding()
                }
            }
            .padding(.horizontal, 12)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                sliderValue = totalExpense
            }
        } else {
            Text("Card not found.")
        }
    }
}


#Preview {
    CardDetailView(viewModel: BankViewModel(), id: 1)
}
