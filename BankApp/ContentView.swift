//
//  ContentView.swift
//  BankApp
//
//  Created by Malik Alijanov on 16.04.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BankAppView()
    }
}

#Preview {
    ContentView()
}


struct BankAppView: View {
    @StateObject private var viewModel = BankViewModel()
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack {
                // Header
                HStack {
                    Text("My Bank")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Button {
                        // Profile action
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7)]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                )

                // Cards
                StackedCardsView(viewModel: viewModel)
                    .frame(height: 250)
                    .padding()

                // Action Buttons
                HStack(spacing: 25) {
                    ActionButton(iconName: "arrow.left.arrow.right", labels: "Transfer")
                    ActionButton(iconName: "dollarsign.circle", labels: "Pay")
                    ActionButton(iconName: "creditcard", labels: "Card")
                    ActionButton(iconName: "chart.bar", labels: "Stats")
                }
                .padding()

                // Transactions
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
                Spacer()
            }
        }
    }
}


struct ActionButton: View {
    var iconName : String
    var labels: String
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Image(systemName: iconName)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Circle())
                
            }
            Text(labels)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}




struct CardView: View {
    var card: Card
    
    var body: some View {
        VStack {
            HStack(alignment:.top){
                Text(card.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Text(card.cardName)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            Spacer()
            Text("**** **** **** \(card.cardNumber)")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.largeTitle)
            Spacer()
            HStack {
                   Text("Exp: \(card.expressionDate)")
                       .foregroundColor(.white)
                   Spacer()
               }
            
              
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}


