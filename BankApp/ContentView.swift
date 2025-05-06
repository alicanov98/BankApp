//
//  ContentView.swift
//  BankApp
//
//  Created by Malik Alijanov on 16.04.25.
//

import SwiftUI

struct ContentView: View {
    @Binding var path: [Route]

    var body: some View {
        MainTabView(path: $path)
            
    }
}


struct BankApp: View {
    @StateObject private var viewModel = BankViewModel()
    @Binding var path: [Route]
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack {
                BankHeader()
                StackedCardsView(viewModel: viewModel)
                    .frame(height: 240)
                    .padding()

                ActionButtonsView(path: $path)

                RecentTransactionsView(viewModel: viewModel)

                Spacer()
            }
            .background(Color.white)
        }
        .background(Color.white)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var path: [Route] = []  
    
    static var previews: some View {
        ContentView(path: $path)
    }
}

