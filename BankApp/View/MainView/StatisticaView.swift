//
//  PayView.swift
//  BankApp
//
//  Created by Malik Alijanov on 24.04.25.
//

import SwiftUI

struct StatisticaView: View {
    @ObservedObject var viewModel: BankViewModel
    var body: some View {
        VStack {
            Header(title: "Statistics", leftIcon: true, rightIcon: true, rightIconStr: "bell")

            ChartView()
                .frame(height: 300)
                .padding(.top, 45)
            RecentTransactionsView(viewModel: viewModel, isCardDetailPage: false)
                .padding(.top, 45)
        }
        .padding(.horizontal, 16)
      
    }
}

#Preview {
    StatisticaView(viewModel: BankViewModel())
}

