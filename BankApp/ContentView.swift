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
        NavigationView {
            BankApp(path: $path)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
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
                    .frame(height: 250)
                    .padding()

                ActionButtonsView(path: $path)

                RecentTransactionsView(viewModel: viewModel)

                Spacer()
            }
        }
    }
}






struct CardsView: View {
    var card: Card
    
    var body: some View {
        ZStack{
            Image("Card")
                .resizable()
                .scaledToFit()
            VStack {
                HStack(alignment:.top){
                    Spacer()
                    Text(card.cardName)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }
                Spacer()
                Text("4562 1122 \(card.cardNumber)")
                    .foregroundColor(.white.opacity(0.8))
                    .font(.system(size: 37,weight: .regular))
                Spacer()
                HStack(spacing: 20) {
                    VStack(spacing:4){
                        Text("Expiry Date")
                            .font(.system(size: 9))
                            .foregroundColor(Color("Gray"))
                        Text((card.expressionDate))
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                    }
                    
                    VStack(spacing:4){
                        Text("CVV")
                            .font(.system(size: 9))
                            .foregroundColor(Color("Gray"))
                        Text(card.expressionDate)
                            .font(.system(size: 13))
                            .foregroundColor(.white)
                    }
                   
                       Spacer()
                    VStack{
                        Image(card.titleCard)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70,height: 40)
                            
                        Text(card.title)
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.white)
                    }
                  
                   }
                  
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 200)
            .cornerRadius(20)
            .shadow(radius: 5)
        }
       
    }
}

#Preview{
    CardsView(card: Card(
           title: "Master Card",
           cardName: "Maincard",
           titleCard: "masterCard",
           cardNumber: "4321 1234",
           expressionDate: "12/26"
       ))
}

