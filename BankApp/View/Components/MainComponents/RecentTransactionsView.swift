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
            HStack{
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


struct RecentTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BankViewModel()
        return RecentTransactionsView(viewModel: viewModel)
    }
}
