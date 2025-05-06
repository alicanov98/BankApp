//
//  CardView.swift
//  BankApp
//
//  Created by Malik Alijanov on 29.04.25.
//

import SwiftUI

struct CardView: View {
var card:Card
    var body: some View {
        ZStack{
            Image("Card")
                .resizable()
                .frame(width: .infinity,height: 240)
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
                    .font(.system(size: 33,weight: .regular))
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
                        Text(card.cvv)
                            .font(.system(size: 13))
                            .foregroundColor(.white)
                    }
                   
                       Spacer()
                    VStack{
                        Image(card.titleCard)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50,height: 30)
                            
                        Text(card.title)
                            .font(.system(size: 12))
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

#Preview {
    CardView(card: Card(
        id:1,
        title: "Master Card",
        cardName: "Cashback Card",
        titleCard: "masterCard",
        cardNumber: "8765 5678",
        expressionDate: "02/30",
        cvv:"456"
    ))
}
