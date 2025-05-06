//
//  MyCardsView.swift
//  BankApp
//
//  Created by Malik Alijanov on 29.04.25.
//

import SwiftUI

struct MyCardsView: View {
    @ObservedObject var viewModel: BankViewModel
    @Binding var path: [Route]

    var body: some View {
        VStack {
            Header(title: "My Cards", rightIcon: true,rightIconStr: "plus")
            ScrollView {
                LazyVStack {
                    ForEach(Array(viewModel.cards.enumerated()), id: \.element.id) { index, card in
                        NavigationLink(destination: CardDetailView(viewModel: viewModel, id: card.id)) {
                            CardView(card: card)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal)
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var path: [Route] = []

        var body: some View {
            MyCardsView(viewModel: BankViewModel(), path: $path)
        }
    }

    return PreviewWrapper()
}
